function [efficiency, VR, P_r, pf] = CASE2(A ,B ,C ,D)
%CASE2 Summary of this function goes here
%   calculate efficiency and voltage reg for case 2
val = inputdlg("Recieving voltage (in kV): ");

while isempty(str2num(val{1}))
    val = inputdlg("Recieving voltage (in kV): ");
end

V_r = complex((str2num(val{1}) / sqrt(3)) * 10^3);
pf = 0.3:0.01:1;  
phi_lag = -1 * acos(pf);
phi_lead = acos(pf);

P_r = 100*10^(3);
P_r = complex(P_r);

I_r_lag = complex((P_r./(3*V_r*pf)).*cos(phi_lag), (P_r./(3*V_r*pf)).*sin(phi_lag));
I_r_lead = complex((P_r./(3*V_r*pf)).*cos(phi_lead), (P_r./(3*V_r*pf)).*sin(phi_lead));

V_s_lag = A * V_r + B * I_r_lag;                         % sending voltage lag
I_s_lag = C * V_r + D * I_r_lag;                         % sending current lag

V_s_lead = A * V_r + B * I_r_lead;                         % sending voltage lead 
I_s_lead = C * V_r + D * I_r_lead;                         % sending current lead

pfs_lag = cos(angle(V_s_lag) - angle(I_s_lag));
pfs_lead = cos(angle(V_s_lead) - angle(I_s_lead));


P_s_lag = 3 * (abs(V_s_lag) .* abs(I_s_lag)) .* pfs_lag;         % sending active power lag
P_s_lead = 3 * (abs(V_s_lead) .* abs(I_s_lead)) .* pfs_lead;         % sending active power lead

efficiency_lag = (P_r ./ P_s_lag) .* 100;                  % efficiency lag
efficiency_lead = (P_r ./ P_s_lead) .* 100;                  % efficiency lead

V_rnl_lag = V_s_lag / A;                                 % no load voltage lag
V_rnl_lead = V_s_lead / A;                                 % no load voltage lead

VR_lag = ((abs(V_rnl_lag) - abs(V_r)) / abs(V_r)) * 100; % voltage regulation lag
VR_lead = ((abs(V_rnl_lead) - abs(V_r)) / abs(V_r)) * 100; % voltage regulation lead

efficiency = [efficiency_lag; efficiency_lead];
VR = [VR_lag; VR_lead];
end

