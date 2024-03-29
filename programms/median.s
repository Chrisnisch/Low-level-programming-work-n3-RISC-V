.text
median:
.globl median
    # � a0 - ����� 0-�� �������� �������
    # � a1 - ����� ������� 
    
    li t0, 2             # � t0 �������� 2
    li t1, 4             # � t1 �������� 4  
    rem a2, a1, t0       # �������� ������� �� ������� ����� ������� �� 2
    bnez a2, odd         # ���� ������� 0, ����������� ��� ����� (even), ���� ��� ����������� ��� ����� odd
    even:
        div a2, a1, t0   # ����� ������ �� 2
        mul a2, a2, t1   # �������� �� 4
        add a2, a0, a2   # ���������� � ������ ������� �������� ������� ���������� ������ � ���������� ��� � x12
        lw a3, 0(a2)     # ���� �������, ����� �������� ��� ������� �� ���������� ����, � ���������� ��� � x13
        lw a4, -4(a2)    # ���� ���������� ������� � ���������� ��� � x14
        add a3, a4, a3   # ���������� ��������
        div a0, a3, t0   # ����� ����� ������ �� 2 � ��������� ��������� � x10
        li a1, 5         # x11 = 5, ������������� ������� x11 � �������� ������� ����� ���������
        beqz x0, exit    # if x0 = 0 (always true) - exit
    odd: 
        div a2, a1, t0   # ����� ������ �� 2
        mul a2, a2, t1   # �������� �� 4
        add a2, a0, a2   # ���������� � ������ ������� �������� ������� ���������� ������ � ���������� ��� � x12
        lw a0, 0(a2)     # ���� ������� ����������� �� ����� ������ � ��������� � x10
        li a1, 0         # �.�. ��������� �����, ��������� ������ ���������� � �������� ��� ������� ����� 0
        beqz x0, exit    # if x0 = 0 (always true) - exit
    exit:
        ret              # jalr zero, ra, 0