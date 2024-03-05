// Prelab 7
//Author : Rakin Alim
//Subject : ENEE459D
/*
Randomize over Person and generate 1000 random people, randomize all variables in it. Then:
a. Count how many are taking 459D out of the 1000 and print the value
*/
class Person;
    rand bit [7:0] age;
    rand bit has_taken_ENEE244;
    rand bit has_taken_ENEE245;
    rand bit has_taken_ENEE350;
    rand bit is_taking_ENEE459D;
  
    // Constraint block to limit age to a minimum of 16 years
    constraint age_constraint {
        age > 16;
        age <= 122; // Adding the maximum age constraint as well
    }

    // Additional constraints
    constraint course_constraints {
        // To take 245, you must have taken 244
        has_taken_ENEE245 == has_taken_ENEE244;

        // To take 350, you must have taken 244
        has_taken_ENEE350 == has_taken_ENEE244;

        // To take 459D, you must have taken both courses 245 and 350
        is_taking_ENEE459D == (has_taken_ENEE245 && has_taken_ENEE350);
    }
endclass

module testbench;
    initial begin
        int count_459D = 0;
        // Generate 1000 random people
        for (int i = 0; i < 1000; i++) begin
            Person person = new();
            person.randomize(); // Randomize all variables
            
            // Check if the person is taking course 459D
            if (person.is_taking_ENEE459D) begin
                count_459D++;
            end
        end
        
        // Print the count of people taking course 459D
        $display("Number of people taking course 459D: %d", count_459D);
    end
endmodule
