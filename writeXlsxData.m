function writeXlsxData(fileName,i,stats)
xlswrite('Results.xlsx', fileName(i), 1, strcat('A',num2str(2+(i-1)*4)));

xlswrite('Results.xlsx', stats.R.Contrast, 1, strcat('C',num2str(2+(i-1)*4)));
xlswrite('Results.xlsx', stats.R.Correlation, 1, strcat('C',num2str(3+(i-1)*4)));
xlswrite('Results.xlsx', stats.R.Energy, 1, strcat('C',num2str(4+(i-1)*4)));
xlswrite('Results.xlsx', stats.R.Homogeneity, 1, strcat('C',num2str(5+(i-1)*4)));

xlswrite('Results.xlsx', stats.G.Contrast, 1, strcat('E',num2str(2+(i-1)*4)));
xlswrite('Results.xlsx', stats.G.Correlation, 1, strcat('E',num2str(3+(i-1)*4)));
xlswrite('Results.xlsx', stats.G.Energy, 1, strcat('E',num2str(4+(i-1)*4)));
xlswrite('Results.xlsx', stats.G.Homogeneity, 1, strcat('E',num2str(5+(i-1)*4)));

xlswrite('Results.xlsx', stats.B.Contrast, 1, strcat('G',num2str(2+(i-1)*4)));
xlswrite('Results.xlsx', stats.B.Correlation, 1, strcat('G',num2str(3+(i-1)*4)));
xlswrite('Results.xlsx', stats.B.Energy, 1, strcat('G',num2str(4+(i-1)*4)));
xlswrite('Results.xlsx', stats.B.Homogeneity, 1, strcat('G',num2str(5+(i-1)*4)));

xlswrite('Results.xlsx', stats.RG.Contrast, 1, strcat('I',num2str(2+(i-1)*4)));
xlswrite('Results.xlsx', stats.RG.Correlation, 1, strcat('I',num2str(3+(i-1)*4)));
xlswrite('Results.xlsx', stats.RG.Energy, 1, strcat('I',num2str(4+(i-1)*4)));
xlswrite('Results.xlsx', stats.RG.Homogeneity, 1, strcat('I',num2str(5+(i-1)*4)));

xlswrite('Results.xlsx', stats.RB.Contrast, 1, strcat('K',num2str(2+(i-1)*4)));
xlswrite('Results.xlsx', stats.RB.Correlation, 1, strcat('K',num2str(3+(i-1)*4)));
xlswrite('Results.xlsx', stats.RB.Energy, 1, strcat('K',num2str(4+(i-1)*4)));
xlswrite('Results.xlsx', stats.RB.Homogeneity, 1, strcat('K',num2str(5+(i-1)*4)));

xlswrite('Results.xlsx', stats.GB.Contrast, 1, strcat('M',num2str(2+(i-1)*4)));
xlswrite('Results.xlsx', stats.GB.Correlation, 1, strcat('M',num2str(3+(i-1)*4)));
xlswrite('Results.xlsx', stats.GB.Energy, 1, strcat('M',num2str(4+(i-1)*4)));
xlswrite('Results.xlsx', stats.GB.Homogeneity, 1, strcat('M',num2str(5+(i-1)*4)));
end