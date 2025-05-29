module interrupt_handler(
    input clk,
    input interrupt_pin,
    input [31:0]IVT,
    input interrupt_ack,
    output reg interrupt_out,
    output reg [31:0]pc_isr
);

    always@(*)
    begin
        if(interrupt_pin)
        begin
            interrupt_out <= 1'b1;
            pc_isr <= IVT;
        end    
        else
            interrupt_out <= 1'b0;
    end  
  endmodule  