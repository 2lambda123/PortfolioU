function [ output] =  AMA_noise( price,daydecide,n )
%�˺�����AMA ��ER��Ч�ʱ��ʣ�������ֵ
% nΪ������
output=0;
for i=1:n
output=output+abs(price(daydecide-i,1)-price(daydecide-i-1,1));
end
end

