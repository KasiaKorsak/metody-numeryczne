% pierwszy argument - dla niego bedzie obliczane przyspieszenie
% drugi argument - potrzebny do obliczenia r
function [a] = acc(x,y)
GM = 4*pi^2;
r = sqrt(x^2+y^2);
a = -(GM/r^3)*x;
end