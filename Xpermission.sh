export containerId=$(sudo docker ps -l -q) && xhost +local:`sudo docker inspect --format='{{ .Config.Hostname }}' $containerId`
