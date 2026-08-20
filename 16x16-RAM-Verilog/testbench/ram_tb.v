`timescale 1ns / 1ps

module ram16x16_tb;

    reg clk;
    reg we;
    reg [3:0] addr;
    reg [15:0] din;
    wire [15:0] dout;

    integer errors;

    // Instantiate RAM
    ram uut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .din(din),
        .dout(dout)
    );

    // Clock generation: 10 ns period
    always #5 clk = ~clk;


    // -------------------------------
    // WRITE TASK
    // -------------------------------
    task write_data;
        input [3:0] address;
        input [15:0] data;

        begin
            @(negedge clk);
            we = 1;
            addr = address;
            din = data;

            @(posedge clk);
            #1;

            $display("WRITE | Address = %0d | Data = %h",
                     address, data);
        end
    endtask


    // -------------------------------
    // READ AND CHECK TASK
    // -------------------------------
    task read_check;
        input [3:0] address;
        input [15:0] expected_data;

        begin
            @(negedge clk);

            we = 0;
            addr = address;

            @(posedge clk);
            #1;

            if (dout === expected_data) begin
                $display("PASS  | Address = %0d | Expected = %h | Received = %h",
                         address, expected_data, dout);
            end
            else begin
                $display("FAIL  | Address = %0d | Expected = %h | Received = %h",
                         address, expected_data, dout);

                errors = errors + 1;
            end
        end
    endtask


    // -------------------------------
    // TEST SEQUENCE
    // -------------------------------
    initial begin

        // Initial values
        clk = 0;
        we = 0;
        addr = 0;
        din = 0;
        errors = 0;

        $display("==============================================");
        $display("      16 x 16 RAM SELF-CHECKING TEST");
        $display("==============================================");


        // Test 1: Write data to address 0
        write_data(4'd0, 16'h1234);

        // Test 2: Write data to address 1
        write_data(4'd1, 16'h5678);

        // Test 3: Write data to address 2
        write_data(4'd2, 16'hABCD);


        // Test 4: Read address 0
        read_check(4'd0, 16'h1234);

        // Test 5: Read address 1
        read_check(4'd1, 16'h5678);

        // Test 6: Read address 2
        read_check(4'd2, 16'hABCD);


        // Test 7: Overwrite address 1
        write_data(4'd1, 16'hFFFF);

        // Verify overwritten data
        read_check(4'd1, 16'hFFFF);


        // Test 8: Lowest address
        write_data(4'd0, 16'hAAAA);
        read_check(4'd0, 16'hAAAA);


        // Test 9: Highest address
        write_data(4'd15, 16'h5555);
        read_check(4'd15, 16'h5555);


        // Final result
        $display("==============================================");

        if (errors == 0)
            $display("ALL TESTS PASSED SUCCESSFULLY");
        else
            $display("TESTS FAILED: %0d", errors);

        $display("==============================================");

        $finish;

    end

endmodule
