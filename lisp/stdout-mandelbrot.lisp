;; stdout-mandelbrot.lisp
;; Copyright (c) 2023 Jeremiah LaRocco <jeremiah_larocco@fastmail.com>

;; Permission to use, copy, modify, and/or distribute this software for any
;; purpose with or without fee is hereby granted, provided that the above
;; copyright notice and this permission notice appear in all copies.

;; THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
;; WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
;; MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
;; ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
;; WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
;; ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
;; OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

(in-package :stdout-mandelbrot)

(defun mandelbrot ()
  "Compute mandelbrot set fractal and write to *standard-output*."
  (declare (optimize (speed 2) (space 2) (debug 0) (safety 0) (compilation-speed 2)))
  (let* ((stream *standard-output*)
         (width 16000)
         (height 6000)
         (min #C(-2.1d0 -1.2d0))
         (max #C(0.6d0 1.2d0))
         (iterations 64)
         (colors "abcdefhij.-+*%#$@ ")

         ;; real increment per pixel
         (inc-real (complex (/ (realpart (- max min))
                               width)
                            0.0d0))

         ;; Imaginary increment per pixel
         (inc-imag (complex 0.0d0
                            (/ (imagpart (- max min))
                               height))))

    ;; imaginary part on the y axis
    (flet ((norm (z)
             "Return squared absolute value of z"
             (let ((rp (realpart z))
                   (ip (imagpart z)))
               (+ (* rp rp)
                  (* ip ip)))))
      (declare (inline norm)
               (ftype (function ((complex (double-float))) double-float) norm))

      (loop
        :for row :below height
        :for row-val :of-type (complex (double-float)) = (+ min (* row inc-imag))
        :do

           ;; Real part on the x axis
           (loop
             :for col :below width
             :for c :of-type (complex (double-float)) = (+ row-val (* col inc-real))
             :for iter-count = (loop
                                 :for current-iteration :upto iterations
                                 :for z :of-type (complex (double-float)) = c
                                   :then (+ (* z z) c)
                                 :until (> (norm z) 4.0)
                                 :finally (return current-iteration))
             :for color-idx = (floor (* (1- (length colors))
                                        iter-count)
                                     iterations)
             :do
                (format stream "~a" (aref colors color-idx)))

           (format stream "~%"))
      )))

(defun main (args)
  (declare (ignorable args))
  (mandelbrot)
  0)
