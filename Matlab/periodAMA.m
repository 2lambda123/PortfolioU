function [ output ] =  periodAMA( priceseries,length)
%periodAMA,��һ��ֵ��sma ����ߵļ������ama,ǰ����250�������ֵ��

m=size(priceseries,1);
days=m-500;
output=zeros(days,1);
if length==1
 output(:,1)=priceseries(500:m-1,2);
 else
output(1,1)=mean(priceseries((501-length):500,2));
for i=2 : days
    output(i,1)=AMA(priceseries(:,2), 500+i,length,output(i-1,1));
end
    
end

