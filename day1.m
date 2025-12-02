%Day 1
clearvars
close all
clc

M = readlines("input_day1.txt");

x = 50;
V1 = 0;
V2 = 0;

for i = 1:length(M)-1
    X = char(M(i));
    Rot = X(1);
    num = str2double(X(2:end));
    if Rot == 'L'
        V2 = V2 + floor(abs(x-num)/100);
        if (x-num) <= 0 && x > 0
            V2 = V2 + 1;
        end
        x = mod(x-num,100);
    else
        V2 = V2 + floor((x+num)/100);
        x = mod(x+num,100);
    end

    if x == 0
        V1 = V1+1;
    end
end
V1
V2

