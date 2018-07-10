function h=rewriteHealthy(h,stats)
    h.R.Contrast(end+1) = stats.R.Contrast(1);
    h.R.Correlation(end+1) = stats.R.Correlation(1);
    h.R.Energy(end+1) = stats.R.Energy(1);
    h.R.Homogeneity(end+1) = stats.R.Homogeneity(1); 
    
    h.G.Contrast(end+1) = stats.G.Contrast(1);
    h.G.Correlation(end+1) = stats.G.Correlation(1);
    h.G.Energy(end+1) = stats.G.Energy(1);
    h.G.Homogeneity(end+1) = stats.G.Homogeneity(1);    
    
    h.B.Contrast(end+1) = stats.B.Contrast(1);
    h.B.Correlation(end+1) = stats.B.Correlation(1);
    h.B.Energy(end+1) = stats.B.Energy(1);
    h.B.Homogeneity(end+1) = stats.B.Homogeneity(1);    
    
    h.RG.Contrast(end+1) = stats.RG.Contrast(1);
    h.RG.Correlation(end+1) = stats.RG.Correlation(1);
    h.RG.Energy(end+1) = stats.RG.Energy(1);
    h.RG.Homogeneity(end+1) = stats.RG.Homogeneity(1);    
    
    h.RB.Contrast(end+1) = stats.RB.Contrast(1);
    h.RB.Correlation(end+1) = stats.RB.Correlation(1);
    h.RB.Energy(end+1) = stats.RB.Energy(1);
    h.RB.Homogeneity(end+1) = stats.RB.Homogeneity(1);
    
    h.GB.Contrast(end+1) = stats.GB.Contrast(1);
    h.GB.Correlation(end+1) = stats.GB.Correlation(1);
    h.GB.Energy(end+1) = stats.GB.Energy(1);
    h.GB.Homogeneity(end+1) = stats.GB.Homogeneity(1); 
end