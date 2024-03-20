module fsm(input clk, input reset, input [2:0] in, input [2:0] cs, input [2:0] ns, input [3:0] exp_out, output reg [3:0] out);
    parameter ZERO = 0, ONE = 1, TWO = 2, THREE = 3, FOUR = 4;
    reg [2:0] state;
    reg [2:0] next_state;

    always @(posedge clk) begin
        if (reset) state <= ZERO;  //cs - current state
        else state <= next_state; //ns - next state
    end

    always @(in or cs) begin
        case(cs) 
            ZERO: begin
                case(in) 
                    ZERO: begin
                        next_state <= ns;
                    end
                    ONE: begin
                        next_state <= ns;
                    end
                    TWO: begin
                        next_state <= ns;
                    end
                    THREE: begin
                        next_state <= ns;
                    end
                    FOUR: begin
                        next_state <= ns;
                    end
                endcase
                out <= exp_out;
            end
            ONE: begin
                case(in) 
                    ZERO: begin
                        next_state <= ns;
                    end
                    ONE: begin
                        next_state <= ns;
                    end
                    TWO: begin
                        next_state <= ns;
                    end
                    THREE: begin
                        next_state <= ns;
                    end
                    FOUR: begin
                        next_state <= ns;
                    end
                endcase
                out <= exp_out;
            end
            TWO: begin
                case(in) 
                    ZERO: begin
                        next_state <= ns;
                    end
                    ONE: begin
                        next_state <= ns;
                    end
                    TWO: begin
                        next_state <= ns;
                    end
                    THREE: begin
                        next_state <= ns;
                    end
                    FOUR: begin
                        next_state <= ns;
                    end
                endcase
                out <= exp_out;
            end
            THREE: begin
                case(in) 
                    ZERO: begin
                        next_state <= ns;
                    end
                    ONE: begin
                        next_state <= ns;
                    end
                    TWO: begin
                        next_state <= ns;
                    end
                    THREE: begin
                        next_state <= ns;
                    end
                    FOUR: begin
                        next_state <= ns;
                    end
                endcase
                out <= exp_out;
            end
            FOUR: begin
                case(in) 
                    ZERO: begin
                        next_state <= ns;
                    end
                    ONE: begin
                        next_state <= ns;
                    end
                    TWO: begin
                        next_state <= ns;
                    end
                    THREE: begin
                        next_state <= ns;
                    end
                    FOUR: begin
                        next_state <= ns;
                    end
                endcase
                out <= exp_out;
            end
        endcase
    end
endmodule