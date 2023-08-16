+++
title = "Beginner Programming Lesson Two"
date = "2017-10-13T18:33:00Z"

[taxonomies]
categories = ["Programming Lesson"]

[extra]
original = "https://uwcs.co.uk/news/beginner-programming-lesson-two-2017/"
+++

<p>The second instalment of our learning to program course. This time, we'll be creating a graphical game! Space Invaders!</p>

<!-- more -->

#### Section 0: An Introduction To Graphics!
In our last tutorial, we used the terminal only. This time, we're going to make a pretty graphical program\! This program will use a GUI, or graphical user interface, which just means it will have a window with maximise, minimise and close buttons, along with some pretty colours and shapes (that make up the game).

You remember how we used some libraries (preexisting pieces of code) that Java provides when we wrote our snake game (when we wrote the "import java.io.\*" line to use some input code)? Well, we're going to use some more here. To create windows and graphics in Java, we have to use the Java AWT library and the Java Swing library. AWT stands for Abstract Window Toolkit, and Swing doesn't stand for anything, the developers just liked the name. These two libraries, we'll call **awt** and **swing** from now on, are the graphical libraries we'll need (along with every other person/company that programs UI's using Java) to create our game Space Invaders.

#### Section 1: Creating A Window
So the very first thing we need to do is create a window\! Luckily, this isn't really that hard. We just need to remember to **import** the awt and swing libraries, because they're the bits of code that will do all the work for us. 

**N.B All programming languages come with libraries built in, not just Java. They make a programmers life easier by giving them common pieces of code (for example printing out to the screen), so the programmer doesn't have to write it themselves.**

As with the last tutorial, I'll give you the code first, and then explain each line individually afterwards. Here is the code you'll need to open an empty window:

```java
import java.awt.*;
import javax.swing.*;

public class SpaceInvaders {
	public static void main(String[] args) {
			JFrame window = new JFrame();
			window.setTitle("Space Invaders!");
			window.setSize(600,400);
			window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			window.setVisible(true);
	}
}
```
And that's it\! That's all you need to open a window. Hopefully some of the lines will look familiar to you, like the "main" function line, but I'll go over them anyway.

**Line 1:** This is where we tell the computer that we want to use the Java awt library. This library has a lot of different functions in it, and we want all of them, so we add the ".\*" after "java.awt" as in computer science, ** \* (star) means ALL.**

**Line 2:** Here we're telling the computer we also want to use the swing library with everything in it. You'll notice it says **javax** instead of Java. The "x" means eXtension, as the swing library was added into Java to be an extension to the awt library that adds in more features (but we're still going to use features from both).

**Line 4:** As we found out last time, Java files must always contain a **public class**, and there must only be one of these. This time we're going to name it "SpaceInvaders" because that's what we're making.

**Line 5:** Ah-ha\! A line we've definitely seen before, the main function\! Remember, the main function tells the computer where to **start** running the program, so you always need one. The **argument** that the main function uses as it's input, "String\[\] args", is not used once again (we didn't use it in Snake either, but Java requires that we use it).

**Line 6:** Here's the first line that we need to create a window. It's another **variable** definition.** **This time, the name of the variable (a variable is a container for a value that can change) is "window" and it's type is **JFrame**. JFrame is a new type that comes from the swing library. A JFrame is just a window (the J stands for Java, and frame means a window frame, it totally makes sense). The part that says "new JFrame()" is creating the new window and assigning it (putting it into the container) to the "window" variable.

**Line 7:** Now we have our window, we need to set some settings on it. The first setting that is changed is the title of the window. This is changed by calling **window.setTitle** with the name you want in quotation marks.

**Line 8:**  This line is setting the width of the window to 600, and the height to 400 (measurements are in pixels).

**Line 9:** The **setDefaultCloseOperation** function lets the computer know what to do when the close button is pressed (the button in the top right corner). Since we probably do just want to, you know, close the window when we press the button, we'll tell the computer that by giving the argument: JFrame.EXIT\_ON\_CLOSE (what else would you even want to do when you press the close button?\!?\!).

**Line 10:** So far, our window is invisible and won't be shown. This line fixes this by setting the window to visible.

##### Compile and run time\! If you can't quite remember what commands to run, they're shown below.

```bash
javac SpaceInvaders.java
java SpaceInvaders
```
Hopefully you should now see a blank window open up\! If it didn't work, come and grab me and we'll work it out. You can close the window by pressing the close button.

#### Section 2: Adding In The Player
So the first thing we need to add in to our empty window is the player\! We'll call it the **shooter** from now on since it's easy to refer to. The code below is what you need to add this guy onto the screen. Again, I'll go through all of the new lines below.

```java
import java.awt.*;
import javax.swing.*;
import java.net.*;
import javax.imageio.ImageIO;
import java.awt.image.*;

public class SpaceInvaders {
	public static void main(String[] args) {
			JFrame window = new JFrame();
			window.setTitle("Space Invaders!");
			window.setSize(600,400);
			window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			window.setLayout(null);
			
			BufferedImage shooter;
			JLabel shooterLabel = new JLabel();

			try {
				shooter = ImageIO.read(new URL("http://dcs.warwick.ac.uk/~csuneh/shooter.png"));
				shooterLabel = new JLabel(new ImageIcon(shooter));
				shooterLabel.setSize(50,50);
				shooterLabel.setLocation(275,325);
			} catch (Exception e) {
				System.out.println("oops, couldn't find image");
			}
			window.add(shooterLabel);
			window.setVisible(true);

	}
}
```
So we've added and moved about a few lines\! Let's go through them.

**Line 3:** This line is needed so that we can load in an image from a URL, you'll see where we do this later. It adds the "net" library which handles URL's.

**Line 4:** In order to create an image, we must use the Java ImageIO library so this is where we tell the computer we want to use those functions.

**Line 5:** In order to add a created image onto our empty JFrame, we must use the awt "image" library, and this is the line that imports this library.

**Line 13:** You'll notice that the "window.setVisible(true)" line that was here originally has been moved to the end, and in it's place we have "window.setLayout(null)". Because we're now adding things onto our JFrame, we don't want to make it visible until everything is added in, or things won't work. The "setLayout" command is telling our JFrame that we don't want an automatic layout done for us, i.e, we want to specify the location that the shooter appears at ourselves. If we don't disable layouts (by putting "null" into the setLayout function), we would not be able to give our shooter image an x and y location, it would appear in the middle only.

**Line 15:** This line is declaring a variable that will hold the image of our shooter, called a BufferedImage.

**Line 16:** This line is declaring a variable that will hold our image container\! In Java swing and awt, you must load in an image (BufferedImage), and then you must create a container to put it in (called JLabel). You can't just load in an image and display it on screen without first putting it into a container\! Unfortunately, the container is named JLabel, which doesn't really make a lot of sense since it's not a label, it's a container for stuff, including images\!

**Line 18:** This is the start of our **try catch** statement\! Remember how we used it in our first tutorial? It's because Java thinks that some lines we write are unsafe, and it wants us to catch any errors that occur, so it makes us use this try catch statement. The unsafe line in this case is line 19, because if that URL doesn't exist, it will error\!

**Line 19:** This is the line where we are reading in our image into the **shooter** variable. The image (of our little shooter guy, amazingly drawn by me) is being retrieved from my webspace on the departmental website using the ImageIO library\! We could also have read in an image that you store on your own computer, but this saves you guys from having to download and save multiple images.

**Line 20:** This line is putting our image into the image container that we made, **shooterLabel**. It creates a new ImageIcon using our **shooter** image, puts it into a new container (JLabel), and then makes our shooterLabel variable equal to it. **shooterLabel** now represents a container that contains our image, sorry that it's so complicated\! I'll try and represent it in ascii art:

                                         JLabel (the box)

                                         -------------------

shooterLabel =      |          shooter          |

                                          --------------------

**Line 21:** This line sets the size of our box, which will be 50 pixels by 50 pixels (width by height).

**Line 22:** This line sets the location of the box (and therefore image) on screen\! We want it right at the bottom of the screen, as this is where the shooter in Space Invaders is, and for now we're going to put it in the middle at the bottom (which happens to be x = 275 and y = 325, remember the origin (0,0) is in the TOP left\!).

**Line 23-25:** These lines only run if there is an error when we are loading the image. In this case, we print out  (TO THE TERMINAL), that the image loading failed\!

**Line 26:** Here we are actually adding our shooterLabel (and therefore image) onto our window (our JFrame), otherwise it would not show anything.

**Line 27:** Finally, we are setting the window (JFrame) to visible so we can see our creation\!

##### Now you can compile and run your program\! You should see a window with a small shooter at the bottom of it. If you don't, come grab me for help\!

Congrats\! Now it's time to add in player movement and shooting\!

#### Section 3: Moving The Shooter And Making It Fire!
So now that we have a shooter, we need to be able to move it and make it fire\! You'll be pleased to know that the way that **swing** and **awt** handle keyboard input is waaaaaay better than how we had to handle keyboard input in the terminal\! It comes built in with these libraries, but only if you're making a graphical application (which is why we couldn't use it in the first tutorial).

First off, here is the code that takes input from the left and right arrow keys and then moves the player in that direction, it will be explained afterwards as normal\!

```java
import java.awt.*;
import javax.swing.*;
import java.net.*;
import javax.imageio.ImageIO;
import java.awt.image.*;
import java.awt.event.*;

public class SpaceInvaders {

	static JFrame window = new JFrame();
	static JLabel shooterLabel = new JLabel();

	public static void main(String[] args) {
			window.setTitle("Space Invaders!");
			window.setSize(600,400);
			window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			window.setLayout(null);
			
			BufferedImage shooter;

			try {
				shooter = ImageIO.read(new URL("http://dcs.warwick.ac.uk/~csuneh/shooter.png"));
				shooterLabel = new JLabel(new ImageIcon(shooter));
				shooterLabel.setSize(50,50);
				shooterLabel.setLocation(275,325);
			} catch (Exception e) {
				System.out.println("oops, couldn't find image");
			}
			window.add(shooterLabel);
			window.addKeyListener(new Listener());
			window.setVisible(true);

	}

	static class Listener implements KeyListener {
		public void keyTyped(KeyEvent e) {
			//we dont really care about this function
		}
		public void keyPressed(KeyEvent e) {
			int key = e.getKeyCode();
			int currentX = shooterLabel.getLocation().x;
			int currentY = shooterLabel.getLocation().y;

			if (key == KeyEvent.VK_LEFT) {
				shooterLabel.setLocation(currentX-10,currentY);
				shooterLabel.setVisible(true);
			} else if (key == KeyEvent.VK_RIGHT) {
				shooterLabel.setLocation(currentX+10,currentY);
				shooterLabel.setVisible(true);
			}
		}
		public void keyReleased(KeyEvent e) {
		}
	}
}
```
So there's a fair amount of new stuff here... Lines 6, 30 and 35-54 are completely new, and lines 10 and 11 have been moved here from where they were before (they used to be at lines 9 and 16). Let's go over them:

**Line 6:** In order to take input from our keyboard, we need to use this library\! The **awt** event library (because pressing a key on the keyboard is an event in Java terms).

**Line 10 & 11:** These two lines have been moved up outside of the **main** function so that they become *global*** **variables. This means that we can access them from different functions and classes (which we'll need to do when we want to move our character). We have also added the **static** keyword at the start of them, because Java requires that all variables that are used in a static function (main function in our case) must be static themselves.

##### I'm going to skip line 30 for now, but we'll be back\!

**Line 35:** Remember when we wrote our own Point class in tutorial one, that holds a point? Well here is another one of our own classes\! This class will handle when a key on the keyboard is pressed. We have called our class **Listener**, as we want it to listen for key presses. Now, there is a new keyword here, **implements**\! Look at it like this, the thing after "implements", **KeyListener**, is a specification of what functions are needed to make a KeyListener work. Our class, just called **Listener**, is *implementing*** **the specification that is specified in KeyListener (found in the Java awt library). The specification says that any key listener must have three functions. A key listener must listen for keys typed (called keyTyped, basically a quick press and release of a key), it must listen for keys pressed (called keyPressed, it just listens for when a key is pushed down) and finally, it must check for keys released (called keyReleased, it listens for when a key is let go of). 

**Line 36-38:** This is the first of the three functions, the keyTyped function. We don't really care about this one as we only want to see if the key was pressed down.

**Line 39:** This is the start of the function we care about, keyPressed. When a key is pressed, it runs this function and the event that happens is recorded and sent into this function using a KeyEvent. This KeyEvent variable (named "e"), holds information like what key was pressed, as well as when and some other not relevant information.

**Line 40:** Remember how all keys on the keyboards have number codes? Well this line declares a new integer variable, **key**, and puts the number code of the key that was pressed into it (the code is produced by calling the getKeyCode function on the KeyEvent variable "e").

**Line 41 & 42:** These two lines are getting the current X and Y locations of our shooter, and putting them into new integer variables called currentX and currentY.

**Line 44:** We now need to check exactly what key on the keyboard was pressed, and if it was the left or right arrow keys. This line checks to see if our keycode matches the keycode of the left arrow key (called KeyEvent.VK\_LEFT).

**Line 45:** If the codes match and we have in fact pressed the left arrow key, then we must move our shooter\! This line does this by setting the location of **shooterLabel** to the left a little bit (by taking away 10 on the X axis, nothing on the Y as we don't want our shooter to be able to move up and down, only left and right).

**Line 46:** This line makes sure that our shooterLabel will draw in the new location, as the setVisible function forces a refresh of the drawing on screen (so it goes to the right place).

**Line 47-50:** These lines are doing the same thing as the lines above, except for if the right arrow key was pressed instead. In this case, we want to move in a positive X direction.

**N.B. When we set the location, any numbers are in pixels.**

**Line 52-53:** This is the final function that the KeyListener specification says we must have, we also don't really care about this one at the moment.

##### Back to line 30...

**Line 30:** We created our Listener class, but remember how a class represents a stencil and we must colour it in to use it? This is exactly what this line is doing. We must add the Listener to our window, so we call the addKeyListener function on the window, with a new Listener (our class) as an argument (input). This will "colour in" the Listener class so we can use it\!

##### Aaaaand you can compile and run. You should now be able to press the left and right arrow keys, and the shooter will move left and right\! Try seeing if you can work out how to reverse the directions (i.e. left arrow moves the shooter right and right arrow moves the shooter left).  

When you ran the program, you might have noticed that if you hold one of the arrow keys down, it moves one space, then pauses for a second before moving in the direction that you pressed. This isn't really that good, since it'll make the game harder to play\! Let's fix it. 

For once, I'm going to explain the idea of what I'm doing before I actually show you the code. The basis of this is that instead of moving the player every time we press down the key, **we will move the player continuously when the key is pressed down.** This means that we will have a boolean variable (true or false variable) for both the left and right arrow keys, that will keep a track of whether they are pressed down (true for down and false for up). We will then have a **while loop** in our main function that will keep checking if an arrow key is pressed down, and it is here that we will move the shooter in the correct direction if there is an arrow pressed. This **while** loop is known as the **game loop**, as it is what makes everything in our game move/function.

So now I've explained that a bit, let's go onto the code. Don't worry, I'll still explain it again, line by line, down below.

```java
import java.awt.*;
import javax.swing.*;
import java.net.*;
import javax.imageio.ImageIO;
import java.awt.image.*;
import java.awt.event.*;

public class SpaceInvaders {

	static JFrame window = new JFrame();
	static JLabel shooterLabel = new JLabel();
	static boolean isLeftDown = false;
	static boolean isRightDown = false;

	public static void main(String[] args) {
			window.setTitle("Space Invaders!");
			window.setSize(600,400);
			window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			window.setLayout(null);
			
			BufferedImage shooter;

			try {
				shooter = ImageIO.read(new URL("http://dcs.warwick.ac.uk/~csuneh/shooter.png"));
				shooterLabel = new JLabel(new ImageIcon(shooter));
				shooterLabel.setSize(50,50);
				shooterLabel.setLocation(275,325);
			} catch (Exception e) {
				System.out.println("oops, couldn't find image");
			}
			window.add(shooterLabel);
			window.addKeyListener(new Listener());
			window.setVisible(true);

			while (true) {
				int currentX = shooterLabel.getLocation().x;
				int currentY = shooterLabel.getLocation().y;
				if (isLeftDown == true) {
					shooterLabel.setLocation(currentX-10,currentY);
					shooterLabel.setVisible(true);
				}
				if (isRightDown == true) {
					shooterLabel.setLocation(currentX+10,currentY);
					shooterLabel.setVisible(true);
				}

				try {
					Thread.sleep(60);
				} catch (Exception e) {
				}
			}

	}

	static class Listener implements KeyListener {
		public void keyTyped(KeyEvent e) {
			//we dont really care about this function
		}
		public void keyPressed(KeyEvent e) {
			int key = e.getKeyCode();

			if (key == KeyEvent.VK_LEFT) {
				isLeftDown = true;
			} else if (key == KeyEvent.VK_RIGHT) {
				isRightDown = true;
			}
		}
		public void keyReleased(KeyEvent e) {
			int key = e.getKeyCode();

			if (key == KeyEvent.VK_LEFT) {
				isLeftDown = false;
			} else if (key == KeyEvent.VK_RIGHT) {
				isRightDown = false;
			}
		}
	}
}
```
The new lines here are 12 and 13, 35-51, 62-67 and 71-75. It seems like a lot, but we have deleted a few line too\! (The stuff that moved the shooter in the Listener class). Let's have a look:

**Line 12 & 13:** These are the boolean variables I was talking about, that will tell us whether the left and right arrow keys are pressed down or not\! We will set them to false initially.

**Line 35:** This is the start of our while loop (or our game loop). We want it to go on infinitely (or until we press the close button, but that will happen automatically) so we can keep playing the game\! The code inside this loop (inside the curly braces) will keep running over and over until we quit out of the game with the close button.

**Line 36 & 37:** You should already recognise these lines\! They have just been moved up from the Listener class. They just store the values of the current X and Y location of the shooter into two variables.

**Line 38:** Hopefully it will be quite obvious that if the left arrow key is pressed down, we want to move the shooter left\! Here we are checking if that is true.

**Line 39:** This line has also been moved up from below. It is changing the location of the shooter to slightly left of where it was before.

**Line 40:** Again, another copied line. This one is just making sure we redraw the shooter on screen at it's new location.

**Line 42-45:** This is the same as if the left arrow key was down, but for the right arrow key.

**Line 47-49:** These lines are the same as some lines in tutorial one. All they do is make the program wait for a short amount of time, in this case 60 milliseconds. I tried playing around with this variable to make the game as smooth as possible, and this is the best value I found. Feel free to change it around yourself\!

**Line 62 & 63:** Instead of moving the shooter when the left arrow key is pressed, we are now just setting the boolean value of isLeftDown to true\! It's the game loop that deals with movement now.

**Line 64-66:** This is the same as the above lines but for isRightDown.

**Line 68 & 69:** Remember how we didn't really care about the keyReleased function before? Well now we need it\! When an arrow key is released, we need to set the boolean isLeftDown or isRightDown (depending on which arrow key was released) to be false again since we aren't holding it any more. Line 69 is getting the key code value from the KeyEvent (the code of the key that was released), similar to the keyPressed function.

**Line 71-75:** You'll notice that this code is pretty much identical to lines 62-66, apart from we set the boolean values (isLeftDown and isRightDown) to false instead, since they have now been released.

##### Now you can compile and run the game, and there will be no stuttering when you press and hold the left and right arrow keys.

Now we need to make our shooter actually fire something\! When the fire button is pressed (space bar), we will make it so that a small bullet is made, and added into a list of bullets. Then we need to move every bullet in the list upwards every time the game loop runs (so it looks like it's firing)\! We will also remove bullets from the list when they go past the top of the screen (and eventually we will remove them from the list when they collide with an enemy). Let's have a look at the code to do this:

```java
import java.awt.*;
import javax.swing.*;
import java.net.*;
import javax.imageio.ImageIO;
import java.awt.image.*;
import java.awt.event.*;
import java.util.*;

public class SpaceInvaders {

	static JFrame window = new JFrame();
	static JLabel shooterLabel = new JLabel();
	static boolean isLeftDown = false;
	static boolean isRightDown = false;
	static ArrayList<JLabel> bullets = new ArrayList<JLabel>();
	static BufferedImage bulletImage;
	public static void main(String[] args) {
			window.setTitle("Space Invaders!");
			window.setSize(600,400);
			window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			window.setLayout(null);
			
			BufferedImage shooter;

			try {
				shooter = ImageIO.read(new URL("http://dcs.warwick.ac.uk/~csuneh/shooter.png"));
				shooterLabel = new JLabel(new ImageIcon(shooter));
				shooterLabel.setSize(50,50);
				shooterLabel.setLocation(275,325);

				bulletImage = ImageIO.read(new URL("http://dcs.warwick.ac.uk/~csuneh/bullet.png"));

			} catch (Exception e) {
				System.out.println("oops, couldn't find image");
			}
			window.add(shooterLabel);
			window.addKeyListener(new Listener());
			window.setVisible(true);

			while (true) {
				int currentX = shooterLabel.getLocation().x;
				int currentY = shooterLabel.getLocation().y;
				if (isLeftDown == true) {
					shooterLabel.setLocation(currentX-10,currentY);
					shooterLabel.setVisible(true);
				}
				if (isRightDown == true) {
					shooterLabel.setLocation(currentX+10,currentY);
					shooterLabel.setVisible(true);
				}

				ArrayList<JLabel> bulletsOutOfBounds = new ArrayList<JLabel>();
				for (int i = 0; i < bullets.size(); i++) {
					int bulletLocationX = bullets.get(i).getLocation().x;
					int bulletLocationY = bullets.get(i).getLocation().y;
					if (bulletLocationY < 0) {
						bulletsOutOfBounds.add(bullets.get(i));
					}
					bullets.get(i).setLocation(bulletLocationX,bulletLocationY-10);
					bullets.get(i).setVisible(true);
				}

				bullets.removeAll(bulletsOutOfBounds);

				try {
					Thread.sleep(60);
				} catch (Exception e) {
				}
				window.repaint();
			}
	}

	static class Listener implements KeyListener {
		public void keyTyped(KeyEvent e) {
			//we dont really care about this function
		}
		public void keyPressed(KeyEvent e) {
			int key = e.getKeyCode();

			if (key == KeyEvent.VK_LEFT) {
				isLeftDown = true;
			} else if (key == KeyEvent.VK_RIGHT) {
				isRightDown = true;
			} else if (key == KeyEvent.VK_SPACE) {
				int currentX = shooterLabel.getLocation().x;
				int currentY = shooterLabel.getLocation().y;

				JLabel bulletLabel = new JLabel(new ImageIcon(bulletImage));
				bulletLabel.setSize(5,5);
				bulletLabel.setLocation(currentX + 24, currentY + 30);
				window.add(bulletLabel);
				bullets.add(bulletLabel);
			}
		}
		public void keyReleased(KeyEvent e) {
			int key = e.getKeyCode();

			if (key == KeyEvent.VK_LEFT) {
				isLeftDown = false;
			} else if (key == KeyEvent.VK_RIGHT) {
				isRightDown = false;
			}
		}
	}
}
```
Woah\! Our code grew\! Lines 7, 15, 16, 31, 52-63, 69 and 84-93 are new. Most of them aren't very complicated though, don't worry\!

**Line 7:** This is the library we need so that we can use java ArrayList's (lists that can change size).

**Line 15:** Here, we are creating our list of bullets. Since our bullets are images that need to be put in containers (JLabels), the type of this ArrayList will be JLabel. We are setting it to empty for now, as we haven't fired yet\!

**Line 16:** This line is declaring a global variable that will hold our bullet image, since we don't want to have to load it in every single time we create a new bullet\!

**Line 31:** This line is the part that actually fetches the image (a nice red square I drew myself) and puts it into our bulletImage variable.

**Line 52:** This line declares a new ArrayList that will hold all of the bullets that we want to remove (if they have gone out of bounds). If we let our list of bullets grow and grow without deleting anything, the game would soon get super slow\!

**Line 53:** Ah, our old friend the **for** loop\! Here, we are are looping through from zero to the size of our list of bullets. This is because we want to access each bullet and both check if it is out of bounds, and move it upwards\!

**Line 54:** This line is getting the X location of the current bullet we are on, bullet number "i" in our list (controlled by the **for** loop, the number of times we have run the code already is "i").

**Line 55:** Same as line 54 but for the Y location.

**Line 56:** Here, we are checking to see if the bullet has gone off the top of the screen (remember, Y = 0 is the top of the screen, so Y \< 0 is off the top\!).

**Line 57:** If the bullet went off the top, we must add it to the list of bullets that are out of bounds, so we can delete it later\! This is what this line does.

**Line 59:** For the bullets that didn't go off screen, we need to move them upwards. This line sets the location of the current bullet to be slightly above (by taking away from the Y value) where it was before.

**Line 60:** This line is making sure the bullet moves to the new location.

**Line 63:** This line removes all of the out of bound bullets from the total list of bullets, making the list only the bullets that we can see onscreen.

**Line 69:** This line is needed because otherwise, the bullets do not show up. It redraws everything on the window.

**Line 84:** This line is checking to see if the key that was pressed down on the keyboard was the spacebar\! Just like we checked to see if it was the left or right arrow keys.

**Line 85 & 86:** These lines are the same as line 41 & 42. They are just storing the current location of the shooter in easy to read variables.

**Line 88:** This line is creating a new container (JLabel) for our new bullet\! It uses our bulletImage as the picture we want to draw.

**Line 89:** Here, we are setting the size of the container to be 5 pixels by 5 pixels, as this is the size of our bullet.

**Line 90:** This line is setting the location of the new bullet to be *just* above the shooter, right in the middle (so it looks like it came out of the shooter's gun\!). The 24 and 30 numbers were just me playing around to get the positioning just right.

**Line 91:** We then need to add our bullet container onto the window, which is what is done here.

**Line 93:** Finally, we need to add our new bullet container into our list of bullets (called **bullets**), so that we can access and move the bullet upwards in the game loop.

##### See, that wasn't that difficult\! If you compile and run your program, you should hopefully have a little shooter that will move and shoot bullets upwards\!

Now you're ready for the next section, adding the enemies\!

#### Section 4: Adding In Some Enemies
It wouldn't be a very good game if there weren't any enemies. The following code adds enemies into the game (no movement yet):

```java
import java.awt.*;
import javax.swing.*;
import java.net.*;
import javax.imageio.ImageIO;
import java.awt.image.*;
import java.awt.event.*;
import java.util.*;

public class SpaceInvaders {

	static JFrame window = new JFrame();
	static JLabel shooterLabel = new JLabel();
	static boolean isLeftDown = false;
	static boolean isRightDown = false;
	static ArrayList<JLabel> bullets = new ArrayList<JLabel>();
	static ArrayList<JLabel> enemies = new ArrayList<JLabel>();
	static BufferedImage bulletImage;
	static BufferedImage invaderImage;

	public static void main(String[] args) {
			window.setTitle("Space Invaders!");
			window.setSize(600,400);
			window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			window.setLayout(null);
			
			BufferedImage shooter;

			try {
				shooter = ImageIO.read(new URL("http://dcs.warwick.ac.uk/~csuneh/shooter.png"));
				shooterLabel = new JLabel(new ImageIcon(shooter));
				shooterLabel.setSize(50,50);
				shooterLabel.setLocation(275,325);

				bulletImage = ImageIO.read(new URL("http://dcs.warwick.ac.uk/~csuneh/bullet.png"));
				invaderImage = ImageIO.read(new URL("http://dcs.warwick.ac.uk/~csuneh/invader.png"));

			} catch (Exception e) {
				System.out.println("oops, couldn't find image");
			}

			for (int i = 0; i < 6; i++) {
				JLabel enemy = new JLabel(new ImageIcon(invaderImage));
				enemy.setSize(50,50);
				enemy.setLocation(40 + (90 * i), 25);
				window.add(enemy);
				enemy.setVisible(true);
				enemies.add(enemy);
			}

			window.add(shooterLabel);
			window.addKeyListener(new Listener());
			window.setVisible(true);

			while (true) {
				int currentX = shooterLabel.getLocation().x;
				int currentY = shooterLabel.getLocation().y;
				if (isLeftDown == true) {
					shooterLabel.setLocation(currentX-10,currentY);
					shooterLabel.setVisible(true);
				}
				if (isRightDown == true) {
					shooterLabel.setLocation(currentX+10,currentY);
					shooterLabel.setVisible(true);
				}

				ArrayList<JLabel> bulletsOutOfBounds = new ArrayList<JLabel>();
				for (int i = 0; i < bullets.size(); i++) {
					int bulletLocationX = bullets.get(i).getLocation().x;
					int bulletLocationY = bullets.get(i).getLocation().y;
					if (bulletLocationY < 0) {
						bulletsOutOfBounds.add(bullets.get(i));
					}
					bullets.get(i).setLocation(bulletLocationX,bulletLocationY-10);
					bullets.get(i).setVisible(true);
				}

				bullets.removeAll(bulletsOutOfBounds);

				try {
					Thread.sleep(60);
				} catch (Exception e) {
				}
				window.repaint();
			}
	}

	static class Listener implements KeyListener {
		public void keyTyped(KeyEvent e) {
			//we dont really care about this function
		}
		public void keyPressed(KeyEvent e) {
			int key = e.getKeyCode();

			if (key == KeyEvent.VK_LEFT) {
				isLeftDown = true;
			} else if (key == KeyEvent.VK_RIGHT) {
				isRightDown = true;
			} else if (key == KeyEvent.VK_SPACE) {
				int currentX = shooterLabel.getLocation().x;
				int currentY = shooterLabel.getLocation().y;

				JLabel bulletLabel = new JLabel(new ImageIcon(bulletImage));
				bulletLabel.setSize(5,5);
				bulletLabel.setLocation(currentX + 24, currentY + 30);
				window.add(bulletLabel);
				bullets.add(bulletLabel);
			}
		}
		public void keyReleased(KeyEvent e) {
			int key = e.getKeyCode();

			if (key == KeyEvent.VK_LEFT) {
				isLeftDown = false;
			} else if (key == KeyEvent.VK_RIGHT) {
				isRightDown = false;
			}
		}
	}
}
```
Right, lines 16, 18, 35 and 41-48 are new, barely anything\!

**Line 16:** Here, we are creating an ArrayList that will hold all of our enemies\! It is set to empty for now since we haven't added any enemies just yet.

**Line 18:** This is the line where we are creating a variable that will hold our invader (enemy) image, so we don't have to load it in for every enemy.

**Line 35:** This line is the line that actually reads in the beautiful invader image that I drew into the invaderImage variable, much like the bulletImage and shooter image lines.

**Line 41:** This is the start of a **for** loop that will draw in our enemies. It loops from 0 until the number of enemies we want. In this case, I think that 6 enemies fits on the screen pretty perfectly so we'll go with 6.

**Line 42:** For the current enemy, this is the line that creates a container (JLabel) to hold our current enemy image.

**Line 43:** This line sets the size of the enemy to be 50 by 50, which is the size of the actual invader.png drawing.

**Line 44:** This line is setting the location of the invader. For each enemy, we want to space it out from the last one (on the X axis, so they display across the window instead of in the same place), so we do a cool sum using the value of "i", the current enemy number, to space it out accordingly (i.e. earlier enemy numbers are closer to the left and they move rightwards).

**Line 45:** Here, we are adding our current enemy onto the window.

**Line 46:** This line makes sure the enemy is visible to us\!

**Line 47:** This line is adding the enemy we just made to our list of enemies, so we're able to access and move it around later\!

##### Now you can compile and run. You should see some amazing invaders spaced out across the top of the screen. They don't move yet and you can't hit them with bullets, but we'll get to that.

So now we have our invaders\! The following code will move the invaders, and when they reach the edge, the whole row will move down. Here is the code:

```java
import java.awt.*;
import javax.swing.*;
import java.net.*;
import javax.imageio.ImageIO;
import java.awt.image.*;
import java.awt.event.*;
import java.util.*;

public class SpaceInvaders {

	static JFrame window = new JFrame();
	static JLabel shooterLabel = new JLabel();
	static boolean isLeftDown = false;
	static boolean isRightDown = false;
	static ArrayList<JLabel> bullets = new ArrayList<JLabel>();
	static ArrayList<JLabel> enemies = new ArrayList<JLabel>();
	static BufferedImage bulletImage;
	static BufferedImage invaderImage;

	public static void main(String[] args) {
			window.setTitle("Space Invaders!");
			window.setSize(600,400);
			window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			window.setLayout(null);
			
			BufferedImage shooter;

			try {
				shooter = ImageIO.read(new URL("http://dcs.warwick.ac.uk/~csuneh/shooter.png"));
				shooterLabel = new JLabel(new ImageIcon(shooter));
				shooterLabel.setSize(50,50);
				shooterLabel.setLocation(275,325);

				bulletImage = ImageIO.read(new URL("http://dcs.warwick.ac.uk/~csuneh/bullet.png"));
				invaderImage = ImageIO.read(new URL("http://dcs.warwick.ac.uk/~csuneh/invader.png"));

			} catch (Exception e) {
				System.out.println("oops, couldn't find image");
			}

			for (int i = 0; i < 6; i++) {
				JLabel enemy = new JLabel(new ImageIcon(invaderImage));
				enemy.setSize(50,50);
				enemy.setLocation(40 + (90 * i), 25);
				window.add(enemy);
				enemy.setVisible(true);
				enemies.add(enemy);
			}

			window.add(shooterLabel);
			window.addKeyListener(new Listener());
			window.setVisible(true);

			int enemyDirection = 1;

			while (true) {
				int currentX = shooterLabel.getLocation().x;
				int currentY = shooterLabel.getLocation().y;
				if (isLeftDown == true) {
					shooterLabel.setLocation(currentX-10,currentY);
					shooterLabel.setVisible(true);
				}
				if (isRightDown == true) {
					shooterLabel.setLocation(currentX+10,currentY);
					shooterLabel.setVisible(true);
				}

				ArrayList<JLabel> bulletsOutOfBounds = new ArrayList<JLabel>();
				for (int i = 0; i < bullets.size(); i++) {
					int bulletLocationX = bullets.get(i).getLocation().x;
					int bulletLocationY = bullets.get(i).getLocation().y;
					if (bulletLocationY < 0) {
						bulletsOutOfBounds.add(bullets.get(i));
					}
					bullets.get(i).setLocation(bulletLocationX,bulletLocationY-10);
					bullets.get(i).setVisible(true);
				}

				if (enemyDirection == 1 && enemies.get(enemies.size()-1).getLocation().x > 540) {
					for (int j = 0; j < enemies.size(); j++) {
						int enemyLocationX = enemies.get(j).getLocation().x;
						int enemyLocationY = enemies.get(j).getLocation().y;
						enemies.get(j).setLocation(enemyLocationX,enemyLocationY + 20);
					}
					enemyDirection = -1;
				} else if (enemyDirection == -1 && enemies.get(0).getLocation().x < 10) {
					for (int j = 0; j < enemies.size(); j++) {
						int enemyLocationX = enemies.get(j).getLocation().x;
						int enemyLocationY = enemies.get(j).getLocation().y;
						enemies.get(j).setLocation(enemyLocationX,enemyLocationY + 20);
					}
					enemyDirection = 1;
				} else if (enemyDirection == 1) {
					for (int j = 0; j < enemies.size(); j++) {
						int enemyLocationX = enemies.get(j).getLocation().x;
						int enemyLocationY = enemies.get(j).getLocation().y;
						enemies.get(j).setLocation(enemyLocationX+5,enemyLocationY);
					}
				} else if (enemyDirection == -1) {
					for (int j = 0; j < enemies.size(); j++) {
						int enemyLocationX = enemies.get(j).getLocation().x;
						int enemyLocationY = enemies.get(j).getLocation().y;
						enemies.get(j).setLocation(enemyLocationX-5,enemyLocationY);
					}
				}


				bullets.removeAll(bulletsOutOfBounds);

				try {
					Thread.sleep(60);
				} catch (Exception e) {
				}
				window.repaint();
			}
	}

	static class Listener implements KeyListener {
		public void keyTyped(KeyEvent e) {
			//we dont really care about this function
		}
		public void keyPressed(KeyEvent e) {
			int key = e.getKeyCode();

			if (key == KeyEvent.VK_LEFT) {
				isLeftDown = true;
			} else if (key == KeyEvent.VK_RIGHT) {
				isRightDown = true;
			} else if (key == KeyEvent.VK_SPACE) {
				int currentX = shooterLabel.getLocation().x;
				int currentY = shooterLabel.getLocation().y;

				JLabel bulletLabel = new JLabel(new ImageIcon(bulletImage));
				bulletLabel.setSize(5,5);
				bulletLabel.setLocation(currentX + 24, currentY + 30);
				window.add(bulletLabel);
				bullets.add(bulletLabel);
			}
		}
		public void keyReleased(KeyEvent e) {
			int key = e.getKeyCode();

			if (key == KeyEvent.VK_LEFT) {
				isLeftDown = false;
			} else if (key == KeyEvent.VK_RIGHT) {
				isRightDown = false;
			}
		}
	}
}
```
The new lines here are lines 54 and 79-105. I know that chunk of code at 79-105 looks like a lot, but there is a ton of repeated code there with minor differences, so don't worry\!

**Line 54:** Since we want our enemies to move left and right, and switch direction when they reach the end, we want to keep a track of the current direction they are going in. **Left is 1 and right is -1.** We will start them off going left\!  

##### A note about the following lines: there are four cases that will occur when we are moving the enemies. The first **two** easy ones are the the enemies are moving left and haven't touched the end yet, so we can just keep on moving them, and the same when they are moving right and haven't touched the end yet. The **third** case is that they are moving left but the last enemy has reached the end (in which case we want all the enemies to move down) and the **fourth** case is that they are moving right and the first enemy reaches the edge.

**Line 79:** This line is checking for **case 3**, that the enemies are moving left (direction = 1) and that the last enemy has gone past the edge (or, just before it goes past the edge, at X value 540 instead of 600).

**Line 80-84:** This chunk of code is looping through the list of enemies and moving them all down a bit (since they're at the edge of the screen).

**Line 85:** Since we reached the end in the left direction, this line reverses the direction so that they start moving right (direction = -1) after they've moved down a bit.

**Line 86-92:** These lines cover **case 4**, that the enemies are moving right and the first enemy has reached the edge. We then loop over all the enemies and move them down slightly, and finally we reverse the direction again so they are going left again.

**Line 93-98:** These lines cover **case 1**, that the enemies are moving left but have not reached the edge yet. This part then loops through all the enemies and moves them all more to the left.

**Line 99-105:** These lines cover **case 2**, that the enemies are moving right but have not reached the edge yet. It loops through the enemies and moves them all more to the right\!

##### And that's it\! Compile and run your code and you should have some moving enemies. I have noticed that the game lags a little when you aren't pressing any keys, so sorry if that happens to you\! (I don't know if it's just my computer, I have a pretty terrible laptop).

Now it's time for the final section, making the enemies die when our bullets hit them\!

#### Section 5: Killing Off The Enemies When We Hit Them (Collision Detection)
The basic idea of collision detection is that we want to check if any of the bullets have hit any of the enemies\! We will do this using two for loops, one nested inside the other. The first loop will go through the list of bullets and the second will loop through the list of enemies. If the bullet is inside the square that represents an enemy, that enemy should die and so should the bullet. The code for this is as follows:

```java
import java.awt.*;
import javax.swing.*;
import java.net.*;
import javax.imageio.ImageIO;
import java.awt.image.*;
import java.awt.event.*;
import java.util.*;

public class SpaceInvaders {

	static JFrame window = new JFrame();
	static JLabel shooterLabel = new JLabel();
	static boolean isLeftDown = false;
	static boolean isRightDown = false;
	static ArrayList<JLabel> bullets = new ArrayList<JLabel>();
	static ArrayList<JLabel> enemies = new ArrayList<JLabel>();
	static BufferedImage bulletImage;
	static BufferedImage invaderImage;

	public static void main(String[] args) {
			window.setTitle("Space Invaders!");
			window.setSize(600,400);
			window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			window.setLayout(null);
			
			BufferedImage shooter;

			try {
				shooter = ImageIO.read(new URL("http://dcs.warwick.ac.uk/~csuneh/shooter.png"));
				shooterLabel = new JLabel(new ImageIcon(shooter));
				shooterLabel.setSize(50,50);
				shooterLabel.setLocation(275,325);

				bulletImage = ImageIO.read(new URL("http://dcs.warwick.ac.uk/~csuneh/bullet.png"));
				invaderImage = ImageIO.read(new URL("http://dcs.warwick.ac.uk/~csuneh/invader.png"));

			} catch (Exception e) {
				System.out.println("oops, couldn't find image");
			}

			for (int i = 0; i < 6; i++) {
				JLabel enemy = new JLabel(new ImageIcon(invaderImage));
				enemy.setSize(50,50);
				enemy.setLocation(40 + (90 * i), 25);
				window.add(enemy);
				enemy.setVisible(true);
				enemies.add(enemy);
			}

			window.add(shooterLabel);
			window.addKeyListener(new Listener());
			window.setVisible(true);

			int enemyDirection = 1;

			while (true) {
				int currentX = shooterLabel.getLocation().x;
				int currentY = shooterLabel.getLocation().y;
				if (isLeftDown == true) {
					shooterLabel.setLocation(currentX-10,currentY);
					shooterLabel.setVisible(true);
				}
				if (isRightDown == true) {
					shooterLabel.setLocation(currentX+10,currentY);
					shooterLabel.setVisible(true);
				}

				ArrayList<JLabel> bulletsOutOfBounds = new ArrayList<JLabel>();
				for (int i = 0; i < bullets.size(); i++) {
					int bulletLocationX = bullets.get(i).getLocation().x;
					int bulletLocationY = bullets.get(i).getLocation().y;
					if (bulletLocationY < 0) {
						bulletsOutOfBounds.add(bullets.get(i));
					}
					bullets.get(i).setLocation(bulletLocationX,bulletLocationY-10);
					bullets.get(i).setVisible(true);
				}

				if (enemyDirection == 1 && enemies.get(enemies.size()-1).getLocation().x > 540) {
					for (int j = 0; j < enemies.size(); j++) {
						int enemyLocationX = enemies.get(j).getLocation().x;
						int enemyLocationY = enemies.get(j).getLocation().y;
						enemies.get(j).setLocation(enemyLocationX,enemyLocationY + 20);
					}
					enemyDirection = -1;
				} else if (enemyDirection == -1 && enemies.get(0).getLocation().x < 10) {
					for (int j = 0; j < enemies.size(); j++) {
						int enemyLocationX = enemies.get(j).getLocation().x;
						int enemyLocationY = enemies.get(j).getLocation().y;
						enemies.get(j).setLocation(enemyLocationX,enemyLocationY + 20);
					}
					enemyDirection = 1;
				} else if (enemyDirection == 1) {
					for (int j = 0; j < enemies.size(); j++) {
						int enemyLocationX = enemies.get(j).getLocation().x;
						int enemyLocationY = enemies.get(j).getLocation().y;
						enemies.get(j).setLocation(enemyLocationX+5,enemyLocationY);
					}
				} else if (enemyDirection == -1) {
					for (int j = 0; j < enemies.size(); j++) {
						int enemyLocationX = enemies.get(j).getLocation().x;
						int enemyLocationY = enemies.get(j).getLocation().y;
						enemies.get(j).setLocation(enemyLocationX-5,enemyLocationY);
					}
				}

				ArrayList<JLabel> enemiesKilled = new ArrayList<JLabel>();
				for (int u = 0; u < bullets.size(); u++) {
					int bulletLocationX = bullets.get(u).getLocation().x + 2;
					int bulletLocationY = bullets.get(u).getLocation().y + 2;
					for (int q = 0; q < enemies.size(); q++) {
						int enemyLocationX = enemies.get(q).getLocation().x;
						int enemyLocationY = enemies.get(q).getLocation().y;
						if (bulletLocationX >= enemyLocationX && bulletLocationX <= enemyLocationX + 50 && bulletLocationY >= enemyLocationY && bulletLocationY <= enemyLocationY+50) {
							bullets.get(u).setVisible(false);
							bulletsOutOfBounds.add(bullets.get(u));
							enemies.get(q).setVisible(false);
							enemiesKilled.add(enemies.get(q));
						}
					}
				}

				bullets.removeAll(bulletsOutOfBounds);
				enemies.removeAll(enemiesKilled);
				if (enemies.size() == 0) {
					window.setVisible(false);
					window.dispose();
					return;
				}

				try {
					Thread.sleep(60);
				} catch (Exception e) {
				}
				window.repaint();
			}
	}

	static class Listener implements KeyListener {
		public void keyTyped(KeyEvent e) {
			//we dont really care about this function
		}
		public void keyPressed(KeyEvent e) {
			int key = e.getKeyCode();

			if (key == KeyEvent.VK_LEFT) {
				isLeftDown = true;
			} else if (key == KeyEvent.VK_RIGHT) {
				isRightDown = true;
			} else if (key == KeyEvent.VK_SPACE) {
				int currentX = shooterLabel.getLocation().x;
				int currentY = shooterLabel.getLocation().y;

				JLabel bulletLabel = new JLabel(new ImageIcon(bulletImage));
				bulletLabel.setSize(5,5);
				bulletLabel.setLocation(currentX + 24, currentY + 30);
				window.add(bulletLabel);
				bullets.add(bulletLabel);
			}
		}
		public void keyReleased(KeyEvent e) {
			int key = e.getKeyCode();

			if (key == KeyEvent.VK_LEFT) {
				isLeftDown = false;
			} else if (key == KeyEvent.VK_RIGHT) {
				isRightDown = false;
			}
		}
	}
}
```
The new lines here are 107-121 and 124-129, and that's it\! Once you've read through all this, your game is done.

**Line 107:** Similar to recording the bullets we want to remove when they went offscreen, this line declares an ArrayList that will hold a list of all the enemies we want to remove.

**Line 108:** Here is the first of our two for loops, it loops through the list of bullets.

**Line 109 & 110:** These two lines are simply creating variables that hold the X and Y location of the bullet on screen\! For simplicity, we will treat the bullet as a single point during collision detection (instead of the 5 by 5 square it actually is), so we add 2 (which is roughly half of 5) to the X and Y coords to get the centre of the bullet.

**Line 111:** This line is the second for loop\! It loops through all of the enemies we currently have on the screen.

**Line 112 & 113:** These lines are declaring variables to hold the X and Y locations of the current enemy in the loop.

**Line 114:** This is the collision detection line\! Basically, we want to check if the bullet (that we've turned into a point for simplicity) is inside an enemy square. We do this by checking **four** things, whether the X location of the bullet is greater than the left edge of an enemy, whether the X location of the bullet is less than the right edge of an enemy (given by left edge plus width, which is 50), whether the Y location of the bullet is greater than the top edge of an enemy, and finally whether the Y location of the bullet is less than the bottom edge of an enemy. If all four of these things are true, then the bullet is inside our enemy\!

**Line 115:** This line is setting the bullet that hit an enemy to not be visible anymore (since we want to remove it).

**Line 116:** This line is adding the bullet to the list of out of bounds bullets, so it gets deleted later.

**Line 117:** This line is setting the enemy that got hit to not be visible anymore.

**Line 118:** This line adds the enemy to the killed enemies list so it gets removed later.

**Line 124:** This line removes all of the enemies that have been killed from our enemy list.

**Line 125-129:** All these lines are doing is checking to see if all the enemies have been killed (there are none in the list anymore) and if they have, it deletes the Java window and ends the program.

##### Now you can compile and run one last time, you made Space Invaders, congrats\!

#### Section -1: Comments
So I hope you all enjoyed this tutorial\! If there's anything you don't understand, come ask me\!

**Next week we will be going back to basics a little bit, and I will be setting questions (with guidance) for you guys to answer (the answers will be a small Java program that does something). This will hopefully get you thinking about and writing code on your own, instead of just copying mine\!**

Thanks for coming along/reading this\!

GLHF -- Tankski

