import classroom, arguments;
import std.typecons, std.string, std.conv;

class CommandException : Exception {
    this(string msg, string file = __FILE__, size_t line = __LINE__) {
        super(msg, file, line);
    }
}

abstract class Command {
    protected ClassRoom* classroom;

    this() {}
    this(ClassRoom* classroom) {
        this.classroom = classroom;
    }

    string exec(string[] args) {
        return "";
    }

    protected void checkArgs(string[] args, ArgumentTypes[] requirements) {
        if(args.length < requirements.length) throw new CommandException(format!"Invalid argument count (expected %1d)"(requirements.length));
        
        foreach(key, type; requirements) {
            switch(type) {
                case ArgumentTypes.PERCENT:
                    double arg = to!double(args[key]);
                    if(arg < 0 || arg > 1) throw new CommandException(format!"Argument %1d should be a percentage (number between 0 and 1)"(key + 1));
                    break;

                case ArgumentTypes.NUMBER:
                    if(!args[key].isNumeric) throw new CommandException(format!"Argument %1d should be numeric"(key + 1));
                    break;
                
                default: break;
            }
        }
    }
}


struct minArgs {
    
}