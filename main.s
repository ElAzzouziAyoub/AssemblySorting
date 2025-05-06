.data
arr: .word 5, 3, 9, 1, 7, 8, 2, 6, 4, 0, 11, 13, 12, 15, 14, 10, 17, 19, 16, 18, 25, 22, 21, 24, 20, 23, 29, 28, 26, 27, 30, 34, 35, 31, 32, 33, 38, 37, 36, 40, 39, 42, 43, 41, 44, 46, 45, 47, 48, 49, 50, 52, 51, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299, 300


size: .word 30
space : .asciiz " "
insertion_text : .asciiz "Insertion Sort : "addi s0 , s0 , 4


            outer_loop_insert : 

                addi x16 , x15 , -1

                slli x22 , x15 , 2 #Calculed 4*i
                add t1 , t0 , x22 #Calculated arr + 4*i

                lw x20 , 0(t1) #Stored arr[i] (KEY)

                addi s0 , s0 , 4



                inner_loop_insert: 

                    slli x22 , x16 , 2 #Calculed 4*j
                    add t1 , t0 , x22 #Calculated arr + 4*j

                    lw x21 , 0(t1) #Stored arr[j]

                    addi s0 , s0 , 3

                    blt x20 , x21 , RightShift_insert
                    bge x20 , x21 , exit_inner_insert

                 

                    RightShift_insert :
                        sw x21 , 4(t1)

                        addi x16 , x16 , -1

                        addi s0 , s0 , 2

                        bge x16 , x0 , inner_loop_insert

                        jal x0 , exit_inner_insert


                exit_inner_insert :
instructions : .asciiz "Instructions  : "
original_text : .asciiz "Original Array : "
jump_to_line : .asciiz "\n"
selection_text : .asciiz "Selection Sort : "
bubble_text : .asciiz "Bubble Sort : "
instruction_text : .asciiz "Instruction Count :"
quick_text: .asciiz "Quick Sort : "

.text
.globl main


main:

    li x15 , 0
    la t0 , arr
    lw x17 , size

    li a0 , 4
    la a1 , original_text
    ecall 


    #Printing the original array

    print_array : 

        li a0 , 1
        lw a1 , 0(t0)
        ecall 

        li a0 , 4
        la a1 , space
        ecall 

        addi t0 , t0 , 4
        addi x15 , x15 , 1

        blt x15 , x17 , print_array

        li a0 , 4
        la a1 , jump_to_line
        ecall 

        




    
    ###########################################################
    #                                                         #
    #         INSERTION SORT CODE                             #
    #                                                         #
    ###########################################################

     InsertionSort :

        li s0, 0    # s0 will count instructions for insertion sort


        la t0, arr       # Base address of array
        lw x17, size     # Load array size (n)
        li x15, 1        # Outer loop counter (i)
        li x16 , 0      #Inner loop counter (j)

        addi s0 , s0 , 4


            outer_loop_insert : 

                addi x16 , x15 , -1

                slli x22 , x15 , 2 #Calculed 4*i
                add t1 , t0 , x22 #Calculated arr + 4*i

                lw x20 , 0(t1) #Stored arr[i] (KEY)

                addi s0 , s0 , 4



                inner_loop_insert: 

                    slli x22 , x16 , 2 #Calculed 4*j
                    add t1 , t0 , x22 #Calculated arr + 4*j

                    lw x21 , 0(t1) #Stored arr[j]

                    addi s0 , s0 , 3

                    blt x20 , x21 , RightShift_insert
                    bge x20 , x21 , exit_inner_insert

                 

                    RightShift_insert :
                        sw x21 , 4(t1)

                        addi x16 , x16 , -1

                        addi s0 , s0 , 2

                        bge x16 , x0 , inner_loop_insert

                        jal x0 , exit_inner_insert


                exit_inner_insert :

                
                slli x22, x16, 2    # Calculated 4 * j
                add t1, t0, x22     # arr + 4 * j
                sw x20, 4(t1)       # arr[j + 1] = key

                addi x15 , x15 , 1

                addi s0 , s0 , 4

                blt x15 , x17 , outer_loop_insert

                addi s0 , s0 , 1

                jal x0 , exit_insert

    exit_insert:
        # Print the array
        li x15, 0

        li a0 , 4
        la a1 , insertion_text
        ecall 

        addi s0 , s0 , 4

    print_loop_insert:
        slli x22, x15, 2
        add t1, t0, x22
        lw x20, 0(t1)
        
        # Print x20 
        li a0, 1
        mv a1, x20
        ecall

        li a0 , 4
        la a1 , space
        ecall 
        
        addi x15, x15, 1

        addi s0 , s0 , 11


        blt x15, x17, print_loop_insert

        li a0 , 4
        la a1 , jump_to_line
        ecall 

        li a0 , 4
        la a1 , instruction_text
        ecall 

        li a0 , 1
        add a1 , s0 , x0
        ecall

        li a0 , 4
        la a1 , jump_to_line
        ecall 

        li a0 , 4
        la a1 , jump_to_line
        ecall 

    ###########################################################
    #                                                         #
    #         SELECTION SORT CODE                             #
    #                                                         #
    ###########################################################


    SelectionSort : 

    li s0 , 0


    la t0, arr       # Base address of array
    lw x17, size     # Load array size (n)
    li x15, 0        # Outer loop counter (i)

    addi s0 , s0 , 3

outer_loop_select:

    addi x16, x15, 1  # Inner loop counter (j = i+1)
    addi x14, x17, -1 # x14 = n-1 (loop bound)

    addi s0 , s0 , 2

inner_loop_select:
    # Calculate address of arr[i]
    slli x22, x15, 2
    add t1, t0, x22
    lw x20, 0(t1)    # x20 = arr[i]

    # Calculate address of arr[j]
    slli x22, x16, 2
    add t2, t0, x22
    lw x21, 0(t2)    # x21 = arr[j]

    addi s0 , s0 , 7

    # If arr[i] > arr[j], swap them (for ascending order)
    ble x20, x21, no_swap_select

    addi s0 , s0 , 2
    sw x21, 0(t1)    # Swap arr[i] and arr[j]
    sw x20, 0(t2)

no_swap_select:

    addi s0 , s0 , 2

    addi x16, x16, 1        # j++
    blt x16, x17, inner_loop_select # Repeat if j < n

    addi s0 , s0 , 3

    addi x15, x15, 1        # i++
    addi x18, x17, -1
    blt x15, x18, outer_loop_select # Repeat if i < n-1

exit:
    # Print the array
    li x15, 0

    li a0 , 4
    la a1 , selection_text
    ecall 

print_loop_select:
    slli x22, x15, 2
    add t1, t0, x22
    lw x20, 0(t1)
    
    # Print x20 (assuming syscall)
    li a0, 1
    mv a1, x20
    ecall

    li a0 , 4
    la a1 , space
    ecall 
    
    addi x15, x15, 1
    blt x15, x17, print_loop_select

    li a0 , 4
    la a1 , jump_to_line
    ecall 

    li a0 , 4
    la a1 , instruction_text
    ecall 

    li a0 , 1
    add a1 , s0 , x0
    ecall

    li a0 , 4
    la a1 , jump_to_line
    ecall 

    li a0 , 4
    la a1 , jump_to_line
    ecall 



    ###########################################################
    #                                                         #
    #         BUBBLE SORT CODE                                #
    #                                                         #
    ###########################################################



    

#BUBBLE SORT CODE

bubbleSort : 

    li s0 , 0

    la t0, arr       # Base address of array
    lw x17, size     # Load array size (n)
    li x15, 0        # Outer loop counter (i)
    li x16 , 0      #Inner loop counter (j)

    addi s0 , s0 , 4


    outer_loop_bubble:

        inner_loop_bubble :

            #We reset t1
            add t1 , t0 , x0

            #Calculating adress of Arr[j]
            slli x22 , x16 , 2 
            add t1 , t1 , x22 

            lw x20 , 0(t1) #Storing arr[j] and arr[j+1]
            lw x21 , 4(t1)

            addi s0 , s0 , 6

            blt x21 , x20 , SWAP_bubble #arr[j+1] < arr[j] we swap
            bge x21 , x20 , NOSWAP_bubble #we dont swap 

            SWAP_bubble :

                sw x21 , 0(t1)
                sw x20 , 4(t1)

                addi s0 , s0 , 2

            NOSWAP_bubble : 

                #We increment j by 1
                addi x16 ,x16 , 1

                sub x23 , x17 , x15
                addi x23 , x23 , -1

                addi s0 , s0 , 4

                blt x16 , x23 , inner_loop_bubble #  j not out of bounds -> repeat

                li x16 , 0 #we reset j to 0
                addi x15 , x15 , 1 #and increment i by 1

                addi s0 , s0 , 3

                blt x15 , x17 , outer_loop_bubble # i not out of bounds -> repeat

                #i is out of bounds -> we exit 

                addi s0 , s0 , 1

                jal x0 , exit_bubble
    
    exit_bubble:
        # Print the array
        li x15, 0

        li a0 , 4
        la a1 , bubble_text
        ecall 


    print_loop_bubble:
        slli x22, x15, 2
        add t1, t0, x22
        lw x20, 0(t1)
        
        # Print x20 (assuming syscall)
        li a0, 1
        mv a1, x20
        ecall

        li a0 , 4
        la a1 , space
        ecall 
        
        addi x15, x15, 1
        blt x15, x17, print_loop_bubble

        li a0 , 4
        la a1 , jump_to_line
        ecall 

        li a0 , 4
        la a1 , instruction_text
        ecall 

        li a0 , 1
        add a1 , s0 , x0
        ecall

        li a0 , 4
        la a1 , jump_to_line
        ecall 

        li a0 , 4
        la a1 , jump_to_line
        ecall 



    ###########################################################
    #                                                         #
    #         QUICK  SORT CODE                                #
    #                                                         #
    ###########################################################



    li s0, 0               # Initialize instruction counter
    
    la t0, arr             # Load array base address
    lw x18, size           
    
    # PRINTING THE ORIGINAL Array
    li a0 , 4
    la a1 , original_text
    ecall

    li x15 , 0 

    add t1 , t0 , x0

    print_quick_array : 
        li a0 , 1
        lw a1 , 0(t1)
        ecall 

        li a0 , 4
        la a1 , space
        ecall 

        addi t1 , t1 , 4
        addi x15 , x15 , 1

        blt x15 , x18 , print_quick_array

    li a0 , 4
    la a1 , jump_to_line
    ecall 

    li x15 , 0
    li a1, 0               # low = 0
    addi a2, x18, -1       # high = size - 1

    la t1 , arr
    la t2 , arr

    jal ra , QuickSort

QuickSort:
    # Base case: if (low >= high), return
    bge a1, a2, end_quicksort

    # Save registers to stack
    addi sp, sp, -12
    sw ra, 8(sp)
    sw a1, 4(sp)   # Save low
    sw a2, 0(sp)   # Save high

    addi s0 , s0 , 4

    # Call Partition
    jal ra, Partition  # a0 = partition index

    # Sort left partition (low..p-1)
    lw a1, 4(sp)    # Original low
    mv a2, a0
    addi a2, a2, -1 # high = p - 1

    addi s0 , s0 , 3

    jal ra, QuickSort

    # Sort right partition (p+1..high)
    mv a1, a0
    addi a1, a1, 1  # low = p + 1
    lw a2, 0(sp)    # Original high

    addi s0 , s0 , 4

    jal ra, QuickSort

    # Restore registers
    lw ra, 8(sp)
    lw a1, 4(sp)
    lw a2, 0(sp)
    addi sp, sp, 12

    addi s0 , s0 , 4

end_quicksort:
    li a0 , 4
    la a1 , quick_text
    ecall

    li x15 , 0 
    add t1 , t0 , x0

    print_sorted_array : 
        li a0 , 1
        lw a1 , 0(t1)
        ecall 

        li a0 , 4
        la a1 , space
        ecall 

        addi t1 , t1 , 4
        addi x15 , x15 , 1

        blt x15 , x18 , print_sorted_array

        li a0 , 4
        la a1 , jump_to_line
        ecall 


        la a1 , instruction_text
        ecall 

        li a0 , 1
        addi a1 , s0 , 0
        ecall

        li a0 , 4
        la a1 , jump_to_line
        ecall

        li a0 , 10
        ecall 

Partition:
    slli x23 , a2 , 2 
    add x23 , x23 , t0  # x23 holds arr + h 

    lw x15 , 0(x23)  # int x = arr[h]
    addi x16 , a1 , -1 # int i = l - 1

    add x19 , a1 , x0  # int j = l

    addi s0 , s0 , 5
partition_loop :
    slli t1 , x19 , 2
    add t1 , t0 , t1  # t1 holds arr + j  

    lw x20 , 0(t1) # x20 = arr[j]

    addi s0 , s0 , 3

    bge x15 , x20 , SWAP # arr[j] <= x
    blt x15 , x20 , NO_SWAP # arr[j] > x  

    SWAP : 
        addi x16 , x16 , 1

        # Calculating address of arr[i]
        slli x22 , x16 , 2
        add t2 , t0 , x22

        lw x23 , 0(t1)
        lw x24 , 0(t2)

        sw x23 , 0(t2) # arr[i] = arr[j]
        sw x24 , 0(t1) # arr[j] = arr[i]

        addi s0 , s0 , 7

    NO_SWAP : 
        addi x19 , x19 , 1

        addi s0 , s0 , 1

        bge x19 , a2, exit_partition_loop
        jal x0 , partition_loop

    exit_partition_loop :
        # Swapping i+1 and h
        addi x20 , x16 , 1 # i = i + 1
        slli x20 , x20 , 2 # i = 4 * i

        add t1 , t0 , x20 # address of arr + (i+1)

        slli x21 , a2 , 2 # x21 = 4 * h
        add t2 , t0 , x21 # Address of arr + h 

        lw x23 , 0(t1)
        lw x24 , 0(t2)

        sw x23 , 0(t2)
        sw x24 , 0(t1)

        addi a0, x16, 1     # Return i+1 in a0 (partition index)
        ret





    




        

