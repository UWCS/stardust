+++
title = "Beginner Programming Lesson One"
date = "2017-10-06T17:33:00Z"

[extra]
original = "https://uwcs.co.uk/news/beginner-programming-lesson-one-2017/"    
categories = ["Programming Lesson"]
+++

<p>A guide for completely new programmers, teaching you how to use the Linux machines and how to start programming the game Snake using Java in a terminal. Click to learn more!</p>

<!-- more -->

#### Section 0: A Quick Word About Our Computers
Here in the Computer Science Department, we have Linux machines. Don't be scared\! Linux is a operating system just like Windows or Mac, but is aimed towards programmers. This means it's a lot easier to learn basic programming on these machines\! We will be using two main programs on these computers, a text editor (just like Notepad on windows) called Kate, and a terminal. Both of these things are explained a little more below.

##### Text Editor: Kate

Yes, I know Kate is a girls name, but it's also the name of the text editor we will be using. To open it, click on the circular start button in the bottom left corner, and then write "Kate" in the search bar. Click on the application to start it up. It works like most text editors: it allows you to write and save text and has features for bold, italic and underlining, simple\!

##### Terminal

For the non-computer scientists among you (or actually, computer scientists as well), the terminal is a scary place that those super nerds use to get things done. In reality, it's a lot easier to use than you think\! To open a terminal, click on the start button again, and type "terminal" into the search bar. Several results will show up, but just click on the top one.

Once you have a terminal open, you're already halfway to compiling (don't worry, I'll explain what compiling is further down) and running your first computer program\! You've now got both the tools you need for this first workshop, so you can move on to the main tutorial. Any future use of the terminal will be explained in these later sections, don't worry\!

##### NB: Have the terminal window and the Kate window next to each other on screen (not overlapping), it will make life easier.

#### Section 1: "Hello World!" In Java
The first thing all programmers do when they learn a new language is write a small, "Hello World\!", program. I don't know why they use that phrase exactly, but it's basically a way of getting used to the **syntax** of a new language. So this is a good place to start.

**syntax: **the structure of statements in a computer language.

We will be learning Java. **** Java is a language that is very widely used in industry, android programming and in universities. In fact, the Computer Scientists at Warwick learn Java from their first year onward, so it's a great beginner language.

I will first write the whole program (it's not very long) for you to type into your text editor, and then I'll go through each part bit by bit. Once you've typed (or copied, but I find typing it out again helps me learn) out the whole thing (without the line numbers, that's just our website making code look pretty), save your file and name it "**HelloWorld.java**" (without the quotes). Naming it exactly this is important because the file name and the class name must match\! 

**N.B When it asks you where to save it, save it into your home directory IF YOU'RE USING YOUR OWN ACCOUNT. If you're using our CompSoc account, just give me a shout and I'll set you up your own folder for saving things.**

**N.B When it looks like lines of the code start in from the side a little bit, use a "tab" (or more than one, depending on how far in it is)\! Don't use spaces, you'll be pressing the button forever. We call this different tab levels.**

```java
public class HelloWorld {

    public static void main(String[] args) {
        // Prints "Hello World!" to the terminal window.
        System.out.println("Hello World!");
    }

}
```
Ta-da\! That's the whole "Hello World\!" program, super short\! We'll get on to actually running it in a minute, but first I'll explain what each line means.

**Line 1:** This line gives the program a name. A very basic explanation is that all bits of a program in Java are called classes. There can only be one **public class** in a file, and the filename must match the class name (with a .java on the end). We won't worry too much about the word "public" right now (but if you're super interested, come find me and ask\!).

**Line 2:** Some nice empty space. Feel free to put as much of this in as you want, if it helps you to read your code.

**Line 3:** This is the main part of our program, hence it's called **main**. Inside a Java class, you can have as many **functions** as you want. Functions are named sections of programs (or classes) that do specific tasks. In this case, we only have one function since we only want to do a small thing, print out some writing. You can ignore the "public static" keywords again, think of them as something that Java requires to work. The **void main(String\[\] args)** part of the line is the important part. This tells us that we have a function called "main" that takes some inputs, "args" that are of type String (a string type is just any sequence of characters wrapped in quotes, e.g "hello", "purple34" or "6\_dsgjfwijo3roi4ht++3"). We aren't going to use these inputs in this first lesson, so think of them as words that Java needs to work for now. Finally "void" means that the function doesn't **return** anything. Functions are allowed to return values if they want, which just means that they can pass back values to other parts of the code. We will cover functions in more detail further down in this lesson\!

**N.B All Java programs (classes) need the main function, just as written in line 3, or an error will occur.**

**Line 4:** Lines that start with the double slashes are **comments**. They do not run as actual code, but are used to tell yourself or anyone who reads your code what that code is doing. The comment stops at the end of the line. Multi-line comments are also available and this is something I can tell you about if you want\!

**Line 5:** This line is the line that does all the work. To print letters to a terminal in Java, you must use the "System.out.println" function. Remember how I said "main" was a function, well this is another one\! Just this time, this function has been written for us and we can just use it, we didn't have to make another line that said something like "void System.out.println(String\[\] words)". When you use (this is called "calling" a function) a function, it will often need an **argument**. An argument is just anything that goes into the brackets to tell the function to use that as it's input. Can you see what the argument on this line is? Hopefully you said that it was the string "Hello World\!", because you'd be right\!

**N.B Don't forget the semi-colon\! Most of your programming errors will be because you forgot the semi colon at the end of the line, seriously. It takes a while to get used to where you need to put a semi-colon, but you'll get it\!**

**Line 6:** This is a closing brace. This is an important part of the program that we haven't talked about yet\! You'll notice that line 1 and line 3 both have opening braces at the end. Braces are a way of showing which code belongs in which section. **You must match open braces with close braces.** If you count the numbers of opening and closing braces and they don't match, something has gone wrong\! This closing brace matches the opening brace on line 3. 

**Line 7:** More empty space\!

**Line 8:** The final closing brace to match line 1's opening brace.

##### Now it's time to get our program working\!

To do this, we first need to **compile** our program. Compiling means turning our easy to read (it's in English) program into words that the computer can understand, called "byte code" for Java. Go to your terminal window and type in the following command (making sure you've saved your file in Kate) **and then press the enter key**:

```bash
javac HelloWorld.java
```
**javac** is the Java compiler. If you just get back to a terminal prompt and nothing prints out on screen, congrats\! Your compiling worked. If an error message came up, give me a shout and we can work out why (or you can read the error and try and work it out yourself, it's not as scary as you think).

Next, the following command will run your program **once you press the enter key**:

```bash
java HelloWorld
```
If you saw "Hello World\!" printed to the screen, you did it\! Your first program is complete\! If that didn't happen, give me a shout and we can fix it. 

So that's it\! You managed your first Java program and you're ready to move onward and upward. Just remember that **EVERY TIME** you make a change to your program code and want to run it, **you must run both javac and java and remember to press the enter key each time.**

#### Section 2: Starting Our Snake Game
So the whole point of this tutorial was to do something fun and different to most tutorials, so we're making a game. Snake to be exact. If you don't know what Snake is, I suggest you Google it and play it for a little bit to get an idea of what you're programming and what it's supposed to look like (but seriously, who hasn't heard of Snake?\! If you haven't, I'm so sorry you've missed out for this long, it's great\!).

I know it looks like we're about to take this massive leap, but it'll actually be done in small steps, and teach you basic programming concepts as you go along.

First up, you'll need to **open a new file**. Use Kate to open a blank file, call it "Snake.java" (without quotes) and save it to the same place you saved your "HelloWorld.java". 

The first thing a snake game needs is a play area (a square of some kind) that we draw to the terminal so we can see it. To create this area and draw it, type up the following code:

```java
public class Snake {

    public static void main(String[] args) {
        int x_size = 80;
        int y_size = 40;

        for (int i = 0; i < y_size; i++) {
            for (int j = 0; j < x_size; j++) {
                System.out.print(".");
            }
            System.out.println();
        }
    }
}
```
**Line 1:** This time we are calling our class "Snake" since we want to make a snake game (it's descriptive).

**Line 3:** This is the same "main" function as before, as I said, every class needs one\!

**Line 4 & 5:** These two lines hold **variable definitions.** A variable is just a container for a value that can change (or vary, as the name implies). An example of a variable in the real world would be **height**, as my height is a number (in centimeters for arguments sake) that has changed over my life time (I'm now 170cm, yay\!). When we **define** a variable, we are just creating it, and giving it a **type**.

Every variable in Java needs a type, it's just how Java works. **int** means an integer, but there are also other types such as String, boolean (true or false), double (decimal place number) and a few more that we might come across later on. Line 4 is telling the program that we want to create a variable that contains an integer, and that variable will be named x\_size. We can also assign a value to a variable on the same line it is created on, or we can do it later (but it is done on the same line in this example). **DO NOT COPY THE CODE BELOW,** but it shows you what I mean:

```java
// we can do this, using two separate lines:
int height;
height = 170;

//or we can do this, both are valid variable definitions!
int height = 170;
```
**N.B Variable names are only allowed if they start with a letter and then contain letters, numbers and underscores after that first letter. Any other characters will cause your program to not compile\!**

So, as you may already have guessed, x\_size will be the width of our snake game area, and y\_size will be the height.

**Line 7:** This line, along with line 8, are the two scariest lines in the code, but no fear\! You'll understand them in no time. If you're having any trouble with anything, please come grab me\! I'm here to help you guys.

This line is what we call a **for loop**. It's called this because it starts with the word "for", inventive I know. All a for loop does is repeat the part of code that's inside it's curly braces a few times. The number of times that the "for" loop repeats for is controlled by the part in brackets after the "for" keyword. If you look a little more closely, you'll see that there are three parts to this bit inside the brackets, separated by semi-colons. The first part, **int i = 0**, is something that looks familiar\! Hopefully you were thinking it is a variable definition, because you'd be correct, it is. This is the section that defines the **loop variable**. This loop variable will change according to the third section, and once stops fulfilling the condition in the second section, the loop will stop running.

We will cover the second bracketed section shortly, but going over the third one before makes more sense. The third section, **i++**, is what happens after the code inside the "for" loop has run once. **i++** just means doing the sum "i = i + 1", or adding one to "i". Every time the loop is run, "i" will be incremented by one.

Lastly, the second section, **i \< y\_size**, means that the loop will run **only** when the value of "i" is less than our variable "y\_size". So you remember how "i" gets incremented by one every time the loop code is run? Eventually it will become bigger than "y\_size" and the for loop will stop running.

Again,** DO NOT COPY THE CODE BELOW**, but it will show you a simple "for loop" and it's output:

```java
for (int i = 0; i < 10; i++) {
    System.out.println(i);
}
// this prints:
// 0
// 1
// 2
// 3
// 4
// 5
// 6
// 7
// 8
// 9
```
**N.B At this point, you're probably wondering "why the hell does it start from 0 and not 1?\!", and don't worry, I was confused too. The reason for this is that most programming languages, including Java, are zero-indexed. What this means is that things like lists start at number 0 instead of number 1 (much like this tutorial starts with section 0).**

**Line 8:** Another "for" loop\! This time, we're naming our loop variable "j", and having it only run while the value of "j" is less than the value of "x\_size". You'll also notice that this loop is inside of curly brackets for the first loop. This is called **nesting**. To draw our area and make it 2D, we need to draw on both the x axis and the y axis. Think of it like needing to draw pixels to create a screen. You need to draw a lot of dots to make a rectangle/square, and it's the same here. 

This inner "for" loop draws the rows of our area, and the outer loop puts in the line break when it's time to start the new row, for example:

The @s are drawn by the inner loop --\> @@@@@@@ \<-- the line break (when you press enter on a keyboard) is drawn by the outer loop

The @s are drawn by the inner loop --\> @@@@@@@ \<-- the line break (when you press enter on a keyboard) is drawn by the outer loop

The @s are drawn by the inner loop --\> @@@@@@@ \<-- the line break (when you press enter on a keyboard) is drawn by the outer loop

And so on and so on, until the loops have stopped.

**Line 9:** This line prints out a "." symbol, to represent a pixel in our play area (it makes the play area easier to see). You'll notice that we're using System.out.print instead of System.out.println. This is because in this inner loop, we do **not** want line breaks, and print on its own doesn't come with a line break, whereas println does.

**Line 10:** This closes the inner "for" loop.

**Line 11:** This line creates a line break, so we can start printing the next row of pixels onto the screen. You'll see that we've not put in any arguments, just closed it with an open and closing bracket next to each other. This is valid Java and will just create a line break.

**Line 12:** This line closes the outer "for" loop.

**Line 13 & 14:** These lines close the main function and the whole class. If you count the number of opening and closing braces in the program, they will match\! This means we haven't forgotten to close anything off. 

##### It's compile and run time again\!

Now for the exciting part, making it work\! Go to your terminal and type in the following two commands, pressing enter after each one:

```bash
javac Snake.java
java Snake
```
Yay\! You should have a square made up of dots printed to the screen. If it didn't work, come grab me\!

**Optional exercise:** Try changing the values of x\_size and y\_size, then compiling and running the program again. You'll get some different looking squares/rectangles\! I chose 80 width by 40 height because it fits nicely onto my screen, but you can make it bigger or smaller if you wish (or change it back to my values)\!

If you're still struggling with the concept of "for" loops and want a little more help, I'm very happy to go over a more basic example since this one is a little complicated with the nesting. You can also [look here](http://www.homeandlearn.co.uk/java/java_for_loops.html) for another web tutorial on "for" loops (but be warned, I didn't write this one)\!

Now you should be ready to the next section, animating the game.

#### Section 3: Animating The Game
I'll admit, I couldn't come up with a better title for this because it's exactly what we're doing. It just happens to sound super complicated when it's not. At the moment, we have only printed out one single drawing of the play area to the terminal and then quit the program. Obviously, we'll need to print a lot more drawings to make the game playable, and so our eventual snake can move about and we can see where it's moved to. To do this, we're going to **modify** our existing code to **keep** drawing out that square, over and over infinitely (or, until we press **ctrl** and** c** simultaneously, which will quit the program).

You now need to make the following **changes** to your code (i.e, don't add this stuff all below your existing code, just add the lines that have changed):

```java
public class Snake {

    public static void main(String[] args) {
        int x_size = 80;
        int y_size = 40;


        while (true) {

            // all these lines have moves in one tab level
            for (int i = 0; i < y_size; i++) {
                for (int j = 0; j < x_size; j++) {
                    System.out.print(".");
                }
                System.out.println();
            }

            try {
                Thread.sleep(1000);
            } catch (Exception e) {
            }
        }
    }
}
```
**N.B Don't let that extra closing brace trip you up, see there are now four braces in a row on the last four lines? Copy that exactly\!**

So, we've added some new lines. You'll see that our existing "for" loops have been wrapped in this weird **while** thingy, and that we've added a couple of lines after the "for" loops that **sleep** the program. Let's explain that a bit more...

**Line 8:** This line is the start of yet another type of loop\! The **while** loop. All of the code inside it's braces will repeat over and over *while* the bit in brackets is true. The simplest thing you can put in the brackets is the value "true" itself, since then the while loop will never end because true is always equal to true... you can't really deny that\!

**Line 18 - 21:** Since we are drawing our playable area (the dots) out over and over, we don't want it to be drawn too fast. The line **Thread.sleep(1000)** makes the program wait for 1000ms (or 1 second, maths woo\!) and then carry on. The bit surrounding that, the **try** and then **catch (Exception e)** is needed to protect our selves from bad things. Sometimes, things go wrong when we run the program that couldn't be fixed in the compilation stage. When this happens, our program will normally crash, but if you put the part that sometimes crashes inside a "try catch statement", then even if that line fails (in our case, the sleep command), the program will go on its merry way and won't crash\! Perfect\! 

##### Compile and run time\! You should know how to do this by now, but I'll tell you explicitly one last time.

Type the following commands, each followed by the enter key, into the terminal:

```bash
javac Snake.java
java Snake
```
Aaaaaaand you did it\! When the program runs, it will print out dots over and over. Eventually it will look like nothing is happening but that's because the dots are getting drawn in exactly the same place on screen as the old dots, it's still doing it\!

**N.B To exit the infinite dot drawing program, press the ctrl and c buttons at the same time (or, press and hold ctrl and then press c, then release both).**

One last thing to add before the next section. It's kind of annoying that we just print the squares one after another and the screen scrolls down and down and down. Well we can fix that by clearing the screen just before we print the square out every single time\! Add the line **System.out.println("\\033\[2J");** to the following place:

```java
public class Snake {

    public static void main(String[] args) {
        int x_size = 80;
        int y_size = 40;


        while (true) {

            System.out.println("\033[2J");
            // all these lines have moves in one tab level
            for (int i = 0; i < y_size; i++) {
                for (int j = 0; j < x_size; j++) {
                    System.out.print(".");
                }
                System.out.println();
            }

            try {
                Thread.sleep(1000);
            } catch (Exception e) {
            }
        }
    }
}
```
Now try compiling and running the program again. You will have what looks like one image of your dotty square in the terminal. What's actually happening is that the square is getting drawn again and again every second but this time it is in the same place\! Much better.

#### Section 4: Adding Mr Snake And Moving Him About
Or Mrs Snake, I don't mind.

First off, I'm going to explain how we're going to represent Mr Snake, and how we're going to draw him. Mr Snake is going to need a location, so we will make a variable that stores a ** Point**. That is, Mr Snake's x and y locations (think of the drawing area as a graph with an x and y axis).

**N.B In a graph, the origin (0,0) is always at the bottom left. In computer science, the origin (0,0) of the screen is at the top left. Adding positive values to the x-axis moves the object right (same as a graph), but adding POSITIVE values to the Y-AXIS, moves it DOWN (and not up, like a graph does).**

So, we've seen a few types at this point, we've seen "int" and "String". "Point" is just another type, but it doesn't exist quite yet\! Java has the ability to **create it's own types.** This is what we will be doing so we can store the location of Mr Snake as an x and y coordinate. Make the following changes to your code, being careful to make sure all of the curly braces match up:

```java
public class Snake {

    public static void main(String[] args) {
        int x_size = 80;
        int y_size = 40;


        while (true) {

            System.out.println("\033[2J");
            // all these lines have moves in one tab level
            for (int i = 0; i < y_size; i++) {
                for (int j = 0; j < x_size; j++) {
                    System.out.print(".");
                }
                System.out.println();
            }

            try {
                Thread.sleep(1000);
            } catch (Exception e) {
            }
        }
    }

    static class Point {

        public int x;
        public int y;

        public Point(int x_input, int y_input) {
            x = x_input;
            y = y_input;
        }
    }
}
```
So what we've done is created a new **static class** called **Point**. You remember I said Java files can only contain one **public class?** Well having just a plain old "static class" (with no public keyword) in addition to this is fine\! This point class will be our new type to store x and y coordinates.

**Line 28 & 29:** So, the whole point (oh dear) of the "Point" class is to be able to store x and y coordinates of Mr Snake\! So that's what we'll be doing. These lines are declaring integer variables called "x" and "y". The **public** keyword before "int" is important because we want to be able to access these x and y coordinates once we've created our "Point", so we can read back to ourselves where Mr Snake is\!

**Line 31:** The function that is declared on this line is called a **constructor.** It defines how we actually create our "Point" in the first place. What I'm about to explain may sound weird at first but you'll get it: Think of the "Point" class as a stencil (like you had as a kid when colouring). You can't just put that stencil on a piece of paper and call it a day, you need to colour it in for it to be useful\! It's the same with this code. You can't just write in the "Point" class and expect it to work, you need to "colour it in" by **instantiating** it. This **constructor** is the function that is used every time we want to **instantiate** a new "Point" (or, carrying on with the analogy, every time we want to move the stencil and colour it in again).

The constructor has two **arguments** in it, of type integer. Remember when I said that arguments were just inputs? This means that when we want to create (colour in) a new "Point", we tell the computer what the x-coordinate and y-coordinate we want to store are.

**Line 32 & 33:** These lines are just setting the values of our x and y coordinates to the values that we told the computer (using our arguments) to put in. We set the value of our x coord to what we typed in, the "x\_input" and the same with y.

**N.B Watch out for the closing braces again\!**

##### Now you can compile and run the program again, but it won't do anything different yet because we haven't actually *used* our new Point type (we haven't coloured it in yet\!).

Now we have somewhere where can store Mr Snake's x and y location on screen, so let's actually use it\! Make the following additions to the code:

```java
public class Snake {

    public static void main(String[] args) {
        int x_size = 80;
        int y_size = 40;

        Point snake = new Point(40,20);

        while (true) {

            System.out.println("\033[2J");
            // all these lines have moves in one tab level
            for (int i = 0; i < y_size; i++) {
                for (int j = 0; j < x_size; j++) {

                    if (j == snake.x && i == snake.y) {
                        System.out.print("@");
                    } else {
                        System.out.print(".");
                    }

                }
                System.out.println();
            }

            try {
                Thread.sleep(1000);
            } catch (Exception e) {
            }
        }
    }

    static class Point {

        public int x;
        public int y;

        public Point(int x_input, int y_input) {
            x = x_input;
            y = y_input;
        }
    }
}
```
You'll see that line 7 and lines 16-20 are different\! So lets go over them.

**Line 7:** This is where we **instantiate** our point class\! We are creating a new variable called "snake" that is of type point. Then we are making it a "new  Point" with the coordinates we want to place the snake at in brackets. I picked the middle of the screen for now. Remember, instantiating just means using our "Point" stencil by "colouring it in". We can do this as many times as we want, but we only need one for now since Mr Snake is small and hasn't got a tail\!

**Line 16:** New things\! Yay\! This line is the start of an **if-statement,** another really inventive name. "If" statements are pretty straight forward. **IF** the thing in brackets is true, then it will run the code in its curly braces, **ELSE** it skips that code and runs the code in the curly braces after the **else** keyword a couple of lines down. Simple\!

Now, for the thing in the brackets. This is stating that **if** we have reached the same x location as Mr Snake **and** (shown with the double &&) we have reached the same y location as Mr Snake, we should run the code in the curly brackets since we are on top of Mr Snake (which prints out an "@" to represent Mr Snake's head\! We don't want an invisible Snake, that would be a pretty hard game).

**Line 17:** This line prints out an "@" symbol, as explained above, when we have reached Mr Snake's location and we want to show him on screen\!

**Line 18:** This is the **else** part of the **if-statement.** This part runs if we are **not** at Mr Snake's location and we just want to print out a "." to show that the area is empty.

**Line 19:** This part is the same as before, it prints out a "." in empty play space.

**Line 20:** Our final if-statement closing brace\!

##### Now, compile and run your program again. You'll see that your snake is chilling in the middle of the screen\!

**Optional exercise:** Try changing the x and y coordinates (in the "new Point" line) of Mr Snake and see if you can predict where he will show up. Keep in mind that (0,0) is in the top left corner\! This will help you learn about this weird coordinate system.

##### Time to move our snake around\!

It wouldn't be a very good game if you couldn't move... So here's how to do it\! Unfortunately, detecting whether a key is pressed down (a key for movement) is actually quite complicated in Java. I'll try and explain it as best I can, but it might be one of those things you just have to accept for a while (since it isn't really important in learning basic Java). Make the following additions to your code (it's quite a lot, sorry\!):

```java
import java.io.*;
public class Snake {

    public static void main(String[] args) {
        int x_size = 80;
        int y_size = 40;
        int movement = 0;

        Point snake = new Point(40,20);


        while (true) {

            System.out.println("\033[2J");
            // all these lines have moves in one tab level
            for (int i = 0; i < y_size; i++) {
                for (int j = 0; j < x_size; j++) {

                    if (j == snake.x && i == snake.y) {
                        System.out.print("@");
                    } else {
                        System.out.print(".");
                    }

                }
                System.out.println("");
            }

            try {
                String[] cmd = {"/bin/bash", "-c", "stty raw </dev/tty"};
                String[] cmd2 = {"/bin/bash", "-c", "stty cooked </dev/tty"};
                Runtime.getRuntime().exec(cmd).waitFor();
                movement = System.in.read();
                Runtime.getRuntime().exec(cmd2).waitFor();
                if (movement == 113) {
                    return;
                }

                if (movement == 119) {
                    //move up
                    snake.y = snake.y - 1;
                } else if (movement == 100) {
                    //move right
                    snake.x = snake.x + 1;
                } else if (movement == 115) {
                    //move down
                    snake.y = snake.y + 1;
                } else if (movement == 97) {
                    //move left
                    snake.x = snake.x - 1;
                }

            } catch (Exception e) {
            }

            try {
                Thread.sleep(1000);
            } catch (Exception e) {
            }

        }
    }
    static class Point {

        public int x;
        public int y;

        public Point(int x_input, int y_input) {
            x = x_input;
            y = y_input;
        }
    }
}
```
So, lines 1 and 7 are new\! And so are lines 29-54, that's a lot\! Let's go through them.

**Line 1:** Since we're taking input from the keyboard, we need to use some of the functions available in Java's IO (input, output) library. This **import** lets us use these IO functions.

**Line 7:** On this line we are declaring a new integer variable called movement. This variable will hold the number value of the direction we want to move in\! **We will be using the "w", "a", "s" and "d" keys for movement and NOT the arrow keys.** This is because in Linux, when you press an arrow key, it sends a weird sequence of characters instead of the actual key itself, but letters don't do this. If you like reading, look up "escape sequences linux" on Google.

On a computer, every key on your keyboard is represented by a **number**. We will store this number in the "movement" variable. The "w" key is 119, the "a" key is 97, the "s" key is 115 and the "d" key is 100. For a full list of all character codes, [see here\!](http://www.asciitable.com/)

**Line 29:**  Remember when we used a **try catch** statement before? This is the same thing.

**Line 30-34:** So this is the bit of the code that does the reading in. It's pretty complicated but I'll give you a quick explanation\! The first and second lines are setting up some commands that we need to give to our terminal so it will let us read in letters. The third line runs the first command we specified, which lets us read letters. The fourth line, **movement = System.in.read()**, reads the number code of the letter we just pressed (hopefully "w", "a", "s" or "d") and puts it into our variable (or container) called movement that we defined on line 7.

The last line just resets our terminal back to non-reading in mode (so we can print things to the screen properly, since read mode screws this up. Don't worry if you don't quite get this part, it isn't a fundamental basic of Java, we just need it for our snake game to work.

**Line 35-37:** This part checks if the "q" key, code 113, has been pressed. If it has, we quit the program (q for quit, simple\!). Otherwise, we would have no way of quitting\!

**Line 39-51:** These lines make Mr Snake move\! Remember those letter codes I wrote about earlier, (for "wasd"), well now we're using them. These lines use an extended form of **if-statement** with **else if**'s instead of just one else\! An if-statement takes the form, "if (condition) { code } else if (condition) { code} .... else { code }" where you can have as many "else if" parts in the dotted area as you want\! Basically, if we get a "w", we will move Mr Snake upwards, if we get a "d" then we will move Mr Snake right and so on and so on.

The comments will tell you which part does what, but I'll explain one of the lines. Take **snake.x = snake.x + 1** for example: this part adds one to the x coordinate of Mr Snake, which will move him right. Hopefully this is pretty simple, but if you don't quite get it, then come talk to me\!

##### Now you can compile and run again. You should be able to press the "wasd" keys and Mr Snake will move\! Again, if it doesn't work, then come grab me.

**Optional exercise:** Mr Snake moves very slowly at the moment. Can you work out how to make him faster? Hopefully you said that we can change the "Thread.sleep(1000)" line to have a lower number, say 500 instead, or even 100.

We're so close to the end of this section\! We just need to do one more things: make Mr Snake move on his own, so our arrow keys just change his direction.

To do this, we're going to change the code we just wrote a little bit:

```java
import java.io.*;
public class Snake {

    public static void main(String[] args) {
        int x_size = 80;
        int y_size = 40;
        int movement = 119;

        Point snake = new Point(40,20);


        while (true) {

            System.out.println("\033[2J");
            // all these lines have moves in one tab level
            for (int i = 0; i < y_size; i++) {
                for (int j = 0; j < x_size; j++) {

                    if (j == snake.x && i == snake.y) {
                        System.out.print("@");
                    } else {
                        System.out.print(".");
                    }

                }
                System.out.println("");
            }

            try {
                String[] cmd = {"/bin/bash", "-c", "stty raw </dev/tty"};
                String[] cmd2 = {"/bin/bash", "-c", "stty cooked </dev/tty"};
                Runtime.getRuntime().exec(cmd).waitFor();
                if (System.in.available() > 0) {
                    movement = System.in.read();
                }
                Runtime.getRuntime().exec(cmd2).waitFor();
                if (movement == 113) {
                    return;
                }

                if (movement == 119) {
                    //move up
                    snake.y = snake.y - 1;
                } else if (movement == 100) {
                    //move right
                    snake.x = snake.x + 1;
                } else if (movement == 115) {
                    //move down
                    snake.y = snake.y + 1;
                } else if (movement == 97) {
                    //move left
                    snake.x = snake.x - 1;
                }
            } catch (Exception e) {
            }


            try {
                Thread.sleep(1000);
            } catch (Exception e) {
            }
        }
    }

    static class Point {

        public int x;
        public int y;

        public Point(int x_input, int y_input) {
            x = x_input;
            y = y_input;
        }
    }
}
```
Lines 7 and 33-35 have changed. This is why:

**Line 7:** We want Mr Snake to move on his own when the game starts. We've changed the initial value of movement to 119 (the "w" key, upwards moving\!) so he moves up automatically.

**Line 33-35:** Instead of just waiting until we press a key and then moving Mr Snake, we want to constantly move Mr Snake and only make him change directions when a key is pressed. This **if-statement** checks if there is any key inputs ("wasd" keys) available, and if there is, we read it. If there isn't we will use the old value of movement that we had from the previous loop of the **while loop**.

##### Now you can compile and run again. You can use the "wasd" keys to move Mr Snake\! You'll notice that the input seems quite laggy. We'll fix this in the next section.

You're ready to proceed\! It's now time to make Mr Snake grow, by feeding him.

#### Section 5: Feeding Mr Snake And Making Him Grow
We have Mr Snake, but he's currently just a point (he is only one square big). We want to be able to make him eat food that we put on the screen, and make him grow\! The first stage of this is to randomly place a food pellet on our playable area somewhere. The code to do this and the changes you need to make are as follows:

```java
import java.io.*;
public class Snake {

    public static void main(String[] args) {
        int x_size = 80;
        int y_size = 40;
        int movement = 119;

        Point snake = new Point(40,20);

        int random_x = (int) (Math.random() * (x_size-1));
        int random_y = (int) (Math.random() * (y_size-1));
        Point food = new Point(random_x,random_y);


        while (true) {

            System.out.println("\033[2J");
            // all these lines have moves in one tab level
            for (int i = 0; i < y_size; i++) {
                for (int j = 0; j < x_size; j++) {

                    if (j == snake.x && i == snake.y) {
                        System.out.print("@");
                    } else if (j == food.x && i == food.y) {
                        System.out.print("#");
                    } else {
                        System.out.print(".");
                    }

                }
                System.out.println("");
            }

            try {
                String[] cmd = {"/bin/bash", "-c", "stty raw </dev/tty"};
                String[] cmd2 = {"/bin/bash", "-c", "stty cooked </dev/tty"};
                Runtime.getRuntime().exec(cmd).waitFor();
                if (System.in.available() > 0) {
                    movement = System.in.read();
                }
                Runtime.getRuntime().exec(cmd2).waitFor();
                if (movement == 113) {
                    return;
                }

                if (movement == 119) {
                    //move up
                    snake.y = snake.y - 1;
                } else if (movement == 100) {
                    //move right
                    snake.x = snake.x + 1;
                } else if (movement == 115) {
                    //move down
                    snake.y = snake.y + 1;
                } else if (movement == 97) {
                    //move left
                    snake.x = snake.x - 1;
                }
            } catch (Exception e) {
            }


            try {
                Thread.sleep(1000);
            } catch (Exception e) {
            }
        }
    }

    static class Point {

        public int x;
        public int y;

        public Point(int x_input, int y_input) {
            x = x_input;
            y = y_input;
        }
    }
}
```
Lines 11-13 have been added, as well as lines 25-27.

**Line 11 & 12:** Here, we are creating a random x coordinate and a random y coordinate for the piece of food to spawn at. We are defining new variables called ** random\_x** and **random\_y** for the x and y coordinates of the food. The **Math.random()** bit gives us a value between 0 and 1, that we then need to multiply by the size of our playable area so it gives us a random integer inside the area (hopefully you understand that because it's just maths\!).

**Line 13:** This line is creating a new point (colouring in another stencil\!) called "food" that will store this random location. 

**Line 25-27:** These lines are the part that actually draw in the food for us. We already draw in our snake, but now we also want to draw the food. I'm using the "\#" symbol to represent food but feel free to use any symbol or letter you want (but probably shouldn't be the "@" again... that would get confusing)\!

##### Compile and run time\! You'll see a bit of food on the screen. You can move towards it and walk over it, but nothing will happen at the moment. We will fix this now.

Okay I'm about to throw a TON of code at you.. but I can't break it down any further or it just wouldn't work\! I'll explain it as best I can, but you can always come talk to me\! I'll put the code first, then explain it all after.

```java
import java.io.*;
import java.util.*;
public class Snake {

	public static void main(String[] args) {
		int x_size = 80;
		int y_size = 40;
		int movement = 119;

		ArrayList snake = new ArrayList();
		snake.add(new Point(40,20));

		int random_x = (int) (Math.random() * (x_size-1));
		int random_y = (int) (Math.random() * (y_size-1));
		Point food = new Point(random_x,random_y);

		
		while (true) { 

			Point snake_head = (Point) snake.get(0);
			if (snake_head.x == food.x && snake_head.y == food.y) {
				if (movement == 119) {
					snake.add(new Point(food.x,food.y+1));
				} else if (movement == 100) {
					snake.add(new Point(food.x-1,food.y));
				} else if (movement == 115) {
					snake.add(new Point(food.x,food.y-1));
				} else if (movement == 97) {
					snake.add(new Point(food.x+1,food.y));
				}
			}
			System.out.println("\033[2J");

			try {
				String[] cmd = {"/bin/bash", "-c", "stty raw </dev/tty"};
				String[] cmd2 = {"/bin/bash", "-c", "stty cooked </dev/tty"};
				Runtime.getRuntime().exec(cmd).waitFor();
				if (System.in.available() > 0) {
					movement = System.in.read();
				}
				Runtime.getRuntime().exec(cmd2).waitFor();
				if (movement == 113) {
					return;
				}

				snake = moveSnake(snake, movement);
				snake_head = (Point) snake.get(0);

			} catch (Exception e) {
			}
			// all these lines have moves in one tab level
			for (int i = 0; i < y_size; i++) {
				for (int j = 0; j < x_size; j++) {

					String to_print = ".";

					for (int k = 0; k < snake.size(); k++) {
						Point snake_body = (Point) snake.get(k);
						if (snake_body.x == j && snake_body.y == i) {
							to_print = "S";
						}
					}

					if (j == snake_head.x && i == snake_head.y) {
						to_print = "@";
					} else if (j == food.x && i == food.y) {
						to_print = "#";
					}
					System.out.print(to_print);

				}
				System.out.println("");
			}

			try {
				Thread.sleep(1000); 
			} catch (Exception e) {
			}
		} 
	}
	static ArrayList moveSnake(ArrayList currentSnake, int direction) {

		ArrayList newSnake = new ArrayList();
		Point old_head = (Point) currentSnake.get(0);
		Point head = new Point(0,0);
		if (direction == 119) {
			//move up
			head.x = old_head.x;
			head.y = old_head.y - 1;
		} else if (direction == 100) {
			//right
			head.x = old_head.x + 1;
			head.y = old_head.y;
		} else if (direction == 115) {
			//down
			head.x = old_head.x;
			head.y = old_head.y + 1;
		} else if (direction == 97) {
			//left
			head.x = old_head.x - 1;
			head.y = old_head.y;
		}
		newSnake.add(head);
		for (int i = 0; i < currentSnake.size()-1; i++) {
			newSnake.add(currentSnake.get(i));
		}
		return newSnake;
	}

	static class Point {

		public int x;
		public int y;

		public Point(int x_input, int y_input) {
			x = x_input;
			y = y_input;
		}
	}
}
```
So that was a whole lot of code\! Lets go through it all.

**Line 2:** Further down in this code, we're going to need some more functions that are contained in the Java utilities library, so this line adds those\!

**Line 10:** This is the start of all the new stuff. Previously, our snake was just a single point, but now, since we want him to grow, he should be a list of points instead\! Those points represent his head and all the bits of his tail. This line defines a new snake variable that is of type **ArrayList.** An array is Java is just a list of things (anything, integers, Points etc) that has a fixed size, but an **ArrayList** can be of any size\! It can grow and shrink as you want it to, which is perfect for us as we need Mr Snake to grow\! We are creating this "ArrayList" at a size of 0 to start with.

**Line 11:** This line is our first growth of Mr Snake\! We are just adding his head. The **add** function is used to add a new Point which will represent his head. When we want him to grow more (when he eats) we can add more points to this list\! 

**N.B The first Point in Mr Snake's list will always be where his head is\!**

**Line 20:** Since we're going to need the location of Mr Snake's head over and over (to check if he's eaten and where he is etc), we will assign it to a new variable called "snake\_head" each time the while loop runs. This just makes it easier to access his head location, and cuts down on code\!

**Line 21-31:** If Mr Snake's head is in the same place that our food is, then we want Mr Snake to eat and grow longer\! The **if-statement** is the part that checks this. To make Mr Snake grow, we need to add a section onto his body that is on the opposite side of the direction we are going (i.e the direction we came from). The nested inner **if-statement** is the part that works out where we came from, and then adds a new section (a Point) onto Mr Snake to make him longer.

**Line 46:** So before, when we wanted to change direction, we just used an if-statement (if (movement == 119) { ... } etc), but I thought this would be a good point to teach you how to write your own functions. The **moveSnake** part is a function that uses our current list of snake points and the direction we want it to go (the key code) as its input, and it **returns** (gives back) a new load of snake locations that show the snake has moved. 

##### We're now going to skip ahead a little to the moveSnake function, but don't worry, we'll go over the new lines between afterwards\!

**Line 81:** This is where we create the moveSnake function. Functions are a way of tidying up our code by splitting it up into sections and allowing us to reuse pieces of code without having to write them out more than once, super useful\! We can ignore the "static" keyword, since this is just something that Java likes us to use\! The part of the line that says **ArrayList** means that our function will return (give back) an ArrayList, in our case a new list of snake points\! Remember right at the start when I talked about the main function having the word "void" so it doesn't return anything at all? Well this one does return stuff\! And you need to make sure you tell your program the type of the thing you want to return (ArrayList in this case).

**Line 83:** This is where we are creating our new list of snake Points to return\! For now it's empty but we will build it up with the code below.

**Line 84:** This line is pretty much the same as line 20. We will need to access the location of the snakes head (the old location, not the new one we're creating) a lot so we're assigning it to a variable.

**Line 85:** Since we want to move Mr Snake, his head is going to end up somewhere else. This line creates a new variable that will store the new location of Mr Snake's head.

**Line 86-102:** These lines determine where Mr Snake's head should be moved to, given the direction of travel. E.g if we press the "w" key (code 119), we want Mr Snake to move upwards, so his new head position will be one above the old one\!

**Line 103:** Once we've worked out the new location of the snakes head, we can add it as the first thing in our new list of snake points.

**Line 104-106:** These lines are a little tricky but they totally make sense. We are using a for loop that loops for the size of Mr Snake minus one. Since Mr Snake doesn't want to grow at this point (because he hasn't eaten), and we are adding a new head location, we need to take away (cut off) the last place where his tail was so we don't grow every step. This loop adds all but the last location back onto the snake, so he's shifted along one in the direction we chose. This is how he moves\!

**Line 107:** Finally, we return the new list of snake Points, and Mr Snake has been moved along\!

##### Now we can go back up to the lines we missed.

**Line 47**: Once again, we're keeping a track of the snakes head location using a variable.

**Line 55:** So, before when we printed out our play area and the snake, we had a load of "System.out.print" statements in an if-statement. Now, we're going to save what we want to print in a String variable, and wait until the end of the inner for-loop code to print it out\! This is what this line does. By default, we probably want to print out a ".", since most of the area will be that character.

**Line 57:** This is another loop that will go through the length of the snake (all of the snakes Points) so we can check whether the current space is part of the snake, and print out a tail character.

**Line 58:** We are temporarily storing each point of the snake in a "snake\_body" variable for easy access\!

**Line 59-61:** This if statement will change the to\_print String if the position we are in is a part of Mr Snake. Mr Snake's tail will be represented by "S" characters, but feel free to change this if you wish.

**Line 64-68:** This if-statement checks whether the current location is our snakes head, or if it's the piece of food, and changes the character to print accordingly.

**Line 69:** This is where we actually print the character, whether it's a background ".", and piece of food "\#", the head of the snake "@" or Mr Snake's tail "S".

##### That's the end of all the additions in the above code\! Now you can compile and run your code.

You should notice that you can now move around and eat the piece of food, but the food doesn't move (you can actually eat it again and again). You'll also notice that our input lag has gone\! This is because we are now drawing the playable area *after* we have moved the snake, instead of before (like the code above the latest one).

##### For the end of this section, lets move the food every time it get's eaten.

It would be a terrible game if the food always stayed in the same place... The following additions to the code will change the location\!

```java
import java.io.*;
import java.util.*;
public class Snake {

	public static void main(String[] args) {
		int x_size = 80;
		int y_size = 40;
		int movement = 119;

		ArrayList snake = new ArrayList();
		snake.add(new Point(40,20));

		int random_x = (int) (Math.random() * (x_size-1));
		int random_y = (int) (Math.random() * (y_size-1));
		Point food = new Point(random_x,random_y);

		
		while (true) { 

			Point snake_head = (Point) snake.get(0);
			if (snake_head.x == food.x && snake_head.y == food.y) {
				if (movement == 119) {
					snake.add(new Point(food.x,food.y+1));
				} else if (movement == 100) {
					snake.add(new Point(food.x-1,food.y));
				} else if (movement == 115) {
					snake.add(new Point(food.x,food.y-1));
				} else if (movement == 97) {
					snake.add(new Point(food.x+1,food.y));
				}

				random_x = (int) (Math.random() * (x_size-1));
				random_y = (int) (Math.random() * (y_size-1));
				food = new Point(random_x,random_y);

			}
			System.out.println("\033[2J");

			try {
				String[] cmd = {"/bin/bash", "-c", "stty raw </dev/tty"};
				String[] cmd2 = {"/bin/bash", "-c", "stty cooked </dev/tty"};
				Runtime.getRuntime().exec(cmd).waitFor();
				if (System.in.available() > 0) {
					movement = System.in.read();
				}
				Runtime.getRuntime().exec(cmd2).waitFor();
				if (movement == 113) {
					return;
				}

				snake = moveSnake(snake, movement);
				snake_head = (Point) snake.get(0);

			} catch (Exception e) {
			}
			// all these lines have moves in one tab level
			for (int i = 0; i < y_size; i++) {
				for (int j = 0; j < x_size; j++) {

					String to_print = ".";

					for (int k = 0; k < snake.size(); k++) {
						Point snake_body = (Point) snake.get(k);
						if (snake_body.x == j && snake_body.y == i) {
							to_print = "S";
						}
					}

					if (j == snake_head.x && i == snake_head.y) {
						to_print = "@";
					} else if (j == food.x && i == food.y) {
						to_print = "#";
					}
					System.out.print(to_print);

				}
				System.out.println("");
			}

			try {
				Thread.sleep(500); 
			} catch (Exception e) {
			}
		} 
	}
	static ArrayList moveSnake(ArrayList currentSnake, int direction) {

		ArrayList newSnake = new ArrayList();
		Point old_head = (Point) currentSnake.get(0);
		Point head = new Point(0,0);
		if (direction == 119) {
			//move up
			head.x = old_head.x;
			head.y = old_head.y - 1;
		} else if (direction == 100) {
			//right
			head.x = old_head.x + 1;
			head.y = old_head.y;
		} else if (direction == 115) {
			//down
			head.x = old_head.x;
			head.y = old_head.y + 1;
		} else if (direction == 97) {
			//left
			head.x = old_head.x - 1;
			head.y = old_head.y;
		}
		newSnake.add(head);
		for (int i = 0; i < currentSnake.size()-1; i++) {
			newSnake.add(currentSnake.get(i));
		}
		return newSnake;
	}

	static class Point {

		public int x;
		public int y;

		public Point(int x_input, int y_input) {
			x = x_input;
			y = y_input;
		}
	}
}
```
Thankfully, the only lines we've added in this part of the code are lines 32-34\! We're putting this new code inside that part that detects when the snake's head is on the food (i.e Mr Snake has eaten), and moving the food.

**Line 32 & 33:** These lines are changing the random x and random y locations of the food.

**Line 34:** This line is changing the Point where the food is to our new random locations, and that's it\!

##### You can now compile and run your code again and it should look pretty much like a game\! Mr Snake will grow when he eats and the food will appear in different places.

The final section will teach us how to add a failure condition. At the moment, the snake can run into itself and the walls and nothing will happen. Move on to fix this\!

#### Section 6: Killing Mr Snake
When we fail at playing the game, Mr Snake dies. We need to program this\! First of all, we'll stop Mr Snake from running into himself (by making him die when that happens\!). The following code shows this:

```java
import java.io.*;
import java.util.*;
public class Snake {

	public static void main(String[] args) {
		int x_size = 80;
		int y_size = 40;
		int movement = 119;

		ArrayList snake = new ArrayList();
		snake.add(new Point(40,20));

		int random_x = (int) (Math.random() * (x_size-1));
		int random_y = (int) (Math.random() * (y_size-1));
		Point food = new Point(random_x,random_y);

		
		while (true) { 

			Point snake_head = (Point) snake.get(0);
			if (snake_head.x == food.x && snake_head.y == food.y) {
				if (movement == 119) {
					snake.add(new Point(food.x,food.y+1));
				} else if (movement == 100) {
					snake.add(new Point(food.x-1,food.y));
				} else if (movement == 115) {
					snake.add(new Point(food.x,food.y-1));
				} else if (movement == 97) {
					snake.add(new Point(food.x+1,food.y));
				}

				random_x = (int) (Math.random() * (x_size-1));
				random_y = (int) (Math.random() * (y_size-1));
				food = new Point(random_x,random_y);

			}
			System.out.println("\033[2J");

			try {
				String[] cmd = {"/bin/bash", "-c", "stty raw </dev/tty"};
				String[] cmd2 = {"/bin/bash", "-c", "stty cooked </dev/tty"};
				Runtime.getRuntime().exec(cmd).waitFor();
				if (System.in.available() > 0) {
					movement = System.in.read();
				}
				Runtime.getRuntime().exec(cmd2).waitFor();
				if (movement == 113) {
					return;
				}

				snake = moveSnake(snake, movement);
				snake_head = (Point) snake.get(0);

			} catch (Exception e) {
			}
			// all these lines have moves in one tab level
			for (int i = 0; i < y_size; i++) {
				for (int j = 0; j < x_size; j++) {

					String to_print = ".";

					for (int k = 0; k < snake.size(); k++) {
						Point snake_body = (Point) snake.get(k);
						if (snake_body.x == j && snake_body.y == i) {
							to_print = "S";
						}
					}

					if (j == snake_head.x && i == snake_head.y) {
						to_print = "@";
					} else if (j == food.x && i == food.y) {
						to_print = "#";
					}
					System.out.print(to_print);

				}
				System.out.println("");
			}

			for (int i = 1; i < snake.size(); i++) {
				Point snake_section = (Point) snake.get(i);
				if (snake_head.x == snake_section.x && snake_head.y == snake_section.y) {
					System.out.println("Game over, your length was: " + snake.size());
					return;
				}
			}

			try {
				Thread.sleep(500); 
			} catch (Exception e) {
			}

		} 
	}
	static ArrayList moveSnake(ArrayList currentSnake, int direction) {

		ArrayList newSnake = new ArrayList();
		Point old_head = (Point) currentSnake.get(0);
		Point head = new Point(0,0);
		if (direction == 119) {
			//move up
			head.x = old_head.x;
			head.y = old_head.y - 1;
		} else if (direction == 100) {
			//right
			head.x = old_head.x + 1;
			head.y = old_head.y;
		} else if (direction == 115) {
			//down
			head.x = old_head.x;
			head.y = old_head.y + 1;
		} else if (direction == 97) {
			//left
			head.x = old_head.x - 1;
			head.y = old_head.y;
		}
		newSnake.add(head);
		for (int i = 0; i < currentSnake.size()-1; i++) {
			newSnake.add(currentSnake.get(i));
		}
		return newSnake;
	}

	static class Point {

		public int x;
		public int y;

		public Point(int x_input, int y_input) {
			x = x_input;
			y = y_input;
		}
	}
}
```
Again, we've only added a few lines here, lines 80-86.

**Line 80:**  The idea of all of this is to loop through the tail of our snake (not including the head, just everything else\!) and check if the head of our snake is in the same place as a part of the tail (i.e, we've crashed into ourselves). This line is the for-loop that runs through each section of the snake (starting at one to avoid the head).

**Line 81:** Another ease of use line. We're putting the current section (Point) of snake we want to check into a variable called "snake\_section" for easy access.

**Line 82-85:** This part checks to see if the head of Mr Snake is in the same place as a section of his tail. If it is, we print out a message saying game over, and shows you the size of your snake (you can compete for high scores\!). The program then uses the "return" keyword to end itself, and the game stops running.

##### Compile and run time\! You'll find that the game will end if you run into your tail now.

We're so close to making a whole game\! We now want to make the game end if Mr Snake runs into a wall. The code for this can be found below.

```java
import java.io.*;
import java.util.*;
public class Snake {

	public static void main(String[] args) {
		int x_size = 80;
		int y_size = 40;
		int movement = 119;

		ArrayList snake = new ArrayList();
		snake.add(new Point(40,20));

		int random_x = (int) (Math.random() * (x_size-1));
		int random_y = (int) (Math.random() * (y_size-1));
		Point food = new Point(random_x,random_y);

		
		while (true) { 

			Point snake_head = (Point) snake.get(0);
			if (snake_head.x == food.x && snake_head.y == food.y) {
				if (movement == 119) {
					snake.add(new Point(food.x,food.y+1));
				} else if (movement == 100) {
					snake.add(new Point(food.x-1,food.y));
				} else if (movement == 115) {
					snake.add(new Point(food.x,food.y-1));
				} else if (movement == 97) {
					snake.add(new Point(food.x+1,food.y));
				}

				random_x = (int) (Math.random() * (x_size-1));
				random_y = (int) (Math.random() * (y_size-1));
				food = new Point(random_x,random_y);

			}
			System.out.println("\033[2J");

			try {
				String[] cmd = {"/bin/bash", "-c", "stty raw </dev/tty"};
				String[] cmd2 = {"/bin/bash", "-c", "stty cooked </dev/tty"};
				Runtime.getRuntime().exec(cmd).waitFor();
				if (System.in.available() > 0) {
					movement = System.in.read();
				}
				Runtime.getRuntime().exec(cmd2).waitFor();
				if (movement == 113) {
					return;
				}

				snake = moveSnake(snake, movement);
				snake_head = (Point) snake.get(0);

			} catch (Exception e) {
			}
			// all these lines have moves in one tab level
			for (int i = 0; i < y_size; i++) {
				for (int j = 0; j < x_size; j++) {

					String to_print = ".";

					for (int k = 0; k < snake.size(); k++) {
						Point snake_body = (Point) snake.get(k);
						if (snake_body.x == j && snake_body.y == i) {
							to_print = "S";
						}
					}

					if (j == snake_head.x && i == snake_head.y) {
						to_print = "@";
					} else if (j == food.x && i == food.y) {
						to_print = "#";
					}
					System.out.print(to_print);

				}
				System.out.println("");
			}

			for (int i = 1; i < snake.size(); i++) {
				Point snake_section = (Point) snake.get(i);
				if (snake_head.x == snake_section.x && snake_head.y == snake_section.y) {
					System.out.println("Game over, your length was: " + snake.size());
					return;
				}
			}
			if (snake_head.x < 0 || snake_head.x >= x_size || snake_head.y < 0 || snake_head.y >= y_size) {
				System.out.println("Game over, your length was: " + snake.size());
				return;
			}

			try {
				Thread.sleep(500); 
			} catch (Exception e) {
			}

		} 
	}
	static ArrayList moveSnake(ArrayList currentSnake, int direction) {

		ArrayList newSnake = new ArrayList();
		Point old_head = (Point) currentSnake.get(0);
		Point head = new Point(0,0);
		if (direction == 119) {
			//move up
			head.x = old_head.x;
			head.y = old_head.y - 1;
		} else if (direction == 100) {
			//right
			head.x = old_head.x + 1;
			head.y = old_head.y;
		} else if (direction == 115) {
			//down
			head.x = old_head.x;
			head.y = old_head.y + 1;
		} else if (direction == 97) {
			//left
			head.x = old_head.x - 1;
			head.y = old_head.y;
		}
		newSnake.add(head);
		for (int i = 0; i < currentSnake.size()-1; i++) {
			newSnake.add(currentSnake.get(i));
		}
		return newSnake;
	}

	static class Point {

		public int x;
		public int y;

		public Point(int x_input, int y_input) {
			x = x_input;
			y = y_input;
		}
	}
}
```
We've added lines 87-90.

**Line 87:** We need to check if the head of Mr Snake is out of bounds. This will happen if Mr Snake's head location is less that 0 in either the x or y direction, or if its past the boundaries of the play area (given by "x\_size" and "y\_size"). The **or** symbol is denoted by the "||" double pipes. You'll find this key to the left of the left shift key on your keyboard.

**Line 88 & 89:** These lines do the same thing that happens if Mr Snake runs into itself, prints out a game over message with your final size, and then exits the program\!

##### Now compile and run\! If you got this far, good job\! You've made the game snake in the terminal using Java\! Woohoo\!

Below is a section that contains further work and more Java information.

#### Section -1: Useful Links, Tutorials And Exercises
The official Java website's tutorial information: <https://docs.oracle.com/javase/tutorial/>

Lots of information about all Java stuff (plus a tutorial): <http://www.javatpoint.com/java-tutorial>

A slightly harder Java tutorial that tells you how to make a game (in a window with graphics, not the terminal\!): <http://zetcode.com/tutorials/javagamestutorial/basics/>

A load of Java exercises to put in to practice what you learnt (that I can check your answers for): <https://www3.ntu.edu.sg/home/ehchua/programming/java/J2a_BasicsExercises.html>

#### Finally, thanks very much for coming along!
You can always email me (David or Tankski, I don't bite: <D.J.Richardson@warwick.ac.uk>) if you need any more help\! I hope you enjoyed it here, we'll be doing more exciting things next week\!

GLHF\!

