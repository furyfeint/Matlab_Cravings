figure;
hold on; axis equal; axis off; view(3);

%--- NOSE CONE (Payload Fairing)
[nx,ny,nz]=cylinder([0 0.35],60); nz=nz*1.1+6.7; % z = 6.7 to 7.8
surf(nx,ny,nz,'FaceColor',[1 1 1]*0.95,'EdgeAlpha',0.05);

%--- AVIONICS BAY
[ax,ay,az]=cylinder([0.35 0.35],50); az=az*0.28+6.42;
surf(ax,ay,az,'FaceColor',[0.2 0.2 0.6],'EdgeAlpha',0.07);

%--- INTERSTAGE COUPLER
[cx,cy,cz]=cylinder([0.39 0.35],40); cz=cz*0.2+6.22;
surf(cx,cy,cz,'FaceColor',[0.3 0.3 0.28],'EdgeAlpha',0.08);

%--- SECOND STAGE TANK
[s2x,s2y,s2z]=cylinder([0.35 0.35],60); s2z=s2z*1.4+4.8;
surf(s2x,s2y,s2z,'FaceColor',[0.7 0.7 0.7],'EdgeAlpha',0.05);

%--- SECOND STAGE ENGINE BELL
[esx,esy,esz]=cylinder([0.35 0.21],40); esz=esz*0.42+4.38;
surf(esx,esy,esz,'FaceColor',[0.2 0.2 0.22],'EdgeAlpha',0.06);

%--- SAFETY/CUTAWAY MARK
for cut=0:4
    line([-0.35 0.35]*cos(pi*cut/2.2), [-0.35 0.35]*sin(pi*cut/2.2),6.1*[1 1],'Color','k','LineWidth',1);
end

%--- INTERSTAGE RING
[irx,iry,irz]=cylinder([0.45 0.39],40); irz=irz*0.21+4.17;
surf(irx,iry,irz,'FaceColor',[0.28 0.25 0.2],'EdgeAlpha',0.12);

%--- FIRST STAGE (large tanks)
[x1,y1,z1]=cylinder([0.45 0.45],60); z1=z1*4+0.17;
surf(x1,y1,z1,'FaceColor',[0.8 0.8 0.88],'EdgeAlpha',0.03);

%--- MAINTENANCE/FUEL PORT
[fp_x,fp_y]=circle(0.07,30);
z_fp=3; % Port height
fill3(fp_x+0.45,fp_y,z_fp*ones(size(fp_x)),[0.7 0.3 0],'EdgeAlpha',0.7);

%--- ENGINE SECTION BELL ARRAY
n_eng=9; e_rad=0.20; e_bell=0.07; eb_z=0.13;
for k=0:n_eng-1
    ang = 2*pi*k/n_eng;
    [ex,ey,ez]=cylinder([e_bell e_rad],20); ez=ez*eb_z-0.13;
    surf(ex+0.33*cos(ang), ey+0.33*sin(ang), ez, 'FaceColor',[0.17 0.17 0.18],'EdgeAlpha',0.03);   
end
% Center engine (for Falcon 9 style)
[ex,ey,ez]=cylinder([e_bell e_rad],20); ez=ez*eb_z-0.13;
surf(ex, ey, ez, 'FaceColor',[0.22 0.18 0.16],'EdgeAlpha',0.06);

%--- FINS (4 swept-back)
fin_z=[0 -0.09 0.18 0.25 0];
fin_r=[0.45 0.49 0.66 0.67 0.45];
for k=0:3
    rot = k*pi/2;
    x_fin = fin_r .* cos(rot); y_fin = fin_r .* sin(rot);
    fill3(x_fin, y_fin, fin_z, [0.13 0.13 0.15],'EdgeAlpha',0.9,'EdgeColor','k');
end

%--- GRID FINS (Falcon style, could be rectangles furthe rdown)
for k=0:3
    grid_z=0.9; % mid-low
    rot = k*pi/2; gd=[-0.04 0.04 0.04 -0.04];
    [gx,gy]=pol2cart(rot*ones(1,4), 0.54*ones(1,4));
    fill3(gx+gd, gy+gd, grid_z*ones(1,4),[0.39 0.38 0.30],'EdgeAlpha',0.8);
end

%--- BOOSTERS (side, optional)
for b = [-1,1]
    [bx,by,bz]=cylinder([0.15 0.18],40); bz=bz*3.4+0.2;
    surf(bx+b*0.85,by,bz,[0.82 0.78 0.89],'EdgeAlpha',0.05);
    % Booster nozzle
    [boX,boY,boZ]=cylinder([0.18 0.24],30); boZ=boZ*0.12-0.05;
    surf(boX+b*0.85,boY,boZ+0.2,[0.21 0.16 0.14],'EdgeAlpha',0.06);
end

%--- Sensor/Cameras/Ports (just add small spheres/discs)
[sx,sy,sz]=sphere(10);
surf(0.05*sx+0.52,0.05*sy+0.1,3.8+0.05*sz,[0.91 0.97 0.2],'EdgeAlpha',0.7);

%--- Annotate major sections
text(0,0,8,'Payload Fairing','HorizontalAlignment','center','FontSize',14,'Color','k');
text(0,0,6.5,'Avionics','HorizontalAlignment','center','FontSize',10,'Color','b');
text(0,0,5.5,'Stage 2','HorizontalAlignment','center','FontSize',10,'Color','k');
text(0,0,1.3,'Stage 1','HorizontalAlignment','center','FontSize',10,'Color','k');

%--- GENERAL 3D Lighting
light('Position',[6 5 12],'Style','infinite'); material shiny
hold off;

function [x,y]=circle(r,n)
    theta=linspace(0,2*pi,n);
    x=r*cos(theta); y=r*sin(theta);
end
