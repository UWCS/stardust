+++
title = "Docker, Contained"
date = "2023-01-18"
+++

We’re going to make a super simple web API using Python and Flask, containerise it with Docker, set up continuous integration with Github Actions, and then deploy it using Docker too.

---

## A Python Project
Login to the DCS machines, open you web browser of choice, go to [GitHub](https://github.com/) and create a new repo called `my-flask-app`. Leave the repo blank and create it. Copy the URL in the address bar. In the terminal, clone your repo with `git clone <repo url>`, and then `cd` into it.

We’re going to use [pipenv](https://pipenv.pypa.io/en/latest/) to create a new python project. Pipenv manages dependencies and virtual environments for us, making it much more ergonomic than just using pip and virtualenvs manually. Install it with `python3.9 -m pip install --user pipenv`.  You can then invoke pipenv with `python3.9 -m pipenv <subcommand>`. Add [Flask](https://flask.palletsprojects.com/en/2.2.x/) to your project with `python 3.9 -m pipenv install flask`.

There’s another dependency that we’ll need later on as well: [gunicorn](https://gunicorn.org/). Gunicorn is a Python HTTP server, and will serve our Flask app for us: `python3.9 -m pipenv install gunicorn`.

### Flask

Create a new Python file called `app.py`, and inside it add the following code:

```python
from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
	return "Hello, World!"
```
This is the most simple Flask app possible. The `app` variable refers to an object that encapsulates your app and all it's API routes, and then we create a new route that returns simply the text “Hello, world”. Customise the string so your app is unique to you.

You can start your app with `python3.9 -m pipenv run flask run`: this will start the flask *development* server within the python environment that pipenv has created. Head to the URL that is printed in the terminal and you will see your response. 

(Note how the development server prints a message about using a production WSGI server instead? That's where gunicorn will come in.)

Congrats, you’ve created your very own web app! Commit this to GitHub (`git add .`, `git commit -am "first commit"`, `git push origin main`). If this results in a user password field we have a handy [guide](https://uwcs.co.uk/resources/github-token-authentication/) on how to generate a token for this.

---

## Docker

### Writing a Dockerfile

So you can run your app on your computer, but will it be able to run on someone elses computer? We’re going to build something that will allow anyone to run your app anywhere, on any machine, with no\* (\*minimal) setup or installation required.

The way Docker works is you build an *image*, which contains everything we need to run the container, using `docker build`. We then do `docker run`, which takes your image and starts a container, which is just a process on your machine but isolated from the rest of the system. When we create a docker image, we're building up a mini-system within the host system, so we need to install anything that our program will depend on.

That's the short version, see <https://docs.docker.com/get-started/> for more: the way Docker works within the Linux kernel is very interesting.

Create a file called `Dockerfile`, which is where the description of our container image will go. We’ll create our Dockerfile line by line.

The first line is
```docker
FROM python:3.9
```

Here, we give Docker a name of another image that we want to use as a base for our image. We’re using the Python one from Docker hub: <https://hub.docker.com/_/python>, version 3.9. Docker hub is container registry, where people publish images for others to use.

The next thing we want to do is install pipenv so we can use it within our container. Remember that container builds are isolated from the rest of the system, so any tools we want to use we need to install in our container:

```docker
RUN pip install pipenv
```

The `RUN` command tells docker to execute a command as part of the build process.

Next we set our working directory within the container. Containers have their own file system which is separate from ours, so we make use of that. 

```dockerfile
WORKDIR /app
```

To run our code within the container, we need to copy the contents of our project into it. We copy everything in the current directory (our project directory), which docker calls the *build context*, from the host to the container:

```dockerfile
COPY . .
```

We need to use pipenv to install the dependencies for our project within the container, so another `RUN` command. We use the `--system` flag to install our dependencies to the global Python environment instead of creating a virtual environment. We’re in a container which is an isolated environment itself, so there’s no need for virtualenvs.

```dockerfile
RUN pipenv install --system
```

We’ve set up everything we need for our app, so now we tell Docker how to run it. The `CMD` command tells the container how to start the process when we do `docker run`. We want to use gunicorn to start our flask app as a HTTP server. We do this instead of using the development server, [because using the development server for production is bad](https://stackoverflow.com/questions/12269537/is-the-server-bundled-with-flask-safe-to-use-in-production)

```docker
CMD gunicorn app:app -b 0.0.0.0:8080
```

We tell gunicorn to run `app:app`, which means the Flask application called `app` within the file `app` that we created (confusing, I know). We also tell it to listen for connections from on  `0.0.0.0:8080`, which means the server will accept connections on port `8080`.

Your complete dockerfile should look like this:
```docker
FROM python:3.9
RUN pip install pipenv
WORKDIR /app
COPY . .
RUN pipenv install --system
CMD gunicorn app:app -b 0.0.0.0:8080
```

DCS have something called `podman` installed, which is a docker-compatible container tool, so we’ll make use of that. Run `podman build -t myapp .` to build your container and tag it with the name  ‘myapp’.

### Running a Container

You can now start your app with `podman run myapp`. You’ll see gunicorn starting up, and then head to `localhost:8080` in your browser to see your hello world message again.

This won’t work: why? We said that containers are isolated from their host, which includes networking and ports. We need to explicitly expose ports from the container to the host when we start it.

We’re going to use a different command to start the container.
```
podman run -d -p '8080:8080' myapp
```

The `-d` flag tells podman to start the container in the background. The `-p '8080:8080'` flag tells podman that we want to map port 8080 on the host to port 8080 on the container. You can now head to `localhost:8080` in your browser to see your ‘Hello, world’ message!

A few other useful podman commands:
- `podman ps` will show all running containers and their names
- `podman logs` will show the logs from any running containers
- `podman attach` will attach to a running container

Create a new Git commit with your Dockerfile and push it.

---

## GitHub Actions

So we can build and run a container image, how do we share it with other people so everyone else can run our amazing app too? We mentioned container registries earlier, and we’re going to use the Github Container Registry, or `ghcr.io`.

Github Actions is a platform built into GitHub that allows you to automate software and deployment workflows for continuous integration and deployment (CI/CD). We’re going to create a simple workflow that builds and publishes our image for us every time we push new code to GitHub. Make sure your repo is public, or you might need to add some extra config to the workflow file.

Create a new file at `.github/workflows/ci.yml` with the following contents:

```yaml
name: CI # the name of our workflow is 'CI'

# run this workflow when we push to the 'main' branch
on:	
  push:
    branches: [main]

# the list of jobs in this workflow
jobs:

# define a job
  build: 
    name: Build and Push Container Image # the job's full name
    runs-on: ubuntu-latest # the OS that this job runs on
		
	# we need write permissions to publish the package
    permissions: 
      packages: write
			
	# the steps that this job consists of
    steps:
	  - uses: actions/checkout@v3 # check out our repo
	  
	  - name: Log in to the container registry
        uses: docker/login-action@v2
        with:
          registry: ghcr.io
          username: ${{ github.repository_owner }}
          password: ${{ secrets.GITHUB_TOKEN }}

		# generate the tags that we'll use to name our image
      - name: Get Docker metadata
        id: meta
        uses: docker/metadata-action@v4
        with:
          images: ghcr.io/${{ github.repository }}
          tags: | # tag with commit hash and with 'latest'
            type=sha 
            type=raw,value=latest,enable={{is_default_branch}}
		
		# build and push our image, using output from previous step
      - name: Build and push Docker image
        uses: docker/build-push-action@v3
        with:
          context: .
          push: true
          tags: ${{ steps.meta.outputs.tags }}
          labels: ${{ steps.meta.outputs.labels }}
```

GitHub Actions workflows are comprised of multiple jobs, which themselves consist of multiple steps. This workflow will be run by GitHub every time you push to your `main` branch. Here, we define a single job, `build`, with 4 steps:

- Check out our repository
- Log in to the container registry
- Generate the metadata for our image (tags, labels)
- Build and push the image

Steps usually use workflows provided by other people. Here, we’re using workflows provided by docker to define our steps (the `uses` key). The `with` defines the inputs to those workflows.

GitHub Actions is a very large topic and can be very confusing, but this simple workflow file will be enough to get us started for now. Have a look at the [workflow files for Apollo](https://github.com/UWCS/apollo/blob/master/.github/workflows/ci.yaml) if you want a larger example.

Commit your file and push it to GitHub. Go to the actions tab, and you should see your workflow being run. Once it’s complete, the built image should should appear in the right sidebar of your repo’s homepage under ‘Packages’. You might need to mess with your package settings to make it public, [see here for more info](https://docs.github.com/en/packages/learn-github-packages/configuring-a-packages-access-control-and-visibility).

This is great because now you can run anyone else’s app on your machine easily: `podman run ghcr.io/<github name>/<repo name>:latest` will pull down their image and run it. Don’t forget to add the port mapping in your `run` command!

---

## Deployment (Portainer)

So we have our app, it's published and anyone can run it anywhere. What if we want to host it somewhere so it's available all the time? There are lots of container hosting platforms out there, but we actually have our own that is set up using [Portainer](https://www.portainer.io/), available for members of the society to use. Head to <https://portainer.uwcs.co.uk> and log in with your ITS account. If you've forgotten your details or can't log in then talk to an exec member (or email tech@uwcs.co.uk / send a message in the #tech=team channel on discord if you're reading this on our website after the session).

Portainer provides a nice interface for setting up containers running as services. Click on 'UWCS Public Docker' to access our shared Portainer environment. Click containers, then click the blue 'add container' button in the top right.

Fill out the details to use your image to start a new container. This screen is essentially configuring your `podman run` command but with a GUI. Put the name of your image in the 'image name' field, and under 'network ports configuration', map a random port (above 10000) to 8080 in the container. 

To map your port to a domain name, add the environment variable `VIRTUAL_HOST` with the value `<yourname>`. This will make your app accessible at `https://<yourname>.containers.uwcs.co.uk`.

Give your container a name as well, something descriptive. See <https://docs.portainer.io/user/docker/services/configure> for the full documentation on how to configure a service.

Start your container and it should pull your image and spin up. If it doesn't work then you're probably trying to use a port that someone else is already using on the host, so try another one. You should be able to see your running container. Try accessing the logs, and you can even start a new shell within it by clicking 'console' under 'container status'.

Head to <https://<yourname>.containers.uwcs.co.uk>, and your app should be accessible from the outside world.

---

## Bonus: Persistent Data with Volumes

Let's get slightly more fancy with some HTTP stuff. Update your route handler so that it looks like below. The idea is that our message is read from a file, and we can update the contents of the file by POSTing to the URL.

```python
file_location = getenv("MSG_FILE_LOCATION", "msg.txt")

@app.route("/", methods=["GET", "POST"])
def hello():
    if request.method == "POST":
        with open(file_location, "wb+") as f:
            f.write(request.get_data())
        return "Successfully updated message"
    elif request.method == "GET":
        try:
            with open(file_location, "rb") as f:
                return f.read()
        except FileNotFoundError:
            return "No message found"
```

Try this out running locally without docker. To send a post request with some data, use `curl -X POST -d "test data" <url>`. You should see the file being updated on your filesystem, and the message file will persist between application restarts. Note how we can also set the location of the file using an environment variable, but it will fall back to the default if unset.

Remember how Docker containers have their own isolated filesystem? If we were to run this within Docker, every time we re-created our container to update it or change the config, the message would be lost. Fortunately, we can use [Docker Volumes](https://docs.docker.com/storage/volumes/) to persist data within containers, like mini storage drives that we can mount in containers.

Commit and push your code to GitHub, wait for the image to build in CI, then re-deploy in Portainer, pulling the latest image. This should work using the default file location of `msg.txt`, but if you destroy the container and re-created it, your message will not be saved.

In Portainer, click on volumes in the sidebar and create a new volume, call it 'message_data' or something. Next, go back to your running service container, and click 'duplicate/edit'. Scroll down to advanced settings, click volumes, and map your new volume to `/mnt/message_data` within the container. Head to environment variables and set `MSG_FILE_LOCATION` to `/mnt/message_data/msg.txt` so that Flask knows to put your message file within the mounted volume. Check the Portainer docs if you need more info on how to do this.

Start your container and POST a new message to your service, then make a GET request to get it back. Head back to your volume in the portainer UI and you should see your message file there. You can download it, or upload a different message file too. Destroy and re-create your container, you should notice that the message file is persisted in there too.

---

## The End*

**Welcome to the end of the lab!** You're free to leave if you want, but maybe you could spend a bit of time improving that flask app of yours... for example, adding some buttons or a persistent counter, or CSS, or even a database - and make sure you can build and deploy it with those changes.

The kind of workflow you've just set up for building and deploying a service is very similar to how major tech companies really do this kind of thing. Docker is a really powerful tool for deploying services and making them portable, and we've only scratched the surface of it here.

Something we'd definitely recommend taking a look at is Docker Compose. Compose allows you to spin up multiple containers with a pre-configured run command using just `docker compose up`, which is especially useful if you want to, for example, bring up a database container at the same time as your application. Check out the tutorial: <https://docs.docker.com/compose/gettingstarted/>

If you're doing CS261 then these skills may come in handy: being able to set up a docker image makes it easy to work on software in a team where everyone may have different setups, and having a live deployment of your project running on a container host with a setup like you just built is useful too. You can even get Portainer and GitHub Actions to automatically re-deploy the latest version of your image every time you push code! (CI/CD is a hell of a drug)

And, as always, feel free to make use of our hosting services. See <https://techteam.uwcs.co.uk> for our wiki with more details on what we provide, or talk to one of our tech team.