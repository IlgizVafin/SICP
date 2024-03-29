(define (abs x)
    (cond ((> x 0) x)
          ((= x 0) 0)
          ((< x 0) (- x))))

(abs 0)
(abs -2)
(abs 2)

; Предикат - выражение (значение или процедура), значение которого интерпретируется как "Истина" или "Ложь"

(define (abs_v2 x)
    (cond ((< x 0) (- x))
          (else x)))
          
(abs_v2 0)
(abs_v2 -2)
(abs_v2 2)

(define (abs_v3 x)
    (if (< x 0)
        (- x)
        x))

(abs_v3 0)
(abs_v3 -2)
(abs_v3 2)

; Элементарные предикаты: < > = and or not

; 5 < x < 10
; (and (> x 5) (< x 10))

(define (>= x y)
    (or (> x y) (= x y)))

(>= 3 4)
(>= 4 4)
(>= 5 4)

(define (>=_v2 x y)
    (not (< x y)))

(>=_v2 3 4)
(>=_v2 4 4)
(>=_v2 5 4)

; Упражнение 1.1.
; 10 => 10

; (+ 5 3 4) => 12

; (- 9 1) => 8

; (/ 6 2) => 3

; (+ (* 2 4) (- 4 6)) => 6

; (define a 3) => ничего не выводит

; (define b (+ a 1)) => ничего не выводит

; (+ a b (* a b)) => 19

; (= a b) => #f

; (if (and (> b a) (< b (* a b)))
;      b
;      a) => 4

; (cond ((= a 4) 6)
;       ((= b 4) (+ 6 7 a))
;       (else 25)) => 16

; (+ 2 (if (> b a) b a)) => 6

; (* (cond ((> a b) a)
;          ((< a b) b)
;          (else -1))
;    (+ a 1)) => 16


; Упражнение 1.2.
; Префиксная форма - форма выражений в Lisp
; (/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) 
;    (* 3 (- 6 2) (- 2 7)))

; Упражнение 1.3.
(define (square x)
    (* x x))

(define (sum-of-squares x y)
    (+ (square x) 
       (square y)))

(define (sum-of-big-squares x y z)
    (cond ((and (> x z) (> y z)) (sum-of-squares x y))
          ((and (> x y) (> z y)) (sum-of-squares x z))
          (else (sum-of-squares y z))))

; 13
(sum-of-big-squares 1 2 3)

; Упражнение 1.4.
; На входе две переменные
; Если b больше ноля, то складываем a и b
; Если b меньше ноля, то вычитаем из a b
; Если b равно нолю, то вычитаем из a b

(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b))

; 3
(a-plus-abs-b 1 2)

; 3
(a-plus-abs-b 1 -2)

; 1
(a-plus-abs-b 1 0)

; Упражнение 1.5
(define (p) (p))

(define (test x y)
    (if (= x 0)
        0
        y))

(test 0 (p))

; Нормальный порядок вычислений
; Интерпретатор вычислит только первую ветку условия, рекурсии не будет
; Аргументы вычисляются по мере необходимости

; Аппликативный порядок вычислений
; Интерпретатор попробует вычислить обе ветки условия. Уйдет в рекурсию и зависнет
; Сначала вычисляются все аргументы, а затем выбирается ветка условия