lw	a0,40(zero)
addi	a1,zero,1
addi	a2,zero,1
beq	a0,a1,SAVE
LOOP:
addi	a1,a1,1
addi	t1,a1,0
addi	t2,a2,0
jal	ra,MUL
add	a2,zero,t0
bne	a1,a0,LOOP
SAVE:
sw	a2,44(zero)
jal	x0,DONE
MUL:
andi	t0,t0,0
LOOP_MUL:
add	t0,t0,t2
addi	t1,t1,-1
bne	t1,zero,LOOP_MUL
jalr	zero,ra,0
DONE:
add	zero,zero,zero
