`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.12.2024 20:29:16
// Design Name: 
// Module Name: door_control
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


module door_control (
    input x1,          // sensor 1
    input x2,          // sensor 2
    input clk,         // clock signal
    input reset,       // reset signal
    output reg entry,  // entrance Output
    output reg exit,   // exit Output
    output reg [3:0] count // 4 bit counter 
);


always @(*) begin
    
    entry = (~x1 & x2); 

   
    exit = (x1 & ~x2); 
end


always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 4'b0000; 
    end else begin
       
        if (entry) begin
            count <= count + 1;
        end
        
        if (exit && count > 0) begin
            count <= count - 1;
        end
    end
end

endmodule