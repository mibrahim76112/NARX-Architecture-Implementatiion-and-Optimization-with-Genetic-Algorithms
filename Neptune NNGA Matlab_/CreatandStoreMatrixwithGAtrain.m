%Here you can store all trained weights and biases in the matrix and can
%use it for any other purpose in future - making dedicated neuro chips or
%futher optimising the weight and bias values by using any optimisation
%techniques

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
format long;

%Create all above from x which is optimised weights from ga

k=1;
for i=1:nh
    for j=1:d1
        IW11ga(i,j)=W(k);
        k=k+1;
    end
end
for i=1:nh
    for j=1:d2
        LW12ga(i,j)=W(k);
        k=k+1;
    end
end
for i=1:nh
    b1ga(i)=W(k);
    k=k+1;
end
for i=1:no
    for j=1:nh
        LW21ga(i,j)=W(k);
        k=k+1;
    end
end
for i=1:no
    b2ga(i)=W(k);
    k=k+1;
end
