# converts the instruction part of a line of MIPS code 
# param 'instr' is the instruction given
# returns an arrya in the form [function type, opcode, function number]
def instr_decode(instr):
    if instr == "add":
        func_type = "r"
        opcode = 0
        funct = 0x0

    elif instr == "addi":
        func_type = "i"
        opcode = 0x7
        funct = None
        
    
    elif instr == "and":
        func_type = "r"
        opcode = 0
        funct = 0x2
        
    elif instr == "beq":
        func_type = "i"
        opcode = 0x6
        funct = None
        
    elif instr == "j":
        func_type = "j"
        opcode = 0x2
        funct = None
           
    elif instr == "lw":
        func_type = "i"
        opcode = 0x4
        funct = None
    
        
    elif instr == "or":
        func_type = "r"
        opcode = 0
        funct = 0x3
    
    
    elif instr == "slt":
        func_type = "r"
        opcode = 0
        funct = 0x4
    
    
    elif instr == "sw":
        func_type = "i"
        opcode = 0x5
        funct = None
        
    elif instr == "sub":
        func_type = "r"
        opcode = 0
        funct = 0x1

    elif instr =="slti":
        func_type ="i"
        opcode = 0x1
        funct = None
        
        
    else:
        func_type = None
        opcode = None
        funct = None
    
    return [func_type, opcode, funct]