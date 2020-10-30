//Know about decoding bits of Base Integer Intructions
//decoding bits = {funct7[5],funct3,opcode}
for reference check pg no = 116 of below link: (https://riscv.org//wp-content/uploads/2017/05/riscv-spec-v2.2.pdf)
//Arithmetic Instructions
ADD = 11'b0_000_0110011;
ADDI = 11'bx_000_0010011;
OR = 11'b0_110_0110011;
ORI = 11'bx_110_0010011;
XOR = 11'b0_100_0110011;
XORI = 11'bx_100_0010011;
AND = 11'b0_111_0110011;
ANDI = 11'bx_111_0110011;
SUB = 11'b1_000_0110011;
SLT = 11'b0_010_0110011;
SLTI = 11'bx_010_0010011;
SLTU = 11'b0_011_0110011;
SLTIU = 11'bx_011_0010011;
SLLI =  11'b0_001_0010011;
SRLI = 11'b0_101_0010011;
SRAI = 11'b1_101_0010011;
SLL = 11'b0_001_0110011;
SRL =  11'b0_101_0110011;
SRA =  11'b1_101_0110011;

//Load Instruction
 LOAD = 11'bx_xxx_0000011;

//Store Instruction
SB = 11'bx_000_0100011;
SH = 11'bx_001_0100011;
SW = 11'bx_010_0100011;

//Jump Instructions
LUI = 11'bx_xxx_0110111;
AUIPC = 11'bx_xxx_0010111;
JAL = 11'bx_xxx_1101111;
JALR = 11'bx_000_1100111;

//Branch Instructions
BEQ = 11'bx_000_1100011;
BNE = 11'bx_001_1100011;
BLT = 11'bx_100_1100011;
BGE = 11'bx_101_1100011;
BLTU = 11'bx_110_1100011;
BGEU = 11'bx_111_1100011;


