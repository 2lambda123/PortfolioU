format short
% name Trade.m �Ŵ��㷨 �ڻ����ײ����Ż�������
%% ���������
% priceΪѵ�����ݣ�priceselΪ����ֵѡ�����ݣ� pricetestΪ��������
% ÿ�����ݿ�ʼʱ����ǰ500���������Ϊ���㸨����ʱ��δ�201��ʼ
% initialprice��Ϊһ�����������������ȼ��أ��������ݣ���һ�������ָ�ʽ��ʱ�䣬�ڶ�����ʯ�ͼ۸�
RandStream.setGlobalStream(RandStream('mt19937ar','seed',sum(100*clock)));
initialprice=price1;
starttime=751;
step=250;
trivaltimes=15;
rulenumber=10;
everytrail_obj_test=zeros(trivaltimes,2);%����ÿ��ʵ�����Ų����Լ����Ų��ԵĲ��������ʣ�
everytrail_bestrules=zeros(rulenumber,5,trivaltimes);
everytrial_difholding=zeros(250,trivaltimes);
trainlength=250;
sellength=250;
testlength=250;
%% ��ʼ�����趨
generation=50;
popsize=20;

%length�����޸�
chromlength=18;
%����ͱ������
pc=0.7;
pm=0.05;
%���׳ɱ��ʺ��޷���������
cost=18;%�൱��0.1%
risk_free_return=0.02; %�޷���������2%
capitals=1000000;
margin=0.15;
%% ����ѭ��ʵ�飬����trivaltimes��ʵ�飬�õ�ͬ�����������в��Խ��в��ԡ�
for thisrepet=1:20
for trivalcycle=1:17%trivaltimes
   % ����������������
    steppoint=(trivalcycle-1)*step;
    price=initialprice((steppoint+starttime-500):(steppoint+starttime+trainlength+250-1),:);
    pricesel=initialprice((steppoint+starttime+trainlength-500):(steppoint+starttime+trainlength+sellength-1),:);
    pricetest=initialprice((steppoint+starttime+trainlength+sellength-500):(steppoint+starttime+trainlength+sellength+testlength-1),:);
%if���� ������������ʷ����
    lastprice=initialprice((steppoint+starttime-500-step):(steppoint+starttime+trainlength+250-step-1),:);
    lastpricesel=initialprice((steppoint+starttime+trainlength-500-step):(steppoint+starttime+trainlength+sellength-step-1),:);
    lastpricetest=initialprice((steppoint+starttime+trainlength+sellength-500-step):(steppoint+starttime+trainlength+sellength+testlength-step-1),:);
    
    
    

every_gen_result=zeros(generation,5);
bestreturn=[0 -5];%��ʼ���󣬼�¼ÿ����Ⱥ������ѡ��ֵ�������ʣ�ͨ��sel���ݲ��Ե�
% bestindividual=zeros(rulenumber,chromlength,trivaltimes);
pop=Init_trade_strategy(rulenumber,chromlength,popsize);

%% ����ʵ��Ľ�������
for i=1:generation
    i
   [obj_all]=Cal_All_Futureobj(pop,price,lastprice,cost,capitals,margin,risk_free_return);
     %��Ŀ�꺯��ֵ������Ӧ�Ⱥ�����
     %�ڶ����ǻر�ֵ
     fitn_all=ranking(-obj_all(:,2),[2 1]);
    [bestfitness,bestindex]=max(fitn_all);
    % ����ѡ����������Ÿ����ѡ��
     [obj_best_sel]=Cal_All_Futureobj(pop(:,:,bestindex),pricesel,lastpricesel,cost,capitals,margin,risk_free_return);
    if(obj_best_sel(1,2)>bestreturn(1,2)-0.05)
        bestreturn=obj_best_sel;
        bestindividual=pop(:,:,bestindex);
    end
   every_gen_result(i,:)=[obj_all(bestindex,:) mean(obj_all(:,2)) bestreturn ]  ;
 
    %�����µ��Ӵ�
  newpop=Gennewpop(pop,fitn_all,pc,pm,chromlength,rulenumber);
 pop=newpop;
 
end
%% �������Լ���������

%xlswrite('every_gen_best.xls',every_gen_result,['result' num2str(trivalcycle)]);
%[ m, n, class, stnd ] = Trns_Str( bestindividual );
% [obj_test]=Cal_All_Futureobj(bestindividual,pricetest,cost,risk_free_return);
%%��¼ÿ��ʵ������Ų��Բ��Խ��
% everytrail_bestrules(trivalcycle,:)=[m n  class stnd obj_test ];
% trivalcycle
%end
%xlswrite('everytril.xls',everytrail_bestrules);
 %% �������Լ���������

xlswrite([num2str(thisrepet) 'every_gen_best.xlsx'],every_gen_result,['result' num2str(trivalcycle)]);
[ class,m, n, level, score ] = Trns_Str( bestindividual );
[obj_test,holding]=Cal_All_Futureobj(bestindividual,pricetest,lastpricetest,cost,capitals,margin,risk_free_return);
%%��¼ÿ��ʵ������Ų��Բ��Խ��
 everytrail_bestrules(:,:,trivalcycle)=cat(2,m,n,class,level,score);
 everytrail_obj_test(trivalcycle,:)=obj_test;
 everytrial_difholding(:,trivalcycle)=holding;
 thisrepet
 trivalcycle
end
for i=1:trivaltimes
xlswrite([num2str(thisrepet) 'everytril.xlsx'],everytrail_bestrules(:,:,i),i);
end
xlswrite([num2str(thisrepet) 'everytril_objtest.xlsx'],everytrail_obj_test);
xlswrite([num2str(thisrepet) 'everytril_difholding.xlsx'],everytrial_difholding);
end
    
   
