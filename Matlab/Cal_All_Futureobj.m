function [ obj_all, holding ] = Cal_All_Futureobj(pop ,price,lastprice,cost,capitals,margin,risk_free_return)
%����ֵ��n�����еľ��󣬵�һ��Ϊ�����棬�ڶ���Ϊ���׵Ĵ���
%   Detailed explanation goes here
% n=size(pop,1);
% obj_All=zeros(n,2);
a=size(price,1);
b=size(pop,3);
c=a-500;
effprice=price(a-c+1:a,2);
  %�Ѳ��Է���ɿ�ʶ����������
    [class,m, n,level,score]=Trns_Str(pop);
    %����ÿ����Ƽ�ֵ
    [rating] = Cal_ifpart( class,m, n,level,score,price,lastprice );
    sumholding =capitals./effprice/margin;
    difholding=zeros(c,b);
    holding=round(repmat(sumholding,1,b).*rating/1000)*1000;
    holding(c,:)=0;
    difholding(1,:)=holding(1,:);
    difholding(2:c,:)=diff(holding);
    in_out_pay=repmat(effprice,1,b).*difholding+abs(difholding)/1000*cost;
    costfreereturn=(capitals-repmat(effprice,1,b).*(abs(holding))*margin)*risk_free_return/250;
   rateofreturn=(sum(costfreereturn,1)-sum(in_out_pay,1))/capitals;
  obj_all(:,2)=rateofreturn';
   obj_all(:,1)=(1:1:b);    
%    %������Ҫ��ƽ��ֵ��
%    for i=1:size(pop,1)
%      nowcalprice=mainf(price,m(i),n(i),class(i),stnd(i),501);
%   %����ÿ���Ͷ�ʲ���
%     nowcalprice=Decide_Long_Short(nowcalprice,stnd(i));
%     %�ڶ�������Ӧֻ����һ���ǽ��׵Ĵ���
%     [ obj_All(i,1),obj_All(i,2) ]=Calc_Future_Return( nowcalprice, cost, risk_free_return );
%    end
  
end

