
_docker_container_name="gzserver7"

function _no_gpu {
echo "go without gpu"
sudo nvidia-docker run -it --rm \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --name="$_docker_container_name" \
    -v /home/yw-chen/Documents/CAD/gazebo:/root/gazebo \
    -v /home/yw-chen/Code/Gazebo_model/gazebo_models:/root/.gazebo/models \
    frank770504/gazebo:gzaserver7-nvidia gazebo
}

function _with_gpu {
echo "go with gpu"
sudo nvidia-docker run -it --rm \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --name="$_docker_container_name" \
    -v /home/yw-chen/Documents/CAD/gazebo:/root/gazebo \
    -v /home/yw-chen/Code/Gazebo_model/gazebo_models:/root/.gazebo/models \
    frank770504/gazebo:gzaserver7-nvidia gazebo
}

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

