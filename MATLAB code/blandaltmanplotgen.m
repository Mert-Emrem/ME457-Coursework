function altmanchartman(rom1,rom2)
diffrom = rom1-rom2; meanrom = (rom1+rom2)/2;
S = std(diffrom); b = mean(diffrom);
upper = b + 1.96*S; lower = b - 1.96*S;
x = meanrom; y = diffrom;
scatter(x,y,500,'.','r'); grid on; grid minor; hold on;
yline([upper lower],'--',{'Upper limit','Lower limit'})
yline(b,'-',{'Bias'}); hold off;
end

