with Ada.Text_IO;
with Ada.Numerics.Generic_Complex_Types;



procedure mandelbrot is
    package RC is new Ada.Numerics.Generic_Complex_Types (Long_Float);
    use RC;
function norm (z : Complex) return Long_Float
is
begin
   return Z.Re * Z.Re + Z.Im * Z.Im;
end norm;
   package IIO is new Ada.Text_IO.Integer_IO(Natural);
   use IIO;

   package RIO is new Ada.Text_IO.Float_IO(Long_float);
   use RIO;

        Width : Natural := 16000;
    Height : Natural  := 6000;
    Iterations : Natural := 64;
    Min : Complex := (-2.1, -1.2);
    Max : Complex := (0.6, 1.2);
    Inc_Imag : Complex;
    Inc_Real : Complex;
    Row_Val : Complex;
    C : Complex;
    Iter_Count : Natural;
    Z : Complex := (0.0, 0.0);
    Colors : String := "abcdefhij.-+*%#$@ ";
    Color_Idx : Natural;
    Diff : Complex := (Max - Min);
    package TIO renames Ada.Text_IO;
begin
    Inc_Real := (diff.Re / Long_Float(Width), 0.0);
    Inc_Imag := (0.0, diff.Im / Long_Float(Height));
    for row in 0..height loop
        Row_Val := Min + Long_float(Row) * Inc_Imag;
        for col in 0..Width loop
            C := Row_Val + Long_Float(Col) * Inc_Real;
            Iter_Count := 0;
            Z := C;
            Inner_Loop:
            loop
                Iter_Count := Iter_Count + 1;
                Z := Z * Z + C;
                if ((Norm(Z)>4.0) or (Iter_Count > Iterations)) then
                    exit Inner_Loop;
                end if;
            end loop Inner_loop;
            Color_Idx := 1 + ((Colors'Length-1) * Iter_Count) / Iterations;
            Tio.Put(Colors(Color_Idx));
        end loop;
        Tio.New_Line;
    end loop;
end Mandelbrot;
