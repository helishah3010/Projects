# FP program
		.data
matrix_a:
		.word   1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12
		.word  13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24
		.word  25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36
		.word  37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48
		.word  49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60
		.word  61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72
		.word  73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84
		.word  85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96
		.word  97, 98, 99,100,101,102,103,104,105,106,107,108
		.word 109,110,111,112,113,114,115,116,117,118,119,120
		.word 121,122,123,124,125,126,127,128,129,130,131,132
		.word 133,134,135,136,137,138,139,140,141,142,143,144

matrix_b:
		.word 133,134,135,136,137,138,139,140,141,142,143,144
		.word 121,122,123,124,125,126,127,128,129,130,131,132
		.word 109,110,111,112,113,114,115,116,117,118,119,120
		.word  97, 98, 99,100,101,102,103,104,105,106,107,108
		.word  85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96
		.word  73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84
		.word  61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72
		.word  49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60
		.word  37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48
		.word  25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36
		.word  13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24
		.word   1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12

matrix_c:
		.word   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
		.word   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
		.word   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
		.word   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
		.word   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
		.word   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
		.word   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
		.word   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
		.word   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
		.word   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
		.word   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
		.word   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0

bs:		.word 4
n:		.word 12

nline:  .asciiz "\n"				#Define new line string
sp:	.asciiz " "
msga: .asciiz "Matrix A is: \n"
msgb: .asciiz "Matrix B is: \n"
msgc: .asciiz "Matrix C=A*B is: \n"

		.text
		.globl main
main:

		la	$s0, bs	
		lw	$s0, 0($s0)
		la	$s1, n
		lw	$s1, 0($s1)
		la	$s2, matrix_a
		la	$s3, matrix_b
		la	$s4, matrix_c

		la	$a0, msga
		la 	$a1, matrix_a
		jal	PRINT_MAT 
		la	$a0, msgb
		la 	$a1, matrix_b
		jal	PRINT_MAT 

# Your CODE HERE
       
       
                  addi $t0,$0,0			        #i=$t0
        checki:   bge  $t0,$s1,end              #i<12

                  addi $t1,$0,0			        #j=$t1
       checkj:    bge  $t1,$s1,inci             #j<12
                
                  addi $t2,$0,0			        #k=$t2
       checkk:    bge  $t2,$s1,incj             #k<12
       
                  add $t3,$0,$t0	            #x=$t3   
                  add $s5,$s0,$t0 	            #s5=i+bs                
       checkx:    bge  $t3,$s5,inck             #x<i+bs   
       
                  add $t4,$0,$t1	            #y=$t4  
                  add $s6,$s0,$t1 	            #s6=j+bs                
       checky:    bge  $t4,$s6,incx             #y<j+bs 

                  add $t5,$0,$t2	            #z=$t5   
                  add $s7,$s0,$t2 	            #s7=k+bs                
       checkz:    bge  $t5,$s7,incy             #z<k+bs
       
	                #implementing address=base address of matrix1+($s1*x+z)*4               
	                mul $t6,$s1,$t3
	                add $t6,$t6,$t5
	                mul  $t6,$t6,4
	                add $t6,$t6,$s2
	                lw $t6,($t6)                #$t6 holds a[x][z]
                
                
	                #implementing address=base address of matrix2+($s1*z+y)*4
	                mul $t7,$s1,$t5
	                add $t7,$t7,$t4
	                mul $t7,$t7,4
	                add $t7,$t7,$s3
	                lw $t7,($t7)		       #t7 holds b[z][y]
                
	                #implementing address=base address of matrix2+($s1*x+y)*4
	                 mul $t8,$s1,$t3
	                 add $t8,$t8,$t4
	                 mul $t8,$t8,4
	                 add $t8,$t8,$s4
	                 lw $t9,($t8)		 #t8 holds c[x][y]			
	                
	                
	                #implementing c[x][y]=c[x][y]+a[x][z]*b[z][y]
	                mul $t7,$t6,$t7                 
	                add $t9,$t9,$t7
	                sw $t9,0($t8)
                
            addi $t5,$t5,1           #z=z+1
                 b checkz
                
            incy:addi $t4,$t4,1      #y=y+1
                 b checky
                
            incx:addi $t3,$t3,1      #x+x+1
                 b checkx
                
            inck:add $t2,$t2,$s0     #k=k+bs
                 b checkk
                
            incj: add $t1,$t1,$s0    #j=j+bs
                 b checkj
                
            inci: add $t0,$t0,$s0    #i=i+bs
                 b checki
                
       end:
       
# End CODE

		la	$a0, msgc
		la 	$a1, matrix_c
		jal	PRINT_MAT 

#   Exit
		li	 $v0,10
    	syscall


PRINT_MAT:	li	$v0,4
		syscall
		addi $a2,$0,0	
PL4:	bge	$a2,$s1,PL1
		addi $a3,$0,0
PL3:	bge	$a3,$s1,PL2

		lw	$a0,0($a1)
		li	$v0,1
		syscall
		la	$a0,sp
		li	$v0,4
		syscall
		addi $a1,$a1,4
		addi $a3,$a3,1
		b 	PL3

PL2:	addi	$a2,$a2,1
		la	$a0,nline
		li	$v0,4
		syscall
		b	PL4
PL1:	jr	$ra
