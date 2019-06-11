; Упражнение 1.11
; f(n) = n, n < 3
; f(n) = f(n - 1) + f(n - 2) + f(n - 3), n >= 3

; рекурсивный процесс
(define (f n)
    (if (< n 3)
        n
        (+ (f (- n 1)) 
           (f (- n 2)) 
           (f (- n 3)))))

(f 3)

; (f 4)
; (+ (f 3) (f 2) (f 1))
; (+ (f 2) (f 1) (f 0) 2 1)
; (+ 2 1 0 2 1)
; 6

; итеративный процесс
; a = 0
; b = 1
; c = 2
; a <- a + b + c
; b <- a
; c <- b

(define (f_v2 n)
    (f_iter 2 1 0 n))

(define (f_iter a b c count)
    (if (= count 0)
        c
        (f_iter (+ a b c) 
                a 
                b 
                (- count 1))))
(f_v2 3)

; Упраждение 1.12
; level > 0
; n > 0
(define (paskal-triangle level n)
    (paskal-triangle-iter level n))

(define (paskal-triangle-iter level n)
    (if (or (= n 1) (= n level)) 
        1
        (+ (paskal-triangle-iter (- level 1) (- n 1))
           (paskal-triangle-iter (- level 1) n))))

(paskal-triangle 5 2)