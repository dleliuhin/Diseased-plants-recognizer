function supres=findsupremum(A,B,numbns)
%���������� ��������� ���� ��������
    
    assert(length(A)==length(B),'Differents arrays dimensions');
    
    supres(1) = max(histcounts(A, numbns));
    supres(2) = max(histcounts(B, numbns));
    
end