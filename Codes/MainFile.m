% Mainfile to run
clear all; clc;

% Load input data
load Example1;
figure;
imshow( reshape(xtilde,l,L) );
title('Image floutée et bruitée');

%Choose parameter and solve problem
lambda = 1e-10;
x = deblurr(A,xtilde,lambda);

figure
imshow( reshape(x,l,L) );
title('Image défloutée');

