features2=importdata('featuresdct.mat');
n=0;
labelTrue=[linspace(1,1,(size(features2,1)/2)-n)';linspace(-1,-1,(size(features2,1)/2)+n)'];
v=randperm(132);



%% RISULTATI CON KERNEL LINEARE
%load model_linear
[modelL]= SVM_TrainingLinear(features2,labelTrue);
[accuracy_Linear]= SVM_Test(modelL,labelTrue, features2, v);

%% RISULTATI CON KERNEL RADIAL BASIS FUNCTION RBF (GAUSSIANO)
[modelRBF]= SVM_TrainingRBF(features2,labelTrue);
[accuracy_Gaussian]= SVM_Test(modelRBF,labelTrue, features2,v);

 table(accuracy_Linear,accuracy_Gaussian,'VariableNames',...
      {'Score_Kernel_Lineare','Score_Kernel_RBF'})