`timescale 1ns/1ps

//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:15:11 08/18/2013
// Design Name:
// Module Name:    alu
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module alu(
           clk,           // system clock              (input)
           rst_n,         // negative reset            (input)
           src1,          // 32 bits source 1          (input)
           src2,          // 32 bits source 2          (input)
           ALU_control,   // 4 bits ALU control input  (input)
			  //bonus_control, // 3 bits bonus control input(input) 
           result,        // 32 bits result            (output)
           zero,          // 1 bit when the output is 0, zero must be set (output)
           cout,          // 1 bit carry out           (output)
           overflow       // 1 bit overflow            (output)
           );
input           clk;
input           rst_n;
input  [32-1:0] src1;
input  [32-1:0] src2;
input   [4-1:0] ALU_control;


output [32-1:0] result;
output          zero;
output          cout;
output          overflow;

reg [32-1:0] result;
reg          overflow;
reg [2-1:0]  top_OP;
reg A_invert,B_invert;
reg zero;
reg cout;

wire [32-1:0] carry;
wire [32-1:0] w_result;
wire the_0;
wire set;
wire the_cout;

assign carry[0]=(ALU_control==4'b0110)? 1: (ALU_control==4'b0111)? 1: 0;
assign the_0=1'b0;

always@(*) 
begin
	case(ALU_control)
 		4'b0000: begin A_invert <= 0;B_invert <= 0;top_OP<= 2'b00;overflow=0;end
		4'b0001: begin A_invert <= 0;B_invert <= 0;top_OP<= 2'b01;overflow=0;end
		4'b0010: begin A_invert <= 0;B_invert <= 0;top_OP<= 2'b10;
 		if(src1[31] == src2[31]) overflow = (src1[31]^result[31]); end
		4'b0110: begin A_invert <= 0;B_invert <= 1;top_OP<= 2'b10;
 		if(src1[31] != src2[31]) overflow = (src1[31]^result[31]);end
		4'b1100: begin A_invert <= 1;B_invert <= 1;top_OP<= 2'b00;overflow=0;end
		4'b0111: begin A_invert <= 0;B_invert <= 1;top_OP<= 2'b11;overflow=0;end
	endcase
end
alu_top r0( .src1(src1[0]), .src2(src2[0]), .less(set), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[0]), .operation(top_OP), .result(w_result[0]), .cout(carry[1]));
alu_top r1( .src1(src1[1]), .src2(src2[1]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[1]), .operation(top_OP), .result(w_result[1]), .cout(carry[2]));
alu_top r2( .src1(src1[2]), .src2(src2[2]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[2]), .operation(top_OP), .result(w_result[2]), .cout(carry[3]));
alu_top r3( .src1(src1[3]), .src2(src2[3]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[3]), .operation(top_OP), .result(w_result[3]), .cout(carry[4]));

alu_top r4( .src1(src1[4]), .src2(src2[4]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[4]), .operation(top_OP), .result(w_result[4]), .cout(carry[5]));
alu_top r5( .src1(src1[5]), .src2(src2[5]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[5]), .operation(top_OP), .result(w_result[5]), .cout(carry[6]));
alu_top r6( .src1(src1[6]), .src2(src2[6]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[6]), .operation(top_OP), .result(w_result[6]), .cout(carry[7]));
alu_top r7( .src1(src1[7]), .src2(src2[7]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[7]), .operation(top_OP), .result(w_result[7]), .cout(carry[8]));

alu_top r8( .src1(src1[8]), .src2(src2[8]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[8]), .operation(top_OP), .result(w_result[8]), .cout(carry[9]));
alu_top r9( .src1(src1[9]), .src2(src2[9]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[9]), .operation(top_OP), .result(w_result[9]), .cout(carry[10]));
alu_top r10( .src1(src1[10]), .src2(src2[10]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[10]), .operation(top_OP), .result(w_result[10]), .cout(carry[11]));
alu_top r11( .src1(src1[11]), .src2(src2[11]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[11]), .operation(top_OP), .result(w_result[11]), .cout(carry[12]));

alu_top r12( .src1(src1[12]), .src2(src2[12]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[12]), .operation(top_OP), .result(w_result[12]), .cout(carry[13]));
alu_top r13( .src1(src1[13]), .src2(src2[13]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[13]), .operation(top_OP), .result(w_result[13]), .cout(carry[14]));
alu_top r14( .src1(src1[14]), .src2(src2[14]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[14]), .operation(top_OP), .result(w_result[14]), .cout(carry[15]));
alu_top r15( .src1(src1[15]), .src2(src2[15]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[15]), .operation(top_OP), .result(w_result[15]), .cout(carry[16]));

alu_top r16( .src1(src1[16]), .src2(src2[16]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[16]), .operation(top_OP), .result(w_result[16]), .cout(carry[17]));
alu_top r17( .src1(src1[17]), .src2(src2[17]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[17]), .operation(top_OP), .result(w_result[17]), .cout(carry[18]));
alu_top r18( .src1(src1[18]), .src2(src2[18]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[18]), .operation(top_OP), .result(w_result[18]), .cout(carry[19]));
alu_top r19( .src1(src1[19]), .src2(src2[19]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[19]), .operation(top_OP), .result(w_result[19]), .cout(carry[20]));

alu_top r20( .src1(src1[20]), .src2(src2[20]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[20]), .operation(top_OP), .result(w_result[20]), .cout(carry[21]));
alu_top r21( .src1(src1[21]), .src2(src2[21]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[21]), .operation(top_OP), .result(w_result[21]), .cout(carry[22]));
alu_top r22( .src1(src1[22]), .src2(src2[22]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[22]), .operation(top_OP), .result(w_result[22]), .cout(carry[23]));
alu_top r23( .src1(src1[23]), .src2(src2[23]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[23]), .operation(top_OP), .result(w_result[23]), .cout(carry[24]));

alu_top r24( .src1(src1[24]), .src2(src2[24]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[24]), .operation(top_OP), .result(w_result[24]), .cout(carry[25]));
alu_top r25( .src1(src1[25]), .src2(src2[25]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[25]), .operation(top_OP), .result(w_result[25]), .cout(carry[26]));
alu_top r26( .src1(src1[26]), .src2(src2[26]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[26]), .operation(top_OP), .result(w_result[26]), .cout(carry[27]));
alu_top r27( .src1(src1[27]), .src2(src2[27]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[27]), .operation(top_OP), .result(w_result[27]), .cout(carry[28]));

alu_top r28( .src1(src1[28]), .src2(src2[28]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[28]), .operation(top_OP), .result(w_result[28]), .cout(carry[29]));
alu_top r29( .src1(src1[29]), .src2(src2[29]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[29]), .operation(top_OP), .result(w_result[29]), .cout(carry[30]));
alu_top r30( .src1(src1[30]), .src2(src2[30]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[30]), .operation(top_OP), .result(w_result[30]), .cout(carry[31]));
alu_last r31( .src1(src1[31]), .src2(src2[31]), .less(the_0), .A_invert(A_invert), .B_invert(B_invert),.cin(carry[31]), .operation(top_OP), .result(w_result[31]), .cout(the_cout),.set(set));

	
always@( posedge clk or negedge rst_n)
    if(rst_n == 0) result = 0;
    else begin
	cout=the_cout;
	result = w_result;
	zero = (result == 0) ? 1 : 0;
    end
     


endmodule
