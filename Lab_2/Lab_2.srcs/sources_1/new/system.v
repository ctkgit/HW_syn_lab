`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: Chulalongkorn University
// Engineer: Thammakorn Kobkuachaiyapong
// 
// Create Date: 02/02/2020 08:34:24 AM
// Design Name: 
// Module Name: system
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


module system(
    output [6:0] seg,
    output dp,
    output [3:0]an,
    input clk
    );
    
wire [3:0] num0;
wire [3:0] num1;
wire [3:0] num2;
wire [3:0] num3;
/*--Number assignment--*/
assign num0 = 1 ;
assign num1 = 2 ;
assign num2 = 3 ;
assign num3 = 4 ;

/*--Clock--*/
wire [18:0] tclk;

assign tclk[0] = clk ;

genvar c;
generate for(c=0;c<18;c=c+1)
    begin
        //clock divider is a DFF that will divide clock frequency a half for each divider
        clockDivider fdiv(tclk[c+1],tclk[c]);
    end 
endgenerate
/*--Display--*/
quad2SevenSeg q7seg(seg,dp,an,num0,num1,num2,num3,0,0,tclk[18]);

endmodule
