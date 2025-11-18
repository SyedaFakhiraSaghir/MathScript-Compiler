; MathSeq Compiler Output
; Source: C:\Users\22K-4646\Desktop\MathScript-Compiler-main\MathScript-Compiler-main\MathScript-Compiler-main\test\examples\fibonacci_pattern.mathseq
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
main:
count = 10
param 10
t6 = call fibonacci, 10
fib_sequence = t6
param Fibonacci sequence: 
param fib_sequence
t7 = call print, Fibonacci sequence: , fib_sequence
param fib_sequence
t8 = call length, fib_sequence
t9 = t8 > 5
param fib_sequence
param 0
t10 = call get, fib_sequence, 0
t11 = t10 == 0
t12 = t9 && t11
ifFalse t12 goto L3
param Pattern matched: Sequence starts with 0 and has more than 5 elements
t13 = call print, Pattern matched: Sequence starts with 0 and has more than 5 elements
goto L4
L3:
param Pattern not matched
t14 = call print, Pattern not matched
L4:
return 0

; Program Output
; --------------
; Fibonacci sequence:  [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
; Pattern matched: Sequence starts with 0 and has more than 5 elements
; Exit Code: 0
