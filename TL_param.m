%% Transimission line parameters
resistivity = input('Please enter the conductor resistivity: ');
while resistivity <= 0
    fprintf('****Invalid Input****\n');
    resistivity = input('Please enter the conductor resistivity: ');
end
length = input('Please enter the length in meters: ');
while length <= 0
    fprintf('****Invalid Input****\n');
    length = input('Please enter the length in meters: ');
end
diameter = input('Please enter the diameter in centimeters: ');
while diameter <= 0
    fprintf('****Invalid Input****\n');
    diameter = input('Please enter the diameter in centimeters: ');
end
radius = (diameter / 2) * 10^(-2);
area = pi * radius^2 ;
GMR = radius * exp(-0.25);
R = resistivity * length/area;
fprintf('Please enter the number corresponding to your choice\n1-Symetrical system\n2-Unsymetrical system\n');
choice = input('Choice: ');
switch choice
    case 1
        distance = input('Please enter the seperation distance in meters: ');
        L = (2 * 10^(-7) * log(distance/GMR)) * length;
        C = (( 2 * pi * 8.85 * 10 ^(-6))/(log(distance/radius))) * length;
    case 2
        dis_1 = input('Please enter the distance between a and b in meters: ');
        dis_2 = input('Please enter the distance between b and c in meters: ');
        dis_3 = input('Please enter the distance between a and c in meters: ');
        dis = dis_1 * dis_2 * dis_3;
        GMD = nthroot(dis, 3);
        L = (2 * 10^(-7) * log(GMD/GMR)) * length;
        C = (( 2 * pi * 8.85 * 10 ^(-6))/(log(GMD/radius))) * length;
end
fprintf('The tansmission line per phase resistance R = %f ohm\nThe transmission line per phase inductance L = %f H\nThe transmission line per phase capcitance C = %f uF\n' , R, L, C);
%% ABCD Parameters
X_l = 2 * pi * 50 * L;
Y_c = 2 * pi * 50 * C * 10^(-6);
Z = complex(R, X_l);
Y = complex(0, Y_c); 
if length < 80000
    fprintf('Short Line Model\n');
    A = 1;
    B = Z;
    C = 0;
    D = 1;
    fprintf('A = %0.1f\nB =%f+j%f\nC=%0.1f\nD=%0.1f\n', A, real(B), imag(B), C, D); 
elseif (length >= 80000) && (length <= 250000)
    fprintf('Which medium line model would you like to work with?\n1-pi Model\n2-T Model\n');
    choice = input('Choice: ');
    switch choice
        case 1
            A = 1 + (Z*Y)/2;
            B = Z;
            C = Y * (1 + (ZY/4));
            D = 1 + (Z*Y)/2;
        case 2
            A = 1 + (Z*Y)/2;
            C = Z * (1 + (ZY/4));
            C = Y;
            D = 1 + (Z*Y)/2;
    end
    fprintf('A = %f+j%f\nB =%f+j%f\nC=%f+j%f\nD=%f+j%f\n', real(A), imag(A), real(B), imag(B), real(C), imag(C), real(D), imag(D));
elseif length > 250000
    fprintf('Long Transmission Line has no accurate model\n');
end
%%   
    