function [h,i5,i95] = concentration_centerline_5_95(C)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

[nx,ny] = size(C);



h = zeros(1,ny);
i5 = zeros(1,ny);
i95 = zeros(1,ny);

% for i=1:ny
%     
%     i5 = find(smooth(C(:,i),200)<0.05);
%     if isempty(i5)
%     	i5 = 1;
%     else
%         i5 = i5(1);
%     end
%     i5 = i5(end);
% 
%     i95 = find(smooth(C(:,i),200)>0.95);
%     if isempty(i95)
%         i95 = length(C(:,i));
%     else
%         i95 = i95(end);
%     end
% 
% h(i) = abs(i95-i5);
% 
% end

for i=1:ny
    
    for j=1:nx
        if C(j,i)<0.8
            i95 = j;
            break
        end
    end
    
    for j=nx:-1:1
        if C(j,i)>0.2
            i5 = j;
            break
        end
    end
    
    h(i) = (i95+i5)/2;
    
end

i5 = mean(i5);
i95 = mean(i95);


end

