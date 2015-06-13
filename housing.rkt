#lang racket
(require "linear-model.rkt")
(require (only-in plot plot [points p-points]))

;; load data

(define labeled-points
  (shuffle
    (call-with-input-file "housing.data"
      (λ (port)
        (for/list ([line (in-lines port)])
          (map string->number (string-split line)))))))

(define train-points (take labeled-points 400))
(define test-points (sort (drop labeled-points 400) (λ (p1 p2) (< (car p1) (car p2)))))

(define-values (coefs model-f)
  (get-best-fit train-points))

(define-values (actuals guesses)
  (for/fold ([actuals null]
             [guesses null])
            ([point (in-list test-points)]
             [i (in-naturals 1)])
    (values (cons (list i (car point)) actuals)
            (cons (list i (model-f (cdr point))) guesses))))
(plot (list
       (p-points actuals
                 #:color 'green
                 #:label "actual price of house")
       (p-points guesses
                 #:color 'red
                 #:label "predicted price of house"
                 #:sym 'plus))
      #:width 1024
      #:height 768
      #:x-label "test case number"
      #:y-label "price in tens of thousands of dollars"
      #:title "predicting house values with linear regression"
      #:out-file "lovely-plot.pdf"
      #:out-kind 'pdf)