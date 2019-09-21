voice=readtable('voice.csv');
features=table2cell(voice(1:size(voice,1),1:size(voice,2)-1));
features=cell2mat(features);
n=0;
labelTrue=[linspace(1,1,(size(voice,1)/2)-n)';linspace(-1,-1,(size(voice,1)/2)+n)'];
features=[features,labelTrue];

L=size(features,1);
LT=ceil(0.9*L);
v=randperm(L-LT);

Score=ShowResults(features, v,L, LT);
