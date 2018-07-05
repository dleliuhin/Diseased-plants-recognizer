function [h,nh] = initialStats()
    %Stats_R empty arrays for output histograms
    h.R.Contrast=[];h.R.Correlation=[];h.R.Energy=[];h.R.Homogeneity=[];
    nh.R.Contrast=[];nh.R.Correlation=[];nh.R.Energy=[];nh.R.Homogeneity=[];
    %Stats_G empty arrays for output histograms
    h.G.Contrast=[];h.G.Correlation=[];h.G.Energy=[];h.G.Homogeneity=[];
    nh.G.Contrast=[];nh.G.Correlation=[];nh.G.Energy=[];nh.G.Homogeneity=[];
    %Stats_B empty arrays for output histograms
    h.B.Contrast=[];h.B.Correlation=[];h.B.Energy=[];h.B.Homogeneity=[];
    nh.B.Contrast=[];nh.B.Correlation=[];nh.B.Energy=[];nh.B.Homogeneity=[];
    %Stats_RG empty arrays for output histograms
    h.RG.Contrast=[];h.RG.Correlation=[];h.RG.Energy=[];h.RG.Homogeneity=[];
    nh.RG.Contrast=[];nh.RG.Correlation=[];nh.RG.Energy=[];nh.RG.Homogeneity=[];
    %Stats_RB empty arrays for output histograms
    h.RB.Contrast=[];h.RB.Correlation=[];h.RB.Energy=[];h.RB.Homogeneity=[];
    nh.RB.Contrast=[];nh.RB.Correlation=[];nh.RB.Energy=[];nh.RB.Homogeneity=[];
    %Stats_GB empty arrays for output histograms
    h.GB.Contrast=[];h.GB.Correlation=[];h.GB.Energy=[];h.GB.Homogeneity=[];
    nh.GB.Contrast=[];nh.GB.Correlation=[];nh.GB.Energy=[];nh.GB.Homogeneity=[];
end