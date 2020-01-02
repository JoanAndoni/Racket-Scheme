
#|
    Joan Andoni Gonźalez Rioz
    A00569929

    Program that returns the next day of a date checking if it's a leap year
|#

#|
    Receives as argument a number, and returns true or false, 
    indicating whether the argument is a prime number
|#
(define (prime? number)
    (define isPrime 1)
    (cond
        [(<= number 1) #f]
        [(= number 2) #t]
        [else
            (for ([i (listNumbers '() (- number 1))])              
                (cond
                    [(zero? (modulo number i)) (set! isPrime 0)]
                )
            )
            (if (= isPrime 0)
                #f
                #t
            )
        ]
    )
)

#|
    Function that returns the list of the numbers behind them
|#
(define (listNumbers lst number)
    (cond 
        [(= number 1) lst]
        [(> number 1) (listNumbers (append (list number) lst) (- number 1))]
    )
)

#|
    Receives a number, and returns a list containing all the prime numbers smaller than the input. 
    The first prime listed must be 2
|#
(define (primes-less-than maxValue)
    (define lst '()) ; Define an empty list
    (cond 
        [(<= maxValue 1) (display "There are no prime numbers before 1")] ;Conditional when theres no prime numbers behind 1
        [else
            (for ([i (listNumbers '() (- maxValue 1))])              
                (cond 
                    [(prime? i) (set! lst (append lst (list i)))] ;Set the list to the append of the last iteration
                )
            )
        ]
    )
    lst ;Return the list
)

;(define (nth-prime positionNumber))