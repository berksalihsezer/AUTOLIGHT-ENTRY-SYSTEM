`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2024 18:40:57
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
    input x1,          // Sensor 1
    input x2,          // Sensor 2
    input clk,         // Clock signal
    input reset,       // Reset signal
    output reg entry,  // Entrance Output
    output reg exit,   // Exit Output
    output reg [3:0] count // 4 bit counter 
);

// Entrance and Exit situation
always @(*) begin
    // Entry: x1 = 0, x2 = 1
    entry = (~x1 & x2); 

    // Exit: x1 = 1, x2 = 0
    exit = (x1 & ~x2); 
end

// Counter: Increment and Decrement
always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 4'b0000; // Reset the counter to 0
    end else begin
        // Increment the counter for entry
        if (entry) begin
            count <= count + 1;
        end
        // Decrement the counter for exit, but not below 0
        if (exit && count > 0) begin
            count <= count - 1;
        end
    end
end

endmodule

    
