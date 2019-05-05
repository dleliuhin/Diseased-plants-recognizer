function [iStruct] = checkStatsNan(iStruct)
%Function which check if the each Stats value is NaN
%and set value to 0.

%--------------R-Stats-----------
iStruct.R.Contrast(isnan(iStruct.R.Contrast)) = 0;
iStruct.R.Correlation(isnan(iStruct.R.Correlation))=0;
iStruct.R.Energy(isnan(iStruct.R.Energy))=0;
iStruct.R.Homogeneity(isnan(iStruct.R.Homogeneity))=0;

%--------------G-Stats-----------
iStruct.G.Contrast(isnan(iStruct.G.Contrast))=0;
iStruct.G.Correlation(isnan(iStruct.G.Correlation))=0;
iStruct.G.Energy(isnan(iStruct.G.Energy))=0;
iStruct.G.Homogeneity(isnan(iStruct.G.Homogeneity))=0;

%--------------B-Stats-----------
iStruct.B.Contrast(isnan(iStruct.B.Contrast))=0;
iStruct.B.Correlation(isnan(iStruct.B.Correlation))=0;
iStruct.B.Energy(isnan(iStruct.B.Energy))=0;
iStruct.B.Homogeneity(isnan(iStruct.B.Homogeneity))=0;

%--------------RG-Stats-----------
iStruct.RG.Contrast(isnan(iStruct.RG.Contrast))=0;
iStruct.RG.Correlation(isnan(iStruct.RG.Correlation))=0;
iStruct.RG.Energy(isnan(iStruct.RG.Energy))=0;
iStruct.RG.Homogeneity(isnan(iStruct.RG.Homogeneity))=0;

%--------------RB-Stats-----------
iStruct.RB.Contrast(isnan(iStruct.RB.Contrast))=0;
iStruct.RB.Correlation(isnan(iStruct.RB.Correlation))=0;
iStruct.RB.Energy(isnan(iStruct.RB.Energy))=0;
iStruct.RB.Homogeneity(isnan(iStruct.RB.Homogeneity))=0;

%--------------GB-Stats-----------
iStruct.GB.Contrast(isnan(iStruct.GB.Contrast))=0;
iStruct.GB.Correlation(isnan(iStruct.GB.Correlation))=0;
iStruct.GB.Energy(isnan(iStruct.GB.Energy))=0;
iStruct.GB.Homogeneity(isnan(iStruct.GB.Homogeneity))=0;

end 