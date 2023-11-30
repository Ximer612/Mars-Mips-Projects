.data 666

#mars parte da 400.000
.text 0x400000

j start

.text 0x500000

start:

lui $a0, 0x8001
ori $a0, $a0, 0x0000
lw  $t7, 0($a0)

read:
lui $a0, 0x1001
lw $t0, 0($a0)
lw $t0, 4($a0)
lw $t0, 8($a0)
lw $t0, 12($a0)

lw $t0, 16($a0)
lw $t0, 20($a0)
lw $t0, 24($a0)
lw $t0, 28($a0)

j read
#nop with delayed branches

addiu $t0, $zero, 1
addiu $t1, $zero, 2
add $t2, $t0, $t1 #hazard in theory because of ALU

lui $t4, 0x1234
addiu $t4, $t4, 0x5678

addiu $t5, $zero, 3
for:
	addiu $t5, $zero, -1	
	bne $t5, $zero, for
	
end:

loop:
	addiu $t4, $t4, 1
	j loop

.ktext 0x80000180
	mfc0 $s0, $14
	addiu $s0, $s0, 4
	mtc0 $s0, $14
	eret
	
# .data
