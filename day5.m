% Day  5
clearvars
close all
clc

M = readlines('input_day5.txt');

f = find(M == '');

M1 = M(1:f(1)-1);
M2 = M(f(1)+1:f(2)-1);

fresh = 0;
fresh_ranges = [];

for i = 1:length(M2)
    for j = 1:length(M1)
        s = split(M1(j),'-');
        if isbetween(str2double(M2(i)),str2double(s(1)),str2double(s(2)))
            fresh = fresh + 1;
            break
        end
    end
end

for i = 1:length(M1)
    s = split(M1(i),'-');
    fresh_ranges(end+1,:) = [str2double(s(1)),str2double(s(2))];
end

sum_ranges = 0;
U = sort(fresh_ranges,1);

for i = 1:length(U)
    range = U(i,2)-U(i,1)+1;

    sum_ranges = sum_ranges + range;

    if i < length(U)
        if U(i,1) >= U(i+1,1)
            sum_ranges = sum_ranges - range;
        else
            if U(i,2) >= U(i+1,2)
                sum_ranges = sum_ranges - (U(i+1,2) - U(i+1,1) + 1);
            else
                if U(i,2) >= U(i+1,1)
                    sum_ranges = sum_ranges - (U(i,2) - U(i+1,1) + 1);
                end
            end
        end
    end
end


fprintf('Answer for part 1: %d \n',fresh)
fprintf('Answer for part 2: %d \n',sum_ranges)
