(define (sum a b)
    (+ a b)
)

(define (sumList data)
    (if (list? data)
        (display (sum (car data) (car data)))
        (display "It's a number")
    )
)