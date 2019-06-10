(define (square x)
    (* x x))

(define (abs x)
    (if (< x 0) 
        (- x) 
        x))

(define (average x y)
    (/ (+ x y) 2))

(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
    (average guess (/ x guess)))

(define (sqrt-iter guess x)
    (if (good-enough? guess x) 
        guess 
        (sqrt-iter (improve guess x) 
                   x)))

(define (sqrt x)
    (sqrt-iter 1.0 x))

(sqrt 9)
(sqrt (+ 100 37))
(sqrt (+ (sqrt 2) (sqrt 3)))
(square (sqrt 1000))


; Упражнение 1.6
; Неправильно ответил :(
; 1 версия (ошибочная) в then-clause будет попадать всегда первоначальное значение приближения
; Правильная версия (из ответов) - из-за аппликативного порядка вычисления интерпретатор будет пытаться
; вычислить все аргументы процедуры new-if. При вычислении then-clause уйдет в рекурсию

; Упражнение 1.7 - улучшенный алгоритм проверки завершения
(define (good-enough?-v2 current-guess previous-guess)
    (< (abs (/ (- current-guess previous-guess) previous-guess)) 0.001))

(define (sqrt-iter-v2 current-guess previous-guess x)
    (if (good-enough?-v2 current-guess previous-guess) 
        current-guess
        (sqrt-iter-v2 (improve current-guess x) 
                      current-guess
                      x)))
                     
(define (sqrt-v2 x)
    (sqrt-iter-v2 1.0 0 x))

(sqrt 0.0001)
(sqrt-v2 0.0001)

; Упражнение 1.8
(define (qbrt x)
    (define (qbrt-iter current-guess prev-guess)
        (define (improve-cube guess)
            (/ (+ (/ x (square guess))
                (* 2 guess)) 
            3))
        (if (good-enough?-v2 current-guess prev-guess)
            current-guess
            (qbrt-iter (improve-cube current-guess) 
                    current-guess)))
    (qbrt-iter 1.0 0))

(qbrt 8)
