function diff_sec = diff_sec_fun(x, t, a, vxod)
    switch vxod
        case 1
            diff_sec =diff(gamma_fun(t-x/a), 'x_loc');
        case 2
            diff_sec =diff(u0_fun(x-a*t), 'x_loc');
        case 3
            diff_sec=0;
    end
end
