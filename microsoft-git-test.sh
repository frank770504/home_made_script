sudo docker run \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
-v /home/yw-chen/Code/VS/:/root/git-credential-manager/ \
-v /home/yw-chen/Code/Compal/repo_test/src/decision_manager/:/root/decision_manager/ \
-it --rm ubuntu:git-jre
