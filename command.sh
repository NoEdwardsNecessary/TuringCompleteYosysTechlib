yosys example.ys

verilator -Wall --cc synth_output.v turing_complete_tech.v --top-module the_top_module --exe example_tb.cpp --trace

make -C obj_dir/ -f Vthe_top_module.mk Vthe_top_module

obj_dir/Vthe_top_module
