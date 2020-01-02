#|
Basic opening and closing of files
As described in:
https://docs.racket-lang.org/guide/ports.html
Gilberto Echeverria
11/09/2019
|#

; Writing to a file
; Overwriting
;(define out (open-output-file "test.txt" #:exists 'update))         ; Both seem to do the same
; Appending
(define out (open-output-file "test.txt" #:exists 'truncate))      ; Both seem to do the same
(display "This is only a test 1\n" out)
(display "This is only a test 2\n" out)
(display "This is only a test 3\n" out)
(display "This is only a test 4\n" out)
(close-output-port out)

; Reading from a file
(define in (open-input-file "test.txt"))
(read-line in)
(close-input-port in)