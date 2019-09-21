function [Score]=ShowResults(features, v, L, LT)
[kmin,ErroreMin,accuracy_knn]= kMIN(features,v,L,LT);
n=0;
labelTrue=[linspace(1,1,(size(features,1)/2)-n)';linspace(-1,-1,(size(features,1)/2)+n)'];
%% RISULTATI CON KERNEL LINEARE
%load model_linear
[modelL]= SVM_TrainingLinear(features,labelTrue, L, LT);
[accuracy_Linear]= SVM_Test(modelL,labelTrue, features, v, L, LT);

%% RISULTATI CON KERNEL RADIAL BASIS FUNCTION RBF (GAUSSIANO)
[modelRBF]= SVM_TrainingRBF(features,labelTrue, L,LT);
[accuracy_Gaussian]= SVM_Test(modelRBF,labelTrue, features,v, L, LT);

Score=table(accuracy_knn, accuracy_Linear,accuracy_Gaussian,'VariableNames',...
      {'Score_knn','Score_Kernel_Lineare','Score_Kernel_RBF'});
end