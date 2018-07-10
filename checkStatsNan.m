function [h,nh] = checkStatsNan(h,nh)
%Function which check if the each Stats value is NaN
%and set value to 0.

%--------------R-Stats-----------
h.R.Contrast(isnan(h.R.Contrast))=0;
h.R.Correlation(isnan(h.R.Correlation))=0;
h.R.Energy(isnan(h.R.Energy))=0;
h.R.Homogeneity(isnan(h.R.Homogeneity))=0;

nh.R.Contrast(isnan(nh.R.Contrast))=0;
nh.R.Correlation(isnan(nh.R.Correlation))=0;
nh.R.Energy(isnan(nh.R.Energy))=0;
nh.R.Homogeneity(isnan(nh.R.Homogeneity))=0;
%--------------G-Stats-----------
h.G.Contrast(isnan(h.G.Contrast))=0;
h.G.Correlation(isnan(h.G.Correlation))=0;
h.G.Energy(isnan(h.G.Energy))=0;
h.G.Homogeneity(isnan(h.G.Homogeneity))=0;

nh.G.Contrast(isnan(nh.G.Contrast))=0;
nh.G.Correlation(isnan(nh.G.Correlation))=0;
nh.G.Energy(isnan(nh.G.Energy))=0;
nh.G.Homogeneity(isnan(nh.G.Homogeneity))=0;
%--------------B-Stats-----------
h.B.Contrast(isnan(h.B.Contrast))=0;
h.B.Correlation(isnan(h.B.Correlation))=0;
h.B.Energy(isnan(h.B.Energy))=0;
h.B.Homogeneity(isnan(h.B.Homogeneity))=0;

nh.B.Contrast(isnan(nh.B.Contrast))=0;
nh.B.Correlation(isnan(nh.B.Correlation))=0;
nh.B.Energy(isnan(nh.B.Energy))=0;
nh.B.Homogeneity(isnan(nh.B.Homogeneity))=0;
%--------------RG-Stats-----------
h.RG.Contrast(isnan(h.RG.Contrast))=0;
h.RG.Correlation(isnan(h.RG.Correlation))=0;
h.RG.Energy(isnan(h.RG.Energy))=0;
h.RG.Homogeneity(isnan(h.RG.Homogeneity))=0;

nh.RG.Contrast(isnan(nh.RG.Contrast))=0;
nh.RG.Correlation(isnan(nh.RG.Correlation))=0;
nh.RG.Energy(isnan(nh.RG.Energy))=0;
nh.RG.Homogeneity(isnan(nh.RG.Homogeneity))=0;
%--------------RB-Stats-----------
h.RB.Contrast(isnan(h.RB.Contrast))=0;
h.RB.Correlation(isnan(h.RB.Correlation))=0;
h.RB.Energy(isnan(h.RB.Energy))=0;
h.RB.Homogeneity(isnan(h.RB.Homogeneity))=0;

nh.RB.Contrast(isnan(nh.RB.Contrast))=0;
nh.RB.Correlation(isnan(nh.RB.Correlation))=0;
nh.RB.Energy(isnan(nh.RB.Energy))=0;
nh.RB.Homogeneity(isnan(nh.RB.Homogeneity))=0;
%--------------GB-Stats-----------
h.GB.Contrast(isnan(h.R.Contrast))=0;
h.GB.Correlation(isnan(h.R.Correlation))=0;
h.GB.Energy(isnan(h.R.Energy))=0;
h.GB.Homogeneity(isnan(h.R.Homogeneity))=0;

nh.GB.Contrast(isnan(nh.GB.Contrast))=0;
nh.GB.Correlation(isnan(nh.GB.Correlation))=0;
nh.GB.Energy(isnan(nh.GB.Energy))=0;
nh.GB.Homogeneity(isnan(nh.GB.Homogeneity))=0;

end 