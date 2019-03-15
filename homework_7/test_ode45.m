clear up
clc
U_0 = 2;
tspan = linspace(0, 1, 1001);

odefunc = @(t,u) u;
opts = odeset('RelTol',1e-6,'AbsTol',1e-6);
[t,u] = ode45(odefunc, tspan, U_0,opts);
figure
plot(t,u)

x_0 = 2;
dx_0 = 0;
omega = 2;
X_0 = [x_0 dx_0]';
tspan = linspace(0, 200*pi/omega, 201);
odefunc2= @(t,X) [X(2);
                  -omega^2*X(1)];
[t,X] = ode45(odefunc2, tspan, X_0,opts);
figure
plot(t,X(:,1))
hold on
plot(t,X(:,2))