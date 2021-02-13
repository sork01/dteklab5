fact: # fact $a0 --> $v0 = $a0!
    addi $a0, $0, 3   # a0 = n
    addi $v1, $0, 1
    beq $a0, $0, factdone
    add $a2, $0, $a0 # a2 = n
    add $a3, $0, $a0 # a3 = n
factloop:
    addi $a3, $a3, -1 # a3 = n -1
    beq $a3, $0, factdone
    beq $0, $0, mul
factpostmul:
    # nu har vi n*(n-1) i v1
    add $a2, $0, $v1 # a2 = n(n-1)
    beq $0, $0, factloop
factdone:
    add $v0, $0, $v1
    beq $0, $0, factdone

mul: # mul a2 a3 --> v1 = a2*a3
    add $v1, $0, $0
mulbegin:
    beq $a2, $0, muldone
    add $v1, $v1, $a3
    addi $a2, $a2, -1
    beq $0, $0, mulbegin
muldone:
    # resultat i $v1
    beq $0, $0, factpostmul
