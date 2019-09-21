function [accuracy]= SVM_Test(model,labelTrue, features,v, L, LT) 
YValTest=[labelTrue(1:(L-LT)/2);labelTrue((L-(L-LT)/2)+1:L)];
XValTest=[features(1:(L-LT)/2,1:size(features,2)-1);features((L-(L-LT)/2)+1:L,1:size(features,2)-1)]; 
%randomizzazione test e validation
for i=1:(L-LT)
   XValTest(i,:)=XValTest(v(i),:);
   YValTest(i)=YValTest(v(i));
end
testing_instance_matrix=XValTest(1:(L-LT)/2,:); %istanze e label test
testing_label_vector=YValTest(1:(L-LT)/2);

XVal=XValTest((L-LT)/2:(L-LT),:); %istanze e label validation
YVal=YValTest((L-LT)/2:(L-LT));

[labelPred] = predict(model,testing_instance_matrix);
%[predicted_label, accuracy, prob_estimates] = svmpredict(testing_label_vector, testing_instance_matrix, model);
table(testing_label_vector,labelPred,'VariableNames',...
     {'TrueLabel','PredictedLabel'});
 x=0;
 for i=1:(L-LT)/2
     if testing_label_vector(i)== labelPred(i)
         x=x+1;
     end
 end
 accuracy= (x/((L-LT)/2));
end