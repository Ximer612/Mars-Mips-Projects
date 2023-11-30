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

j start

move_until_reached_pos_function:

#disable movement
sw $0, 0($t5)

#set moveHeading to the value in $a0 (0/90/180/270)
add $s0, $zero, $a0
sw $s0, 0($t1)

#current position (x or y) + offset in $a1
lw $s1, 0($a3)
nop
add $s1, $s1, $a1

#set move to true
addiu $s0, $zero, 1
sw $s0, 0($t5)

start_move_loop:
lw $s0, 0($a3) #load current pos
sub $s2, $s0, $s1 #current pos - next pos

#branch less than zero
bltz $s2, start_move_loop

#disable draw
sw $0, 0($t2)

#disable movement
sw $0, 0($t5)

#return to the main code at the addess written in $k0
jr $k0

start:

addiu $a0, $0, 90
addiu $a1, $0, 0x0040

lui $a3, 0xffff
or $a3, $0, $t3

lui $k0, 0x0040
ori $k0, $k0, 0x0080

j move_until_reached_pos_function

#move right
#enable draw
addiu $s0, $0, 1
sw $s0, 0($t2)

lui $k0, 0x0040
ori $k0, $k0, 0x0094

j move_until_reached_pos_function

#move down
#enable draw
addiu $s0, $0, 1
sw $s0, 0($t2)

addiu $a0, $0, 180

lui $k0, 0x0040
ori $k0, $k0, 0x00b0

or $a3, $0, $t4

j move_until_reached_pos_function

#move left
#enable draw
addiu $s0, $0, 1
sw $s0, 0($t2)

addiu $a0, $0, 270

lui $k0, 0x0040
ori $k0, $k0, 0x00cc

or $a3, $0, $t3

j move_until_reached_pos_function

#move up
#enable draw
addiu $s0, $0, 1
sw $s0, 0($t2)

addiu $a0, $0, 0

lui $k0, 0x0040
ori $k0, $k0, 0x00e8

or $a3, $0, $t4

j move_until_reached_pos_function

#disable draw
sw $0, 0($t2)

#disable movement
sw $0, 0($t5)
