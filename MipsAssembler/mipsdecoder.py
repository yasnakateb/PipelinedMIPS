# Converts MIPS instructions into binary and hex
from instructiondecode import instr_decode # converts the instruction part of a line of MIPS code
from registerdecode import reg_decode # converts the register and immediate parts of the MIPS code
import sys


# the main conversion function
def convert(code):
    code = code.replace("(", " ")
    code = code.replace(")", "")
    code = code.replace(",", " ")
    code = code.replace("  ", " ")
    args = code.split(" ")
    instruction = args[0]
    
    if instruction == "exit":
        sys.exit(0)
        
    codes = instr_decode(instruction)
    func_type = codes[0]   
    reg_values = reg_decode(func_type, instruction, args[1:]) #get the numeric values of the registers
    
    #the following if statement below prints an error if needed
    if reg_values == None:
        print("Not a valid MIPS statement")
        return
    f=open("rams_init_file.hex", "a+")
    #execution for r-type functions
    if func_type == "r":            
        opcode = '{0:03b}'.format(codes[1])
        rs = '{0:03b}'.format(reg_values[0])
        rt = '{0:03b}'.format(reg_values[1])
        rd = '{0:03b}'.format(reg_values[2])
        funct = '{0:04b}'.format(codes[2])
        binary = opcode+rs+rt+rd+funct
        f.write("%s" %binary[:8]+ '\n')
        f.write("%s" %binary[8:]+ '\n')
        
    #execution for i-type functions    
    elif func_type == "i":
        opcode = '{0:03b}'.format(codes[1])
        rs = '{0:03b}'.format(reg_values[0])
        rt = '{0:03b}'.format(reg_values[1])
        imm = '{0:07b}'.format(reg_values[2])
        binary = opcode+rs+rt+imm
        f.write("%s" %binary[:8]+ '\n')
        f.write("%s" %binary[8:]+ '\n')
        
    #execution for j-type functions    
    elif func_type == "j":
        opcode = '{0:03b}'.format(codes[1])
        imm = '{0:013b}'.format(reg_values[0])
        binary = opcode+imm
        f.write("%s" %binary[:8]+ '\n')
        f.write("%s" %binary[8:]+ '\n')
          
    else:
        print("Not a valid MIPS statement")
        return
    
    f.close();   
    return