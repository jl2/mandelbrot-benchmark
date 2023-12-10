program mandelbrot
  implicit none
  integer, parameter :: width = 16000
  integer, parameter :: height = 6000
  integer, parameter :: iterations = 64
  complex, parameter :: min = (-2.1, -1.2)
  complex, parameter :: max = (0.6, 1.2)

  complex, parameter :: inc_real = cmplx( real(max - min)/width, 0.0 )
  complex, parameter :: inc_imag = cmplx( 0.0, aimag(max - min)/height )

  character (len=18) :: colors
  complex :: row_val
  integer :: row
  integer :: col
  complex :: z
  complex :: c
  integer :: color_idx
  integer :: iter_count

  real abs2
  abs2( z ) = real(z)**2 + aimag(z)**2

  colors  = 'abcdefhij.-+*%#$@ '
  do row = 0, height
     row_val = row * inc_imag + min
     do col = 0, width
        c = col * inc_real + row_val
        z = 0
        inner_loop: do iter_count = 0, iterations
           z = z * z + c
           if (abs2(z) > 4.0) then
              exit inner_loop
           end if
        end do inner_loop
        color_idx = 1 + ((len(colors)-1) * iter_count) / iterations
        write(*, fmt="(A)", advance="no") colors(color_idx:color_idx)
     end do
     print *, ''
  end do
end program mandelbrot
