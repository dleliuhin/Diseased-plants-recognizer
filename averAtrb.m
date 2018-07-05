function averAtrb(hR,hG,hB,hRG,hRB,hGB,nhR,nhG,nhB,nhRG,nhRB,nhGB)
xlswrite('Results.xlsx', mean(hR.Contrast), 1, strcat('R',num2str(11)));
xlswrite('Results.xlsx', mean(nhR.Contrast), 1, strcat('S',num2str(11)));
xlswrite('Results.xlsx', mean(hR.Correlation), 1, strcat('R',num2str(12)));
xlswrite('Results.xlsx', mean(nhR.Correlation), 1, strcat('S',num2str(12)));
xlswrite('Results.xlsx', mean(hR.Energy), 1, strcat('R',num2str(13)));
xlswrite('Results.xlsx', mean(nhR.Energy), 1, strcat('S',num2str(13)));
xlswrite('Results.xlsx', mean(hR.Homogeneity), 1, strcat('R',num2str(14)));
xlswrite('Results.xlsx', mean(nhR.Homogeneity), 1, strcat('S',num2str(14)));

xlswrite('Results.xlsx', mean(hG.Contrast), 1, strcat('T',num2str(11)));
xlswrite('Results.xlsx', mean(nhG.Contrast), 1, strcat('U',num2str(11)));
xlswrite('Results.xlsx', mean(hG.Correlation), 1, strcat('T',num2str(12)));
xlswrite('Results.xlsx', mean(nhG.Correlation), 1, strcat('U',num2str(12)));
xlswrite('Results.xlsx', mean(hG.Energy), 1, strcat('T',num2str(13)));
xlswrite('Results.xlsx', mean(nhG.Energy), 1, strcat('U',num2str(13)));
xlswrite('Results.xlsx', mean(hG.Homogeneity), 1, strcat('T',num2str(14)));
xlswrite('Results.xlsx', mean(nhG.Homogeneity), 1, strcat('U',num2str(14)));

xlswrite('Results.xlsx', mean(hB.Contrast), 1, strcat('V',num2str(11)));
xlswrite('Results.xlsx', mean(nhB.Contrast), 1, strcat('W',num2str(11)));
xlswrite('Results.xlsx', mean(hB.Correlation), 1, strcat('V',num2str(12)));
xlswrite('Results.xlsx', mean(nhB.Correlation), 1, strcat('W',num2str(12)));
xlswrite('Results.xlsx', mean(hB.Energy), 1, strcat('V',num2str(13)));
xlswrite('Results.xlsx', mean(nhB.Energy), 1, strcat('W',num2str(13)));
xlswrite('Results.xlsx', mean(hB.Homogeneity), 1, strcat('V',num2str(14)));
xlswrite('Results.xlsx', mean(nhB.Homogeneity), 1, strcat('W',num2str(14)));

xlswrite('Results.xlsx', mean(hRG.Contrast), 1, strcat('X',num2str(11)));
xlswrite('Results.xlsx', mean(nhRG.Contrast), 1, strcat('Y',num2str(11)));
xlswrite('Results.xlsx', mean(hRG.Correlation), 1, strcat('X',num2str(12)));
xlswrite('Results.xlsx', mean(nhRG.Correlation), 1, strcat('Y',num2str(12)));
xlswrite('Results.xlsx', mean(hRG.Energy), 1, strcat('X',num2str(13)));
xlswrite('Results.xlsx', mean(nhRG.Energy), 1, strcat('Y',num2str(13)));
xlswrite('Results.xlsx', mean(hRG.Homogeneity), 1, strcat('X',num2str(14)));
xlswrite('Results.xlsx', mean(nhRG.Homogeneity), 1, strcat('Y',num2str(14)));

xlswrite('Results.xlsx', mean(hRB.Contrast), 1, strcat('Z',num2str(11)));
xlswrite('Results.xlsx', mean(nhRB.Contrast), 1, strcat('AA',num2str(11)));
xlswrite('Results.xlsx', mean(hRB.Correlation), 1, strcat('Z',num2str(12)));
xlswrite('Results.xlsx', mean(nhRB.Correlation), 1, strcat('AA',num2str(12)));
xlswrite('Results.xlsx', mean(hRB.Energy), 1, strcat('Z',num2str(13)));
xlswrite('Results.xlsx', mean(nhRB.Energy), 1, strcat('AA',num2str(13)));
xlswrite('Results.xlsx', mean(hRB.Homogeneity), 1, strcat('Z',num2str(14)));
xlswrite('Results.xlsx', mean(nhRB.Homogeneity), 1, strcat('AA',num2str(14)));

xlswrite('Results.xlsx', mean(hGB.Contrast), 1, strcat('AB',num2str(11)));
xlswrite('Results.xlsx', mean(nhGB.Contrast), 1, strcat('AC',num2str(11)));
xlswrite('Results.xlsx', mean(hGB.Correlation), 1, strcat('AB',num2str(12)));
xlswrite('Results.xlsx', mean(nhGB.Correlation), 1, strcat('AC',num2str(12)));
xlswrite('Results.xlsx', mean(hGB.Energy), 1, strcat('AB',num2str(13)));
xlswrite('Results.xlsx', mean(nhGB.Energy), 1, strcat('AC',num2str(13)));
xlswrite('Results.xlsx', mean(hGB.Homogeneity), 1, strcat('AB',num2str(14)));
xlswrite('Results.xlsx', mean(nhGB.Homogeneity), 1, strcat('AC',num2str(14)));
end