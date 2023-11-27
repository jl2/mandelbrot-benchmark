// This is copied from https://gist.github.com/benhoyt/24b9caf9715659c76f7b652bbdc8a834
package main

import (
	"fmt"
)

func norm( z complex128) float64 {
	return real(z) * real(z) + imag(z)*imag(z);
}

func main() {
	const (
		width      = 16000
		height     = 6000
		min        = -2.1 - 1.2i
		max        = 0.6 + 1.2i
		iterations = 64
		colors     = "abcdefhij.-+*%#$@ "
	)

	incX := complex(real(max-min)/width, 0)
	incY := complex(0, imag(max-min)/height)
	c := min
	for row := 0; row < height; row++ {
		for col := 0; col < width; col++ {
			z := 0 + 0i
			var i int
			for i = 0; i < iterations; i++ {
				z = z*z + c // The core Mandelbrot equation!
				if norm(z) > 4.0 {
					break
				}
			}
			fmt.Printf("%c", colors[i*(len(colors)-1)/iterations])
			c += incX
		}
		fmt.Printf("\n")
		c += incY - real(max-min)
	}
}
