function [ output ] = TMA( priceseries,start,length )
%S6 �������ƶ�ƽ���� TMA
%   
s=0;
for i=1:length
 s=s+SMA(priceseries,start-i+1,length);
end
output=s/length;
end

