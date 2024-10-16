
% Define sampling interval 
Ts=0.001;
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



Un=Inputn;
Yn=Outputn;



%here preparing the input and feedback initial delays in the format
%required by NNET
Un=con2seq(Un');
Yn=con2seq(Yn');
[pi,Uni,Yni] = preparets(netc,Un,{},Yn);
%Now Uni is the input initial delays and Yni is the feedback initial delays
% now set the NARX Neural Network in NNModelCloseStoreMatrixWithNN
%Make sure that the SysName is exactly same as the name of the 
%simulink file where NNET is and the NetName is the name of the NNET

SysName='NNModelClose';
NetName='NARX Neural Network';

setsiminit(SysName,NetName,netc,Uni,Yni,1);
