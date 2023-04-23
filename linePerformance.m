function [efficiency, VR, P_r, pf] = linePerformance(A, B, C, D)
%linePerformance Summary of this function goes here
%   Detailed explanation goes here

fprintf('1. CASE I: constant recieving power factor (0.8 lagging)\n');
fprintf('2. CASE II: constant recieving power (100 kW [full load])\n');
type = input('');

switch type
    case 1
        [efficiency, VR, P_r, pf] = CASE1(A, B, C, D);
        cftool(P_r, efficiency);
        cftool(P_r, VR);
    case 2
        [efficiency, VR, P_r, pf] = CASE2(A, B, C, D);
        cftool(pf, efficiency(1:length(efficiency)/2));
        cftool(pf, VR(1:length(VR)/2));
        cftool(pf, efficiency(length(efficiency)/2+1:end));
        cftool(pf, VR(length(VR)/2+1:end));
end