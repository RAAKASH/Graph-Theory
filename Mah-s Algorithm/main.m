clc 
clear 
close all

Data = 'HW';

%% HW dataset
A = zeros(11);
if strcmp(Data, 'HW')
A(1,6) = 1;
A(2,8) = 1;
A(3,[4,8]) = 1;
A(4,2) = 1;
A(5,9) = 1;
A(6,7) = 1;
A(7,[1,8,11]) = 1;
A(8,4) = 1;
A(9,[3,10]) = 1;
A(10,[4,5,7]) = 1;
A(11,[1,2]) = 1;
end
%% Paper Dataset
if  strcmp(Data,'Paper')
A = zeros(7);
A(1,[1,3]) = 1;
A(2,[1,3,5]) = 1;
A(3,1) = 1;
A(4,[1,2,3,5]) = 1;
A(5,[1,2,3,4,5]) = 1;
A(6,[1,3,4]) = 1;
A(7,[4,5,6]) = 1;
end
%% Mah's algorithm
C = A;
m = size(A) ;
for i = 1:m
    m = find(C(:,i)==1);
    n = find(C(i,:)==1);
    for j = m
        for k = n
            C(j,k)  = 1;
        end
    end
end
[~,iter] = sort(sum(C),'descend');
C = C(iter,:);
C = C(:,iter);
groups = char(iter + 64);