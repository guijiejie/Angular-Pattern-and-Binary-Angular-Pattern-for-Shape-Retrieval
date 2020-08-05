function [ LbapH ] = LBAP4P( Cs, dp1,dp2)
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
Lbap = zeros(length(Cs),4);

%
for i = dp2+1:length(LapE)-dp2
    % ȡ��5���Lap
    TAs = LapE([i-dp2 i-dp2/2 i i+dp2/2 i+dp2]);
    %
    if TAs(1)>=TAs(3)
        %
        Lbap(i-dp2,1) = 1;     
    end
    %
    if TAs(2)>=TAs(3)
        %
        Lbap(i-dp2,2) = 1;     
    end
    %
    if TAs(4)>=TAs(3)
        %
        Lbap(i-dp2,3) = 1;     
    end
    %
    if TAs(5)>=TAs(3)
        %
        Lbap(i-dp2,4) = 1;     
    end
end

% ���оֲ�ģʽ��ֱ��ͼͳ��
LbapH = zeros(16,1);
%
for i = 1:length(Cs)
    %
    Lbap_tmp = Lbap(i,:);
    %
    if isequal(Lbap_tmp,[0 0 0 0])
        %
        LbapH(1) = LbapH(1) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 0 0 1])
        %
        LbapH(2) = LbapH(2) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 0 1 0])
        %
        LbapH(3) = LbapH(3) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 0 1 1])
        %
        LbapH(4) = LbapH(4) + 1;
    end    
    %
    if isequal(Lbap_tmp,[0 1 0 0])
        %
        LbapH(5) = LbapH(5) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 1 0 1])
        %
        LbapH(6) = LbapH(6) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 1 1 0])
        %
        LbapH(7) = LbapH(7) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 1 1 1])
        %
        LbapH(8) = LbapH(8) + 1;
    end      
        %
    if isequal(Lbap_tmp,[1 0 0 0])
        %
        LbapH(9) = LbapH(9) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 0 0 1])
        %
        LbapH(10) = LbapH(10) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 0 1 0])
        %
        LbapH(11) = LbapH(11) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 0 1 1])
        %
        LbapH(12) = LbapH(12) + 1;
    end    
        %
    if isequal(Lbap_tmp,[1 1 0 0])
        %
        LbapH(13) = LbapH(13) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 1 0 1])
        %
        LbapH(14) = LbapH(14) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 1 1 0])
        %
        LbapH(15) = LbapH(15) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 1 1 1])
        %
        LbapH(16) = LbapH(16) + 1;
    end    
end

%
% LbapH = LbapH/length(Cs);




