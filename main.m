clc;
length = input('Transmission line length (in kilo meters): ');
while length <= 0
    clc;
    fprintf('****Invalid Input****\n');
    length = input('Transmission line length (in kilo meters): ');
end
diameter = input('Conductor diameter (in centimeters): ');
while diameter <= 0
    clc;
    fprintf('****Invalid Input****\n');
    diameter = input('Conductor diameter (in centimeters): ');
end

[R, Cap, L] = rcl(length, diameter);

[A, B, C, D] = lineParameters(length, R, Cap, L);

[efficiency, VR, P_r, pf] = linePerformance(A, B, C, D);


fprintf('Line resistance: %f\n', R);
fprintf('Line capacitance: %f\n', Cap);
fprintf('Line inductance: %f\n', L);

fprintf('***************************************\n');
fprintf('A = %f + j%f\t B =%f + j%f\n', real(A), imag(A), real(B), imag(B));
fprintf('C = %f + j%f\t D =%f + j%f\n', real(C), imag(C), real(D), imag(D));