#|
    Joan Andoni Gonźalez Rioz
    A00569929

    Program that to play the guess game in racket recursing

|#

#|
    This is the recursive function that makes the conditions and the display of which 
    was your option, also it makes the reading of the value of an input so you can 
    interact with it in the conditions to check your result.
|#
(define (check number2guess tries)
    (printf "Number to guess: ~a\n" number2guess)   ;Print of the number to guess
    (display "Enter your guess")                    ;Display of the instruction to input a guess
    (define val (read))                             ;Read the number thats going to be the guess
    (cond
      [(< number2guess val) (printf "Enter a lower number\n") (check number2guess (+ tries 1))]     ;If the guess is bigger print to input a lower number plus calls the recursive function with the number of tries +1
      [(> number2guess val) (printf "Enter a bigger number\n") (check number2guess (+ tries 1))]    ;If the guess is lower print to input a bigger number plus calls the recursive function with the number of tries +1
      [(= number2guess val) (printf "Congratulations, you won after ~a tries\n" tries)]             ;If the guess is correct print that you won and the number of tries it take you to win
    )
)

#|
    This is the function called for the first time reciving as parameter the interval where the
    random number will be created, first it checks if the number of the parameter is real, then if 
    the number is real it calls the recursive function with a random number between 1 and the parameter
    and the number of tries as 1. 
|#
(define (guess-game parameter)                          ;Start the game reciving a parameter 
    (printf "WELCOME TO THE NUMBER GUESS GAME\n")       ;Print of the game start
    (if (real? parameter)                               ;Check if the parameter is a real number
        (check (+ (random parameter) 1) 1)              ;If it is real it calls the recursive function
        (display "The parameter is not a real number")  ;It it is not real display that is not real
    )
)