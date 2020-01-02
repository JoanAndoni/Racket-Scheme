#|
Using functions to deal with an open file
Based on examples at:
https://docs.racket-lang.org/guide/ports.html
Gilberto Echeverria
11/09/2019
|#

; Simple example to write a single word to a file
(call-with-output-file "second.txt"
    #:exists 'truncate
    (lambda (out)
    (display "hello" out))
)

; Reading a single line from a file
(call-with-input-file "second.txt"
    (lambda (in)
        (read-line in)
    )
)

;;; More complex

; Callback to be used when opening the file
(define (write-numbers file)
    (display "INSIDE THE write-numbers FUNCTION")
    (print-nums 1 20 file)
)

; Function to write a series of numbers from a file
(define (print-nums start end file)
    (if (<= start end)
        (let
            ([line (string-append (number->string start) "\n")])
            (begin
                (display line file)
                (display line)
                (print-nums (+ start 1) end file)
            )
        )
        (display "Finished Writing\n")
    )
)

(call-with-output-file "third.txt"
    #:exists 'truncate
    write-numbers
)

; Reading multiple lines from a file
(define (read-numbers file)
    (let 
        ([line (read-line file)])
        ; Check if the line could be read
        (if (eof-object? line)
            (display "Finished Reading\n")
            (begin
                (display (string-append line "\n"))
                (read-numbers file)
            )
        )
    )
)

(call-with-input-file "third.txt"
    read-numbers
)