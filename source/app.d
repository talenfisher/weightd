import std.stdio, std.string, std.conv, assignment, classroom;

void main() {
	ClassRoom classroom = new ClassRoom();
	classroom.setWeight("exam", .70);
	classroom.setWeight("quiz", .15);
	classroom.setWeight("homework", .10);
	classroom.setWeight("group homework", .05);

	classroom.addAssignment(new Assignment("Quiz 1 (CCI)", 10, 10, "quiz"));
	classroom.addAssignment(new Assignment("Quiz 2", 10, 10, "quiz"));
	classroom.addAssignment(new Assignment("Quiz 3", 5, 10, "quiz"));
	
	classroom.addAssignment(new Assignment("Homework 1", 15, 15, "homework"));
	classroom.addAssignment(new Assignment("Homework 2", 15, 15, "homework"));
	classroom.addAssignment(new Assignment("Homework 3", 15, 15, "homework"));

	classroom.addAssignment(new Assignment("Group Homework 1", 8, 10, "group homework"));

	writeln(classroom.grade);
}
