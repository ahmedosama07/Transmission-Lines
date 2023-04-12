function [L, C] = cal_inductance_capactance(radius, length)
    fprintf('Please enter the number corresponding to your choice\n1-Symetrical system\n2-Unsymetrical system\n');
    choice = input('Choice: ');
    GMR = radius * exp(-0.25);
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
end 