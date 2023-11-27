#include <iostream>
#include <complex>

void mandelbrot() {
    const uint width = 16000;
    const uint height = 6000;
    const std::complex<double> min(-2.1, -1.2);
    const std::complex<double> max(0.6, 1.2);
    const uint iterations = 64;
    const std::string colors = "abcdefhij.-+*%#$@ ";
    const std::complex<double> inc_real((max - min).real()/ width,
                                        0.0);
    const std::complex<double> inc_imag(0.0,
                                        (max - min).imag()/ height);

    for (auto row = 0; row < height; ++row) {

        const auto row_val = min + (inc_imag * double(row));

        for (auto col = 0; col < width; ++col) {

            const auto c = row_val + (inc_real * double(col));
            auto iter_count = 0;
            std::complex<double> z(0.0, 0.0);

            for (iter_count = 0; iter_count < iterations; ++iter_count) {
                z = z * z + c;
                if (std::norm(z)>4.0) {
                    break;
                }
            }
            const auto color_idx = std::trunc(double((colors.size()-1) * iter_count)
                                              / iterations);
            std::cout << colors[color_idx];
        }
        std::cout << "\n";
    }
                                   
}

int main(int argc, char *argv[]) {
    mandelbrot();
    return 0;
}
