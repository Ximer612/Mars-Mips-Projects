begin:
lui $t1, 0xffff
lui $t2, 0xffff
lui $t3, 0xffff
lui $t4, 0xffff
lui $t5, 0xffff

#moveHeading 	0xffff8010
ori $t1, $t1, 0x8010

#leaveTrack 	0xffff8020
ori $t2, $t2, 0x8020

#WhereAreWeX 	0xffff8030
ori $t3, $t3, 0x8030

#WhereAreWeY 	0xffff8040
ori $t4, $t4, 0x8040

#Move 		0xffff8050
ori $t5, $t5, 0x8050

start:

#set moveHeading to right
addiu $s0, $zero, 90
sw $s0, 0($t1)

#current position + 0x0032 
lw $s2, 0($t3)
addiu $s1, $s2, 0x0032

#set move to true
addiu $s0, $zero, 1
sw $s0, 0($t5)
start_move_loop:

lw $s0, 0($t3)
sub $s2, $s0, $s1

#branch less than zero
bltz $s2, start_move_loop

lw $s2, 0($t3)
addiu $s1, $s2, 0x0032

#enable draw
addiu $s0, $zero, 1
sw $s0, 0($t2)

first_move_loop:

lw $s0, 0($t3)
sub $s2, $s0, $s1

bltz $s2, first_move_loop

#disable draw
sw $0, 0($t2)

#enable draw
addiu $s0, $zero, 1
sw $s0, 0($t2)

#disable movement
sw $zero, 0($t5)

#rotate down
addiu $s0, $zero, 180
sw $s0, 0($t1)

lw $s2, 0($t4)
addiu $s1, $s2, 0x0032

#enable movement
addiu $s0, $zero, 1
sw $s0, 0($t5)

second_move_loop:

lw $s0, 0($t4)
sub $s2, $s0, $s1

bltz $s2, second_move_loop

#disable draw
sw $0, 0($t2)

#enable draw
addiu $s0, $zero, 1
sw $s0, 0($t2)

#disable movement
sw $zero, 0($t5)

#rotate left
addiu $s0, $zero, 270
sw $s0, 0($t1)

#enable movement
addiu $s0, $zero, 1
sw $s0, 0($t5)

lw $s2, 0($t3)
addiu $s1, $s2, 0x0032

third_move_loop:

lw $s0, 0($t3)
sub $s2, $s1, $s0

bltz $s2, third_move_loop

#disable movement
sw $0, 0($t5)

#rotate up
addiu $s0, $zero, 0
sw $s0, 0($t1)

#disable draw
sw $0, 0($t2)

#enable draw
addiu $s0, $zero, 1
sw $s0, 0($t2)

#enable movement
sw $s0, 0($t5)

lw $s2, 0($t4)
addiu $s1, $s2, 0x0010

last_move_loop:

lw $s0, 0($t3)
sub $s2, $s1, $s0

bltz $s2, last_move_loop

#disable draw
sw $0, 0($t2)

#disable movement
sw $0, 0($t5)
