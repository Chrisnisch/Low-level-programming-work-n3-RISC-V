.text
main:
.globl main
    addi sp, sp, -16    # ��������� ������ � �����
    sw ra, 12(sp)       # ���������� ra
     
    la a0, array        # }
    lw a1, array_len    # } median(array, array_length)
    call median         # }
    
    # ��������� ���������� ��������� ����� � ��������� a0 � a1
    la a2, int_res      # ���� ����� ��� ����� ����� ����������
    sw a0, 0(a2)        # ���������� ����� ����� � ������
    
    la a2, fract_res    # ���� ����� ��� ������� ����� ����������
    sw a1, 0(a2)        # ���������� ������� ����� � ������
    
    lw ra, 12(sp)       # �������������� ra
    addi sp, sp, 16     # ������������ ������ � �����
 
    li a0, 0  
    ret                 # jalr zero, ra, 0
    
.rodata
array:
	.word -2, 0, 10, 17, 65, 100, 203
array_len:
	.word 7

.data
int_res:
        .word 10
fract_res: 
        .word 10