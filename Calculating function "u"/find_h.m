function h = find_h(x, T, a)
    int_sigma = @(s) (sigma_fun(s));
    if (x<=0)
        h = 0;
    else
        if (x<=a*T)
            h=u1_fun(x)-gamma_fun(T-x/a)*exp(-(1/a)*integral(int_sigma, 0, x, 'ArrayValued', true));
        else 
            h=u1_fun(x)-u0_fun(x-a*T)*exp(-(1/a)*integral(int_sigma, x-a*T, x, 'ArrayValued', true));
        end
    end
end

