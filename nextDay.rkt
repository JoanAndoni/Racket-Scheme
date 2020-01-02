#|
    Joan Andoni Gonźalez Rioz
    A00569929

    Program that returns the next day of a date checking if it's a leap year
|#

#|
    Function that check if the change of month is for december that means is a new year
    or is just a simple change of month for the date.
|#
(define (condNewYear date isDecember)
    (if (zero? isDecember)                                  ; CHECK IF IT'S A NEW YEAR BY CHECKING IF IT'S DECEMBER
        (list 1 (+ 1 (cadr date)) (caddr date))             ; DATE = '( 1 (MONTH + 1) YEAR ) 
        (list 1 1 (+ 1 (caddr date)))                       ; DATE = '( 1 1 (YEAR + 1) )
    )
)

#|
    Function that check is the day of the date recived is the last day of the month if it is
    send the full date to check the change of month or if not just add another day to the date.
|#
(define (condDay date numberDays isDecember)
    (if (equal? (car date) numberDays)                      ; CHECK IF IT'S THE LAST DAY OF THE MONTH
        (condNewYear date isDecember)                       ; SEND THE DATE TO CHECK IF IT'S A NEW YEAR OR JUST ANOTHER MONTH
        (list (+ 1 (car date)) (cadr date) (caddr date))    ; DATE = '( (DAY + 1) MONTH YEAR )
    )
)

#|
    Function that check if the year of the date recived is a leap or not depending on the
    division of the year by 4, 100 or 400
|#
(define (condLeap year)
    (if (zero? (modulo year 4))                             ; CHECK IF THE YEAR IS DIVISIBLE BY 4
        (if (zero? (modulo year 100))                       ; CHECK IF THE YEAR IS DIVISIBLE BY 100
            (if (zero? (modulo year 400))                   ; CHECK IF THE YEAR IS DIVISIBLE BY 400
                29                                          ; THE YEAR IS A LEAP CAUSE IT'S DIVISIBLE BY 4, 100 AND 400 
                28                                          ; THE YEAR IS DIVISIBLE BY 4 AND 100 BUT NOT DIVISIBLE BY 400
            )            
            29                                              ; THE YEAR IS A LEAP CAUSE IS DIVISIBLE BY 4 AND NOT DIVISIBLE BY 100 OR 400
        )
        28                                                  ; THE YEAR IS NOT DIVISIBLE BY 4 SO IS NOT A LEAP                                                  
    )
)

#|
    Function that check how many days have month of the date recived and send the full date 
    with the number of days of the month and a variable to know if its the last month of the 
    year plus when is february check if its a leap year with another function.
|#
(define (condMonth date)
    (case (cadr date)                                       ; MAKE A SWITCH CASE TO CHECK WHICH MONTH IS
        [(12) (condDay date 31 1)]                          ; IF IT'S DECEMBER SEND THE FULL DATE, NUMBER OF DAYS AND A VARIABLE USED AS BOOLEAN TO CHECK THAT IS THE LAST MONTH OF THE YEAR
        [(1 3 5 7 8 10) (condDay date 31 0)]                ; IF IT'S ONE OF THIS MONTHS RETURN 31 DAYS THAT THE MONTH HAVE AND THE BOOLEAN THAT IS NOT THE LAST MONTH OF THE YEAR
        [(2) (condDay date (condLeap (caddr date)) 0)]      ; IF IT'S FEBRUARY WE SEND THE YEAR TO CHECK IS IT'S A LEAP AND IT RETURNS THE NUMBER OF DAYS OF THIS MONTH EITHER IS 28 OR 29 THEN WE SEND IT LIKE THE OTHER DATES
        [(4 6 9 11) (condDay date 30 0)]                    ; IF IT'S ONE OF THIS MONTHS RETURN 30 DAYS THAT THE MONTH HAVE AND THE BOOLEAN THAT IS NOT THE LAST MONTH OF THE YEAR
    )
)

#|
    Function that recives the date and check if it's a list or not to proced with the conditions
|#
(define (next_day date)
    (if (list? date)                                        ; CHECK IF THE VARIABLE THAT YOU RECIVE IS A LIST
        (condMonth date)                                    ; IF IT'S A LIST SEND THE FULL DATE TO START THE CONDITIONALS 
        (display "It's not a date"))                        ; IF IS NOT A LIST THEN SAY THAT IS NOT A DATE
)