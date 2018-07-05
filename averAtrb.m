function averAtrb(h,nh)
xlswrite('Results.xlsx', mean(h.R.Contrast), 1, strcat('R',num2str(11)));
xlswrite('Results.xlsx', mean(nh.R.Contrast), 1, strcat('S',num2str(11)));
xlswrite('Results.xlsx', mean(h.R.Correlation), 1, strcat('R',num2str(12)));
xlswrite('Results.xlsx', mean(nh.R.Correlation), 1, strcat('S',num2str(12)));
xlswrite('Results.xlsx', mean(h.R.Energy), 1, strcat('R',num2str(13)));
xlswrite('Results.xlsx', mean(nh.R.Energy), 1, strcat('S',num2str(13)));
xlswrite('Results.xlsx', mean(h.R.Homogeneity), 1, strcat('R',num2str(14)));
xlswrite('Results.xlsx', mean(nh.R.Homogeneity), 1, strcat('S',num2str(14)));

xlswrite('Results.xlsx', mean(h.G.Contrast), 1, strcat('T',num2str(11)));
xlswrite('Results.xlsx', mean(nh.G.Contrast), 1, strcat('U',num2str(11)));
xlswrite('Results.xlsx', mean(h.G.Correlation), 1, strcat('T',num2str(12)));
xlswrite('Results.xlsx', mean(nh.G.Correlation), 1, strcat('U',num2str(12)));
xlswrite('Results.xlsx', mean(h.G.Energy), 1, strcat('T',num2str(13)));
xlswrite('Results.xlsx', mean(nh.G.Energy), 1, strcat('U',num2str(13)));
xlswrite('Results.xlsx', mean(h.G.Homogeneity), 1, strcat('T',num2str(14)));
xlswrite('Results.xlsx', mean(nh.G.Homogeneity), 1, strcat('U',num2str(14)));

xlswrite('Results.xlsx', mean(h.B.Contrast), 1, strcat('V',num2str(11)));
xlswrite('Results.xlsx', mean(nh.B.Contrast), 1, strcat('W',num2str(11)));
xlswrite('Results.xlsx', mean(h.B.Correlation), 1, strcat('V',num2str(12)));
xlswrite('Results.xlsx', mean(nh.B.Correlation), 1, strcat('W',num2str(12)));
xlswrite('Results.xlsx', mean(h.B.Energy), 1, strcat('V',num2str(13)));
xlswrite('Results.xlsx', mean(nh.B.Energy), 1, strcat('W',num2str(13)));
xlswrite('Results.xlsx', mean(h.B.Homogeneity), 1, strcat('V',num2str(14)));
xlswrite('Results.xlsx', mean(nh.B.Homogeneity), 1, strcat('W',num2str(14)));

xlswrite('Results.xlsx', mean(h.RG.Contrast), 1, strcat('X',num2str(11)));
xlswrite('Results.xlsx', mean(nh.RG.Contrast), 1, strcat('Y',num2str(11)));
xlswrite('Results.xlsx', mean(h.RG.Correlation), 1, strcat('X',num2str(12)));
xlswrite('Results.xlsx', mean(nh.RG.Correlation), 1, strcat('Y',num2str(12)));
xlswrite('Results.xlsx', mean(h.RG.Energy), 1, strcat('X',num2str(13)));
xlswrite('Results.xlsx', mean(nh.RG.Energy), 1, strcat('Y',num2str(13)));
xlswrite('Results.xlsx', mean(h.RG.Homogeneity), 1, strcat('X',num2str(14)));
xlswrite('Results.xlsx', mean(nh.RG.Homogeneity), 1, strcat('Y',num2str(14)));

xlswrite('Results.xlsx', mean(h.RB.Contrast), 1, strcat('Z',num2str(11)));
xlswrite('Results.xlsx', mean(nh.RB.Contrast), 1, strcat('AA',num2str(11)));
xlswrite('Results.xlsx', mean(h.RB.Correlation), 1, strcat('Z',num2str(12)));
xlswrite('Results.xlsx', mean(nh.RB.Correlation), 1, strcat('AA',num2str(12)));
xlswrite('Results.xlsx', mean(h.RB.Energy), 1, strcat('Z',num2str(13)));
xlswrite('Results.xlsx', mean(nh.RB.Energy), 1, strcat('AA',num2str(13)));
xlswrite('Results.xlsx', mean(h.RB.Homogeneity), 1, strcat('Z',num2str(14)));
xlswrite('Results.xlsx', mean(nh.RB.Homogeneity), 1, strcat('AA',num2str(14)));

xlswrite('Results.xlsx', mean(h.GB.Contrast), 1, strcat('AB',num2str(11)));
xlswrite('Results.xlsx', mean(nh.GB.Contrast), 1, strcat('AC',num2str(11)));
xlswrite('Results.xlsx', mean(h.GB.Correlation), 1, strcat('AB',num2str(12)));
xlswrite('Results.xlsx', mean(nh.GB.Correlation), 1, strcat('AC',num2str(12)));
xlswrite('Results.xlsx', mean(h.GB.Energy), 1, strcat('AB',num2str(13)));
xlswrite('Results.xlsx', mean(nh.GB.Energy), 1, strcat('AC',num2str(13)));
xlswrite('Results.xlsx', mean(h.GB.Homogeneity), 1, strcat('AB',num2str(14)));
xlswrite('Results.xlsx', mean(nh.GB.Homogeneity), 1, strcat('AC',num2str(14)));
end