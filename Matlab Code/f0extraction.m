
function dataset_ff=f0extraction(dataset_trasf,L)
for i=1:L
    dataset_freex{1,i}=dataset_trasf{1,i};
    [Q,R]=quorem(sym(length(dataset_freex{1,i})),sym(256));
    if double(R)~=0
     dataset_freex{1,i}=dataset_freex{1,i}(1:256*double(Q));
    end
    
    for n=0:double(Q)-1
    dataset_ff{1,i}(n+1)=max((abs(real(dataset_freex{1,i}(1+256*n:256*(n+1))))).^2);
    end

end
end