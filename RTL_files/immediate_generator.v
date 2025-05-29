//-------------------------
// Immediate Generator
//-------------------------
// Generates sign-extended immediate and branch target address from instruction.
module immediate_generator(pc,instruction,immx,branch_target);
input [31:0]pc,instruction;
output reg [31:0]immx,branch_target;
reg [31:0]intermeditae_immx;
always @(*)
begin
    //immx <= {{16{instruction[17]}},instruction[15:0]};
    branch_target <= pc + ({{5{instruction[26]}}, instruction[26:0]} << 0);
    case(instruction[17:16])
    2'b01   : immx <= {16'b0, instruction[15:0]};
    2'b10   : immx <= instruction[15:0] << 16 ;
    default : immx <= {{16{instruction[15]}},instruction[15:0]}; 
    endcase
end

endmodule