# Home-service-robot

Final project for Udacity's Robotics Software Engineer Nanodegree Program

**Project Goals**

The goal of this project was to design a robot's environment in gazebo and program the home-service robot that will map it's environment and autonomously navigate to pre-specified pickup and drop-off locations. For this one needed to:

* Design robot's environment with the Building Editor in Gazebo.
* Teleoperate the robot and manually test SLAM.
* Use the ROS navigation stack and manually command the robot using the 2D Nav Goal arrow in rviz to move to 2 different desired positions and orientations.
* Write a pick_objects node that commands the robot to move to the desired pickup and drop off zones.
* Write an add_markers node that subscribes to the robot odometry and publishes pick-up and drop-off markers to rviz.
* modify pick_objects node and add_markers node to establish communication between them, to complete desired home service robot implementation

### Prerequisites

* Ubuntu 16.04 OS with default make (>=4.1) and g++/gcc (>=5.4) packages
* Gazebo >= 7.0
* ROS Kinetic
* following ROS packages were used and the process of obtaining them is detailed below:
	* [gmapping](http://wiki.ros.org/gmapping)
	* [turtlebot_teleop](http://wiki.ros.org/turtlebot_teleop)
	* [turtlebot_rviz_launchers](http://wiki.ros.org/turtlebot_rviz_launchers)
	* [turtlebot_gazebo](http://wiki.ros.org/turtlebot_gazebo)

### Directory Tree and contents

```
    ├──                                # Official ROS packages
    |
    ├── slam_gmapping                  # gmapping_demo.launch file                   
    │   ├── gmapping
    │   ├── ...
    ├── turtlebot                      # keyboard_teleop.launch file
    │   ├── turtlebot_teleop
    │   ├── ...
    ├── turtlebot_interactions         # view_navigation.launch file      
    │   ├── turtlebot_rviz_launchers
    │   ├── ...
    ├── turtlebot_simulator            # turtlebot_world.launch file 
    │   ├── turtlebot_gazebo
    │   ├── ...
    ├──                                # Your packages and direcotries
    |
    ├── map                            # map files
    │   ├── ...
	├── world                          # world files
    │   ├── ...
    ├── scripts                        # shell scripts files
    │   ├── ...
    ├──rvizConfig                      # rviz configuration files
    │   ├── ...
    ├──pick_objects                    # pick_objects C++ node
    │   ├── src/pick_objects.cpp
    │   ├── ...
    ├──add_markers                     # add_marker C++ node
    │   ├── src/add_markers.cpp
    │   ├── ...
    └──
```

This directory represents the main project's `src` folder structure with following contents

* README.md: this file.
* **images** - folder with images and videos for this report
* **add_markers** - add marker C++ node
* **config** - folder with configuration file to specify pick-up and drop-off locations
* **map** - map files
* **world** - world files
* **pick_objects** - pick-objects C++ node
* **rvizConfig** - folder with rViz configurations used with some launch scripts
* **scripts** - shell scripts
	* `home_service.sh` - main script for the home-service-robot
	* `add_marker.sh` - script for testing add_marker 
	* `pick_objects.sh` - script for testing pick_objects 
	* `test_navigation.sh` - script for testing navigation
	* `test_slam.sh` - script for performing SLAM and preparing map
* **slam_gmapping** - official ROS package with `gmapping_demo.launch` file
* **turtlebot** - official ROS package with `keyboard_teleop.launch` file
* **turtlebot_interactions** - official ROS package with `view_navigation.launch` file
* **turtlebot_simulator** - official ROS package with `turtlebot_world.launch` file

---

### Clone and Build

Since the folder presented here comprises only of ROS package, one needs to first create a catkin workspace and initialize it. Also, note that the official ROS packaged are already included here, but their dependencies need to be installed; steps for this are given below.

Within your `home` directory, execute the following:

```
mkdir -p catkin_ws/src
cd catkin_ws/src
catkin_init_workspace
```

Within `~/catkin_ws/src/` download or clone folders of this repository:

```
cd ~/catkin_ws/src/
git clone https://github.com/yuda226/Home-service-robot.git
```
Install dependencies:

```
rosdep -i install gmapping -y
rosdep -i install turtlebot_teleop -y
rosdep -i install turtlebot_rviz_launchers -y
rosdep -i install turtlebot_gazebo -y
```
Build the workspace
```
cd ~/catkin_ws/
catkin_make
source devel/setup.bash
```
Bash the home service .sh
```
cd ~/catkin_ws/src/scripts
./home_service.sh
```

Test slam_gmapping, amcl_localization, pick_objects, add_markers, RUN:
```
./test_slam.sh
./test_navigation.sh
./pick_objects.sh
./add_markers.sh
```