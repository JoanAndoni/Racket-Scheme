
; Create a channel for the work list
(define channel-work (make-channel))
; Create a channel for the output
(define channel-out (make-channel))

; Create the thread to post the output
(thread 
    (lambda()
        (let loop
            ()
            (displayln (channel-get channel-out))
            (loop)
        )
    )
)

(define (make-worker name)
    (thread (lambda () 
        (let loop 
            ()
            (define message (channel-get channel-work))
            (case message
                [(end)
                    (channel-out (format "Thread ~a finishing" name)) 
                ]
                [else 
                    (define result (divisible-up-to message))
                    (channel-out (format ))
                ]
            )
        ))
    )
)