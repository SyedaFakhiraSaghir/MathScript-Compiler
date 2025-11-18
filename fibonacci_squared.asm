; MathSeq Compiler Output
; Source: C:\Users\22K-4646\Desktop\MathScript-Compiler-main\MathScript-Compiler-main\MathScript-Compiler-main\test\examples\fibonacci_squared.mathseq
; =======================

fibonacci:
n = param_n
a = 0
b = 1
t0 = []
t0 = 0 STORE 0
t0 = 1 STORE 1
result = t0
goto L1
L0:
t1 = 1
next = t1
t2 = []
t2 = next STORE 0
t3 = result + t2
result = t3
a = 1
b = next
L1:
param result
t4 = call length, result
t5 = t4 < n
if t5 goto L0
L2:
return result
square:
x = param_x
t6 = x * x
return t6
main:
count = 10
param 10
t7 = call fibonacci, 10
fib_sequence = t7
param fib_sequence
param square
t8 = call map, fib_sequence, square
squared_sequence = t8
param Fibonacci sequence: 
param fib_sequence
t9 = call print, Fibonacci sequence: , fib_sequence
param Squared sequence: 
param squared_sequence
t10 = call print, Squared sequence: , squared_sequence
return 0

; Program Output
; --------------
; Fibonacci sequence:  [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
; Squared sequence:  [0, 1, 1, 4, 9, 25, 64, 169, 441, 1156]
; Exit Code: 0
