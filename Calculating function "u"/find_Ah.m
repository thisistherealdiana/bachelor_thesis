function AH = find_Ah(x,T,a,l)
int_sigma = @(s) (sigma_fun(s));
    syms x_loc t_loc
    if (x<0)
        vxod = 3;
    else
        if (x<=a*T)
            vxod=1;
        else 
            if (x<=l)
                vxod = 2;
            else
                vxod=3;
            end
        end
    end
    u1 = a*diff_u1_fun(x_loc, t_loc, a, vxod);
    second = a * diff_sec_fun(x_loc, t_loc, a, vxod);
    diff_u1 = double(subs(subs(u1, x_loc, x), t_loc, T));
    diff_second = double(subs(subs(second, x_loc, x), t_loc, T));
        
    switch vxod
        case 1
            AH =diff_u1;
            AH=AH+exp(-(1/a)*integral(int_sigma, 0, x, 'ArrayValued', true))*sigma_fun(x)*gamma_fun(T-x/a);
            AH=AH+sigma_fun(x)*find_h(x,T,a);
        case 2
            AH =diff_u1-diff_second*exp(-(1/a)*integral(int_sigma, x-a*T, x, 'ArrayValued', true));
            AH=AH-a*exp(-(1/a)*integral(int_sigma, 0, x, 'ArrayValued', true))*(sigma_fun(x)-sigma_fun(x-a*T))*u0_fun(x-a*T);
            AH=AH+sigma_fun(x)*find_h(x,T,a);
        case 3
            AH=0;
    end
end

