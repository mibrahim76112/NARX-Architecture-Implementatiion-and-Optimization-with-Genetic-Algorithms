
% Initialise the parameters before calling ga function

NoVar=nh*d1+nh*d2+nh+no*nh+no;
NoPop=20;%this is the total population in ga minimum should be 20
NoGen=100;% number of generations in ga
%create an initial weights and biases which is solved through NN training

k=1;
for i=1:nh
    for j=1:d1
        Wi(k)=IW11(i,j);
        k=k+1;
    end
end
for i=1:nh
    for j=1:d2
        Wi(k)=LW12(i,j);
        k=k+1;
    end
end
for i=1:nh
    Wi(k)=b1(i);
    k=k+1;
end
for i=1:no
    for j=1:nh
        Wi(k)=LW21(i,j);
        k=k+1;
    end
end
for i=1:no
    Wi(k)=b2(i);
    k=k+1;
end
%Above command produce a single chromosome with the trained weights and
%biases in a row 


% below is the lower an dupper bound for searching new weights and biases 
% the range is selcted between -2 and +2 because NN also randomly assigned
% the range of weights and biases between -2 and +2. This is an initial
% guess but can be changed to some other numbers but should mostly work in
% this range

lb=[-2];%Lower bound of the search region
ub=[2];%Upper bound of the search region

%now call the ga to optimise the weights of NN
f = @(W)NNETga(W,d1,d2,nh,no,Inputn,Outputn); % define function for ga 
options = optimoptions('ga','PlotFcn', @gaplotbestf,...
    'PopulationSize',NoPop,...
    'InitialPopulationMatrix',Wi,...
    'FunctionTolerance',0,...
    'MaxGenerations',NoGen,...
    'EliteCount',2,...
    'MaxStallGenerations', NoGen);
[W,fval] = ga(f,NoVar,[],[],[],[],lb,ub,[],[],options);