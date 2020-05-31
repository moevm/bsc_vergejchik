module test;

	reg clk;
	reg d;
	wire q;
	reg unknown;
	
	localparam period = 10;

	FLOP flop_inst(clk, d, q);

	`define assert(a, b, signal, expected) \
        if (signal !== expected) begin \
            $display("ASSERTION FAILED"); \
            $display("For clk=%0b and d=%0b the result should be %0b", a, b, expected);\
            $finish; \
        end

	initial

		begin
			
			#period;
			if(q !== unknown)
				begin
			    	$display("ASSERTION FAILED");
            		$display("For clk=x and d=x the result should be x");
            		$finish;
            	end
       		
			d = 1;
			clk = 1;
			#period;
			if(q !== 1)
				begin
			    	$display("ASSERTION FAILED");
            		$display("If clk was switched from 0 to 1 and d=1 the result should be 1");
            		$finish;
            	end

			clk = 0;
			d = 0;
			#period;
			if(q !== 1)
				begin
			    	$display("ASSERTION FAILED");
            		$display("If clk was switched from 1 to 0 and d was switched from 1 to 0 the result should be 1");
            		$finish;
            	end

			clk = 1;
			d = 0;
			#period;
			if(q !== 0)
				begin
			    	$display("ASSERTION FAILED");
            		$display("If clk was switched from 0 to 1 and d=0 the result should be 0");
            		$finish;
            	end

			d = 1;
			#period;
			if(q !== 0)
				begin
			    	$display("ASSERTION FAILED");
            		$display("If clk wasn't switched and d was switched from 0 to 1 the result should be 0");
            		$finish;
            	end

            $display("SUCCESS");

		end

endmodule
