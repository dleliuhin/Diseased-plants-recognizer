function [ipIndicator] = getMedianeIndicator(ipIndicator, ...
                                             iPlotValuesIndicator)
%% GETMEDIANEINDICATOR 
% Assign mediane of iPlotValuesIndicator to ioIndicator.
% 
% * Syntax 
% 
%	[IOINDICATOR] = GETMEDIANEINDICATOR(IOINDICATOR, IPLOTVALUESINDICATOR)
% 
% * Input 
% 
% -- ioIndicator - structure which need to set up a 
%                  new value - iPlotValuesIndicator.
%
% -- iPlotValuesIndicator - structure of values for plotting graphics
%                           including R, G, B, RG, RB, GB components.
%                           Every component contains Contrast, 
%                           Correlation, Energy, Homogeneity properties.
% 
% * Output 
% 
% -- ioIndicator - structure which equal the 
%                  mediane of iPlotValuesIndicator.
% 
% * Examples: 
% 
% Provide sample usage code here
% 
% * See also: 
% 
% No relations.
% 
% * Author: Dmitrii Leliuhin 
% * Email: dleliuhin@mail.ru 
% * Date: 12/10/2018 00:58:17 
% * Version: 1.0 $ 
% * Requirements: PCWIN64, MatLab R2016a 
% 
% * Warning: 
% 
% # No Warnings. 
% 
% * TODO: 
% 
% # TODO list. 
% 

%% Code 

ipIndicator.R.Contrast =      median(iPlotValuesIndicator.R.Contrast.edges);
ipIndicator.R.Correlation =   median(iPlotValuesIndicator.R.Correlation.edges);
ipIndicator.R.Energy =        median(iPlotValuesIndicator.R.Energy.edges);
ipIndicator.R.Homogeneity =   median(iPlotValuesIndicator.R.Homogeneity.edges);

ipIndicator.G.Contrast =      median(iPlotValuesIndicator.G.Contrast.edges);
ipIndicator.G.Correlation =   median(iPlotValuesIndicator.G.Correlation.edges);
ipIndicator.G.Energy =        median(iPlotValuesIndicator.G.Energy.edges);
ipIndicator.G.Homogeneity =   median(iPlotValuesIndicator.G.Homogeneity.edges);

ipIndicator.B.Contrast =      median(iPlotValuesIndicator.B.Contrast.edges);
ipIndicator.B.Correlation =   median(iPlotValuesIndicator.B.Correlation.edges);
ipIndicator.B.Energy =        median(iPlotValuesIndicator.B.Energy.edges);
ipIndicator.B.Homogeneity =   median(iPlotValuesIndicator.B.Homogeneity.edges);

ipIndicator.RG.Contrast =     median(iPlotValuesIndicator.RG.Contrast.edges);
ipIndicator.RG.Correlation =  median(iPlotValuesIndicator.RG.Correlation.edges);
ipIndicator.RG.Energy =       median(iPlotValuesIndicator.RG.Energy.edges);
ipIndicator.RG.Homogeneity =  median(iPlotValuesIndicator.RG.Homogeneity.edges);

ipIndicator.RB.Contrast =     median(iPlotValuesIndicator.RB.Contrast.edges);
ipIndicator.RB.Correlation =  median(iPlotValuesIndicator.RB.Correlation.edges);
ipIndicator.RB.Energy =       median(iPlotValuesIndicator.RB.Energy.edges);
ipIndicator.RB.Homogeneity =  median(iPlotValuesIndicator.RB.Homogeneity.edges);

ipIndicator.GB.Contrast =     median(iPlotValuesIndicator.GB.Contrast.edges);
ipIndicator.GB.Correlation =  median(iPlotValuesIndicator.GB.Correlation.edges);
ipIndicator.GB.Energy =       median(iPlotValuesIndicator.GB.Energy.edges);
ipIndicator.GB.Homogeneity =  median(iPlotValuesIndicator.GB.Homogeneity.edges);

end
