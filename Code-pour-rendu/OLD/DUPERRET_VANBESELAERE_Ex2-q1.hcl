#Code de test Ex 2 - Q 1

        .pos 0
init:   irmovl stack,%esp
        mrmovl n,%eax
        pushl  %eax
        irmovl t,%eax
        pushl  %eax
        call   sum
        iaddl  8,%esp
        rmmovl %eax,s
        halt

sum:    pushl  %ebx
        mrmovl 8(%esp),%edx
        mrmovl 12(%esp),%ecx
        xorl   %eax,%eax
        andl   %ecx,%ecx
        je     end
loop:   mrmovl (%edx),%ebx
        addl   %ebx,%eax
        iaddl  4,%edx
        isubl  1,%ecx
        jne    loop
end:    popl   %ebx
        ret

        .align 4
n:      .long  4
s:      .long  0
t:      .long  0x000a
        .long  0x00b0
        .long  0x0c00
        .long  0xd000

        .pos 0x100
stack: