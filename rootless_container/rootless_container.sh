#!/bin/bash

is_image="false"
is_host_mount="false"
container_name=""

while [[ $is_image != "true" ]]; do
	read -p "Enter image to run: " image
	if podman pull $image > /dev/null 2>&1; then
		read -p "Enter name for container: " container_name
		is_image="true"
		while [[ $is_host_mount != "true" ]]; do
			read -p "Enter the full path of the host mount: " host_mount
			if [[ -d $host_mount ]]; then
				is_host_mount="true"
			else
				echo "no directory"
				mkdir -vp $host_mount 
				is_host_mount="true"
			fi
		done
	else
		echo "no image"
	fi
done

read -p "Enter the path of the container mount: " container_mount
echo "creating container now...."
podman run -d --name $container_name -v $host_mount:$container_mount $image
