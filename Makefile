#TOOL INPUT
SRC = hdl/Pipleline/*.v hdl/mips.v
TESTBENCH = test/mips_test.v
TBOUTPUT = mips_test.vcd
ASSEMBLER = MipsAssembler/main.py

#TOOLS
PYTHON = python3
COMPILER = iverilog
SIMULATOR = vvp
VIEWER = Scansion

#TOOL OPTIONS
COFLAGS = -v -o
SFLAGS = -v

#TOOL OUTPUT
COUTPUT = compiler.out         

###############################################################################

inst:
	$(PYTHON) $(ASSEMBLER)
	
simulate: $(COUTPUT)

	$(SIMULATOR) $(SFLAGS) $(COUTPUT) 

display: 
	open -a $(VIEWER) $(TBOUTPUT) 

$(COUTPUT): $(TESTBENCH) $(SRC)
	$(COMPILER) $(COFLAGS) $(COUTPUT) $(TESTBENCH) $(SRC) 

clean:
	rm *.vcd
	rm *.out
