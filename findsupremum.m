function supres=findsupremum(A,B,numbins)
%���������� ��������� ���� ��������
    
    assert(length(A)==length(B),'Differents arrays dimensions');
    
    supres(1) = max(histcounts(A, numbins));
    supres(2) = max(histcounts(B, numbins));
    
end