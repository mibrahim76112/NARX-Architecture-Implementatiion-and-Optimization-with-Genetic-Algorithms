%Here you will create a simulink NNET with the trained weights and biases.
% Below command also initilises the NNET

%save the trained NNET in case you want to use other day then you do not
%need to run the programme again then just double click on ModelClose and
%all parameters associated with netc will appear again on Workspace. Now
%test is by wrting >>clear all in command line which erases everything 
% from Workspace then double clicking on ModelClose 

 ModelClose=netc;
 save ModelClose;
format long;

%  %trained weights and biases

  IW11=netc.IW{1,1};
  LW12= netc.LW{1,2};
  b1=netc.b{1};
  LW21= netc.LW{2,1};
  b2= netc.b{2};
    


