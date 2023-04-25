function [efficiency, VR, P_r, pf] = CASE1(A, B, C, D)
%CASE1 Summary of this function goes here
%   Detailed explanation goes here
val = inputdlg("Recieving voltage (in kV): ");

while isempty(str2num(val{1}))
    val = inputdlg("Recieving voltage (in kV): ");
end

V_r = complex((str2num(val{1}) / sqrt(3)) * 10^3);
pf = 0.8;                                        % 0.8 lagging power factor
phi = -1 * acos(pf);
P_r = 0:100*10^(3);                              % recieved active power
P_r = complex(P_r);


I_r = complex((P_r/(3*V_r*pf))*cos(phi), (P_r/(3*V_r*pf))*sin(phi));
                                                 % recieved current

V_s = A * V_r + B * I_r;                         % sending voltage
I_s = C * V_r + D * I_r;                         % sending current

pfs = cos(angle(V_s) - angle(I_s));

P_s = 3 * (abs(V_s) .* abs(I_s)) .* pfs;         % sending active power

efficiency = (P_r ./ P_s) .* 100;                  % efficiency

V_rnl = V_s / A;                                 % no load voltage

VR = ((abs(V_rnl) - abs(V_r)) / abs(V_r)) * 100; % voltage regulation
end

