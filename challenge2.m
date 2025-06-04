% s, sin(s), t


x = linspace(-pi,pi,50);
y = x;
z = x;

[X,Y,Z] = meshgrid(x,y,z);

Bx = zeros(size(X));
By = zeros(size(Y));
Bz = zeros(size(Z));

for i = 1:numel(X)
    point = [X(i),Y(i),Z(i)];
    B = biot_savart(point,1);
    Bx(i) = B(1);
    By(i) = B(2);
    Bz(i) = B(3);
end

t = linspace(-pi,pi,100)
x_wire = cos(t);
y_wire = sin(t);
z_wire = zeros(size(t));

figure
plot3(x_wire,y_wire,z_wire,'LineWidth',3)
hold on
grid on
quiver3(X,Y,Z,Bx,By,Bz)




%la funcion va a recibir, un punto, la corriente, diferencial de t


