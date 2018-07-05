function nh=rewriteDiseased(nh,stats)
    nh.R.Contrast(end+1) = stats.R.Contrast(1);
    nh.R.Correlation(end+1) = stats.R.Correlation(1);
    nh.R.Energy(end+1) = stats.R.Energy(1);
    nh.R.Homogeneity(end+1) = stats.R.Homogeneity(1);
    
    nh.G.Contrast(end+1) = stats.G.Contrast(1);
    nh.G.Correlation(end+1) = stats.G.Correlation(1);
    nh.G.Energy(end+1) = stats.G.Energy(1);
    nh.G.Homogeneity(end+1) = stats.G.Homogeneity(1);    
    
    nh.B.Contrast(end+1) = stats.B.Contrast(1);
    nh.B.Correlation(end+1) = stats.B.Correlation(1);
    nh.B.Energy(end+1) = stats.B.Energy(1);
    nh.B.Homogeneity(end+1) = stats.B.Homogeneity(1);    
    
    nh.RG.Contrast(end+1) = stats.RG.Contrast(1);
    nh.RG.Correlation(end+1) = stats.RG.Correlation(1);
    nh.RG.Energy(end+1) = stats.RG.Energy(1);
    nh.RG.Homogeneity(end+1) = stats.RG.Homogeneity(1);    
    
    nh.RB.Contrast(end+1) = stats.RB.Contrast(1);
    nh.RB.Correlation(end+1) = stats.RB.Correlation(1);
    nh.RB.Energy(end+1) = stats.RB.Energy(1);
    nh.RB.Homogeneity(end+1) = stats.RB.Homogeneity(1);
    
    nh.GB.Contrast(end+1) = stats.GB.Contrast(1);
    nh.GB.Correlation(end+1) = stats.GB.Correlation(1);
    nh.GB.Energy(end+1) = stats.GB.Energy(1);
    nh.GB.Homogeneity(end+1) = stats.GB.Homogeneity(1);
end