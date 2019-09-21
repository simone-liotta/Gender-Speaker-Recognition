function [dataset_trasf]=PreProcessing(dataset, L)
%% decimazione, filtro, eliminazione silenzio, dct
b=[1 0.95];
a=[1 0];    %valori per il filtro
SR=12000; % costruzione gaussiana
fco=50;
g=gaussfiltcoef(SR,fco);
x=0; 
for i=1:L
    for n=1:length(dataset{1,i})/4
        dataset_dec{1,i}(n)=dataset{1,i}(4*n);  %decimazione
    end
    dataset_fil{1,i}=filter(b,a,dataset_dec{1,i});  %creazione del filtro
    
    dataset_sil{1,i}=dataset_fil{1,i}; %segnale con silenzio
    
    dataset_sil{1,i}=conv(dataset_sil{1,i}, g); %eliminazione silenzio
      q=dataset_sil{1,i}; %calcolo varianza e sogliatura
    varianza(i)=var(q);
      for n=1:length(dataset_sil{1,i})
        if dataset_sil{1,i}(n)>varianza(i)
          dataset_freesil{1,i}(n-x)=dataset_sil{1,i}(n);
        else
            x=x+1;
        end 
    end
    x=0;
    
    dataset_trasf{1,i}=dct(10*log10(dataset_freesil{1,i})); %dct
end

% figure,stem(dataset_sil{1,1})
% figure,stem(dataset_fil{1,1})
% figure,stem(b)
end
















