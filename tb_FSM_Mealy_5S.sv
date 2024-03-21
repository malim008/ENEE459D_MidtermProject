// Midterm Project
//
//Subject : ENEE459D
//Testbench

`timescale 1ns / 1ps


module tb_fsm_generic;

    // Constants
    localparam int NUM_STATES_MIN = 2;     // Minimum # of states
    localparam int NUM_STATES_MAX = 5;     // Maximum # of states

    // Testbench inputs
    reg clk;
    reg reset;
    reg in;
    reg [1:0] sw_input;
    reg ctrl_input;

    // Testbench outputs
    wire [3:0] out;

    // Instantiate the FSM module
    fsm fsm_inst (
        .clk(clk),
        .reset(reset),
        .in(in),
        .cs(sw_input[1]),
        .ns(ctrl_input),
        .exp_out(out)
    );

    // Define delays for input and control signals
    rand int input_delay;
    rand int ctrl_delay;
    randc int starting_state;

    // File handling variables
    string filename = "FSM_config_input.txt";
    int fsm_type;
    int num_states;
    int [7:0] transition_table [$];

    // Generate random delays and starting state
    initial begin
        input_delay = $urandom_range(5, 10);
        ctrl_delay = $urandom_range(5, 10);
        starting_state = $urandom_range(NUM_STATES_MIN, NUM_STATES_MAX);
        
        // Open and read configuration file
        int file;
        file = $fopen(filename, "r");
        if (file != 0) begin
            $fscanf(file, "%d,%d", fsm_type, num_states);
            while (!$feof(file)) begin
                int input, current_state, next_state, output;
                $fscanf(file, "%d,%d,%d,%d", input, current_state, next_state, output);
                transition_table[{input, current_state, next_state}] = output;
            end
            $fclose(file);
        end else begin
            $display("Error: Could not open file %s", filename);
            $finish;
        end
    end

    // Clock generation
    always #5 clk = ~clk;

    // Generate input and control signals with delays
    initial begin
        // Wait for some initial time
        #10;

        // Generate starting state
        sw_input = starting_state;

        // Apply reset
        reset = 1;
        #5 reset = 0;

        // Weit for input delay
        #input_delay;

        // Generate inpuut
        in = $urandom_range(0, 1);

        // Wait for control dellay
        #ctrl_delay;

        // Generate control input
        ctrl_input = 1;

        // Print configuration
        $display("Starting State: %d", starting_state);
        $display("Input Delay: %d", input_delay);
        $display("Control Delay: %d", ctrl_delay);
        $display("Transition Table:");
        foreach(transition_table[key]) begin
            $display("%d -> %d: %d", key[1], key[2], transition_table[key]);
        end

        // End simulation after desired number of cycles
        #100;
        $finish;
    end

endmodule

































/*
    module tb_fsm_generic;

    // Constants
    localparam int NUM_STATES_MIN = 2;     //Minimum # of states
    localparam int NUM_STATES_MAX = 5;     // Maximum # of states

    // Testbench inputs
    reg clk;
    reg reset;
    reg in;
    reg [1:0] sw_input;
    reg ctrl_input;

    // Testbench outputs
    wire [3:0] out;

    // Instantiate the FSM module
    fsm fsm_inst (
        .clk(clk),
        .reset(reset),
        .in(in),
        .cs(sw_input[1]),
        .ns(ctrl_input),
        .exp_out(out)
    );

    // Define delays for input and control signals
    rand int input_delay;
    rand int ctrl_delay;
    randc int starting_state;

    // Generate random delays and starting state
    initial begin
        input_delay = $urandom_range(5, 10);
        ctrl_delay = $urandom_range(5, 10);
        starting_state = $urandom_range(NUM_STATES_MIN, NUM_STATES_MAX);
    end

    // Clock generation
    always #5 clk = ~clk;

    // Generate input and control signals with delays
    initial begin
        // Wait for some initial time
        #10;

        // Generate starting state
        sw_input = starting_state;

        // Apply reset
        reset = 1;
        #5 reset = 0;

        // Wait for input delay
        #input_delay;

        // Generate input
        in = $urandom_range(0, 1);

        // Wait for control delay
        #ctrl_delay;

        // Generate control input
        ctrl_input = 1;

        // Print configuration
        $display("Starting State: %d", starting_state);
        $display("Input Delay: %d", input_delay);
        $display("Control Delay: %d", ctrl_delay);
        $display("Transition Table:");
        // Output the transition table here

        // Monitor outputs
        // Add code to check for special transitions and output results
        // You can also add assertions to check for expected behavior
        // Example assertion: assert (out == expected_output) else $error("Output mismatch!");

        // End simulation after desired number of cycles
        #100;
        $finish;
    end

    endmodule
*/