#unit width in pixels = 8
#unit heigth in pixels = 8
#display width = 512
#display height = 256

start:
#gray
lui $t0, 0x0040
ori $t0, $t0, 0x4040
#orange
lui $t1, 0x00FF
ori $t1, $t1, 0x7561
#white
lui $t2, 0x00FF
ori $t2, $t2, 0xFFFF
#cyan
lui $t3, 0x00AF
ori $t3, $t3, 0xEEEE

#0x10010000
lui $a0, 0x1001
ori $a0, $a0, 0x0000

addiu $s0, $zero, 2048

draw_background_loop:		
	sw $t3, 0($a0)
	addiu $a0, $a0, 4
	addiu $s0, $s0, -1		
bne $s0, $zero, draw_background_loop

lui $a0, 0x1001
ori $a0, $a0, 0x1090

addiu $s0, $zero, 8

better_draw_loop:
	
	#8
	addiu $s1, $zero, 8
	inside_better_draw_loop:
		addiu $a0, $a0, 4
		sw $t0, 0($a0)
		addiu $s1, $s1, -1
	bne $s1, $zero, inside_better_draw_loop
	
	addiu $a0, $a0, 256
	addiu $a0, $a0, -32 # 4 * 8 (8-1)
	
	addiu $s0, $s0, -1
	
bne $s0, $zero, better_draw_loop

lui $a0, 0x1001
ori $a0, $a0, 0x1194
	
	#second row
	sw $t1, 4($a0)
	sw $t1, 8($a0)
	sw $t1, 12($a0)
	sw $t1, 16($a0)
	sw $t1, 20($a0)
	sw $t1, 24($a0)
	
	addiu $a0, $a0, 256
	
	#third row
	sw $t1, 4($a0)
	sw $t2, 8($a0)
	sw $t1, 12($a0)
	sw $t1, 16($a0)
	sw $t2, 20($a0)
	sw $t1, 24($a0)
	
	addiu $a0, $a0, 256
	
	#fourth row
	sw $t1, 4($a0)
	sw $t1, 8($a0)
	sw $t1, 12($a0)
	sw $t1, 16($a0)
	sw $t1, 20($a0)
	sw $t1, 24($a0)
	
	addiu $a0, $a0, 256
	
	#fifth row
	sw $t1, 4($a0)
	sw $t2, 8($a0)
	sw $t1, 12($a0)
	sw $t1, 16($a0)
	sw $t2, 20($a0)
	sw $t1, 24($a0)
	
	addiu $a0, $a0, 256
	
	#sixth row
	sw $t1, 4($a0)
	sw $t2, 8($a0)
	sw $t2, 12($a0)
	sw $t2, 16($a0)
	sw $t2, 20($a0)
	sw $t1, 24($a0)
	
	addiu $a0, $a0, 256
	
	#second row
	sw $t1, 4($a0)
	sw $t1, 8($a0)
	sw $t1, 12($a0)
	sw $t1, 16($a0)
	sw $t1, 20($a0)
	sw $t1, 24($a0)
	
	addiu $a0, $a0, 256	
	
	lui $a0, 0x1001
	ori $a0, $a0, 0x1090
