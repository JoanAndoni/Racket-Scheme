#|
    Joan Andoni Gonźalez Rioz
    A00569929

    Program that that can solve quadratic equations of the form:

    ax^2 + bx + c = 0
|#

#| 
    Function that recive the values and make the square root that the formula needs
|#
(define (root a b c)
    (sqrt (- (* b b) (* 4 a c))) 
)

#|  
    Function that recive the values and make the full formula to solve the quadratic equation
    when the parameter "a" is different to "0", this function recive as well a variable named 
    "which" that recives the parameter "0" or "1" and take the decision of which formula run 
    the sum or the substraction to have the two possible values of "x"
|#
(define (full a b c which)
    (if (zero? which)
        (/ (+ (- b) (root a b c)) (* 2 a))
        (/ (- (- b) (root a b c)) (* 2 a)) )
)

#|
    Function that recives the values of the quadratic equation and it checks if "a" = 0 and it
    solves the problem with an easy formulto make the a or if not it appends in a list the two possible values
    called from the full quadratic equation; the sum and the substraction sending an extra variable 
    that is "which"
|#
(define (quadratic a b c)
    (if (zero? a)
        (- (/ c b))
        (list (full a b c 0) (full a b c 1))
    )
)