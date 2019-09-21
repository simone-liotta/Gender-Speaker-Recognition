function [model]= SVM_TrainingRBF(features,labelTrue, L, LT) 
r_start=((L-LT)/2)+1;
r_end=L-(L-LT)/2;
c_end=size(features,2)-1;
training_instance_matrix=features(r_start:r_end,1:c_end);      % istances e labels per training
training_label_vector=(labelTrue(r_start:r_end));
model = fitcsvm(training_instance_matrix, training_label_vector, 'Standardize',true,'KernelFunction','gaussian',...
    'KernelScale','auto'); %se cambi kernel vedrai risultati diversi, ora la funzione di decisione è gaussiana,
                          %se la metti lineare vedrai risultati peggiori                       
end