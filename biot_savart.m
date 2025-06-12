function B = biot_savart(P, wire,dwire,sMin,sMax,I,ds)
    mu0 = 4*pi*1e-7;   
    B = [0 0 0];

    for s = sMin:ds:sMax
        r  = wire(s);
        dl = dwire(s)*ds;
        R  = P - r;
        R2 = dot(R,R);
        if R2~=0
            B = B + mu0*I/(4*pi)*cross(dl,R)/(R2*sqrt(R2));
        end
    end
end


