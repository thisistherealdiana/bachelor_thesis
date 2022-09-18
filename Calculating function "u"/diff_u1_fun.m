function diff_u1 = diff_u1_fun(x, t, a, vxod)
    switch vxod
        case 1
            diff_u1 =diff(u1_fun(x), 'x_loc');
        case 2
            diff_u1 =diff(u1_fun(x), 'x_loc');
        case 3
            diff_u1=0;
    end
end
