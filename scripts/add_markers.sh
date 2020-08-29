#!/bin/sh

xterm -e " roslaunch turtlebot_gazebo turtlebot_world.launch world_file:=/home/yuda/myrobot_udacity/myrobot_gazebo_project4/src/world/my_world.world " &
sleep 5

xterm -e " roslaunch turtlebot_gazebo amcl_demo.launch map_file:=/home/yuda/myrobot_udacity/myrobot_gazebo_project4/src/map/my_world_map.yaml " &
sleep 5

xterm -e " roslaunch turtlebot_rviz_launchers view_navigation.launch " &
ssleep 5

xterm -e "rosrun add_markers add_markers"

