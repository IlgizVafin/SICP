; Процедура, вычисляющая факториал

(define (factorial x)
    (* x (factorial (- x 1))))