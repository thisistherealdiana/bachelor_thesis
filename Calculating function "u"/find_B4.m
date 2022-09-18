function B = find_B4(x, T, a, tau, alpha,l)
int_sigma = @(s) (sigma_fun(s));
    B = alpha(1)*find_B3(x-a*T, T, a,tau,alpha,l)*exp(-(1/a)*integral(int_sigma, x-a*T, x, 'ArrayValued', true));
    for k = 2:length(alpha)
        B = B + (alpha(k)-alpha(k-1))*find_B3(x-a*(T-tau(k-1)), T, a,tau,alpha,l)*exp(-(1/a)*integral(int_sigma, x-a*(T-tau(k-1)), x, 'ArrayValued', true));
    end
%}
end

