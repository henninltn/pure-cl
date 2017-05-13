(in-package :cl-user)


; Core libraries
(defvar pure (lambda (a) (lambda () a)))

(defvar bind (lambda (m) (lambda (f) (lambda () (funcall (funcall f (funcall m)))))))

(defvar exec (lambda (m) (funcall m)))

; Helper funtion
(defvar wrap (lambda (f) (lambda (a) (lambda () (funcall f a)))))

(defparameter main (lambda ()))

(defun run-pure-cl ()
  (funcall exec main))


; usage

; define actions
(defvar put (funcall wrap #'print))

(defvar get-line (funcall wrap #'read-line))

(defparameter main (funcall (funcall bind (funcall get-line *standard-input*)) (lambda (x) (funcall put x))))

; execute
(run-pure-cl)
