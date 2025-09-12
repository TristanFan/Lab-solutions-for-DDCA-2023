.data
left_image: .word 5,16,7,1,1,13,2,8,10
right_image: .word 4,15,8,0,2,12,3,7,11
sad_array: .space 36
image_size:  .word 9

.text


main:
        addi $sp, $sp, -16       
   	sw $ra, 12($sp)          
    	sw $s0, 8($sp)           # i
    	sw $s1, 4($sp)           # image_size
    	sw $s2, 0($sp)           # sad_value
    
    	li $s0, 0                # i = 0
    	lw $s1, image_size       # $s1 = image_size = 9
    	li $s2, 0                # sad_value = 0
	
loop:  	beq $s0, $s1, end_loop
	sll $t0, $s0, 2          #left_image[i]
	la  $t1, left_image
	add $t1, $t1, $t0
	lw  $a0, 0($t1)        
	la  $t2, right_image     #right_image[i]
	add $t2, $t2, $t0
	lw  $a1, 0($t2) 
	
	jal abs_diff
	la  $t3, sad_array
	sll $t0, $s0, 2
	add $t3, $t3, $t0
	sw  $v0, 0($t3)
	
	addi $s0, $s0, 1
	j    loop
	
end_loop:
	la   $a0, sad_array
	move $a1, $s1
	jal  recursive_sum     
	move $s2, $v0          
   	lw $s1, 4($sp)           
    	lw $s0, 8($sp)         
    	lw $ra, 12($sp)         
    	addi $sp, $sp, 16        
    	
    	li $v0, 10
    	syscall
# $a0 = pixel_left, $a1 = pixel_right
# $v0 = |pixel_left - pixel_right|
abs_diff:
	sub  $t0, $a0, $a1
	bgez $t0, positive
	sub  $t0, $zero, $t0
positive:
	move $v0, $t0
	jr $ra 
	
## ²ÎÊý£º$a0 = arr[], $a1 = size
# ·µ»Ø£º$v0 = sum of array elements
recursive_sum:
	addi $sp, $sp, -8
	sw   $ra, 4($sp)
	sw   $a1, 0($sp)
	
	beq  $a1, $zero, No_element
	addi $a1, $a1, -1
	jal  recursive_sum
	
	lw   $t0, 0($sp)
	addi $t0, $t0, -1
	sll  $t0, $t0, 2
	add  $t1, $a0, $t0
	lw   $t2, 0($t1)
	add  $v0, $v0, $t2
	lw   $ra, 4($sp)
	addi $sp, $sp, 8
	jr   $ra
	
	
	
No_element:
	li   $v0, 0
	lw   $ra, 4($sp)
	addi $sp, $sp, 8
	jr   $ra     
	
