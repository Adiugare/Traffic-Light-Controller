`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2025 14:33:00
// Name: Aditya Ugare 
// Module Name: traffic_light_controller_tb
// Project Name: Traffic Light Controller
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


module traffic_light_controller_tb();

    reg clk, rst;             
    wire [2:0] light_M1;  
    wire [2:0] light_MT;  
    wire [2:0] light_M2;  
    wire [2:0] light_S;   
 
    traffic_light_controller DUT (
        .clk(clk),
        .rst(rst),
        .light_M1(light_M1),
        .light_MT(light_MT),
        .light_M2(light_M2),
        .light_S(light_S)
    );
 
    // Clock generation
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
 
    // Initialization task
    task initialize;
    begin
        {clk, rst} = 1'b0;
    end
    endtask
 
    // Reset task
    task reset;
    begin
        @(negedge clk);
        rst = 1;
        @(negedge clk);
        rst = 0;
    end
    endtask
 
    // Main simulation
    initial begin
        initialize; 
        reset;
        #3000 $finish;
    end
 
    // Monitor prints output whenever it changes
    initial
        $monitor("time=%0t | clk=%b rst=%b | light_M1=%b light_MT=%b light_M2=%b light_S=%b",
                 $time, clk, rst, light_M1, light_MT, light_M2, light_S);

endmodule

