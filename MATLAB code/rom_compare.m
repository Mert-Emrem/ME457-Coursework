function [rom1,rom2]=rom_compare(motion1,motion2,time1,time2)
motion1(:,1) = motion1(:,1)*10;
motion1(:,2) = motion1(:,2);
motion2(:,2) = -1*motion2(:,2);
subplot(2,1,1);

plot(motion1(:,1),motion1(:,2),'r','LineWidth',1); grid on; grid minor; 

ut1 = unique(time1);
for i = 1:length(ut1)
    xline(ut1(i),'-.','LineWidth',1);
end

hold on;
rom1 = zeros(1,length(time1(:,1)));
for i = 1:length(time1(:,1))
    x = [time1(i,1) time1(i,2)];
    y1 = max(motion1(time1(i,1)/10:time1(i,2)/10,2));
    y2 = min(motion1(time1(i,1)/10:time1(i,2)/10,2));
    plot(x,[y1 y1],'-.k','LineWidth',1);
    plot(x,[y2 y2],'-.k','LineWidth',1);
    rom1(i)=y1-y2;
end
clear i x y1 y2;
hold off;

subplot(2,1,2);
plot(motion2(:,1),motion2(:,2),'b','LineWidth',1); grid on; grid minor;

ut2 = unique(time2);
for i = 1:length(ut2)
    xline(ut2(i),'-.','LineWidth',1); 
end
hold on;

rom2 = zeros(1,length(time1(:,1)));
for i = 1:length(time2(:,1))
    x = [time2(i,1) time2(i,2)];
    index1 = find(x(1) == motion2(:,1));
    index2 = find(x(2) == motion2(:,1));
    y1 = max(motion2(index1:index2,2));
    y2 = min(motion2(index1:index2,2));
    plot(x,[y1 y1],'-.k','LineWidth',1);
    plot(x,[y2 y2],'-.k','LineWidth',1);
    rom2(i)=y1-y2;
end
hold off;

end

