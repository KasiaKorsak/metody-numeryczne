function [dxdt] = kepler(t, xy)
GM = 4*pi^2;
dxdt = [xy(2);-(GM/sqrt(xy(1)^2+xy(3)^2)^3)*xy(1);xy(4);-(GM/sqrt(xy(3)^2+xy(1)^2)^3)*xy(3)];
end