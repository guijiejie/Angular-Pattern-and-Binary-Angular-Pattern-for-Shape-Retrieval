function [ LapH ] = LAP( Cs, n_theta ,dp)
%

%
CsE = [ Cs(end-dp+1:end,:);Cs;Cs(1:dp,:) ];
% %
% figure(100)
% plot(CsE(:,1),CsE(:,2),'r','linewidth',2); 
% %
% pause

%
dA = 2*pi/n_theta;
%
Lap = zeros(length(Cs),1);

%
for i = dp+1:length(CsE)-dp
    % 取出3点
    TPs = CsE([i-dp i i+dp],:);
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
        Lap(i-dp) = Adiff;
    else
        %
        Lap(i-dp) = Adiff+2*pi;        
    end

end

%
Lap = ceil(Lap/dA);
%

% 统计直方图
LapH = zeros(n_theta,1);
%
for j = 1:n_theta
    %
    LapH(j) = length(find(Lap==j));
end


end

