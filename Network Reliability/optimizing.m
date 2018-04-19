function [ t,c,card ] = optimizing( t,c ,A,print)
% Crude optimizer - Optimizing to fing the most reliable network.
% Inputs: incidence matrix, intial tree, chord dataset.
card = 10;
for i = 1:length(t)
    for j = 1:(length(c))
        fprintf('Iteration %d \n',i);
        temp = t(i);
        tree = logical(zeros(1,length(t)+length(c)));
        t(i) = c(j); 
        tree(t) = 1;
        chords = ~tree;
        if det(A(:,tree))~=0
            Cc = round(A(:,tree)\A(:,chords));
            Ct = eye(length(Cc));
            C1 = [Ct,Cc];   
            C = C1;
            C(:,chords) = C1(:,end-length(c)+1:end);
            C(:,tree) = C1(:,1:end-length(c));
            if (card>max(sum(C~=0,2)))
                c(j) = temp;
                if strcmp(print,'on')
                    fprintf('New spanning tree \n');
                
                    t
                    c
                end
                card =  max(sum(C~=0,2));
            else
                t(i) = temp;
            end

        else
            t(i) =temp;
        end
    end
 end
    



end

