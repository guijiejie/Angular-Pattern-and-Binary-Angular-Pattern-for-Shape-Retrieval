function [ LbapH ] = LBAP( Cs, dp1,dp2)
% dp1 是局部角度计算的半径
% dp2 是局部角度比较的半径


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
    % 取出3点
    TPs = CsE([i-dp1 i i+dp1],:);
    % 以中间点为原点，平移
    StartV = TPs(1,:)-TPs(2,:);
    EndV = TPs(3,:)-TPs(2,:);
    % 获得起止点角度
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

% 延长后提取每个点的LBAP
LapE = [ Lap(end-dp2+1:end);Lap;Lap(1:dp2) ];
%
Lbap = zeros(length(Cs),2);

%
for i = dp2+1:length(LapE)-dp2
    % 取出3点的Lap
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

% 进行局部模式的直方图统计
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

