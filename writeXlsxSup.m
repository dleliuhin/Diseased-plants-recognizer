function sup=writeXlsxSup(numbns,h,nh)

xlswrite('Result/Results.xlsx', numbns, 1, strcat('R',num2str(1)));
sup.R.Contrast = findsupremum(h.R.Contrast,nh.R.Contrast,numbns);
xlswrite('Result/Results.xlsx', sup.R.Contrast, 1, strcat('R',num2str(3)));
sup.R.Correlation = findsupremum(h.R.Correlation,nh.R.Correlation,numbns);
xlswrite('Result/Results.xlsx', sup.R.Correlation, 1, strcat('R',num2str(4)));
sup.R.Energy = findsupremum(h.R.Energy,nh.R.Energy,numbns);
xlswrite('Result/Results.xlsx', sup.R.Energy, 1, strcat('R',num2str(5)));
sup.R.Homogeneity = findsupremum(h.R.Homogeneity,nh.R.Homogeneity,numbns);
xlswrite('Result/Results.xlsx', sup.R.Homogeneity, 1, strcat('R',num2str(6)));

sup.G.Contrast = findsupremum(h.G.Contrast,nh.G.Contrast,numbns);
xlswrite('Result/Results.xlsx', sup.G.Contrast, 1, strcat('T',num2str(3)));
sup.G.Correlation = findsupremum(h.G.Correlation,nh.G.Correlation,numbns);
xlswrite('Result/Results.xlsx', sup.G.Correlation, 1, strcat('T',num2str(4)));
sup.G.Energy = findsupremum(h.G.Energy,nh.G.Energy,numbns);
xlswrite('Result/Results.xlsx', sup.G.Energy, 1, strcat('T',num2str(5)));
sup.G.Homogeneity = findsupremum(h.G.Homogeneity,nh.G.Homogeneity,numbns);
xlswrite('Result/Results.xlsx', sup.G.Homogeneity, 1, strcat('T',num2str(6)));

sup.B.Contrast = findsupremum(h.B.Contrast,nh.B.Contrast,numbns);
xlswrite('Result/Results.xlsx', sup.B.Contrast, 1, strcat('V',num2str(3)));
sup.B.Correlation = findsupremum(h.B.Correlation,nh.B.Correlation,numbns);
xlswrite('Result/Results.xlsx', sup.B.Correlation, 1, strcat('V',num2str(4)));
sup.B.Energy = findsupremum(h.B.Energy,nh.B.Energy,numbns);
xlswrite('Result/Results.xlsx', sup.B.Energy, 1, strcat('V',num2str(5)));
sup.B.Homogeneity = findsupremum(h.B.Homogeneity,nh.B.Homogeneity,numbns);
xlswrite('Result/Results.xlsx', sup.B.Homogeneity, 1, strcat('V',num2str(6)));

sup.RG.Contrast = findsupremum(h.RG.Contrast,nh.RG.Contrast,numbns);
xlswrite('Result/Results.xlsx', sup.RG.Contrast, 1, strcat('X',num2str(3)));
sup.RG.Correlation = findsupremum(h.RG.Correlation,nh.RG.Correlation,numbns);
xlswrite('Result/Results.xlsx', sup.RG.Correlation, 1, strcat('X',num2str(4)));
sup.RG.Energy = findsupremum(h.RG.Energy,nh.RG.Energy,numbns);
xlswrite('Result/Results.xlsx', sup.RG.Energy, 1, strcat('X',num2str(5)));
sup.RG.Homogeneity = findsupremum(h.RG.Homogeneity,nh.RG.Homogeneity,numbns);
xlswrite('Result/Results.xlsx', sup.RG.Homogeneity, 1, strcat('X',num2str(6)));

sup.RB.Contrast = findsupremum(h.RB.Contrast,nh.RB.Contrast,numbns);
xlswrite('Result/Results.xlsx', sup.RB.Contrast, 1, strcat('Z',num2str(3)));
sup.RB.Correlation = findsupremum(h.RB.Correlation,nh.RB.Correlation,numbns);
xlswrite('Result/Results.xlsx', sup.RB.Correlation, 1, strcat('Z',num2str(4)));
sup.RB.Energy = findsupremum(h.RB.Energy,nh.RB.Energy,numbns);
xlswrite('Result/Results.xlsx', sup.RB.Energy, 1, strcat('Z',num2str(5)));
sup.RB.Homogeneity = findsupremum(h.RB.Homogeneity,nh.RB.Homogeneity,numbns);
xlswrite('Result/Results.xlsx', sup.RB.Homogeneity, 1, strcat('Z',num2str(6)));

sup.GB.Contrast = findsupremum(h.GB.Contrast,nh.GB.Contrast,numbns);
xlswrite('Result/Results.xlsx', sup.GB.Contrast, 1, strcat('AB',num2str(3)));
sup.GB.Correlation = findsupremum(h.GB.Correlation,nh.GB.Correlation,numbns);
xlswrite('Result/Results.xlsx', sup.GB.Correlation, 1, strcat('AB',num2str(4)));
sup.GB.Energy = findsupremum(h.GB.Energy,nh.GB.Energy,numbns);
xlswrite('Result/Results.xlsx', sup.GB.Energy, 1, strcat('AB',num2str(5)));
sup.GB.Homogeneity = findsupremum(h.GB.Homogeneity,nh.GB.Homogeneity,numbns);
xlswrite('Result/Results.xlsx', sup.GB.Homogeneity, 1, strcat('AB',num2str(6)));

end