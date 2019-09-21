function [kmin,ErroreMin,accuracy]= kMIN(features, v,L, LT)
for k=1:100
    XTrain=features((L-LT)/2:L-(L-LT)/2,1:size(features,2)-1);      % istances e labels per training
    YTrain=categorical(features((L-LT)/2:L-(L-LT)/2,size(features,2)));
    Xnew=XTrain(L/2,1:size(features,2)-1);      % istanza per training

    [Xnearest,Ynearest,distances] = find_knn(XTrain,YTrain,Xnew,k); % trova vicini


    %prediction

     YValTest=categorical([features(1:(L-LT)/2,size(features,2));features(L-(L-LT)/2:L,size(features,2))]); %labels e istances test e validation
     XValTest=[features(1:(L-LT)/2,1:size(features,2)-1);features(L-(L-LT)/2:L,1:size(features,2)-1)]; 

     %randomizzazione test e validation
      for i=1:(L-LT)
          XValTest(i,:)=XValTest(v(i),:);
          YValTest(i)=YValTest(v(i));
      end

       XTest=XValTest(1:(L-LT)/2,:); %istanze e label test
       YTest=YValTest(1:(L-LT)/2);
       XVal=XValTest((L-LT)/2:(L-LT),:); %istanze e label validation
       YVal=YValTest((L-LT)/2:(L-LT));

[label,accuracy] = predict_knn(XTrain,YTrain,XVal,k,YVal); %predict su validation

%conto degli errori commessi in fase di validazione
Errore(k)=0;   
for i=1:(L-LT)/2
    if label(i)~=YVal(i)
        Errore(k)=Errore(k)+1;
    end
end


end

kmin=find(Errore==min(Errore));
ErroreMin=min(Errore);

[label,accuracy] = predict_knn(XTrain,YTrain,XTest,kmin,YTest); %predict sul test con k ottimo

XTrainPlot=XTrain(:, 1:3);
XnewPlot=features(1,1:3);
plot_knn(XTrainPlot,YTrain,XnewPlot,kmin)
end

