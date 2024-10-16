%Normalise input and output data set within +-1 and save in Inputn and
% Outputn
% after removing mean plus standarisation for better training
%load datafile and store it as Input and Output
%load the input file you want to model and return Input and Output
File=xlsread('Test3.csv');
%now we know that first column is SP and third column is TPA
% we want to create a model between SP and TPA
% define it as Input and Output
Input=File(:,1);
Output=File(:,3);

%now normalise Input and Output for Neural Network Training

meanIn=mean(Input);
stdIn=std(Input);
Inputstd=(Input-meanIn)/stdIn; % standarised input after taking out mean and dividing by std

minIn=min(Inputstd); maxIn=max(Inputstd);
mIn=2/(maxIn-minIn);
cIn=1-mIn*maxIn;
Inputn=mIn*Inputstd+cIn; % this will produce input witin +1 and -1

% similarly normalise output data
meanOut=mean(Output);
stdOut=std(Output);
Outputstd=(Output-meanOut)/stdOut;

minOut=min(Outputstd); maxOut=max(Outputstd);
mOut=2/(maxOut-minOut);
cOut=1-mOut*maxOut;
Outputn=mOut*Outputstd+cOut;
