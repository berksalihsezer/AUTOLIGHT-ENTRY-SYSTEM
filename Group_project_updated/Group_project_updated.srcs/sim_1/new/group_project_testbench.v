`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2024 18:44:13
// Design Name: 
// Module Name: group_project_testbench
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


module tb_door_control;


reg x1, x2;          // Inputs
reg clk, reset;      // Clock and reset signals
wire entry, exit;    // Outputs
wire [3:0] count;    // Counter output

// Instantiate the door_control module
door_control uut (
    .x1(x1),
    .x2(x2),
    .clk(clk),
    .reset(reset),
    .entry(entry),
    .exit(exit),
    .count(count)
);

// clock signal
always begin
    #5 clk = ~clk;  // Clock period: 10 units 
end

initial begin
    clk = 0;
    reset = 0;
    x1 = 0; x2 = 0;

    // Monitor 
    $monitor("At time %t, x1 = %b, x2 = %b, entry = %b, exit = %b, count = %d", $time, x1, x2, entry, exit, count);

    // Test case 1: Reset the system
    reset = 1; #10;
    reset = 0; #10;

    // Test case 2: Simulate entry (x1 = 0, x2 = 1)
    x1 = 0; x2 = 1; #10;  // Entry
    x1 = 0; x2 = 1; #10;  // Entry
    x1 = 0; x2 = 1; #10;  // Entry

    // Test case 3: Simulate exit (x1 = 1, x2 = 0)
    x1 = 1; x2 = 0; #10;  // Exit
    x1 = 1; x2 = 0; #10;  // Exit

    // Test case 4: Simulate no change (x1 = 1, x2 = 1)
    x1 = 1; x2 = 1; #10;

    // Test case 5: Simulate exit when counter is 0
    x1 = 1; x2 = 0; #10;  // Exit, should not go below 0
    x1 = 1; x2 = 0; #10;  // Exit, should still be 0

   $finish;
end

endmodule
