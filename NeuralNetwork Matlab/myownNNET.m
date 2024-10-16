% This function will need input of initial data plus parameters
function [NNET]=myownNNET(d1,d2,start,ndata, Un,H,IW11,LW12,b1,LW21,b2)

% prepare initial input and layer data

for i=start:ndata % total number of data
    
    % Creating inputs to the NN model
    for k=1:d1
        
        X1(k)=Un(i-k);
        
    end
    
    for k=1:d2
        X2(k)=H(i-k);
    end
    
    %pass information from input to hidden neuron
    
    %forward pass
    Xh=tanh(IW11*X1'+LW12*X2'+b1);
    
    H(i)=LW21*Xh+b2;
    
    
end % end i
NNET=H;
end % end for function

