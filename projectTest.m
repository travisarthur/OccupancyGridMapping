clear
% Formats all doubles to long format instead of exponential.
format long g

% Initial call of the python program main.py.
% data_from_sensor Is assigned the return output from main.py
% This output is a 1x2 py.list
% 1x1 is the angle data, 1x2 is the distance data.
data_from_sensor = py.Scanner.run(1);
% Seperates data_from_sensor into angle and data. 
% Variables angle_list/dist_list are still type py.list
% Contents of these variables look like:
% [[data1,data2,data3,...,dataN]]
dist_list = data_from_sensor(1);
angle_list = data_from_sensor(2);
% Accessing data within a py.list type is done with {} braces.
% The variables below are to remove the outermost brackets.
sub_angle_list = angle_list{1};
sub_dist_list = dist_list{1};
% These variabless are pre-allocated arrays to make MATLAB happy,and
% create a space to have when when extract the data from the py.list
% so it can be used as a double type.
angle_array = zeros(1,length(angle_list{1}));
dist_array = zeros(1,length(dist_list{1}));
% sub_angle/dist_list looks like [data1,...,dataN] and is still py.list
% type. When  we index sub_angle/dist_list{1} it will grab data1 and then
% because data1 is numeric MATLAB will treat it as a double. All angles
% that come in are in degrees and must be converted to radians. All
% distances that come in are in millimeters and must be in meters.
for i = 1:length(dist_array)
    angle_array(1,i) = sub_angle_list{i} * (pi/180);
    dist_array(1,i) = sub_dist_list{i}*10^(-3);
end

% MAX_Range is constant that is defined by two factors the max distance
% that the sensor can detect is 11m and the max distance available to
% detect in my home which is around 9m. 10 meters was chosen to split the
% difference. 
MAX_RANGE = 10;
% POSE is a constant that repersents the position is space that the sensor
% occupies. 
POSE = [5,5,0];
% MAP is a constant that is assigned the setting of the parameters for the
% occupancyMap(width(m),height(m),Resolution), where Resolution refers to the
% number of grids per meter.
MAP = occupancyMap(15,15,10);
% Creates a lidar scan object for the map.
scan = lidarScan(dist_array,angle_array);
% Processes the scan data with in the occupancy grid map. 
insertRay(MAP,POSE,scan,MAX_RANGE);

show(MAP)
title('RPLidar Occupancy Map')
xlabel('X[meters]')
ylabel('Y[meters]')