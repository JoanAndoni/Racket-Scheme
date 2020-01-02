#|
    List Comprehensions
|#

; Compute the square of each element in 'data'
(define (squares data)
    (let loop
        ([lst data]
         [results empty])
        (if (empty? lst)
            results
            (loop (cdr lst) (append results (list (* (car lst) (car lst)))))
        )
    )
)

; Using map and lambda functions
(define (squares-map data)
    (map (lambda (x) (* x x)) data )
)

; Using list comprnhensions 
(define (squares-for data)
    ; for i in data:
    (for ([i data])
        (* i i)
    )
)