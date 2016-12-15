
_docker_ros_directory="/home/compal_agv_ros_git"
_git_ros_directory="/home/yw-chen/Code/Compal/repo_test"
_docker_container_name="ros-indigo"
_env_file_name=~/.env_for_ros_docker.sh

function _change_env {
sed -ie "s/ROS_DOCKER_CONTAINER_NAME=.*/ROS_DOCKER_CONTAINER_NAME=\"$_docker_container_name\"/" $_env_file_name
cat $_env_file_name
}

function _no_gpu {
echo "go without gpu"
sudo docker run -it --rm \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --env="ROS_DIR=$_docker_ros_directory" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    -v $_git_ros_directory:$_docker_ros_directory \
    -v /home/yw-chen/Code/Compal/ros_common_setting:/root/setting \
    -v /home/yw-chen/Code/Gazebo_model/gazebo_models:/root/.gazebo/models \
    -v /home/yw-chen/Documents/CAD/gazebo:/root/gazebo \
    --name="$_docker_container_name" \
    frank770504/ros:compal-froz bash
}

function _with_gpu {
echo "go with gpu"
sudo nvidia-docker run -it --rm \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --env="ROS_DIR=$_docker_ros_directory" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    -v $_git_ros_directory:$_docker_ros_directory \
    -v /home/yw-chen/Code/Compal/ros_common_setting:/root/setting \
    -v /home/yw-chen/Code/Gazebo_model/gazebo_models:/root/.gazebo/models \
    -v /home/yw-chen/Documents/CAD/gazebo:/root/gazebo \
    --name="$_docker_container_name" \
    frank770504/ros:compal-froz-nvidia bash
}

_change_env

if [[ $# -ne 1 ]];
then
  echo "one"
  _with_gpu
  exit
fi

if [ $1 = "no_gpu" ];
then
  echo "two"
  _no_gpu
else
  echo "three"
  _with_gpu
fi

