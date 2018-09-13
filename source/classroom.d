import assignment, std.stdio;

class ClassRoom {

    private double[string] weights;
    private Assignment[string] assignments;

    void setWeight(string className, double weight) {
        this.weights[className] = weight;
    }

    double getWeight(string className) {
        return this.weights[className];
    }

    void addAssignment(Assignment assignment) {
        this.assignments[assignment.name] = assignment;
    }

    Assignment getAssignment(string name) {
        return this.assignments[name];
    }

    Assignment[] getAssignmentsByWeight(string weight) {
        Assignment[] result;
        
        foreach(Assignment assignment; this.assignments) {
            if(assignment.weight == weight) {
                result ~= [ assignment ];
            }
        }
        return result;
    }


    @property double grade() {
        double gradesPossible = 0.;
        double gradesReceived = 0.;

        foreach(string weightName, double weightValue; this.weights) {
            foreach(assignment; this.getAssignmentsByWeight(weightName)) {
                
                gradesPossible += assignment.pointsPossible * weightValue;
                gradesReceived += assignment.pointsReceived * weightValue;
            }
        }

        return gradesReceived / gradesPossible;
    }
}