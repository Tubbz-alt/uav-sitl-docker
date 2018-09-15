# uav-sitl
A UAV SITL simulation Docker Image for Drone-kit and Ardupilot flight stack.
This Image supports dronekit sitl and ardupilot sitl.

## Download Docker Image
```
docker pull evans000/uav-sitl
```
### Optional: Download the Ardupilot flight stack code

## Docker Start Up

Start the docker container having GUI support for tools like the console and the map
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

### Spawn a new Docker Container
```
docker exec -it <container-id> bash
```

### Optional : Include Ardupilot to the container
Add the following in the `docker run` command
```
-v ~path-to-your-dir/ardupilot:/ardupilot:rw \
```

#### Important
Docker may not run if not called with sudo. In this case add `sudo` before the execution of the docker command


# Ardupilot Sitl Execution
Sitl can be exexuted with Auto parameters for MavProxy or with custom loaded

## Option 1 : Auto MavProxy
```
cd ardupilot/ArduCopter
../Tools/autotest/sim_vehicle.py --map --console
```

## Option 2 : Manual MavProxy
Enter your own home longitude and latitude and the path of your computer on the `defaults` flag

### Docker Terminal 1
```
cd ardupilot/build/sitl/bin
./arducopter -S -I0 --model "+" --home custom-long,custom-lat,0,180 --defaults /home/your-username/ardupilot/Tools/autotest/default_params/copter.parm
```

### Docker Terminal 2
```
mavproxy.py --master tcp:127.0.0.1:5760 --out udp:127.0.0.1:14551
```

## MavProxy console Commands
```
mode GUIDED          (change the flight mode)
GUIDED> arm throttle (arm the UAV)
GUIDED> takeoff 10   (to fly at 10m)
GUIDED> Guided (long, lat) height
```
