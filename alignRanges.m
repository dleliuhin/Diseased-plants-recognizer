function [h,nh]=alignRanges(h,nh)
[h.R.Contrast,nh.R.Contrast]=histdimcompare(h.R.Contrast,nh.R.Contrast);
[h.R.Correlation,nh.R.Correlation]=histdimcompare(h.R.Correlation,nh.R.Correlation);
[h.R.Energy,nh.R.Energy]=histdimcompare(h.R.Energy,nh.R.Energy);
[h.R.Homogeneity,nh.R.Homogeneity]=histdimcompare(h.R.Homogeneity,nh.R.Homogeneity);

[h.G.Contrast,nh.G.Contrast]=histdimcompare(h.G.Contrast,nh.G.Contrast);
[h.G.Correlation,nh.G.Correlation]=histdimcompare(h.G.Correlation,nh.G.Correlation);
[h.G.Energy,nh.G.Energy]=histdimcompare(h.G.Energy,nh.G.Energy);
[h.G.Homogeneity,nh.G.Homogeneity]=histdimcompare(h.G.Homogeneity,nh.G.Homogeneity);

[h.B.Contrast,nh.B.Contrast]=histdimcompare(h.B.Contrast,nh.B.Contrast);
[h.B.Correlation,nh.B.Correlation]=histdimcompare(h.B.Correlation,nh.B.Correlation);
[h.B.Energy,nh.B.Energy]=histdimcompare(h.B.Energy,nh.B.Energy);
[h.B.Homogeneity,nh.B.Homogeneity]=histdimcompare(h.B.Homogeneity,nh.B.Homogeneity);

[h.RG.Contrast,nh.RG.Contrast]=histdimcompare(h.RG.Contrast,nh.RG.Contrast);
[h.RG.Correlation,nh.RG.Correlation]=histdimcompare(h.RG.Correlation,nh.RG.Correlation);
[h.RG.Energy,nh.RG.Energy]=histdimcompare(h.RG.Energy,nh.RG.Energy);
[h.RG.Homogeneity,nh.RG.Homogeneity]=histdimcompare(h.RG.Homogeneity,nh.RG.Homogeneity);

[h.RB.Contrast,nh.RB.Contrast]=histdimcompare(h.RB.Contrast,nh.RB.Contrast);
[h.RB.Correlation,nh.RB.Correlation]=histdimcompare(h.RB.Correlation,nh.RB.Correlation);
[h.RB.Energy,nh.RB.Energy]=histdimcompare(h.RB.Energy,nh.RB.Energy);
[h.RB.Homogeneity,nh.RB.Homogeneity]=histdimcompare(h.RB.Homogeneity,nh.RB.Homogeneity);

[h.GB.Contrast,nh.GB.Contrast]=histdimcompare(h.GB.Contrast,nh.GB.Contrast);
[h.GB.Correlation,nh.GB.Correlation]=histdimcompare(h.GB.Correlation,nh.GB.Correlation);
[h.GB.Energy,nh.GB.Energy]=histdimcompare(h.GB.Energy,nh.GB.Energy);
[h.GB.Homogeneity,nh.GB.Homogeneity]=histdimcompare(h.GB.Homogeneity,nh.GB.Homogeneity);
end