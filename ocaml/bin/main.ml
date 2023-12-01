
(*
  The inner recursive loop is derived from this code:
  https://github.com/timestretch/mandelbrot_ocaml/blob/master/mandelbrot.ml

  I'm torn about this implementation.
  The inner recursion is significantly different than the other implementations,
  making it dubious to include as a benchmark.
  On the other hand, I think this is a more realistic implementation for OCaml.
 *)

let mandelbrot () =
  let width = 16000 in
  let height = 6000 in
  let min = Complex.({ re = -2.1; im = -1.2 }) in
  let max = Complex.({ re = 0.6; im = 1.2 }) in
  let iterations = 64 in
  let colors = "abcdefhij.-+*%#$@ " in
  let inc_real = (Complex.sub max min).re /. float_of_int(width) in

  let inc_imag = (Complex.sub max min).im /. float_of_int(height) in

  for row = 0 to height-1 do
    let row_val = Complex.add
                    min
                    Complex.({ re = 0.0;
                              im = (float_of_int row) *. inc_imag}) in
    for col = 0 to width-1 do
      let c = Complex.add row_val
                Complex.({ re = (float_of_int col) *. inc_real;
                           im = 0.0 }) in
      let rec iterate i z =
        if (Complex.norm2 z) > 4.0 || i >= iterations then i
        else iterate (i+1) (Complex.add (Complex.mul z z) c) in
      let iter_count = (iterate 0 c) in
      let color_index = (((String.length colors) - 1) * iter_count) / iterations in
      print_char (String.get colors color_index)
    done;
    print_newline ();
  done;;

let () = mandelbrot();;
