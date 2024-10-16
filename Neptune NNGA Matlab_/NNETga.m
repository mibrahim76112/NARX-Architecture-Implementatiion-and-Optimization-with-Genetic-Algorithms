
function y=NNETga(W,d1,d2,nh,no,U,H)

%You can also create your own NN script here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% We can use the same notation as inside function all notations are local
% to this function only and will not effect any parameter with the same
% notation in Workspace which only shows the global variable in the Matlab
% environment which can be used by any toolboxes/applications
%IW11- nh*d1
%LW12- nh*d2
%b1 - nh*1
%LW21- nout*nh
%b2- nout*1
%Create all above from W

k=1;
for i=1:nh
    for j=1:d1
        IW11(i,j)=W(k);
        k=k+1;
    end
end
for i=1:nh
    for j=1:d2
        LW12(i,j)=W(k);
        k=k+1;
    end
end
for i=1:nh
    b1(i)=W(k);
    k=k+1;
end
for i=1:no
    for j=1:nh
        LW21(i,j)=W(k);
        k=k+1;
    end
end
for i=1:no
    b2(i)=W(k);
    k=k+1;
end



% prepare initial input and layer data

if(d1>d2)
    start=d1+1;
else
    start=d2+1;
end


ndata=length(U);

Y=H; %capture original output here

for i=start:ndata % total number of data
    
    % Creating inputs to the NN model
    for k=1:d1
        
        X1(k)=U(i-k);
        
    end
    
    for k=1:d2
        X2(k)=H(i-k);
    end
    
    %pass information from input to hidden neuron
    
    %forward pass
    Xh=tanh(IW11*X1'+LW12*X2'+b1');
    
    H(i)=LW21*Xh+b2;
    
    
end % end i

e=H-Y;
y=mse(e);
end %for function