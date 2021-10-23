#include <stdio.h>

#include "Vthe_top_module.h"
#include "verilated_vcd_c.h"

int main(int argc, char** argv, char** env) {
  Verilated::commandArgs(argc, argv);
  Vthe_top_module* dut = new Vthe_top_module;

  Verilated::traceEverOn(true);
  VerilatedVcdC* trace = new VerilatedVcdC;
  dut->trace(trace, 99);
  trace->open("waves.vcd");

  int timestamp = 0;

  printf("time\tclk\trst\td\tnload\tq\n");

  dut->clk = 1;
  dut->rst = 1;
  dut->en_counter = 0;
  dut->en_lfsr = 0;

  dut->eval();
  printf("%d\t%d\t%d\t%d\t%d\t%d\t%d\n", timestamp, dut->clk, dut->rst, dut->en_counter, dut->en_lfsr, dut->counter, dut->lfsr);
  trace->dump(timestamp++);
  
  dut->clk = 0;

  dut->eval();
  printf("%d\t%d\t%d\t%d\t%d\t%d\t%d\n", timestamp, dut->clk, dut->rst, dut->en_counter, dut->en_lfsr, dut->counter, dut->lfsr);
  trace->dump(timestamp++);
    
  dut->clk = 1;

  dut->eval();
  printf("%d\t%d\t%d\t%d\t%d\t%d\t%d\n", timestamp, dut->clk, dut->rst, dut->en_counter, dut->en_lfsr, dut->counter, dut->lfsr);
  trace->dump(timestamp++);

  dut->rst = 0;
  
  for(int i = 0; i < 50; i++) {
    dut->en_counter = (rand() & 3) != 0? 1 : 0;
    dut->en_lfsr = (rand() & 3) != 0? 1 : 0;

    dut->clk = 0;

    dut->eval();
    printf("%d\t%d\t%d\t%d\t%d\t%d\t%d\n", timestamp, dut->clk, dut->rst, dut->en_counter, dut->en_lfsr, dut->counter, dut->lfsr);
    trace->dump(timestamp++);
    
    dut->clk = 1;
    
    dut->eval();
    printf("%d\t%d\t%d\t%d\t%d\t%d\t%d\n", timestamp, dut->clk, dut->rst, dut->en_counter, dut->en_lfsr, dut->counter, dut->lfsr);
    trace->dump(timestamp++);
  }

  dut->final();
  trace->close();
  delete dut;
  
  return 0;
}
