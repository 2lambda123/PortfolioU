function [ class,m, n, level, score ] = Trns_Str( pop )
%�������������ǽ�pop����ɲ��ԵĲ������Ա����±ߵļ���ƽ��ֵ����ʹ�á�
% class,m, n, level, score ��ȡֵ�ֱ𷵻�5����ά����
% class=Decodechr(pop,1,2);
% class=mod(class,3)+1;%��ƽ��ֵ�ķ���������ȡ�࣬����Ϊ1-3֮��
%�µ�class���࣬ȡ����
class=Decodechr(pop,1,2)+1;
t=Decodechr(pop,3,5)+1;
a=size(pop,1);
b=size(pop,3);
n=zeros(a,1,b);
m=zeros(a,1,b);
for i=1:a
    for j=1:b
switch t(i,1,j)
    case 1
        n(i,1,j)=1;
        m(i,1,j)=10;
    case 2
        n(i,1,j)=1;
        m(i,1,j)=20;
    case 3
        n(i,1,j)=1;
        m(i,1,j)=50;
    case 4
        n(i,1,j)=1;
        m(i,1,j)=100;
    case 5
        n(i,1,j)=1;
        m(i,1,j)=150;
    case 6
        n(i,1,j)=1;
        m(i,1,j)=200;
    case 7
        n(i,1,j)=3;
        m(i,1,j)=10;
    case 8
        n(i,1,j)=3;
        m(i,1,j)=20;
    case 9
        n(i,1,j)=3;
        m(i,1,j)=50;
    case 10
        n(i,1,j)=3;
        m(i,1,j)=100;
    case 11
        n(i,1,j)=3;
        m(i,1,j)=150;
    case 12
        n(i,1,j)=3;
        m(i,1,j)=200;
    case 13
        n(i,1,j)=5;
        m(i,1,j)=10;
    case 14
        n(i,1,j)=5;
        m(i,1,j)=20;
    case 15
        n(i,1,j)=5;
        m(i,1,j)=50;
    case 16
        n(i,1,j)=5;
        m(i,1,j)=100;
    case 17
        n(i,1,j)=5;
        m(i,1,j)=150;
    case 18
        n(i,1,j)=5;
        m(i,1,j)=200;
    case 19
        n(i,1,j)=10;
        m(i,1,j)=20;
    case 20
        n(i,1,j)=10;
        m(i,1,j)=50;
    case 21
        n(i,1,j)=10;
        m(i,1,j)=100;
    case 22
        n(i,1,j)=10;
        m(i,1,j)=150;
    case 23
        n(i,1,j)=10;
        m(i,1,j)=200;
    case 24
        n(i,1,j)=15;
        m(i,1,j)=20;
    case 25
        n(i,1,j)=15;
        m(i,1,j)=50;
    case 26
        n(i,1,j)=15;
        m(i,1,j)=100;
    case 27
        n(i,1,j)=15;
        m(i,1,j)=150;
    case 28
        n(i,1,j)=15;
        m(i,1,j)=200;
    case 29
        n(i,1,j)=20;
        m(i,1,j)=50;
    case 30
        n(i,1,j)=20;
        m(i,1,j)=100;
    case 31
        n(i,1,j)=20;
        m(i,1,j)=150;
    case 32
        n(i,1,j)=20;
        m(i,1,j)=200;
  
end
    end
end




level=Decodechr(pop,8,3);
level=mod(level,7)+1;
A=level;

A(A==1)=-1;
A(A==2)=-1;
A(A==3)=-1;
%A(A==4)=0;��ȥ�淶���м�����಻����ôд�������Ȱѵ����ĵĵط�Ĩ��������ټ��Ͼͺ���
A(A==4)=0;
A(A==5)=1;
A(A==6)=1;
A(A==7)=1;

B=level;
B(B==1)=0;
B(B==2)=0;
B(B==3)=0;
B(B==4)=1;
B(B==5)=0;
B(B==6)=0;
B(B==7)=0;
score=round((Decodechr(pop,11,8)/255*2-1)*10)/10;
score=A.*abs(score)+B.*score;



end

