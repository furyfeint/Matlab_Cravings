% Working 3D Realistic Bicycle Model - Simplified and Fixed
clear; close all; clc;

figure('Name','3D Bicycle','Color','w');
hold on; axis equal; axis off;
view(3);

%% Define Colors
frame_color = [0.2 0.2 0.25];
wheel_color = [0.1 0.1 0.1];
rim_color = [0.7 0.7 0.75];
hub_color = [0.5 0.5 0.5];

%% REAR WHEEL (at origin)
rear_x = 0; rear_y = 0; rear_z = 0.35;
[X,Y,Z] = cylinder(0.35, 50);
Z = Z*0.03 - 0.015;
surf(X+rear_x, Y+rear_y, Z+rear_z, 'FaceColor', wheel_color, 'EdgeAlpha', 0.1);

% Rear rim
[X,Y,Z] = cylinder(0.32, 50);
Z = Z*0.02 - 0.01;
surf(X+rear_x, Y+rear_y, Z+rear_z, 'FaceColor', rim_color, 'EdgeAlpha', 0.2);

% Rear hub
[X,Y,Z] = cylinder(0.03, 30);
Z = Z*0.04 - 0.02;
surf(X+rear_x, Y+rear_y, Z+rear_z, 'FaceColor', hub_color, 'EdgeAlpha', 0.3);

% Rear spokes
theta = linspace(0, 2*pi, 37);
for i = 1:36
    plot3([rear_x, rear_x+0.32*cos(theta(i))], ...
          [rear_y, rear_y+0.32*sin(theta(i))], ...
          [rear_z, rear_z], 'k-', 'LineWidth', 0.5);
end

%% FRONT WHEEL
front_x = 1.0; front_y = 0; front_z = 0.35;
[X,Y,Z] = cylinder(0.35, 50);
Z = Z*0.03 - 0.015;
surf(X+front_x, Y+front_y, Z+front_z, 'FaceColor', wheel_color, 'EdgeAlpha', 0.1);

% Front rim
[X,Y,Z] = cylinder(0.32, 50);
Z = Z*0.02 - 0.01;
surf(X+front_x, Y+front_y, Z+front_z, 'FaceColor', rim_color, 'EdgeAlpha', 0.2);

% Front hub
[X,Y,Z] = cylinder(0.03, 30);
Z = Z*0.04 - 0.02;
surf(X+front_x, Y+front_y, Z+front_z, 'FaceColor', hub_color, 'EdgeAlpha', 0.3);

% Front spokes
for i = 1:36
    plot3([front_x, front_x+0.32*cos(theta(i))], ...
          [front_y, front_y+0.32*sin(theta(i))], ...
          [front_z, front_z], 'k-', 'LineWidth', 0.5);
end

%% FRAME
% Seat tube
plot3([0 0], [0 0], [0.35 0.65], 'Color', frame_color, 'LineWidth', 8);

% Top tube
plot3([0 0.55], [0 0], [0.65 0.55], 'Color', frame_color, 'LineWidth', 8);

% Down tube
plot3([0 0.55], [0 0], [0.35 0.1], 'Color', frame_color, 'LineWidth', 9);

% Head tube
plot3([0.55 0.55], [0 0], [0.1 0.55], 'Color', frame_color, 'LineWidth', 7);

% Chain stays (rear triangle)
plot3([0 0], [0 0.12], [0.35 0.35], 'Color', frame_color, 'LineWidth', 6);
plot3([0 0], [0 -0.12], [0.35 0.35], 'Color', frame_color, 'LineWidth', 6);

% Seat stays
plot3([0 0], [0.12 0], [0.35 0.65], 'Color', frame_color, 'LineWidth', 6);
plot3([0 0], [-0.12 0], [0.35 0.65], 'Color', frame_color, 'LineWidth', 6);

%% FORK
% Fork legs
plot3([0.55 1.0], [0.08 0.08], [0.1 0.35], 'Color', [0.25 0.25 0.3], 'LineWidth', 6);
plot3([0.55 1.0], [-0.08 -0.08], [0.1 0.35], 'Color', [0.25 0.25 0.3], 'LineWidth', 6);

% Fork crown
plot3([0.55 0.55], [0.08 -0.08], [0.1 0.1], 'Color', [0.25 0.25 0.3], 'LineWidth', 7);

%% SEAT & SEATPOST
% Seat post
plot3([0 0], [0 0], [0.65 0.75], 'Color', [0.4 0.4 0.45], 'LineWidth', 5);

% Saddle
[X,Y,Z] = ellipsoid(0, 0, 0.77, 0.08, 0.15, 0.03, 20);
surf(X, Y, Z, 'FaceColor', [0.1 0.1 0.1], 'EdgeAlpha', 0.2);

%% HANDLEBARS
% Stem
plot3([0.55 0.60], [0 0], [0.55 0.52], 'Color', [0.35 0.35 0.4], 'LineWidth', 5);

% Handlebar (horizontal bar)
plot3([0.60 0.60], [-0.22 0.22], [0.52 0.52], 'Color', [0.3 0.3 0.35], 'LineWidth', 5);

% Drop sections
plot3([0.60 0.62], [-0.22 -0.24], [0.52 0.42], 'Color', [0.3 0.3 0.35], 'LineWidth', 4);
plot3([0.60 0.62], [0.22 0.24], [0.52 0.42], 'Color', [0.3 0.3 0.35], 'LineWidth', 4);

%% CRANKSET & PEDALS
% Crank arms
crank_angle = 45 * pi/180;
crank_length = 0.17;

% Left crank
crank_x1 = crank_length * cos(crank_angle);
crank_z1 = 0.35 + crank_length * sin(crank_angle);
plot3([0 crank_x1], [0 0], [0.35 crank_z1], 'Color', [0.35 0.35 0.4], 'LineWidth', 7);

% Right crank
crank_x2 = -crank_length * cos(crank_angle);
crank_z2 = 0.35 - crank_length * sin(crank_angle);
plot3([0 crank_x2], [0 0], [0.35 crank_z2], 'Color', [0.35 0.35 0.4], 'LineWidth', 7);

% Pedals (as ellipsoids)
[X,Y,Z] = ellipsoid(crank_x1, 0, crank_z1, 0.05, 0.03, 0.01, 15);
surf(X, Y, Z, 'FaceColor', [0.2 0.2 0.2], 'EdgeAlpha', 0.3);

[X,Y,Z] = ellipsoid(crank_x2, 0, crank_z2, 0.05, 0.03, 0.01, 15);
surf(X, Y, Z, 'FaceColor', [0.2 0.2 0.2], 'EdgeAlpha', 0.3);

%% CHAINRING
chainring_r = 0.1;
chainring_theta = linspace(0, 2*pi, 50);
chainring_x = chainring_r * cos(chainring_theta);
chainring_y = chainring_r * sin(chainring_theta);
plot3(chainring_x, chainring_y, 0.35*ones(size(chainring_x)), 'Color', [0.3 0.3 0.35], 'LineWidth', 3);

%% CASSETTE (rear sprocket)
cassette_r = 0.06;
cassette_x = cassette_r * cos(chainring_theta);
cassette_y = cassette_r * sin(chainring_theta);
plot3(cassette_x+rear_x, cassette_y+rear_y, rear_z*ones(size(cassette_x)), 'Color', [0.25 0.25 0.3], 'LineWidth', 2);

%% CHAIN
plot3([0.1 0], [0 0], [0.35 0.35], 'k-', 'LineWidth', 2);

%% DISC BRAKES
% Front disc
disc_theta = linspace(0, 2*pi, 40);
disc_r = 0.09;
disc_x_f = disc_r * cos(disc_theta) + front_x;
disc_y_f = disc_r * sin(disc_theta) + front_y;
disc_z_f = (front_z - 0.35) * ones(size(disc_theta));
fill3(disc_x_f, disc_y_f, disc_z_f, [0.4 0.2 0.1], 'EdgeAlpha', 0.3);

% Rear disc
disc_x_r = disc_r * cos(disc_theta) + rear_x;
disc_y_r = disc_r * sin(disc_theta) + rear_y;
disc_z_r = (rear_z - 0.35) * ones(size(disc_theta));
fill3(disc_x_r, disc_y_r, disc_z_r, [0.4 0.2 0.1], 'EdgeAlpha', 0.3);

%% WATER BOTTLE
bottle_x = 0.3;
[X,Y,Z] = cylinder(0.03, 20);
Z = Z*0.18 + 0.45;
surf(X+bottle_x, Y+0.1, Z, 'FaceColor', [0 0.4 0.8], 'FaceAlpha', 0.7, 'EdgeAlpha', 0.4);

%% LIGHTS
% Front light
[X,Y,Z] = sphere(10);
surf(0.02*X+front_x-0.05, 0.02*Y-0.15, 0.02*Z+0.15, 'FaceColor', [1 1 0], 'EdgeAlpha', 0.5);

% Rear light
surf(0.015*X+rear_x-0.05, 0.015*Y-0.15, 0.015*Z+rear_z+0.05, 'FaceColor', [1 0 0], 'EdgeAlpha', 0.5);

%% FINISHING
lighting gouraud;
light('Position', [2 2 3]);
light('Position', [-2 -2 2]);
material dull;
camlight('headlight');

view(45, 20);
title('Realistic 3D Bicycle Model', 'FontSize', 16);

hold off;
