function pop2=Decodechr(pop,spoint,length)
% ����Ҫ������ת����ʮ���ƵĲ���������
%���ؼ��㲿�ֵ�ʮ���ƴ�
pop1=pop(:,spoint:spoint+length-1,:);
pop2=Decodebin(pop1);
end