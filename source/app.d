import std.stdio, std.string, std.array, std.conv, std.algorithm, std.traits, std.functional;
import classroom, assignment, command, arguments;
import std.typecons;

alias STRING = ArgumentTypes.STRING;
alias NUMBER = ArgumentTypes.NUMBER;
alias PERCENT = ArgumentTypes.PERCENT;

void main() {
	bool run = true;
	ClassRoom classroom = new ClassRoom();

	Command[string] commands = [
		/**
		 * Set weight command
		 */
		"sw": new class (&classroom) Command {
			this(ClassRoom* classroom) {
				super(classroom);
			}

			@([ STRING, PERCENT ]) 
			override string exec(string[] args) {
				this.checkArgs(args, __traits(getAttributes, this.exec));
				
				string name = args[0];
				double weight = to!double(args[1]);

				this.classroom.setWeight(name, weight);
				return format!"Created weight %s"(name);
			}
		},

		/**
		 * Add assignment command
		 */
		"aa": new class (&classroom) Command {
			this(ClassRoom* classroom) {
				super(classroom);
			}

			@([ STRING, NUMBER, NUMBER, STRING ]) 
			override string exec(string[] args) {
				this.checkArgs(args, __traits(getAttributes, this.exec));

				string name = args[0];
				double pointsReceived = to!double(args[1]);
				double pointsPossible = to!double(args[2]);
				string weight = args[3];
				
				this.classroom.addAssignment(new Assignment(name, pointsReceived, pointsPossible, weight));
				return format!"Created assignment %s"(name);
			}
		},

		/**
		 * Show grades command
		 */
		"g": new class (&classroom) Command {
			this(ClassRoom* classroom) {
				super(classroom);
			}

			override string exec(string[] args) {
				return format!"Your weighted grade is %2.2f%%"(this.classroom.grade * 100);
			}
		},

		/**
		 * Exits the program
		 */
		"quit": new class (&run) Command {
			private bool* run;
			
			this(bool* run) {
				this.run = run;
			}

			override string exec(string[] args) {
				*this.run = false;
				return "Goodbye!";
			}
		}
	];

	while(run == true) {
		write("> ");
		string input = readln().chomp();
		string[] args = input.split(" ");
		string commandName = args.length > 0 ? args[0].toLower() : "";

		args = args.length > 0 ? args[1 .. args.length] : args;
		
		try {
			auto command = commands[commandName];

			if(command !is null) {
				writeln(command.exec(args));
			}

		} catch(CommandException e) {
			writeln(e.msg);
		}
	}
}
