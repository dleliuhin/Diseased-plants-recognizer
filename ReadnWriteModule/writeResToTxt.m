function [resh, resnh] = writeResToTxt(fileres, stats, mean, imagename, atribute, count, resh, resnh)
    %R
    [res, count] = checkResultPercents(double(mean.h.R.Contrast), double(stats.R.Contrast(1)), double(mean.nh.R.Contrast), count);
    fprintf('%s | \t %d \t | %s | %2.4f  | %2.4f | %2.4f | %d \n', ...
        imagename, atribute, sprintf('R.Contrast    '), double(mean.h.R.Contrast), double(stats.R.Contrast(1)), double(mean.nh.R.Contrast), res);
    
    [res, count] = checkResultPercents(double(mean.h.R.Correlation), double(stats.R.Correlation(1)), double(mean.nh.R.Correlation), count);
    fprintf('\t\t\t\t\t | %s | %2.4f  | %2.4f | %2.4f | %d \n', ...
        sprintf('R.Correlation '), double(mean.h.R.Correlation), double(stats.R.Correlation(1)), double(mean.nh.R.Correlation), res);
    
    [res, count] = checkResultPercents(double(mean.h.R.Energy), double(stats.R.Energy(1)), double(mean.nh.R.Energy), count);
    fprintf('\t\t\t\t\t | %s | %2.4f  | %2.4f | %2.4f | %d \n', ...
        sprintf('R.Energy      '), double(mean.h.R.Energy), double(stats.R.Energy(1)), double(mean.nh.R.Energy), res);
    
    [res, count] = checkResultPercents(double(mean.h.R.Homogeneity), double(stats.R.Homogeneity(1)), double(mean.nh.R.Homogeneity), count);
    fprintf('\t\t\t\t\t | %s | %2.4f  | %2.4f | %2.4f | %d \n', ...
        sprintf('R.Homogeneity '), double(mean.h.R.Homogeneity), double(stats.R.Homogeneity(1)), double(mean.nh.R.Homogeneity), res);    
    
    %G
    [res, count] = checkResultPercents(double(mean.h.G.Contrast), double(stats.G.Contrast(1)), double(mean.nh.G.Contrast), count);
    fprintf('\t\t\t\t\t | %s | %2.4f  | %2.4f | %2.4f | %d \n', ...
        sprintf('G.Contrast    '), double(mean.h.G.Contrast), double(stats.G.Contrast(1)), double(mean.nh.G.Contrast), res);
    
    [res, count] = checkResultPercents(double(mean.h.G.Correlation), double(stats.G.Correlation(1)), double(mean.nh.G.Correlation), count);
    fprintf('\t\t\t\t\t | %s | %2.4f  | %2.4f | %2.4f | %d \n', ...
        sprintf('G.Correlation '), double(mean.h.G.Correlation), double(stats.G.Correlation(1)), double(mean.nh.G.Correlation), res);
    
    [res, count] = checkResultPercents(double(mean.h.G.Energy), double(stats.G.Energy(1)), double(mean.nh.G.Energy), count);
    fprintf('\t\t\t\t\t | %s | %2.4f  | %2.4f | %2.4f | %d \n', ...
        sprintf('G.Energy      '), double(mean.h.G.Energy), double(stats.G.Energy(1)), double(mean.nh.G.Energy), res);
    
    [res, count] = checkResultPercents(double(mean.h.G.Homogeneity), double(stats.G.Homogeneity(1)), double(mean.nh.G.Homogeneity), count);
    fprintf('\t\t\t\t\t | %s | %2.4f  | %2.4f | %2.4f | %d \n', ...
        sprintf('G.Homogeneity '), double(mean.h.G.Homogeneity), double(stats.G.Homogeneity(1)), double(mean.nh.G.Homogeneity), res);
    
    %B
    [res, count] = checkResultPercents(double(mean.h.B.Contrast), double(stats.B.Contrast(1)), double(mean.nh.B.Contrast), count);
    fprintf('\t\t\t\t\t | %s | %2.4f  | %2.4f | %2.4f | %d \n', ...
        sprintf('B.Contrast    '), double(mean.h.B.Contrast), double(stats.B.Contrast(1)), double(mean.nh.B.Contrast), res);
    
    [res, count] = checkResultPercents(double(mean.h.B.Correlation), double(stats.B.Correlation(1)), double(mean.nh.B.Correlation), count);
    fprintf('\t\t\t\t\t | %s | %2.4f  | %2.4f | %2.4f | %d \n', ...
        sprintf('B.Correlation '), double(mean.h.B.Correlation), double(stats.B.Correlation(1)), double(mean.nh.B.Correlation), res);
    
    [res, count] = checkResultPercents(double(mean.h.B.Energy), double(stats.B.Energy(1)), double(mean.nh.B.Energy), count);
    fprintf('\t\t\t\t\t | %s | %2.4f  | %2.4f | %2.4f | %d \n', ...
        sprintf('B.Energy      '), double(mean.h.B.Energy), double(stats.B.Energy(1)), double(mean.nh.B.Energy), res);
    
    [res, count] = checkResultPercents(double(mean.h.B.Homogeneity), double(stats.B.Homogeneity(1)), double(mean.nh.B.Homogeneity), count);
    fprintf('\t\t\t\t\t | %s | %2.4f  | %2.4f | %2.4f | %d \n', ...
        sprintf('B.Homogeneity '), double(mean.h.B.Homogeneity), double(stats.B.Homogeneity(1)), double(mean.nh.B.Homogeneity), res);
    
    %RG
    [res, count] = checkResultPercents(double(mean.h.RG.Contrast), double(stats.RG.Contrast(1)), double(mean.nh.RG.Contrast), count);
    fprintf('\t\t\t\t\t | %s | %2.4f  | %2.4f | %2.4f | %d \n', ...
        sprintf('RG.Contrast   '), double(mean.h.RG.Contrast), double(stats.RG.Contrast(1)), double(mean.nh.RG.Contrast), res);
    
    [res, count] = checkResultPercents(double(mean.h.RG.Correlation), double(stats.RG.Correlation(1)), double(mean.nh.RG.Correlation), count);
    fprintf('\t\t\t\t\t | %s | %2.4f  | %2.4f | %2.4f | %d \n', ...
        sprintf('RG.Correlation'), double(mean.h.RG.Correlation), double(stats.RG.Correlation(1)), double(mean.nh.RG.Correlation), res);
    
    [res, count] = checkResultPercents(double(mean.h.RG.Energy), double(stats.RG.Energy(1)), double(mean.nh.RG.Energy), count);
    fprintf('\t\t\t\t\t | %s | %2.4f  | %2.4f | %2.4f | %d \n', ...
        sprintf('RG.Energy     '), double(mean.h.RG.Energy), double(stats.RG.Energy(1)), double(mean.nh.RG.Energy), res);
    
    [res, count] = checkResultPercents(double(mean.h.RG.Homogeneity), double(stats.RG.Homogeneity(1)), double(mean.nh.RG.Homogeneity), count);
    fprintf('\t\t\t\t\t | %s | %2.4f  | %2.4f | %2.4f | %d \n', ...
        sprintf('RG.Homogeneity'), double(mean.h.RG.Homogeneity), double(stats.RG.Homogeneity(1)), double(mean.nh.RG.Homogeneity), res);
    
    %RB
    [res, count] = checkResultPercents(double(mean.h.RB.Contrast), double(stats.RB.Contrast(1)), double(mean.nh.RB.Contrast), count);
    fprintf('\t\t\t\t\t | %s | %2.4f  | %2.4f | %2.4f | %d \n', ...
        sprintf('RB.Contrast   '), double(mean.h.RB.Contrast), double(stats.RB.Contrast(1)), double(mean.nh.RB.Contrast), res);
    
    [res, count] = checkResultPercents(double(mean.h.RB.Correlation), double(stats.RB.Correlation(1)), double(mean.nh.RB.Correlation), count);
    fprintf('\t\t\t\t\t | %s | %2.4f  | %2.4f | %2.4f | %d \n', ...
        sprintf('RB.Correlation'), double(mean.h.RB.Correlation), double(stats.RB.Correlation(1)), double(mean.nh.RB.Correlation), res);
    
    [res, count] = checkResultPercents(double(mean.h.RB.Energy), double(stats.RB.Energy(1)), double(mean.nh.RB.Energy), count);
    fprintf('\t\t\t\t\t | %s | %2.4f  | %2.4f | %2.4f | %d \n', ...
        sprintf('RB.Energy     '), double(mean.h.RB.Energy), double(stats.RB.Energy(1)), double(mean.nh.RB.Energy), res);
    
    [res, count] = checkResultPercents(double(mean.h.RB.Homogeneity), double(stats.RB.Homogeneity(1)), double(mean.nh.RB.Homogeneity), count);
    fprintf('\t\t\t\t\t | %s | %2.4f  | %2.4f | %2.4f | %d \n', ...
        sprintf('RB.Homogeneity'), double(mean.h.RB.Homogeneity), double(stats.RB.Homogeneity(1)), double(mean.nh.RB.Homogeneity), res);
    
    %GB
    [res, count] = checkResultPercents(double(mean.h.GB.Contrast), double(stats.GB.Contrast(1)), double(mean.nh.GB.Contrast), count);
    fprintf('\t\t\t\t\t | %s | %2.4f  | %2.4f | %2.4f | %d \n', ...
        sprintf('GB.Contrast   '), double(mean.h.GB.Contrast), double(stats.GB.Contrast(1)), double(mean.nh.GB.Contrast), res);
    
    [res, count] = checkResultPercents(double(mean.h.GB.Correlation), double(stats.GB.Correlation(1)), double(mean.nh.GB.Correlation), count);
    fprintf('\t\t\t\t\t | %s | %2.4f  | %2.4f | %2.4f | %d \n', ...
        sprintf('GB.Correlation'), double(mean.h.GB.Correlation), double(stats.GB.Correlation(1)), double(mean.nh.GB.Correlation), res);
    
    [res, count] = checkResultPercents(double(mean.h.GB.Energy), double(stats.GB.Energy(1)), double(mean.nh.GB.Energy), count);
    fprintf('\t\t\t\t\t | %s | %2.4f  | %2.4f | %2.4f | %d \n', ...
        sprintf('GB.Energy     '), double(mean.h.GB.Energy), double(stats.GB.Energy(1)), double(mean.nh.GB.Energy), res);
    
    [res, count] = checkResultPercents(double(mean.h.GB.Homogeneity), double(stats.GB.Homogeneity(1)), double(mean.nh.GB.Homogeneity), count);
    fprintf('\t\t\t\t\t | %s | %2.4f  | %2.4f | %2.4f | %d \n', ...
        sprintf('GB.Homogeneity'), double(mean.h.GB.Homogeneity), double(stats.GB.Homogeneity(1)), double(mean.nh.GB.Homogeneity), res);
    
    hCountPercent = double((count.h)./24*100);
    nhCountPercent = double((count.nh)./24*100);
    if (hCountPercent > nhCountPercent)
        finalResult = 1;
        resh = resh + 1;
    elseif (hCountPercent < nhCountPercent)
        finalResult = 0;
        resnh = resnh + 1;
    elseif (hCountPercent == nhCountPercent)
        finalResult = 'undefined';
    end
    
    fprintf('Healthy: %3.2f%% , Ill: %3.2f%% , Verdict atribute: %s \n', hCountPercent, nhCountPercent, num2str(finalResult));
    fprintf('\n');
    
    clear finalResult hCountPercent nhCountPercent;
end