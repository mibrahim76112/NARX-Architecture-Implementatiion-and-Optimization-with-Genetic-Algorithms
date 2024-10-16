
% Define sampling interval 
Ts=0.01;
% Check the data and indicate it by a integer number
totaldata=length(Input);

% Create Time -series starting from zero in the increment of Ts 
t=0:Ts:(totaldata-1)*Ts;
% Now create input and output time-series for testing the NN in simulink

zIn=[t' Input];

zOut=[t' Output];



% Now create initial input and feedback delays for NNET. This data should
% be after pre-processing and before post-processing and not on the actual
% Input and Output. You have to use same mean, std, min and max as used for
% creating the training data. Here Input can be different if same file is
% not used for testing and training.


% now use normalised input and output to create initial data for NNET

Indelay(3)=Inputn(3);
Indelay(2)=Inputn(2);
Indelay(1)=Inputn(1);


Outdelay(2)=Outputn(2);
Outdelay(1)=Outputn(1);

