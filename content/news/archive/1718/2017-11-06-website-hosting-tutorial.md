+++
title = "Website Hosting Tutorial"
date = "2017-11-06T18:22:00Z"

[extra]
original = "https://uwcs.co.uk/news/website-hosting-tutorial/"    
+++

<p>So you want to make use of our free website hosting, but don't know how? Here's all the information you're going to need!</p>

<!-- more -->

### Introduction
In case you didn't know, CompSoc offer free website hosting to all of their members\! This guide will take you through setting up a shell account on our servers, connecting to said servers and placing your website files in the correct directory. I won't be covering how to make websites, but I'll throw in a few good tutorial links to get you started at the bottom of this post.

**If you have any issues with this process, from logging in to getting your obscure website framework to work, please check the FAQ at the bottom.**

If you're still having problems, join our Discord (the link to which can be found in the 'Description' of our [Facebook group](https://www.facebook.com/groups/warwickcompsoc/)) and post in \#tech which will get you the fastest response, or email** **<techteam@uwcs.co.uk>.

### Creating A Shell Account
You need an account on our servers to be able to use our web hosting\! The **same** account is used across all of the servers you will need to access. The steps to create an account are as follows:

1.  Login to this website, there is a link in the top right.
2.  Click your name in the top right, and select 'Profile' from the drop down list.
3.  From your profile page, there are links on the left, including one to request a shell account: click it.
4.  Fill in the info, including what username you would like. For reference, most people choose quite short names e.g their online name, mine is 'rhiba'.
5.  You'll then get an email with a temporary password and some instructions, including one telling you to **login to lovelace.uwcs.co.uk** before doing anything else\! Lovelace is the name of one of our servers.
6.  **From Linux/Mac**, you can do this with the the **ssh** command in a terminal: **ssh your\_username@lovelace.uwcs.co.uk**. **From Windows**, you can do this by [downloading PuTTY](https://puttytray.goeswhere.com/) and typing in "your\_username@lovelace.uwcs.co.uk" into the "Hostname" textbox and hitting the "Open" button at the bottom. **You may get a warning when connecting for the first time about an unverified hostname or fingerprint, just continue by typing or pressing 'yes' when prompted.** 
7.  Both methods will prompt you for a password. Please note that *you will not see the cursor move when you type in your password*, that is normal\! Hit enter and you should be logged in.
8.  Please now change your password. You can do this by entering in the command **passwd** and typing in what it asks for. *Again, the cursor will not move.*

Congrats\! You now have a shell account. The reason you have to login to Lovelace first is that your home directory gets set up on that server, then mirrored across to the others. Once you login for the first time to Lovelace, you can connect to any machine on subsequent logins with no issues.

### Hosting Your Website
So now you have a shell account, you can set up your website. The steps to do this part are as follows:

1.  Login to **Hopper**, another one of our servers that we host all websites from. You can do this by ssh-ing to **your\_username@hopper.uwcs.co.uk**, or if you are already logged into Lovelace, you can simply type **ssh hopper**.
2.  Collect any files needed for your website (the minimum would be your "index.html"). If you do not already know how to copy files from external locations, lookup the **scp** command, or alternatively, write the files in the terminal using a terminal text editor like **nano** (good for beginners, the \`^\` means CTRL key) or **vim** (quick once you get the hang of it).
3.  Copy these files to (or write directly into) the **/compsoc/sites/your\_username** directory.
4.  Make sure your files have the correct permissions\! You can do this by running **chmod 755 /compsoc/sites/your\_username/file.html** for all website files.
5.  Go to "your\_username.uwcs.co.uk" in a web browser and you will see your website.

This is the simplest website setup complete, and if all you need is a small, static site then you're finished\! The section below will explain some slightly more complicated website related matters.

### More Technical Details
**Your own domain names: **If you own a domain name and would like to point it at our server, login to your domain provider and create an A record that points to Hopper (137.205.37.213), and then talk to the tech team (details at the start of document) so we can setup your Apache config correctly. We recommend just using your domain providers nameservers.

**PHP:** You are free to use PHP when building your websites, we run version 7.0.22 (as of 06/11/2017). Simply create your **index.php** and other files as you usually would.

**Databases:** If you need a database as part of your website, you can request an account using a link from your 'Profile' page on this website. You can choose either **Postgres** or **MySQL**. Please note that *database account creation is manual*, so it may take a few days for someone to get it done. If it's taking ages or you need it soon, then jump on Discord or email the tech team (details at the top of this post), we honestly do forget sometimes so don't feel bad for poking us\!

**Misc: **

  - We have ports on **Lovelace** (lovelace.uwcs.co.uk) open in the 6000-7000 range for anyone wanting to run a project (no game servers unless agreed with the exec first please, or you may find they have been killed rather swiftly). Please login to **Lovelace** for this and pick a port in that range (if by some small chance you manage to clash with a port someone else is using, please pick another).  
  - If you need a program/library that isn't installed currently, please just ask\! If it's possible, we'll definitely do it for you (but occasionally it won't be possible for some reason or another).

### Website Creation Tutorial Links
Here are some links that will help you create a website if you've never done so before (as well as googling something like "basic website tutorial"):

  - <https://www.w3schools.com/html/> (for your first website).  
  - <https://www.tutorialspoint.com/php/> (for dynamic websites).  
  - <https://www.w3schools.com/bootstrap/> (for easy and beautiful websites).

### FAQ
**Q - Where do I find my UWCS website login details?**

A - When you first joined the society via the SU, you will have been emailed login details\! If you haven't joined yet, you must join to be able to login.

**Q - My login details don't work on the UWCS website, what do I do?**

A - First, make sure you are a current member of CompSoc, since people who joined in previous academic years but not in the current year will have an *inactive account*. To re-activate your account, simply join CompSoc again, and try with your original login details after an hour or two (with the password you chose when you were forced to change it, of course). *This does not apply if you are ex-exec, who should always have an active account no matter their membership status.*

If you're definitely a member, then make sure you are using the correct username, it is your *university number* (no letter at the front). Finally, you can try using the password reset link to reset your password. If none of this works then please get in contact with the exec\! Details at the top of this post.

**Q - I can't login to my shell account, what do I do?**

A - Make sure you are using the right username, you can find this in your 'Profile' once logged in to this website. If you still can't get in, please get in contact with the tech team (details at the top of this post) who can reset your password.

**Q - I'm getting an error about a missing home directory when I SSH in to your server, how do I fix it?**

A - You likely tried to **ssh** to 'uwcs.co.uk' instead of 'lovelace.uwcs.co.uk'. On your first connection, please **ssh** to Lovelace before anywhere else, as this action will trigger the generation of a home directory for you. You can then **ssh** to either Lovelace or Hopper (Hopper is where 'uwcs.co.uk' points to) freely, and your home directory will be mirrored across both.

**Q - I'm getting an internal server error when trying to view my website, what's going on?**

A - Unfortunately, this could be for many reasons\! The simplest is usually permissions related. Please make sure all website files have read permissions by all, you can do this using the command: **chmod 755 /compsoc/sites/your\_username/file.html**. 

If that doesn't fix it, just message the tech team (details at the top of the post) and one of us can check the error logs.

