.text
	.global _start
_start:
	#print contents of variable mesg:
	movl	$leng, %edx	#store variable mem addr in gen regis d
	movl	$mesg, %ecx	#store message in cpu registure
	movl	$1, %ebx	#1 is cout. i think page tables :-p
	movl	$4, %eax	#4 is sys_write in the page table?
	int	$0x80		#is this the same as no-op or nah?
	
	#get input
	movl 	$20, %edx
	movl 	$buf, %ecx
	movl 	$1, %ebx
	movl 	$3, %eax
	int 	$0x80
	
	#result container
	movl	$lng, %edx
	movl	$msg, %ecx
	movl	$1, %ebx
	movl	$4, %eax
	int	$0x80

	movl	$20, %edx
	movl	$buf, %ecx
	movl	$1, %ebx
	movl	$4, %eax
	int	$0x80
	#exit funktion
	movl 	$0, %ebx	#exit code  -0
	movl 	$1, %eax	#sys exit -^
	int 	$0x80    #call kern---^

	.data	#variable bank?
	
	mesg:
		.string "enter a letter\n#>  "
		leng = . - mesg	#. is current context?
	msg:
		.string "\n\tYou entered : "
		lng = . - msg
	buf:
		.string " "
