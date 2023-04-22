function [efficiency, VR, P_r] = CASE1(A, B, C, D)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
V_r = input('Recieving voltage: ');
pf = 0.8;                                        % 0.8 lagging power factor
angle = acos(pf);
P_r = 0:100*10^(3);                              % recieved active power

I_r = P_r / V_r;                                 % recieved current

V_s = A * V_r + B * I_r;                         % sending voltage
I_s = C * V_r + D * I_r;                         % sending current

P_s = V_s .* I_s;                                % sending active power

efficiency = (P_r / P_s) * 100;                  % efficiency

V_rnl = V_s / A;                                 % no load voltage

VR = ((abs(V_rnl) - abs(V_r)) / abs(V_r)) * 100; % voltage regulation
end

