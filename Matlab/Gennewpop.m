function [ newpop ] = Gennewpop( pop,fitvalues ,pc,pm,chromlength,rulenumber)
%�����µ���Ⱥ
%������Ӧ��ѡ��80%����Ⱥ

selectpop=select3d('rws',pop,fitvalues,0.8);
migratepop=select3d('rws',pop,fitvalues,0.1);
%ʣ��ĸ�����������
newpopsize=size(pop,3)-size(selectpop,3)-size(migratepop,3);
newsubpop=Init_trade_strategy(rulenumber,chromlength,newpopsize);
%�����µ���Ⱥ
newpop1=cat(3,selectpop,newsubpop);
%���н���ͱ���
newpop1=recombin3d('xovsprs3d',newpop1,pc);
%�����Ʊ�ʾ����Ҫ�ƶ�����ı߽�
[a,b,c]=size(newpop1);
bigpop=permute(newpop1,[2,1,3]);
bigpop=(reshape(bigpop,b,a*c))';
bigpop=recombin('xovsprs',bigpop,pc);
bigpop=mutate('mut',bigpop,NaN,pm);
newpop1=reshape(bigpop',b,a,c);
newpop1=permute(newpop1,[2,1,3]);
newpop=cat(3,newpop1,migratepop);
end

