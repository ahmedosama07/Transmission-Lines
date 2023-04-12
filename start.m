function [resistivity, length, diameter] = start()
    clc; 
    
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
end