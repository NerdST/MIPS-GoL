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


	sw $t1, 0($sp)
	sw $t1, 3456($sp)
	sw $t1, 4($sp)
	sw $t1, 3460($sp)
	sw $t1, 3588($sp)
	sw $t1, 8($sp)
	sw $t1, 3592($sp)
	sw $t1, 12($sp)
	sw $t1, 1804($sp)
	sw $t1, 3596($sp)
	sw $t1, 16($sp)
	sw $t1, 1808($sp)
	sw $t1, 3600($sp)
	sw $t1, 1812($sp)
	sw $t1, 3604($sp)
	sw $t1, 1816($sp)
	sw $t1, 3608($sp)
	sw $t1, 1820($sp)
	sw $t1, 3612($sp)
	sw $t1, 1824($sp)
	sw $t1, 1952($sp)
	sw $t1, 2080($sp)
	sw $t1, 3488($sp)
	sw $t1, 3616($sp)
	sw $t1, 1828($sp)
	sw $t1, 2084($sp)
	sw $t1, 2212($sp)
	sw $t1, 3364($sp)
	sw $t1, 3492($sp)
	sw $t1, 1704($sp)
	sw $t1, 1832($sp)
	sw $t1, 2344($sp)
	sw $t1, 2984($sp)
	sw $t1, 3112($sp)
	sw $t1, 3240($sp)
	sw $t1, 3368($sp)
	sw $t1, 3496($sp)
	sw $t1, 44($sp)
	sw $t1, 1708($sp)
	sw $t1, 2348($sp)
	sw $t1, 2604($sp)
	sw $t1, 2732($sp)
	sw $t1, 2860($sp)
	sw $t1, 2988($sp)
	sw $t1, 3500($sp)
	sw $t1, 48($sp)
	sw $t1, 1584($sp)
	sw $t1, 2352($sp)
	sw $t1, 2480($sp)
	sw $t1, 2608($sp)
	sw $t1, 3504($sp)
	sw $t1, 3632($sp)
	sw $t1, 52($sp)
	sw $t1, 1332($sp)
	sw $t1, 1460($sp)
	sw $t1, 1716($sp)
	sw $t1, 1844($sp)
	sw $t1, 1972($sp)
	sw $t1, 2100($sp)
	sw $t1, 2228($sp)
	sw $t1, 2356($sp)
	sw $t1, 2484($sp)
	sw $t1, 3636($sp)
	sw $t1, 56($sp)
	sw $t1, 184($sp)
	sw $t1, 1080($sp)
	sw $t1, 1208($sp)
	sw $t1, 1336($sp)
	sw $t1, 3640($sp)
	sw $t1, 188($sp)
	sw $t1, 828($sp)
	sw $t1, 956($sp)
	sw $t1, 1084($sp)
	sw $t1, 3644($sp)
	sw $t1, 192($sp)
	sw $t1, 960($sp)
	sw $t1, 1088($sp)
	sw $t1, 3520($sp)
	sw $t1, 3648($sp)
	sw $t1, 196($sp)
	sw $t1, 1092($sp)
	sw $t1, 1220($sp)
	sw $t1, 1732($sp)
	sw $t1, 1860($sp)
	sw $t1, 1988($sp)
	sw $t1, 2116($sp)
	sw $t1, 2244($sp)
	sw $t1, 2372($sp)
	sw $t1, 3524($sp)
	sw $t1, 200($sp)
	sw $t1, 328($sp)
	sw $t1, 1224($sp)
	sw $t1, 3528($sp)
	sw $t1, 332($sp)
	sw $t1, 1228($sp)
	sw $t1, 1356($sp)
	sw $t1, 3404($sp)
	sw $t1, 3532($sp)
	sw $t1, 336($sp)
	sw $t1, 464($sp)
	sw $t1, 1360($sp)
	sw $t1, 1488($sp)
	sw $t1, 1616($sp)
	sw $t1, 1744($sp)
	sw $t1, 1872($sp)
	sw $t1, 2000($sp)
	sw $t1, 2128($sp)
	sw $t1, 2256($sp)
	sw $t1, 2384($sp)
	sw $t1, 2512($sp)
	sw $t1, 3280($sp)
	sw $t1, 3408($sp)
	sw $t1, 468($sp)
	sw $t1, 596($sp)
	sw $t1, 1364($sp)
	sw $t1, 2516($sp)
	sw $t1, 2644($sp)
	sw $t1, 2772($sp)
	sw $t1, 3156($sp)
	sw $t1, 3284($sp)
	sw $t1, 600($sp)
	sw $t1, 728($sp)
	sw $t1, 1368($sp)
	sw $t1, 2776($sp)
	sw $t1, 2904($sp)
	sw $t1, 3032($sp)
	sw $t1, 3160($sp)
	sw $t1, 860($sp)
	sw $t1, 988($sp)
	sw $t1, 1372($sp)
	sw $t1, 2908($sp)
	sw $t1, 3036($sp)
	sw $t1, 992($sp)
	sw $t1, 1120($sp)
	sw $t1, 1248($sp)
	sw $t1, 1376($sp)
	sw $t1, 1380($sp)


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
