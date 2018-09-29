# weightd
Want to know the running total of your weighted grades, but don't want to bug your professor?  Me too, so I created this application in D to calculate them for me. 

## Can't you see grades on \<insert LMS here>?
That depends... some professors don't setup weights on canvas/blackboard/etc, so the score may be incorrect.  Also, some learning management systems don't have a "what-if" feature that allows you to test the effect of different scores on your grade.

# Installation
To install this application, simply clone the repository and run [dub](https://code.dlang.org/download) (which will both compile and run the application).  At some point, I will provide precompiled binaries.

# Usage
Below are the available commands:

## sw 
Sets a grade weight:
```
sw <weightName> <weightValue>
``` 
- weightValue should be a decimal between 0 and 1

## aa 
Adds a new assignment:
```
aa <assignmentName> <pointsEarned> <pointsPossible> <weightName>
```

## g
Displays your current weighted grade in the class
```
g
```

## quit
Exits the application:
```
quit
```

# To-do
- Add data persistence 
- Add a graphical interface
- Add commands to manage multiple classes
- Add command to edit already entered assignments
- Add command to display a list of entered assignments
- Use some CI script to compile & upload binaries to an artifact repo of choice