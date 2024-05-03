`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.05.2024 21:43:16
// Design Name: 
// Module Name: LFSR_2
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

module LFSR_2(reset,num,clk);
input clk,reset;
output wire [3:0]num;
wire x1,x2;
dff d3(reset,x2,clk,num[3]);
dff d2(reset,num[3],clk,num[2]);
xor g2(x2,num[2],x1);
dff d1(reset,num[2],clk,num[1]);
xnor g1(x1,num[0],num[1]);
dff d0(reset,num[1],clk,num[0]);
endmodule
