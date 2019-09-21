path='/Users/veronicaera/Desktop/sistemi_biom_prog/parte2/dataset_voci';
[dataset, L]=CreaDataset(path);
dataset_trasf=PreProcessing(dataset,L);
features=FeaturesExtraction(dataset_trasf, L);
LT=0.9*L;
v=randperm(L-LT);
Score=ShowResults(features, v,L, LT);
