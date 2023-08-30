# Low-code/no-code nodered based command server

Simple node red based command server for co-ordinating/controlling tasks across multiple VMs in a network. Useful if your VMs cannot directly talk to each other but needs to go through a bastion host. This container can be deployed in the bastion host and all the internal VMs should be able to communicate to this component over REST apis. This custom container is build with default project/flow which has few REST endpoint to register the VMs, check status with polling, reset the registration.

Repo have docker build script to customize the nodered image with default project/flows, bash script for simple tasks, docker-compose file to run the container. 

_Currenly only support http and APIs don't have any auth support_
