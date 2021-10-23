module lfsr (
  input        clk,
  input        rst,
  input        en,
  output logic out
);
  logic [7:0] r_lfsr;
  logic [7:0] n_lfsr;

  assign n_lfsr = rst? '0 : ({r_lfsr[6:0], ~(r_lfsr[7] ^ r_lfsr[6])});

   always @(posedge clk)
     r_lfsr <= en? n_lfsr : r_lfsr;

  assign out = r_lfsr[0];
endmodule

module the_top_module (
  input 	     clk,
  input 	     rst,
  input 	     en_counter,
  input 	     en_lfsr,
  output logic [1:0] counter,
  output logic 	     lfsr
);

  logic [3:0] r_counter = '0;
  logic [3:0] n_counter;

  lfsr a_submodule (
    .clk(clk),
    .rst(rst),
    .en(en_lfsr),
    .out(lfsr)
  );

  assign n_counter = rst? '0 : (r_counter + 4'd1);
  
  always @(posedge clk)
    r_counter <= en_counter? n_counter : r_counter;

   assign counter = r_counter;
endmodule
