function [ output ] = SMA( price,start,length )
%S1 ����1 SMA ���ƶ�ƽ��
%price�����һ��Ϊʱ�䣬�ڶ���Ϊ�۸�
%start �����㵱���±�
%length Ϊ����ĳ���
output=mean(price(start-length:start-1,2));
end

