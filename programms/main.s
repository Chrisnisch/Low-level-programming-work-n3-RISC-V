.text
main:
.globl main
    addi sp, sp, -16    # выделение памяти в стеке
    sw ra, 12(sp)       # сохранение ra
     
    la a0, array        # }
    lw a1, array_len    # } median(array, array_length)
    call median         # }
    
    # результат выполнения программы лежит в регистрах a0 и a1
    la a2, int_res      # берём адрес для целой части результата
    sw a0, 0(a2)        # записываем целую часть в память
    
    la a2, fract_res    # берём адрес для дробной части результата
    sw a1, 0(a2)        # записываем дробную часть в память
    
    lw ra, 12(sp)       # восстановление ra
    addi sp, sp, 16     # освобождение памяти в стеке
 
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