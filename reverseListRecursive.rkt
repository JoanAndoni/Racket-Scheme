(define (reversing listRecived)
    (if (null? (cdr listRecived))
        listRecived
        (append (reversing (cdr listRecived)) (list (car listRecived)))
    )
)