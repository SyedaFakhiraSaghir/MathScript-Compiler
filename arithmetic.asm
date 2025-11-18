; MathSeq Compiler Output
; Source: test\examples\arithmetic.mathseq
; =======================

calculate:
a = param_a
b = param_b
t0 = a + b
sum = t0
t1 = a * b
product = t1
t2 = a - b
difference = t2
t3 = sum > product
ifFalse t3 goto L0
return sum
goto L1
L0:
return product
L1:
main:
x = 15
y = 3
param 15
param 3
t4 = call calculate, x, y
result = t4
param x = 
param 15
t5 = call print, x = , x
param y = 
param 3
t6 = call print, y = , y
param Result: 
param result
t7 = call print, Result: , result
return 0

; Program Output
; --------------
; x =  15
; y =  3
; Result:  45
; Exit Code: 0
