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

[A, B, C, D] = lineParameters(length, R, C, L);

[efficiency, VR, P_r] = linePerformance(A, B, C, D);
cftool(P_r, efficiency);
