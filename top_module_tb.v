`timescale 1ns / 1ps

module top_module_tb;

    reg clk;
    reg rst;
    reg interrupt_pin;
    reg [31:0]IVT;

    // Instantiate the top module
    top_module uut (
        .clk(clk),
        .rst(rst),
        .interrupt_pin(interrupt_pin),
        .IVT(IVT)
    );

    // Clock generation: 10ns period (100MHz)
    always #5 clk = ~clk;
  

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        interrupt_pin = 0;
        // Hold reset for a few cycles
        #6;
        rst = 0;
        #45;
        interrupt_pin = 1;
        IVT = 32'd54;
        #10 interrupt_pin = 0; 
        #379
        interrupt_pin = 1;
        #10
        interrupt_pin = 0; 
        // Let the simulation run for 200ns
        #20000 $finish;

   
    end

endmodule
