//-------------------------
// Register File
//-------------------------
// 16-register file, 32-bit each.
// Supports two reads and one write per cycle
module register__file(clk,Iret,interrupt,pc_EX,flags,rs1,rs2,rd_ra,isWb,isSet,isReset,data,rd1,rd2,flag_out);
input clk,isWb,isSet,isReset;
input [31:0]pc_EX;
input [1:0]flags;
input interrupt;
input Iret;
input [3:0]rs1,rs2,rd_ra;
input [31:0]data;
output  [31:0]rd1,rd2;
output reg [1:0]flag_out;

reg [31:0]register[15:0];  
        
initial
begin
// Initialize registers
    register[0]=3;
    register[1]=2;
    register[2]=5;
    register[3]=7;
    register[4]=3;
    register[5]=4;
    register[6]=8;
    register[7]=10;
    register[8]=10;
    register[9]=3;
    register[10]=1;
    register[11]=1;
    register[12]=35; //pc
    register[13]=42;  //flags
    register[14]=32'd25;  //sp
    register[15]=12;  //ra
end

assign rd1 = register[rs1];
assign rd2 = register[rs2];
always @(posedge interrupt)
begin
    register[12] <= pc_EX;
    register[13] <= {30'b0,flags};    
end
always @(posedge Iret)
begin
    flag_out <=  register[13];   
end

always @(*)
begin
    
     if(isWb )
     begin
        if(isSet)
            register[rd_ra] <=register[rd_ra] | data;  
        else if(isReset)
            register[rd_ra] <= register[rd_ra] & data; //writing to register file if enabled 
        else 
            register[rd_ra] <=  data   ;
     end
        
end
endmodule