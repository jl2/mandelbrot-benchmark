program mandelbrot;
uses uComplex, math;
const
   width           = 16000;
   height          = 6000;
   min  : complex  = (re : -2.1; im : -1.2);
   max  : complex  = (re : 0.6; im : 1.2);
   iterations      = 64;
   colors : string = 'abcdefhij.-+*%#$@ ';

var
   inc_real   : complex;
   inc_imag   : complex;
   row        : integer;
   col        : integer;
   row_val    : complex;
   z          : complex;
   c          : complex;
   color_idx  : integer;
   iter_count : integer;

   function cnorm(z : complex) : real;
   begin
      cnorm := z.re * z.re + z.im * z.im;
   end;


   begin
      inc_real := cinit((max - min).re / width,  0.0);
      inc_imag := cinit( 0.0 ,  (max-min).im / height);

      for row := 0 to height do
      begin
         row_val := min + row * inc_imag;
         for col := 0 to width do
         begin
            c:= row_val + col * inc_real;
            z := c;
            iter_count := 0;
            repeat
               iter_count := iter_count + 1;
               z := z*z + c;
            until ((cnorm(z)> 4.0) or (iter_count > iterations));
            color_idx := 1 + floor(((Length(colors)-1) * iter_count) / iterations);
            write(colors[color_idx]);
         end;
         WriteLn('');
      end;
   end.
