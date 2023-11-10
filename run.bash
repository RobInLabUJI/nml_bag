#!/bin/bash

BAGS_FOLDER="${HOME}/Escriptori/IR2121/SLAM_TB3/"

docker run --rm -it -p 8888:8888 -v ${BAGS_FOLDER}:/home/jovyan/bags nml_bag:latest

