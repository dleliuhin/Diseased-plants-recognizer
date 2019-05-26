function [oVector] = insertAtRight(iVector, iValue, iIndex)
%% INSERTATRIGHT
% Increase the right branch of the function by adding iValue with 
% specific iIndex.
% 
% * Syntax
%
% [OVECTOR] = INSERTATRIGHT(IVECTOR, IVALUE, IINDEX)
%
% * Input
%
% -- iVector - vector in which need to insert iValue at right of the vector 
%              with specific iIndex.
%
% -- iValue - value which need to insert at iVector.
%
% -- iIndex - the index of the vector by which need to insert iValue.
%
% * Output
%
% -- oVector - vector with inserted iValue at right of the vector by 
%              specific iIndex.
% 
% * Examples: 
% 
% Provide sample usage code here.
% 
% * See also: 
%
% No relations.
%
% * Authors: Dmitrii Leliuhin
% * Email: dleliuhin@mail.ru 
% * Date: 19/07/2018 02:48:41
% * Version: 1.0 $ 
% * Requirements: PCWIN64, MatLab R2016a  
% 
% * Warning: 
% 
% # No Warnings.
% 
% * TODO: 
% 
% # TO DO list.
% 

%% Code

if isempty(iIndex)
    oVector = vertcat(iVector, iValue);
else
    oVector = vertcat(iVector(1:iIndex - 1), iValue, iVector(iIndex:end));
end

end