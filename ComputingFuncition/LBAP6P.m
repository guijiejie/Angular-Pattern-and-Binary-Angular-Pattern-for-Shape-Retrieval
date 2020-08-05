function [ LbapH ] = LBAP6P( Cs, dp1,dp2)
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
Lbap = zeros(length(Cs),6);

%
for i = dp2+1:length(LapE)-dp2
    % 取出7点的Lap
    TAs = LapE([i-dp2 i-dp2*(2/3) i-dp2*(1/3) i i+dp2*(1/3) i+dp2*(2/3) i+dp2]);
    %
    if TAs(1)>=TAs(4)
        %
        Lbap(i-dp2,1) = 1;     
    end
    %
    if TAs(2)>=TAs(4)
        %
        Lbap(i-dp2,2) = 1;     
    end
    %
    if TAs(3)>=TAs(4)
        %
        Lbap(i-dp2,3) = 1;     
    end
    %
    if TAs(5)>=TAs(4)
        %
        Lbap(i-dp2,4) = 1;     
    end
    %
    if TAs(6)>=TAs(4)
        %
        Lbap(i-dp2,5) = 1;     
    end
    %
    if TAs(7)>=TAs(4)
        %
        Lbap(i-dp2,6) = 1;     
    end
end

% 进行局部模式的直方图统计
LbapH = zeros(64,1);
%
for i = 1:length(Cs)
    %
    Lbap_tmp = Lbap(i,:);
    %
    if isequal(Lbap_tmp,[0 0 0 0 0 0])
        %
        LbapH(1) = LbapH(1) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 0 0 0 0 1])
        %
        LbapH(2) = LbapH(2) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 0 0 0 1 0])
        %
        LbapH(3) = LbapH(3) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 0 0 0 1 1])
        %
        LbapH(4) = LbapH(4) + 1;
    end    
    %
    if isequal(Lbap_tmp,[0 0 0 1 0 0])
        %
        LbapH(5) = LbapH(5) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 0 0 1 0 1])
        %
        LbapH(6) = LbapH(6) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 0 0 1 1 0])
        %
        LbapH(7) = LbapH(7) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 0 0 1 1 1])
        %
        LbapH(8) = LbapH(8) + 1;
    end      
        %
    if isequal(Lbap_tmp,[0 0 1 0 0 0])
        %
        LbapH(9) = LbapH(9) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 0 1 0 0 1])
        %
        LbapH(10) = LbapH(10) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 0 1 0 1 0])
        %
        LbapH(11) = LbapH(11) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 0 1 0 1 1])
        %
        LbapH(12) = LbapH(12) + 1;
    end    
        %
    if isequal(Lbap_tmp,[0 0 1 1 0 0])
        %
        LbapH(13) = LbapH(13) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 0 1 1 0 1])
        %
        LbapH(14) = LbapH(14) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 0 1 1 1 0])
        %
        LbapH(15) = LbapH(15) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 0 1 1 1 1])
        %
        LbapH(16) = LbapH(16) + 1;
    end    
    %
    %
    %
    if isequal(Lbap_tmp,[0 1 0 0 0 0])
        %
        LbapH(17) = LbapH(17) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 1 0 0 0 1])
        %
        LbapH(18) = LbapH(18) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 1 0 0 1 0])
        %
        LbapH(19) = LbapH(19) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 1 0 0 1 1])
        %
        LbapH(20) = LbapH(20) + 1;
    end    
    %
    if isequal(Lbap_tmp,[0 1 0 1 0 0])
        %
        LbapH(21) = LbapH(21) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 1 0 1 0 1])
        %
        LbapH(22) = LbapH(22) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 1 0 1 1 0])
        %
        LbapH(23) = LbapH(23) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 1 0 1 1 1])
        %
        LbapH(24) = LbapH(24) + 1;
    end      
        %
    if isequal(Lbap_tmp,[0 1 1 0 0 0])
        %
        LbapH(25) = LbapH(25) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 1 1 0 0 1])
        %
        LbapH(26) = LbapH(26) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 1 1 0 1 0])
        %
        LbapH(27) = LbapH(27) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 1 1 0 1 1])
        %
        LbapH(28) = LbapH(28) + 1;
    end    
        %
    if isequal(Lbap_tmp,[0 1 1 1 0 0])
        %
        LbapH(29) = LbapH(29) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 1 1 1 0 1])
        %
        LbapH(30) = LbapH(30) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 1 1 1 1 0])
        %
        LbapH(31) = LbapH(31) + 1;
    end
    %
    if isequal(Lbap_tmp,[0 1 1 1 1 1])
        %
        LbapH(32) = LbapH(32) + 1;
    end 
    %
    %
    %
    if isequal(Lbap_tmp,[1 0 0 0 0 0])
        %
        LbapH(33) = LbapH(33) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 0 0 0 0 1])
        %
        LbapH(34) = LbapH(34) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 0 0 0 1 0])
        %
        LbapH(35) = LbapH(35) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 0 0 0 1 1])
        %
        LbapH(36) = LbapH(36) + 1;
    end    
    %
    if isequal(Lbap_tmp,[1 0 0 1 0 0])
        %
        LbapH(37) = LbapH(37) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 0 0 1 0 1])
        %
        LbapH(38) = LbapH(38) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 0 0 1 1 0])
        %
        LbapH(39) = LbapH(39) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 0 0 1 1 1])
        %
        LbapH(40) = LbapH(40) + 1;
    end      
        %
    if isequal(Lbap_tmp,[1 0 1 0 0 0])
        %
        LbapH(41) = LbapH(41) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 0 1 0 0 1])
        %
        LbapH(42) = LbapH(42) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 0 1 0 1 0])
        %
        LbapH(43) = LbapH(43) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 0 1 0 1 1])
        %
        LbapH(44) = LbapH(44) + 1;
    end    
        %
    if isequal(Lbap_tmp,[1 0 1 1 0 0])
        %
        LbapH(45) = LbapH(45) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 0 1 1 0 1])
        %
        LbapH(46) = LbapH(46) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 0 1 1 1 0])
        %
        LbapH(47) = LbapH(47) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 0 1 1 1 1])
        %
        LbapH(48) = LbapH(48) + 1;
    end  
    %
    %
    %
    if isequal(Lbap_tmp,[1 1 0 0 0 0])
        %
        LbapH(49) = LbapH(49) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 1 0 0 0 1])
        %
        LbapH(50) = LbapH(50) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 1 0 0 1 0])
        %
        LbapH(51) = LbapH(51) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 1 0 0 1 1])
        %
        LbapH(52) = LbapH(52) + 1;
    end    
    %
    if isequal(Lbap_tmp,[1 1 0 1 0 0])
        %
        LbapH(53) = LbapH(53) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 1 0 1 0 1])
        %
        LbapH(54) = LbapH(54) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 1 0 1 1 0])
        %
        LbapH(55) = LbapH(55) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 1 0 1 1 1])
        %
        LbapH(56) = LbapH(56) + 1;
    end      
        %
    if isequal(Lbap_tmp,[1 1 1 0 0 0])
        %
        LbapH(57) = LbapH(57) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 1 1 0 0 1])
        %
        LbapH(58) = LbapH(58) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 1 1 0 1 0])
        %
        LbapH(59) = LbapH(59) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 1 1 0 1 1])
        %
        LbapH(60) = LbapH(60) + 1;
    end    
        %
    if isequal(Lbap_tmp,[1 1 1 1 0 0])
    %
        LbapH(61) = LbapH(61) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 1 1 1 0 1])
        %
        LbapH(62) = LbapH(62) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 1 1 1 1 0])
        %
        LbapH(63) = LbapH(63) + 1;
    end
    %
    if isequal(Lbap_tmp,[1 1 1 1 1 1])
        %
        LbapH(64) = LbapH(64) + 1;
    end  
end

%
% LbapH = LbapH/length(Cs);




