let mandelbrot () =
  let width = 160
  and height = 60
  and min = Complex.({ re = -2.1; im = -1.2 })
  and max = Complex.({ re = 0.6; im = 1.2 })
  and iterations = 64
  and colors = "abcdefhij.-+*%#$@ "
  and inc_real = Complex.(Complex.sub(max, min) /. float_of_int(width),
                          0)
  and inc_imag = Complex.(0,
                          Complex.sub(max, min) /. float_of_int(height))
  in
  for row = 0 to height do
    let row_val = Complex.add(min, Complex.(float_of_int row * inc_imag.re,
                                            float_of_int row * inc_imag.im)) in
    for col = 0 to width do
      let c = Complex.add(row_val, Complex.(float_of_int col * inc_real.re,
                                            float_of_int col * inc_real.im)) in
      let z = ref c in
      let rec iter_count i z =
        let znext = Complex.add(Complex.mul(z, z), c) in
        let inext = i + 1 in
      
          z := 
          
                           
  

  print_endline "Hello, World from Mandelbrot!";;

let () = mandelbrot();;
