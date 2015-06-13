#lang racket
;; Luke Miles, June 2015
;; strongly based off jeremykun.com/2013/08/18/linear-regression/ 
(require (only-in math/matrix list*->matrix ->col-matrix
                  matrix-transpose matrix-inverse matrix*
                  matrix-dot matrix->list))

(define (get-best-fit labeled-points)
  (let* ([X (list*->matrix
              (map (λ (labeled-point) (cons 1 (cdr labeled-point)))
                   labeled-points))]
         [y (->col-matrix (map car labeled-points))]
         [Xt (matrix-transpose X)]
         [inv (matrix-inverse (matrix* Xt X))]
         [w (matrix* (matrix* inv Xt) y)])
    (values (matrix->list w)
            (λ (x) (matrix-dot w (->col-matrix (cons 1 x)))))))

(provide get-best-fit)
