module fa_tb();
   reg ck, rst;
   reg [2:0] i;
   wire s, co, a, b, ci;

   assign{a, b, ci} = i;
   
   always begin
      #50; ck = ~ck;
   end

   initial begin
      ck <= 0; rst <= 1; i <= 3'b000;
      #100; rst <= 0;
      #100; i <= 3'b001;
      #100; i <= 3'b010;
      #100; i <= 3'b011;
      #100; i <= 3'b100;
      #100; i <= 3'b101;
      #100; i <= 3'b110;
      #100; i <= 3'b111;
   end
endmodule
