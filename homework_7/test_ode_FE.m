%% test for u'=u
t_exp = [0 1 2 3]';
u_exp = [1 2 4 8]';
%%
U_0 = 1;
fun = @(t,u) u;
tspan = [1 3];
tol = 1e-6;
[t, u] = ode_FE(fun, tspan, U_0);
plot(t,u)
assert(isequal(size(t),size(t_exp)));
assert(max(abs(t-t_exp))<tol);
assert(max(abs(u-u_exp))<tol);
%% test u'=ru
tspan = [0.5 60];
r = 0.1;
fun = @ (t,u) r*(1 - u/500)*u;
U_0 = 100;
[t, u] = ode_FE(fun, tspan, U_0);
plot(t,u)
%% 
a=1;
k=100;
b=1;
m = 1;
tspan = [1 20];
f = @(t) a*t+b;
fun = @ (t,u) a+k*(u-f(t)).^m;
U_0 = f(0);
[t, u] = ode_FE(fun, tspan, U_0);
plot(t,u)




