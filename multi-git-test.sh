sudo docker run \
-v /home/yw-chen/Code/VC/git-subrepo/:/root/git-subrepo/ \
-v /home/yw-chen/Code/VC/multi-project-test-sub/:/root/multi-project-test-sub/ \
-v /home/yw-chen/Code/VC/multi-project-test-repo/:/root/multi-project-test-repo/ \
-v /home/yw-chen/Code/VC/play_ground/:/root/play_ground/ \
-it --rm ubuntu:git-up
