% Day 6
clearvars
close all
clc

S = readlines("input_day6.txt");
signs = char(erase(S(5),' '));

M = rmmissing(readmatrix('input_day6.txt'));

total1 = 0;
total2 = 0;

for i = 1:length(signs)
    if signs(i) == '*'
        total1 = total1 + prod(M(:,i));
    else
        total1 = total1 + sum(M(:,i));
    end
end

M = char(readlines('input_day6.txt'));
M = M(1:end-1,:);

jono1 = M(1,:);
jono2 = M(2,:);
jono3 = M(3,:);
jono4 = M(4,:);
signs = M(5,:);

list = [];

for i = length(signs):-1:1
    if ~isnan(str2double(strcat(jono1(i),jono2(i),jono3(i),jono4(i))))
        list(end+1) = str2double(strcat(jono1(i),jono2(i),jono3(i),jono4(i)));
    end
    if signs(i) == '*'
        total2 = total2 + prod(list);
        list = [];
    elseif signs(i) == '+'
        total2 = total2 + sum(list);
        list = [];
    end
end

fprintf('Answer for part 1: %d \n',total1)
fprintf('Answer for part 2: %d \n',total2)
