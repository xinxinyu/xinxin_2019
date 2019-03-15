clc 
clear all
f = @(u, t) 0.1*(1 - u/500)*u;
U_0 = 100;
T = 60;

figure
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 10 8]); 
for l = 0
    dt = 2^(-l)*0.5;
    tspan = [dt T]';
    [t,u] = ode_FE(f,tspan, U_0);
    plot(t, u,'LineWidth',1);
    hold on
    xlabel('t','FontUnits','points','interpreter','latex','FontSize',12,'FontName','Times'); 
    ylabel('N(t)','FontUnits','points','interpreter','latex','FontSize',12,'FontName','Times');
    grid on 
end
print -depsc2 T0.eps



figure
k = 0;
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 10 8]); 
while true
    dt = 2^(-k)*0.5;
    tspan = [dt T]';
    [t,u] = ode_FE(f,tspan, U_0);
    plot(t(55/dt:56/dt), u(55/dt:56/dt));
    xlim([55 55.5])
    hold on
    xlabel('t','FontUnits','points','interpreter','latex','FontSize',12,'FontName','Times'); 
    ylabel('N(t)','FontUnits','points','interpreter','latex','FontSize',12,'FontName','Times');

    grid on
   legend({'k=1','k=2','k=3','k=4','k=5','k=6','k=7','k=8','k=9','k=10'},'FontUnits','points','interpreter','latex','FontSize',8,'FontName','Times','Location','northwest')
   print -depsc2 uwithT.eps
    reply = input('Do you want more? Y/N [Y]:','s');
    if strcmp(reply,'Y')
        k = k+1;
        continue
    else
        break
    end
end 









%     dt = 2^(-k)*0.5;
%     tspan = [dt T]';
%     [t,u] = ode_FE(f,tspan, U_0);
%     plot(t, u);
%     hold on
%     xlabel('t'); ylabel('N(t)');
%     grid on
%     
%     legend('k=1','k=2','k=3','k=4','k=5','k=6','k=7','k=8','k=9','k=10')
% end 
% 
%     filestem = strcat('dt=',num2str(dt));
% filename = strcat(filestem, '.png'); print(filename);
% filename = strcat(filestem, '.pdf'); print(filename);
% dt = 20; T = 100;
% tspan = [dt T]';
% [t,u] = ode_FE(f,tspan, U_0);
% plot(t, u, 'b-');
% xlabel('t'); ylabel('N(t)');
% filestem = strcat('tmp_',num2str(dt));
% print(filestem, '-dpng'); print(filestem, '-dpdf');
