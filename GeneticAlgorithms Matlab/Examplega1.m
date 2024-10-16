%Here you are defining a ga function which takes variables which you want to optimise 
% x here to compute the function value. The function output should be minimised
%Function name should be the name of the file (i.e
% Examplega1 here)

function y= Examplega1(x)
y = 100*(x(1)^2 - x(2))^2 + (1 - x(1))^2;
end