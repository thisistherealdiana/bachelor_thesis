function u = find_u (x, t, a, T,N0,beta,tau,alpha,l)

    int_sigma = @(p) (sigma_fun(p));
    integral_fun = @(s) (find_g_new(s, a, T,N0,beta,tau,alpha,l)*exp((1/a)*integral(int_sigma, x, s, 'ArrayValued', true)));
    
    if (t<=tau(1))&&(t>=0)
            if (x <= a * t)
                u = gamma_fun(t - x/a)*exp(-(1/a)*integral(int_sigma, 0, x, 'ArrayValued', true));
                u = u + (1/a)*alpha(1)*integral(integral_fun, 0, x, 'ArrayValued', true);
            else
                if x<=l
                    u = u0_fun(x - a*t)*exp(-(1/a)*integral(int_sigma, x-a*t, x, 'ArrayValued', true));
                    u = u + (1/a)*alpha(1)*integral(integral_fun, x-a*t, x, 'ArrayValued', true);
                end
            end
    end
    for k = 2:length(alpha)
        if (t<=tau(k))&&(t>=tau(k-1))
            if (x <= a * t)
                u = gamma_fun(t - x/a)*exp(-(1/a)*integral(int_sigma, 0, x, 'ArrayValued', true));
                p=0;
                for m=1:(k-1)
                    u = u + (1/a)*alpha(m)*integral(integral_fun, p, x-a*t+a*tau(m), 'ArrayValued', true);
                    p=x-a*t+a*tau(m);
                end
                u=u+(1/a)*alpha(k)*integral(integral_fun, p, x, 'ArrayValued', true);
            else
                if x<=l            
                    u = u0_fun(x - a*t)*exp(-(1/a)*integral(int_sigma, x-a*t, x, 'ArrayValued', true));
                    p=x-a*t;
                    for m=1:(k-1)
                        u = u + (1/a)*alpha(m)*integral(integral_fun, p, x-a*t+a*tau(m), 'ArrayValued', true);
                        p=x-a*t+a*tau(m);
                    end
                    u = u + (1/a)*alpha(k)*integral(integral_fun, p, x, 'ArrayValued', true);
                end
            end
        end   
    end
    

