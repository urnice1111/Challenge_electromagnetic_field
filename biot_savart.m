function B = biot_savart(Point,current)
 %distance = sqrt((Point(1)-dt(1))^2 + (Point(2)-dt(2))^2+(Point(3)-dt(3))^2);
    function dr = wire_dr(s)

        dr = [-sin(s),cos(s),0];  %derivar r porfavor ayuda
    end


    function r = wire(s)
        r = [cos(s),sin(s),0];
    end

    
    mu0 = (4*pi)*0.0000001;
    B = [0,0,0];
    for i =  -pi:0.1:pi
        r = wire(i);
        R = Point - r;
        dl = wire_dr(i) * 0.0001;
        R_norm = norm(R)^3;
        if R_norm ~= 0
            db = (mu0*current / 4*pi) * cross(dl,R)/norm(R)^3;
        end

        B = B + db;
    end

end