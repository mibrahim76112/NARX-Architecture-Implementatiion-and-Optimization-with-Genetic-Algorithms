%Here you are defining a ga function which takes variables which you want to optimise 
% x here with three extra parameters a,b,c which you are just passing 
% to compute the function value. The function output should be minimising 
% some function. Function name should be the name of the file (i.e
% Examplega2 here)

function y= Examplega2(x,a,b,c)
y = (a - b*x(1)^2 + x(1)^4/3)*x(1)^2 + x(1)*x(2) + ...
    (-c + c*x(2)^2)*x(2)^2;
end