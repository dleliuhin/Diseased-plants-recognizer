%> 
%
%
function [h_test] = initialStatsTest()

    %Stats_R empty arrays for output histograms
    h_test.R.Contrast=[];h_test.R.Correlation=[];
    h_test.R.Energy=[];h_test.R.Homogeneity=[];
    %Stats_G empty arrays for output histograms
    h_test.G.Contrast=[];h_test.G.Correlation=[];
    h_test.G.Energy=[];h_test.G.Homogeneity=[];
    %Stats_B empty arrays for output histograms
    h_test.B.Contrast=[];h_test.B.Correlation=[];
    h_test.B.Energy=[];h_test.B.Homogeneity=[];
    %Stats_RG empty arrays for output histograms
    h_test.RG.Contrast=[];h_test.RG.Correlation=[];
    h_test.RG.Energy=[];h_test.RG.Homogeneity=[];
    %Stats_RB empty arrays for output histograms
    h_test.RB.Contrast=[];h_test.RB.Correlation=[];
    h_test.RB.Energy=[];h_test.RB.Homogeneity=[];
    %Stats_GB empty arrays for output histograms
    h_test.GB.Contrast=[];h_test.GB.Correlation=[];
    h_test.GB.Energy=[];h_test.GB.Homogeneity=[];
end