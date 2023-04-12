[resistivity, length, diameter] = start(); %reading the input from the user
radius = (diameter / 2) * 10^(-2);
area = pi * radius^2 ;
R = resistivity * length/area;
[L, C] = cal_inductance_capactance(radius, length);
fprintf('The transmission line per phase resistance R = %f ohm\nThe transmission line per phase inductance L = %f H\nThe transmission line per phase capcitance C = %f uF\n' , R, L, C);
X_l = 2 * pi * 50 * L;
Y_c = 2 * pi * 50 * C * 10^(-6);
Z = complex(R, X_l);
Y = complex(0, Y_c); 
[A, B, C, D] = abcd_param(Z, Y, length);
fprintf('A= %f <%f\nB=%f <%f\nC=%f <%f\nD=%f <%f\n', abs(A), angle(A)*180/pi, abs(B), angle(B)*180/pi, abs(C), angle(C)*180/pi, abs(D), angle(D)*180/pi); 