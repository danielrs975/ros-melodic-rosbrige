FROM ros:melodic-perception

# Install ros-bridge package
RUN apt-get update -y && \
    apt-get install ros-melodic-rosbridge-suite -y && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# PORTS:
#   - 9090 --> Websocket port. You can use it to connect through
#              websockets to the ROS Master. With this connection
#              you can make control the Nodes in ROS.
#   - 11311 --> ROS Master port. So you can verify is the master is active
EXPOSE 9090 11311 

CMD [ "roslaunch", "rosbridge_server", "rosbridge_websocket.launch" ]