
_user="frank770504"

function _docker_rm {
sudo docker run \
 -v /home/yw-chen/Code/Compal/compal_agv_ros_git:/home/compal_agv_ros_git \
 -v /home/yw-chen/Code/Compal/ros_common_setting:/root/setting \
 --name="ros-indego" \
 --rm -it $_user/ros:$1 bash
}
function _docker {
sudo docker run \
 -v /home/yw-chen/Code/Compal/compal_agv_ros_git:/home/compal_agv_ros_git \
 -v /home/yw-chen/Code/Compal/ros_common_setting:/root/setting \
 -it $_user/ros:$1 bash
}

if [[ $# -ne 2 ]];
then
  _docker_rm $1
  exit
fi

if [ $2 = "free" ];
then
  _docker $1
else
  _docker_rm $1
fi
