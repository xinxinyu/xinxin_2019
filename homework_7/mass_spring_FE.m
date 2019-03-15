% Special case implementation of a simple oscillator simulation using
% first-order Forward Euler solver. Even with small time steps solution 
% amplitude is increasing.
clear all
clc

omega0 = 2;

% Initial condition
X_0 = 2;

T0 = 2*pi/omega0;
% dt = T0/10000;
tk = 3*T0;




figure
k = 1;
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 10 8]); 
while true
    dt = 1/2*2^(-k)*0.5;
    N_t = floor(tk/dt);
    t = linspace(0, N_t*dt, N_t+1);
    u = zeros(N_t+1, 1);
    v = zeros(N_t+1, 1);
    u(1) = X_0;
    v(1) = 0;
    for n = 1:N_t
        u(n+1) = u(n) + dt*v(n);
        v(n+1) = v(n) - dt*omega0^2*u(n);
    end

for i = 1:length(u)
E(i)= osc_energy(u(i),v(i),omega0);
end

    plot(t, E)
    hold on
    xlabel('t (s)','FontUnits','points','interpreter','latex','FontSize',12,'FontName','Times'); 
    ylabel('Energy (J)','FontUnits','points','interpreter','latex','FontSize',12,'FontName','Times');

    grid on
   legend({'k=1','k=2','k=3','k=4','k=5','k=6','k=7','k=8','k=9','k=10'},'FontUnits','points','interpreter','latex','FontSize',8,'FontName','Times','Location','northwest')
   print -depsc2 energyFE.eps
    reply = input('Do you want more? Y/N [Y]:','s');
    if strcmp(reply,'Y')
        k = k+1;
        continue
    else
        break
    end
end 




% % Step equations forward in time
% for n = 1:N_t
%     u(n+1) = u(n) + dt*v(n);
%     v(n+1) = v(n) - dt*omega0^2*u(n);
% end
% 
% for i = 1:length(u)
% E(i)= osc_energy(u(i),v(i),omega0);
% end
% plot(t, E)
% 
% figure
% plot(t, u, 'b-', t, X_0*cos(omega0*t), 'r--');
% legend('numerical', 'exact', 'Location','northwest');
% title(sprintf('Displacements FE dt %g, tk %f', dt, tk))
% xlabel('t');
% % print('tmp', '-dpdf'); print('tmp', '-dpng');