

function [dataset, L]=CreaDataset(path)
d = dir(path);
subdirList = fullfile({d.folder}', {d.name}'); 
subdirList(~[d.isdir]) = []; %remove non-directories
subdirList=subdirList(3);
%Loop through subdirectories
dataset = cell(1, 660*2);  %20 files x 20 folders
c = 0;               %This is just a counter
for k = length(subdirList)
    filelist= dir(fullfile(subdirList{k}, '*.wav')); 
    % Loop through files
    for j = 1:size(filelist,1)
        c = c+1; 
        dataset{c} = audioread(fullfile(filelist(j).folder, filelist(j).name)); 
    end
end
L=length(dataset);
end