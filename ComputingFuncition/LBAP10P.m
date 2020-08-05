function [ LbapH ] = LBAP10P( Cs, dp1,dp2)
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
Lbap = zeros(length(Cs),10);

%
for i = dp2+1:length(LapE)-dp2
    % 取出11点的Lap
    TAs = LapE([i-dp2 i-dp2*(4/5) i-dp2*(3/5) i-dp2*(2/5) i-dp2*(1/5) i i+dp2*(1/5) i+dp2*(2/5) i+dp2*(3/5) i+dp2*(4/5) i+dp2]);
    %
    if TAs(1)>=TAs(6)
        %
        Lbap(i-dp2,1) = 1;     
    end
    %
    if TAs(2)>=TAs(6)
        %
        Lbap(i-dp2,2) = 1;     
    end
    %
    if TAs(3)>=TAs(6)
        %
        Lbap(i-dp2,3) = 1;     
    end
    %
    if TAs(4)>=TAs(6)
        %
        Lbap(i-dp2,4) = 1;     
    end
    %
    if TAs(5)>=TAs(6)
        %
        Lbap(i-dp2,5) = 1;     
    end
    %
    if TAs(7)>=TAs(6)
        %
        Lbap(i-dp2,6) = 1;     
    end
        %
    if TAs(8)>=TAs(6)
        %
        Lbap(i-dp2,7) = 1;     
    end
    %
    if TAs(9)>=TAs(6)
        %
        Lbap(i-dp2,8) = 1;     
    end
    %
    if TAs(10)>=TAs(6)
        %
        Lbap(i-dp2,9) = 1;     
    end
    %
    if TAs(11)>=TAs(6)
        %
        Lbap(i-dp2,10) = 1;     
    end
end

% 进行局部模式的直方图统计
LbapH = zeros(1024,1);
%
Lbap1 = Lbap(:,1)*128;
Lbap2 = Lbap(:,2)*64;
Lbap3 = Lbap(:,3)*32;
Lbap4 = Lbap(:,4)*16;
Lbap5 = Lbap(:,5)*8;
Lbap6 = Lbap(:,6)*4;
Lbap7 = Lbap(:,7)*2;
Lbap8 = Lbap(:,8)*1;
Lbap9 = Lbap(:,9)*256;
Lbap10 = Lbap(:,10)*512;
%
LbapV = Lbap1+Lbap2+Lbap3+Lbap4+Lbap5+Lbap6+Lbap7+Lbap8+Lbap9+Lbap10;
%
for i = 1:length(Cs)
    %
    LbapH(LbapV(i)+1) = LbapH(LbapV(i)+1)+1;
end

%
% LbapH = LbapH/length(Cs);




