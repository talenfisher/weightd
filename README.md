# weightd
Unaware of what your weighted grades are but don't want to bug your professor?  Me too, so I created this application in D to calculate them for me. 

## Can't you see grades on <insert LMS here>?
Sure, but some professors don't setup weights on canvas/blackboard/etc.  

# Installation
To install this application, simply clone the repository and run [dub](https://code.dlang.org/download) (which will both compile and run the application).  At some point I will provide a precompiled binary.

# Usage
Below are the available commands:
- **sw \<weightName> \<weightValue>** (sets a grade weight, weightValue should be a number between 0 and 1)
- **aa \<assignmentName> \<pointsEarned> \<pointsPossible> \<weightName>** (adds a new assignment)
- **g** (displays your current weighted grade in the class)
- **quit** (exits the application)

# To-do
[] Add data persistence 
[] Add commands to manage multiple classes
[] Add command to edit already entered assignments
[] Add command to display a list of entered assignments
[] Use some CI script to compile & upload artifact to an artifact repo of choice