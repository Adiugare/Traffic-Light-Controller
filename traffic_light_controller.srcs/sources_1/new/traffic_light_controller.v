`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2025 13:44:30
// Name: Aditya Ugare 
// Module Name: traffic_light_controller
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


module traffic_light_controller(
    input clk, rst,
    output reg [2:0] light_M1,
    output reg [2:0] light_MT,
    output reg [2:0] light_M2,
    output reg [2:0] light_S
);

reg [3:0] count;
reg [2:0] ps;         

// State parameters
parameter S0 = 0,
          S1 = 1,
          S2 = 2,
          S3 = 3,
          S4 = 4,
          S5 = 5;

// Time parameters
parameter sec7 = 7,
          sec5 = 5,
          sec3 = 3,
          sec2 = 2;

always @(posedge clk) begin
    if (rst) begin
        ps    <= S0;
        count <= 0;
    end else begin
        case (ps)

            S0 : if (count < sec7) begin
                    count <= count + 1;
                 end else begin
                    ps <= S1;
                    count <= 0;
                 end

            S1 : if (count < sec2) begin
                    count <= count + 1;
                 end else begin
                    ps <= S2;
                    count <= 0;
                 end

            S2 : if (count < sec5) begin
                    count <= count + 1;
                 end else begin
                    ps <= S3;
                    count <= 0;
                 end

            S3 : if (count < sec2) begin
                    count <= count + 1;
                 end else begin
                    ps <= S4;
                    count <= 0;
                 end

            S4 : if (count < sec3) begin
                    count <= count + 1;
                 end else begin
                    ps <= S5;
                    count <= 0;
                 end

            S5 : if (count < sec3) begin
                    count <= count + 1;
                 end else begin
                    ps <= S0;
                    count <= 0;
                 end

            default : ps <= S0;
        endcase
    end
end

always @(ps) begin
    case (ps)

        S0 : begin
                light_M1 <= 3'b001;   // Green
                light_MT <= 3'b100;   // Red
                light_M2 <= 3'b001;   // Green
                light_S  <= 3'b100;   // Red
             end

        S1 : begin
                light_M1 <= 3'b001;   
                light_MT <= 3'b100;
                light_M2 <= 3'b010;   // Yellow
                light_S  <= 3'b100;
             end

        S2 : begin
                light_M1 <= 3'b001;
                light_MT <= 3'b001;
                light_M2 <= 3'b100;
                light_S  <= 3'b100;
             end

        S3 : begin
                light_M1 <= 3'b010;   // Yellow
                light_MT <= 3'b010;
                light_M2 <= 3'b100;
                light_S  <= 3'b100;
             end

        S4 : begin
                light_M1 <= 3'b100;   // Red
                light_MT <= 3'b100;
                light_M2 <= 3'b100;
                light_S  <= 3'b001;   // Green
             end

        S5 : begin
                light_M1 <= 3'b100;
                light_MT <= 3'b100;
                light_M2 <= 3'b100;
                light_S  <= 3'b010;   // Yellow
             end

        default : begin
                light_M1 <= 3'b000;
                light_MT <= 3'b000;
                light_M2 <= 3'b000;
                light_S  <= 3'b000;
             end
    endcase
end

endmodule
