function OUT = findInterBins(IN)
%����� ���������� ���������� ������� ���������� �������� ����������
    for i = 1:length(IN)-1
        OUT(i)=(IN(i)+IN(i+1))/2;
    end
end