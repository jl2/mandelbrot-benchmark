use num::complex::Complex;

fn mandelbrot() {
    let width = 16000;
    let height = 6000;

    let min = Complex::new(-2.1, -1.2);
    let max = Complex::new(0.6, 1.2);

    let iterations = 64;
    let colors = "abcdefhij.-+*%#$@ ";

    let inc_real = Complex::new((max - min).re
                                / (width as f64),
                                0.0);
    let inc_imag = Complex::new(0.0,
                                (max - min).im
                                / height as f64);

    for row in 0..height {
        let row_val = min + ((row as f64) * inc_imag);

        for col in 0..width {
            let c = row_val + ((col as f64) * inc_real);
            let mut z = c; //Complex::new(0.0, 0.0);
            let mut iter_count = 0;
            
            while (iter_count < iterations) && (z.norm_sqr() < 4.0) {
                z = z * z + c;
                iter_count += 1;
            }
            let color_index = (((colors.len()-1) * iter_count) as f64
                               / iterations as f64).trunc() as usize;
            print!("{0}", match colors.chars().nth(color_index) {
                Some(x) => x,
                None    => ' '
            });
        }
        println!("");
    }
}

fn main() {
    mandelbrot();
}
