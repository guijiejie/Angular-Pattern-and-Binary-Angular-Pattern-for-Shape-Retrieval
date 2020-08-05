function [ LbapH ] = LBAP( Cs, dp1,dp2)
% dp1 �Ǿֲ��Ƕȼ���İ뾶
% dp2 �Ǿֲ��ǶȱȽϵİ뾶


%
CsE = [ Cs(end-dp1+1:end,:);Cs;Cs(1:dp1,:) ];
% %
% figure(100)
% plot(CsE(:,1),CsE(:,2),'r','linewidth',2); 
% %
% pause

%
Lap = zeros(length(Cs),1);

%
for i = dp1+1:length(CsE)-dp1
    % ȡ��3��
    TPs = CsE([i-dp1 i i+dp1],:);
    % ���м��Ϊԭ�㣬ƽ��
    StartV = TPs(1,:)-TPs(2,:);
    EndV = TPs(3,:)-TPs(2,:);
    % �����ֹ��Ƕ�
    StartA = atan2(StartV(2),StartV(1));
    EndA = atan2(EndV(2),EndV(1));
    %
    Adiff = EndA - StartA;
    %
    if Adiff>=0
        %
        Lap(i-dp1) = Adiff;
    else
        %
        Lap(i-dp1) = Adiff+2*pi;        
    end

end

% �ӳ�����ȡÿ�����LBAP
LapE = [ Lap(end-dp2+1:end);Lap;Lap(1:dp2) ];
%
Lbap = zeros(length(Cs),2);

%
for i = dp2+1:length(LapE)-dp2
    % ȡ��3���Lap
    TAs = LapE([i-dp2 i i+dp2]);
    %
    if TAs(1)>=TAs(2)
        %
        Lbap(i-dp2,1) = 1;     
    end
    %
    if TAs(3)>=TAs(2)
        %
        Lbap(i-dp2,2) = 1;     
    end
end

% ���оֲ�ģʽ��ֱ��ͼͳ��
LbapH = zeros(4,1);
%
for i = 1:length(Cs)
    %
    Lbap_tmp = Lbap(i,:);
    %
    if isequal(Lbap_tmp,[0 0])
        %
        LbapH(1) = LbapH(1) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 1])
        %
        LbapH(2) = LbapH(2) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 0])
        %
        LbapH(3) = LbapH(3) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 1])
        %
        LbapH(4) = LbapH(4) + 1;
    end    
end

