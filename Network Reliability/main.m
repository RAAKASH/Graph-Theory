%% Graph theory.
clc 
clear
close all
%% Paper graph
A = zeros(6,8);
A(1,1) = 1;A(1,[8,6]) = -1;
A(2,2) = 1;A(2,1) = -1;
A(3,3) = 1;A(3,2) = -1;
A(4,[4,5]) = 1;A(4,3) = -1;
A(5,4) = -1;A(5,[8,7]) = 1;
A(6,6) = 1;A(6,[7,5]) = -1;
A = A(1:end-1,:);

c = [1,4,6];
t = [2,3,5,7,8];

%% Homework graph
A = zeros(11,16);
A(1,[2,13]) = 1;A(1,1) = -1;
A(2,2) = -1; A(2,3) = 1;
A(3,[4,5,6,7]) = 1;A(3,3) = -1;
A(4,8) = 1;A(4,[4,14]) = -1;
A(5,5) = -1;A(5,15) = 1;
A(6,6) = -1;A(6,9) = 1;
A(7,7) = -1;A(7,10) = 1;
A(8,8) = -1;A(8,11) = 1;
A(9,9) = -1;A(9,12) = 1;
A(10,10) = -1; A(10,16) = 1;
A(11,[11,15,12,13,16]) = -1;A(11,[1,14]) = 1;
A = A(1:end-1,:);
c = [2,5,6,7,14,1];
t = [3,4,8,9,10,11,12,13,15,16];


iter = 0;
while iter <1000
[ t,c ,card] = optimizing( t,c,A ,'off');
iter = iter+1;
end
fprintf('reliability = %d\n',0.9^(card-1))