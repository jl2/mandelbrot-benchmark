program mandelbrot;
uses uComplex;
const
   width           = 160;
   height          = 60;
   min  : complex  = (re : -2.1; im : -1.2);
   max  : complex  = (re : 0.6; im : 1.2);
   iterations      = 64;
   colors : string = 'abcdefhij.-+*%#$@ ';

var
   inc_real   : complex;
   inc_imag   : complex;
   row        : integer;
   col        : integer;
   z          : complex;
   c          : complex;
   color_idx  : integer;
   iter_count : integer;

   function cnorm(z : complex) : complex;
   begin
      cnorm := z.re * z.re + z.im * z.im;
   end;


   begin
      inc_real := cinit( 0.0 ,  (max-min).im / height);
      inc_imag := cinit((max - min).re / width,  0.0);
      
      writeLn('Mandelbrot');
   end.
