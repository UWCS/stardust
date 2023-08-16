+++
title = "Beginner Programming Lesson Three"
date = "2016-10-21T10:43:00Z"

[extra]
original = "https://uwcs.co.uk/news/beginner-programming-lesson-3/"    
categories = ["Programming Lesson"]
+++

<p>The third instalment of our beginner programming series.</p>

<!-- more -->

#### Section 0: Intro
This lesson, we're going back to basics a little\! So far, you've been learning by copying my code and seeing it work. It's now time for you to write your own\! I'm going to set a few Java questions, and help you out by giving a skeleton answer that you have to fill in. You'll be fine I promise\! I'll give you a reminder how to compile and run your code in section 1, in case you forgot.

#### Section 1: Warm Up
Here, I simply want you to be able to enter a number, and have the computer tell you whether that number is odd or even. I'm going to specify the output as follows:

**Output:** "The number is \<odd/even\>."

The values in square brackets are to be deleted as appropriate (ie, only print out one of them\!).

Here is the skeleton code (save it as Question1.java, it reads in a number from the command line and just prints it out again. You need to alter it so it tells me if the output is odd or even\!

```java
import java.io.*;
public class Question1 {
    public static void main(String[] args) {
        int num = 0;
        System.out.println("Enter a number:");

        try {
              BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
            num = Integer.parseInt(br.readLine());
        } catch (Exception e) {
            System.out.println("Not a number.");
            return;
        }

        System.out.println("You entered: " + num);
    }
}
```
**Hint: Think about the mathematical way of telling whether a number is even or odd. Maybe the mod function will be of use? (The % sign in Java).**

To compile and run your code, type the following commands into the terminal:

```bash
javac Question1.java
java Question1
```
#### Section 2: A Little More Difficult
Next stage, we're going to draw some shapes. I would like you to draw a box of N\*N dimensions, where the user can input N.

**Output:** n\*n box with the points as $ characters.

The skeleton code includes the user input for the dimensions of the box, and the first **for** loop that will draw a single line. You need to make it into a box\!

```java
import java.io.*;                                                             
public class Question2 {                                                      
    public static void main(String[] args) {                                  
        int boxSize = 0;                                                      
        System.out.println("Enter a box size:");                              
                                                                              
        try {     
            BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
           boxSize = Integer.parseInt(br.readLine());    
        } catch (Exception e) {                                               
            System.out.println("Not a number.");                              
            return;
        }   
        
        for (int i = 0; i < boxSize; i++) {                                   
            System.out.print("$");
        }   
        System.out.println();                                                 
    }   
}
```
**Hint: Pay attention to your System.out.print() and System.out.println() ordering of commands\!**

#### Section 3: Fibonacci Numbers
For this question, you're going to read in a number from the command line, and this number will be the nth fibonacci number to calculate. Let the first Fibonacci number be 1 and the second also be 1. For example:

If you enter 6 into the command line, your program should return 8 because the Fibonacci sequence is as follows:

1 1 2 3 5 8 \<-- 6th number is an 8.

In case you haven't met Fibonacci numbers before, just know that the nth number is the sum of the two previous numbers (and the sequence starts with two 1's).

All the sample code does this time is take the user input, it is up to you to calculate that number\! You will need to add in extra variables and loops\!

```java
import java.io.*;                                                             
public class Question3 {
    public static void main(String[] args) {                                  
        int fibnum = 0;
        System.out.println("Enter fibonacci number n you want to find:");
                                                                              
        try {                                                                
             BufferedReader br = new BufferedReader(new InputStreamReader(System.in)); 
            fibnum = Integer.parseInt(br.readLine()); 
        } catch (Exception e) {                                               
            System.out.println("Not a number.");                              
            return;
        }   
        
    }   
}
```
**Hint: Think about how the sum to calculate the current number needs the previous two numbers, and store them in a variable each.**

If you get stuck, come and grab me\! I'm here to help\!

#### Section 4: Printing Numbers In Words
In this task, I'd like to be able to enter a number between 1 and 1000, and have the computer print that number out to me in word form. Below are some examples:

**Input:** 345

**Output:** Your number in words is: three hundred and forty five

**Input:** 9

**Output:** Your number in words is: nine

Here is the sample code\! It currently only works for numbers 1 to 9. Fix that\!

```java
import java.io.*;
public class Question4 {
    public static void main(String[] args) {
        int num = 0;
        System.out.println("Enter a number between 1 and 1000:");

        try {
           BufferedReader br = new BufferedReader(new InputStreamReader(System.in)); 
            num = Integer.parseInt(br.readLine());
        } catch (Exception e) {
            System.out.println("Not a number.");
            return;
        }
        String number_string = Integer.toString(num);

        System.out.print("You number in words is: ");

        if (number_string.length() == 1) {
            switch (number_string) {
                case "1":
                    System.out.println("one");
                    break;
                case "2":
                    System.out.println("two");
                    break;
                case "3":
                    System.out.println("three");
                    break;
                case "4":
                    System.out.println("four");
                    break;
                case "5":
                    System.out.println("five");
                    break;
                case "6":
                    System.out.println("six");
                    break;
                case "7":
                    System.out.println("seven");
                    break;
                case "8":
                    System.out.println("eight");
                    break;
                case "9":
                    System.out.println("nine");
                    break;
            }
        } // you need to extend this

    }
}
```
If you have any trouble, come get me\!

