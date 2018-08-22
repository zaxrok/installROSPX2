#!/bin/bash
# Install Robot Operating System (ROS) on NVIDIA Jetson TX2
# Maintainer of ARM builds for ROS is http://answers.ros.org/users/1034/ahendrix/
# Information from:
# http://wiki.ros.org/kinetic/Installation/UbuntuARM

# The script is modified according to discussions on the Nvidia forum: https://devtalk.nvidia.com/default/topic/1011002/general/cross-compiling-driveworks-on-the-px2-with-ros/

# Setup sources.lst
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
# Setup keys
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 0xB01FA116
# Update the libssl1.0.0 package to the latest version [1.0.2g-1ubuntu4.6]and install libssl-dev
sudo apt-get install libssl1.0.0/xenial libssl-doc/xenial libssl-dev/xenial
# Installation
sudo apt-get update
# sudo apt-get install ros-kinetic-ros-base -y
sudo apt-get install ros-kinetic-desktop
# Add Individual Packages here
# You can install a specific ROS package (replace underscores with dashes of the package name):
# sudo apt-get install ros-kinetic-PACKAGE
# e.g.
# sudo apt-get install ros-kinetic-navigation
#
# To find available packages:
# apt-cache search ros-kinetic
# 
# Initialize rosdep
sudo apt-get install python-rosdep -y
# Certificates are messed up, to prevent error when run rosdep init
sudo c_rehash /etc/ssl/certs
# Initialize rosdep
sudo rosdep init
# To find available packages, use:
rosdep update
# Environment Setup
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
# echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib:/usr/lib/aarch64-linux-gnu" >> ~/.bashrc
source ~/.bashrc
# Install rosinstall
sudo apt-get install python-rosinstall -y
