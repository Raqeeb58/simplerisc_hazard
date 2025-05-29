///////////////////////////////////////////////////////////////////////////////
// Control Unit
///////////////////////////////////////////////////////////////////////////
// Instruction decoder generating 9 control signals:
// - isRet: Return operation
// - isSt: Store to memory
// - isWb: Write back to register
// - isImmediate: Immediate operand
// - isBeq: Branch if equal
// - isBgt: Branch if greater
// - isUbranch: Unconditional branch
// - isLd: Load from memory
// - isCall: Function call

module control_unit(instruction ,isRet,isSt,isWb,isImmediate,alusignals,isBeq,isBgt,isUbranch,isLd,isCall,isIret,isSet,isReset);
input [31:0]instruction;
output reg isRet,isSt,isWb,isImmediate,isBeq,isBgt,isUbranch,isLd,isCall,isIret,isSet,isReset;
output [4:0]alusignals;

assign alusignals = instruction[31:27];

always @(*)
begin
    case(instruction[31:27])
    5'b00000,5'b00001,5'b00010,5'b00011,5'b00100,5'b00110,5'b00111,5'b01000,5'b01010,5'b01011,5'b01100,5'b01001:{isRet,isSt,isWb,isBeq,isBgt,isUbranch,isLd,isCall,isIret,isSet,isReset}=11'b00100000000;
    5'b01110 : {isRet,isSt,isWb,isBeq,isBgt,isUbranch,isLd,isCall,isIret,isSet,isReset}=11'b00100010000;
    5'b01111 : {isRet,isSt,isWb,isBeq,isBgt,isUbranch,isLd,isCall,isIret,isSet,isReset}=11'b01000000000;
    5'b10000 : {isRet,isSt,isWb,isBeq,isBgt,isUbranch,isLd,isCall,isIret,isSet,isReset}=11'b00010000000;
    5'b10001 : {isRet,isSt,isWb,isBeq,isBgt,isUbranch,isLd,isCall,isIret,isSet,isReset}=11'b00001000000;
    5'b10010 : {isRet,isSt,isWb,isBeq,isBgt,isUbranch,isLd,isCall,isIret,isSet,isReset}=11'b00000100000;
    5'b10011 : {isRet,isSt,isWb,isBeq,isBgt,isUbranch,isLd,isCall,isIret,isSet,isReset}=11'b00100101000;
    5'b10100 : {isRet,isSt,isWb,isBeq,isBgt,isUbranch,isLd,isCall,isIret,isSet,isReset}=11'b10000100000;
    5'b00101 : {isRet,isSt,isWb,isBeq,isBgt,isUbranch,isLd,isCall,isIret,isSet,isReset}=11'b00000000000;
    5'b10101 : {isRet,isSt,isWb,isBeq,isBgt,isUbranch,isLd,isCall,isIret,isSet,isReset}=11'b10000100100; //isret
    5'b11000 : {isRet,isSt,isWb,isBeq,isBgt,isUbranch,isLd,isCall,isIret,isSet,isReset}=11'b00100000010; //set
    5'b11001 : {isRet,isSt,isWb,isBeq,isBgt,isUbranch,isLd,isCall,isIret,isSet,isReset}=11'b00100000001; //reset
    default  : {isRet,isSt,isWb,isBeq,isBgt,isUbranch,isLd,isCall,isIret,isSet,isReset}=11'b00000000000;
    
    endcase
    if(instruction[26]==1)
        isImmediate = 1'b1;
    else
        isImmediate = 1'b0;
        
end    
endmodule
