function [features]=FeaturesExtraction(dataset_trasf, L)
dataset_ff=f0extraction(dataset_trasf, L);
for i=1:L
meanfrequency(i)=meanfreq(dataset_trasf{1,i}, 12000,[20 280])/length(dataset_trasf{1,i});
sd(i)=std(dataset_trasf{1,i});
median(i)=medfreq(dataset_trasf{1,i}, 12000, [20 280])/length(dataset_trasf{1,i});
Q25(i)=quantile(dataset_trasf{1,i},0.25);
Q75(i)=quantile(dataset_trasf{1,i},0.75);
IQR(i)=iqr(dataset_trasf{1,i});
skew(i)=skewness(dataset_trasf{1,i});
kurt(i)=kurtosis(dataset_trasf{1,i});
spent(i)=-sum((dataset_trasf{1,i}).^2.*log((dataset_trasf{1,i}).^2)./log((dataset_trasf{1,i}).^2));
sfm(i)=geomean(abs(dataset_trasf{1,i})/mean(abs(dataset_trasf{1,i})));
modefreq(i)=mode(dataset_trasf{1,i});
centroid(i)=sum(dataset_trasf{1,i}.*(dataset_trasf{1,i}).^2);
meanfun(i)= mean(dataset_ff{1,i});
minfun(i)=min(dataset_ff{1,i});
maxfun(i)=max(dataset_ff{1,i});
end
features=[meanfrequency; sd; median; Q25; Q75; IQR; skew; kurt; spent; sfm; modefreq; centroid; meanfun; minfun; maxfun];

features=features';

%% aggiunta delle labels

etichette=zeros(L,1);
etichette(1:L/2)=-1;
etichette(L/2:L)=1;
features=[features, etichette];
end
