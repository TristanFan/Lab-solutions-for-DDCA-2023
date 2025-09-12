#
# Calculate sum from A to B.
#
# Authors: 
#	X Y, Z Q 
#
# Group: ...
#

.text
main:
	#
	# Your code goes here...
	#
	addi $t0, $0, 1
	addi $t1, $0, 10
	add  $t2, $0, $0
for:    beq  $t0, $t1, done
	add  $t2, $t2, $t0
	addi $t0, $t0, 1
	j    for
done: 
	add $t2, $t2, $t1
	# Put your sum S into register $t2
end:	
	j	end	# Infinite loop at the end of the program. 
