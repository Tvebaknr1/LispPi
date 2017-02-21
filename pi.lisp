
;;
;; Preamble: Lisp prerequisits
;;

;; These two lines sets the number of binary digits used to represent a float
;; in Lisp. This is necessary because you'll be working with tiny numbers
;; TL;DR ignore these two lines
(setf (EXT:LONG-FLOAT-DIGITS) 35000)
(setf *read-default-float-format* 'long-float)

;; This method rounds a number to a certain precision
;; It takes two arguments: the number to round and the number of digits to
;; round in decimals
;;
;; Example: (roundToPrecision 10.0044 3) -> 10.004
(defun roundToPrecision (number precision)
  (let
    ((p (expt 10 precision)))
     (/ (round (* number p)) p)

  )
)

;; Exercise
;; Your task is to implement the Gauss-Legendre algorithm for calculating pi
;; and extract 10.000 (ten thousand) digits
(setf c 0)
(setf a 1)
(setf b (/ 1 (sqrt 2.0)))
(setf r (/ 1 4))
(setf p 1)
;; Gauss-Legendre algorithm on Wikipedia
;; https://en.wikipedia.org/wiki/Gauss%E2%80%93Legendre_algorithm
(defun calculate ()
  (if(< (- a b) 0.000000000000001)
    (setf k (/  (* (+ a b)(+ a b))(* 4 r)))
    (progn
      (setf c a)
      (setf a (/ (+ a b) 2))
      (setf b (sqrt(* c b)))
      (setf r (- r(* p(*(- c a)(- c a)))))
      (setf p (* 2 p))
      (calculate)
    )
  )
)

(calculate)
(roundToPrecision k 1000)
(write k)
