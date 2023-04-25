function [type, efficiency, VR, P_r, pf] = linePerformance(A, B, C, D)
%linePerformance Summary of this function goes here
%   function plots line performance
formats = struct('type', {}, 'style', {}, 'items', {}, 'format', {}, 'limits', {}, 'size', {});
formats(1,1).type   = 'list';
formats(1,1).style = 'popupmenu';
formats(1,1).items  = {'1. CASE I: constant recieving power factor (0.8 lagging)',
                       '2. CASE II: constant recieving power (100 kW [full load])'};

value = inputsdlg('Transmission Line Model:: ', 'Midium Line', formats);
type = value{1};
switch type
    case 1
        [efficiency, VR, P_r, pf] = CASE1(A, B, C, D);
%          cftool(P_r, efficiency);
%          cftool(P_r, VR);
    case 2
        [efficiency, VR, P_r, pf] = CASE2(A, B, C, D);
%         cftool(pf, efficiency(1:length(efficiency)/2));
%         cftool(pf, VR(1:length(VR)/2));
%         cftool(pf, efficiency(length(efficiency)/2+1:end));
%         cftool(pf, VR(length(VR)/2+1:end));
end