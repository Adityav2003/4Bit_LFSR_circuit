`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2024 22:58:13
// Design Name: 
// Module Name: lfsr_1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module dff(reset,d,clk,q);
input d,clk,reset;
output reg q;
always @(negedge clk)
begin
if(reset == 0) q <= 0;
else q <= d;
end
endmodule

module lfsr_1(reset,num,clk);
input clk,reset;
output wire [3:0]num;
wire x1,x2;
dff d3(reset,x1,clk,num[3]);
dff d2(reset,x2,clk,num[2]);
xnor g2(x2,num[3],x1);
dff d1(reset,num[2],clk,num[1]);
xor g1(x1,num[0],num[1]);
dff d0(reset,num[1],clk,num[0]);
endmodule
