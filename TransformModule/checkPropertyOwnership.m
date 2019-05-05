function [oResult, ioCount] = checkPropertyOwnership(iStructH, ...
                                                     iCurrentStats, ...
                                                     iDiseaseCode, ...
                                                     iStructNh, ...
                                                     ioCount)
%% CHECKPROPERTYOWNERSHIP
% Determines which diseased group the component belongs to 
% based on iDiseaseCode.
% 
% * Syntax 
% 
%	[ORESULT, IOCOUNT] = CHECKPROPERTYOWNERSHIP(ISTRUCTH, 
%                                               ICURRENTSTATS,
%                                               IDISEASECODE,
%                                               ISTRUCTNH,
%                                               IOCOUNT)
% 
% * Input 
% 
% -- iStructH - glcm statistics of training set table for healthy images.
% 
% -- iCurrentStats - glcm statistics of current image or group of images.
%
% -- iDiseaseCode - number of plant leaf disease.
%
% -- iStructNh - glcm statistics of training set table for diseases images
%                by specific iDiseaseCode.
%
% -- ioCount - value that shows the number of images or group of images 
%              related to specific plantic group and which should be 
%              incremented.
% 
% * Output 
% 
% -- oResult - the binarized result of belonging to specific
%              plantic group. 
%              0 - if current image or group of images belong to 
%                  disease plantic group.
%              1 - if current image or group of images belong to 
%                  healthy plantic group.
%
% -- ioCount - incremented value that shows the number of images or group 
%              of images related to specific plantic group.
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
% * Date: 05/09/2018 13:04:04
% * Version: 1.0 $ 
% * Requirements: PCWIN64, MatLab R2016a 
% 
% * Warning: 
% 
% # Warnings list. 
% 
% * TODO: 
% 
% Do incrementing ioCount structure for all kinds of diseases.
% 

%% Code 

% Precalculation difference modulus between iCurrentStats and iStructH.
absConditionH = abs(iCurrentStats - iStructH);
% Precalculation difference modulus between iCurrentStats and iStructNh.
absConditionNh = abs(iCurrentStats - iStructNh);

if ~isnan(iCurrentStats)
    % Check if the absConditionH is closer to absConditionNh.
    if (absConditionH < absConditionNh)
        % Then image or group of images belong to healthy plantic group.
        oResult = 1;
        ioCount.h = ioCount.h + 1;
        
    else
        % Then image or group of images belong to disease plantic group by
        % specific iDiseaseCode.
        oResult = 0;
        ioCount.(iDiseaseCode) = ioCount.(iDiseaseCode) + 1;
        
    end
    
else
    oResult = NaN;
    
end

end