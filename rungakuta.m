function [r_next,v_next] = rungakuta(r,v,dt,q,m, wire,dwire,sMin,sMax,I,ds)

    B1 = biot_savart(r,wire,dwire,sMin,sMax,I,ds);
    a1 = (q/m)*cross(v,B1);
    k1r = v;   k1v = a1;

    r2 = r + 0.5*dt*k1r;
    v2 = v + 0.5*dt*k1v;
    B2 = biot_savart(r2,wire,dwire,sMin,sMax,I,ds);
    a2 = (q/m)*cross(v2,B2);

    r3 = r + 0.5*dt*v2;
    v3 = v + 0.5*dt*a2;
    B3 = biot_savart(r3,wire,dwire,sMin,sMax,I,ds);
    a3 = (q/m)*cross(v3,B3);

    r4 = r + dt*v3;
    v4 = v + dt*a3;
    B4 = biot_savart(r4,wire,dwire,sMin,sMax,I,ds);
    a4 = (q/m)*cross(v4,B4);

    r_next = r + dt/6*(k1r + 2*v2 + 2*v3 + v4);
    v_next = v + dt/6*(k1v + 2*a2 + 2*a3 + a4);
end