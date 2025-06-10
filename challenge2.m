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

pasos = 20;
n_particula = 100;

posx = zeros(pasos, n_particula);
posy = zeros(pasos, n_particula);
posz = zeros(pasos, n_particula);

posx(1,:) = pi*rand(1, n_particula);
posy(1,:) = pi*rand(1, n_particula);
posz(1,:) = pi*rand(1, n_particula);


v_next = [1,1,1];
v = [1,1,1];
q = 1.602e-19;
m = 9.109e-31;
dt = 0.1;




t = linspace(-pi,pi,100);
x_wire = cos(t);
y_wire = sin(t);
z_wire = zeros(size(t));

figure
plot3(x_wire,y_wire,z_wire,'LineWidth',3)
hold on
grid on
% quiver3(X,Y,Z,Bx,By,Bz)
daspect([1 1 1])



for i = 1:pasos
    scatter3(posx(i,:), posy(i,:), posz(i,:), 2, 'r', 'filled');
    pause(0.1);
end

%la funcion va a recibir, un punto, la corriente, diferencial de t


