% Day 4
clearvars
close all
clc

M = readlines('input_day4.txt');
M = M(1:end-1);

x = 0;

for k = 1:72
    V = M;
    % Ylärivi
    s1 = split(M(1),'');
    s2 = split(M(2),'');
    [V,x] = ylaRivi(V,s1,s2,x);

    % Keskirivi
    for i = 2:length(M)-1
        s0 = split(M(i-1),'');
        s1 = split(M(i),'');
        s2 = split(M(i+1),'');
        [V,x] = keskiRivi(V,s0,s1,s2,x,i);
    end

    % Alarivi
    s2 = split(M(end-1),'');
    s1 = split(M(end),'');
    [V,x] = alaRivi(V,s1,s2,x);

    [rivit, jonot] = size(char(V));
    A = zeros([rivit,jonot]);

    for i = 1:rivit
        c = char(V(i));
        for j = 1:jonot
            if c(j) == '@'
                A(i,j) = 1;
            else
                A(i,j) = 0;
            end
        end
    end
    spy(A)
    drawnow
    M = V;
    if k == 1
        V1 = x;
    end
end
fprintf('Puzzle answer for part 1: %d \n', V1)
fprintf('Puzzle answer for part 2: %d', x)

function [M,x] = ylaRivi(M,s1,s2,x)
% s1 haku rivi
% s2 alempi rivi

s1 = s1(2:end-1);
s2 = s2(2:end-1);

c = char(M(1));

% Oikea yläreuna
oikea = s1(2);

ala_suora = s2(1);
ala_oikea = s2(2);


roll = sum([oikea == '@', ala_suora == '@', ala_oikea == '@']);
if roll < 4 && s1(1) == '@'
    x = x+1;
    c(1) = 'x';
end

% Kaikki paitsi reunat
for i = 2:length(s1)-1
    vasen = s1(i-1);
    oikea = s1(i+1);
    ala_vasen = s2(i-1);
    ala_suora = s2(i);
    ala_oikea = s2(i+1);
    roll = sum([vasen == '@', oikea == '@', ala_vasen == '@', ala_suora == '@', ala_oikea == '@']);
    if roll < 4 && s1(i) == '@'
        x = x+1;
            c(i) = 'x';
    end
end

% Vasen yläreuna
vasen = s1(end-1);

ala_suora = s2(end);
ala_vasen = s2(end-1);

roll = sum([vasen == '@', ala_suora == '@', ala_vasen == '@']);
if roll < 4 && s1(end) == '@'
    x = x+1;
    c(end) = 'x';
end

c = convertCharsToStrings(c);
M(1) = c;
end

function [M,x] = keskiRivi(M,s0,s1,s2,x, j)
% s0 ylempi rivi
% s1 haku rivi
% s2 alempi rivi
% j monennesko rivi matriisissa M

c = char(M(j));

s0 = s0(2:end-1);
s1 = s1(2:end-1);
s2 = s2(2:end-1);

% Oikea reuna
yla_suora = s0(1);
yla_oikea = s0(2);

oikea = s1(2);

ala_suora = s2(1);
ala_oikea = s2(2);

roll = sum([yla_suora == '@', yla_oikea == '@', oikea == '@', ala_suora == '@', ala_oikea == '@']);
if roll < 4 && s1(1) == '@'
    x = x+1;
    c(1) = 'x';
end

% Kaikki paitsi reunat
for i = 2:length(s1)-1
    yla_vasen = s0(i-1);
    yla_suora = s0(i);
    yla_oikea = s0(i+1);

    vasen = s1(i-1);
    oikea = s1(i+1);

    ala_vasen = s2(i-1);
    ala_suora = s2(i);
    ala_oikea = s2(i+1);
    roll = sum([yla_vasen == '@', yla_suora == '@', yla_oikea == '@', vasen == '@', oikea == '@', ala_vasen == '@', ala_suora == '@', ala_oikea == '@']);
    if roll < 4 && s1(i) == '@'
        x = x+1;
        c(i) = 'x';
    end
end

% Vasen reuna
yla_suora = s0(end);
yla_vasen = s0(end-1);

vasen = s1(end-1);

ala_suora = s2(end);
ala_vasen = s2(end-1);

roll = sum([yla_suora == '@', yla_vasen == '@', vasen == '@', ala_suora == '@', ala_vasen == '@']);
if roll < 4 && s1(end) == '@'
    x = x+1;
    c(end) = 'x';
end
c = convertCharsToStrings(c);
M(j) = c;
end

function [M,x] = alaRivi(M,s1,s2,x)
% s1 haku rivi
% s2 ylempi rivi

s1 = s1(2:end-1);
s2 = s2(2:end-1);

c = char(M(end));

% Oikea alareuna
yla_suora = s2(1);
yla_oikea = s2(2);

oikea = s1(2);

roll = sum([yla_suora == '@', yla_oikea == '@', oikea == '@']);
if roll < 4 && s1(1) == '@'
    x = x+1;
    c(1) = 'x';
end

% Kaikki paitsi reunat
for i = 2:length(s1)-1
    vasen = s1(i-1);
    oikea = s1(i+1);
    yla_vasen = s2(i-1);
    yla_suora = s2(i);
    yla_oikea = s2(i+1);
    roll = sum([vasen == '@', oikea == '@', yla_vasen == '@', yla_suora == '@', yla_oikea == '@']);
    if roll < 4 && s1(i) == '@'
        x = x+1;
        c(i) = 'x';
    end
end

% Vasen alareuna
vasen = s1(end-1);

yla_suora = s2(end);
yla_vasen = s2(end-1);

roll = sum([vasen == '@', yla_suora == '@', yla_vasen == '@']);
if roll < 4 && s1(end) == '@'
    x = x+1;
    c(end) = 'x';
end
c = convertCharsToStrings(c);
M(end) = c;
end