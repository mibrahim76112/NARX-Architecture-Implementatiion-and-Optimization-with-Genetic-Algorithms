%Here we can call different ga functions 
%Call Examplega function where you want to optimise 2 varibales and
%passing 3 parameters a,b,c to the function

a = 4; b = 2.1; c = 4; NoVar=2;% Assign parameter values
f = @(x)Examplega2(x,a,b,c); % define function for ga
% call ga to optimise x
%option 1 with all default with minimum parameters you need to put 

%     [x,fval] = ga(f,NoVar)

%option 2 with lower and upper bound 
% x = ga(fun,nvars,A,b,Aeq,beq,lb,ub) 
% defines a set of lower and upper bounds on the design variables, 
% x, so that a solution is found in the range lb < x < ub. 
% (Set Aeq=[] and beq=[] if no linear equalities exist.)
% 
%     lb=[-0.1, -1];
%     ub=[0.1, 1];
%     [x,fval] = ga(f,NoVar,[],[],[],[],lb,ub)

%option 3 with some plotting for the above
% x = ga(fun,nvars,A,b,Aeq,beq,lb,ub,nonlcon,options) 
% minimizes with the default optimization parameters replaced 
% by values in options. (Set nonlcon=[] if no nonlinear 
% constraints exist.) Create options using optimoptions.
%all varibles should be within -1 and +1

xi =[-0.0898    0.7127]; %initial population for one chromosome
lb=[-1];
ub=[1];
options = optimoptions('ga',...
    'PlotFcn', @gaplotbestf,...
    'PopulationSize',200,...
    'InitialPopulationMatrix',xi);
[x,fval] = ga(f,NoVar,[],[],[],[],lb,ub,[],options)