.macro CHECK_AND_INCREMENT (%offset, %label)
	subu $t2, $s0, $sp
	addiu $t2, $t2, %offset
	li $t3, 4096
	divu $t2, $t3
	mfhi $t2
	addu $t2, $t2, $sp
	lw $t1, 0($t2)
	andi $t0, $t1, 0x08000000
	beqz $t0, %label
	addi $s1, $s1, 1
%label:
.end_macro

.data
.text

# Data Shape
#	EEEEA
#	A - Alive or Dead
#	E - Number of Neighbors
main:
	jal frame_init
	
#	jr frame_fill
	
	loop:
	jal update_neighbors
	jal update_cells
	jal update_screen
	j loop
	
frame_init:		# Sets value to all the things as 0
	subi $sp, $sp, 4220
	move $s0, $sp
	li $t7, 0
	li $t1, 0x00000000
	
	fi_loop:
	sw $t1, 0($s0)
	
	addi $s0, $s0, 4
	addi $t7, $t7, 1
	
	bne $t7, 1023, fi_loop
	
	li $t1, 0x08000000
	
	# PASTE CANVAS CODE HERE #####################################################

	sw $t1, 3604($sp)
	sw $t1, 1816($sp)

	##############################################################################

	jr $ra

update_neighbors:
	move $s0, $sp
	li $t7, 0
	
	un_loop:
	li $s1, 0	# Initialize neighbor count to 0
	
#	# See if NorthWest wall is gucci
#	subiu $t0, $s0, 36
#	bltu $t0, $gp, un_cN	# Skip check if out or range

	CHECK_AND_INCREMENT (-132, un_cN)
	CHECK_AND_INCREMENT (-128, un_cNE)
	CHECK_AND_INCREMENT (-124, un_cW)
	CHECK_AND_INCREMENT (-4, un_cE)
	CHECK_AND_INCREMENT (4, un_cSW)
	CHECK_AND_INCREMENT (124, un_cS)
	CHECK_AND_INCREMENT (128, un_cSE)
	CHECK_AND_INCREMENT (132, un_cNW)
	
	sll $s1, $s1, 28
	lw $s2, 0($s0)
	andi $s2, 0x0fffffff
	or $s1, $s1, $s2
	sw $s1, 0($s0)
	
	addi $s0, $s0, 4
	addi $t7, $t7, 1
	
	bne $t7, 1023, un_loop
	
	jr $ra

update_cells:
	move $s0, $sp
	li $t7, 0
	
	uc_loop:
	# All the logic stuff
	lw $s2, 0($s0)
	srl $s1, $s2, 28
	blt $s1, 2, uc_kill
	beq $s1, 2, uc_logicFinish
	beq $s1, 3, uc_alive
	bgt $s1, 3, uc_kill
	
	uc_kill:
	andi $s2, 0xf7ffffff
	j uc_logicFinish
	
	uc_alive:
	ori $s2, 0x08000000
	
	uc_logicFinish:	
	sw $s2, 0($s0)
	
	addi $s0, $s0, 4
	addi $t7, $t7, 1
	
	bne $t7, 1023, uc_loop
	
	jr $ra
	
update_screen:
	move $s0, $sp
	li $s1, 0
	li $t7, 0
	
	li $s3, 0xffffffff
	
	us_loop:
	lw $s2, 0($s0)
	andi $t0, $s2, 0x08000000
	beqz $t0, us_black
	
	sw $s3, 0($s1)
	j us_white
	
	us_black:
	sw $zero, 0($s1)
	
	us_white:
	
	addi $s0, $s0, 4
	addi $s1, $s1, 4
	addi $t7, $t7, 1
	
	bne $t7, 1023, us_loop
	
	jr $ra
