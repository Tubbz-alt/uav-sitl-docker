# uav-sitl
A UAV SITL simulation Docker Image for Drone-kit and Ardupilot flight stack.
This Image supports dronekit sitl and ardupilot sitl.

## Download Docker Image
```
docker pull evans000/uav-sitl
```
### Optional: Download the Ardupilot flight stack code

## Docker Start Up
```
xhost +
docker run -it --privileged \
 --env=LOCAL_USER_ID="$(id -u)" \
 -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
 -e DISPLAY=:0 \
 -p 14556:14556/udp \
 -p 8080:8080 \
 evans000/uav-sitl bash
```

### Optional : Include Ardupilot to the container
Add the following in the `docker run` command
```
-v ~path-to-your-dir/ardupilot:/ardupilot:rw \
```

### Important
Docker may not run if not called with sudo. In this case add `sudo` before the execution of the docker command
