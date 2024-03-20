module fsm(input clk, input reset, input in, input cs, input ns, input [3:0] exp_out, output reg [3:0] out);
    parameter ZERO = 0, ONE = 1;
    reg state;
    reg next_state;

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
                endcase
                out <= exp_out;
            end
        endcase
    end
endmodule