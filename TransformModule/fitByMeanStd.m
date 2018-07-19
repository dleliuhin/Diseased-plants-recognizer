function [f,edges,num]=fitByMeanStd(f,edges,num,typeApproximation,coefStd)

fitmean = mean(num);
fitstd = std(num);

[f,edges,num] = fitIncremention(f,edges,num,fitmean,fitstd,typeApproximation,coefStd);

fitmean = []; fitstd = [];
end