#!/bin/bash

image="false"
host_mount="false"
while [[ $image != "true" ]]; do
	read -p "Enter image to run: " image
	if [[ $image == "test" ]]; then
		image="true"
		while [[ $host_mount != "true" ]]; do
			read -p "Enter the path of the host mount: " host_mount
			if [[ $host_mount == "host" ]]; then
				host_mount="true"
				read -p "Enter the path of the container mount: " container_mount
				echo "creating container now..."
			else
				echo "no directory"
			fi
		done
	else
		echo "no image"
	fi
done
