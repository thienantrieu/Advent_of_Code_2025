% Day 2
clearvars
close all
clc

M = readcell("input_day2.txt");

V1 = 0;
V2 = 0;

for i = 1:length(M)
    s = split(M(i),'-');
    for j = str2double(s(1)):str2double(s(2))
        n = num2str(j);

        % part 1
        if mod(length(n),2) == 0
            x = n(1:length(n)/2);
            y = n(1+length(n)/2:end);
            if  all([x == y, x(1) ~= '0', y(1) ~= '0'])
                    V1 = V1 + str2double(n);
            end
        end

        % part 2
        for k = 1:length(n)/2
            r = repmat(n(1:k),1,length(n));
            r = r(1:length(n));
            if all([r == n, r(1) ~= '0', n(1) ~= '0', mod(length(n),k) == 0])
                V2 = V2 + str2double(n);
                break
            end
        end
    end
end

fprintf('%d \n',V1)
fprintf('%d \n',V2)