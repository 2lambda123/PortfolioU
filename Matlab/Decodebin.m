function [subpopinten]=Decodebin(subpop)
%��pop�е�ÿһλ������0����1�ĳ�ʮ���Ƶ�����Ȼ��������ʮ�������֣�
%pop2Ϊ���ص�ʮ��������
py=size(subpop,2);
pop1=subpop;
for i=1:py
    pop1(:,i,:)=2^(py-i).*subpop(:,i,:);
end
subpopinten=sum(pop1,2);
end