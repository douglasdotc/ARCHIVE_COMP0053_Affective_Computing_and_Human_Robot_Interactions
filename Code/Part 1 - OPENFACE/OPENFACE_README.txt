
# Instruction on using OpenFace to extract facial features

OpenFace is available on Windows, Unix and MacOS. Here the instructions are for Mac as it is what was used in the project. 

### Installation 

Follow the instructions from the following links to download and build OpenFace:

https://github.com/TadasBaltrusaitis/OpenFace/wiki/Mac-installation

https://github.com/TadasBaltrusaitis/OpenFace/wiki/Unix-Installation

### Docker
In order to run OpenFace on Mac, Docker is required. Download the Mac (intel chip) version of docker from https://www.docker.com/get-started, then follow the instructions to install and setup docker. 

Once the docker engine is up and running, follow the instructions from https://github.com/TadasBaltrusaitis/OpenFace/wiki/Docker to run the container.

### Running OpenFace

Follow the instructions from the following links to run OpenFace:

https://github.com/TadasBaltrusaitis/OpenFace/wiki/Command-line-arguments

### description of steps performed to extract features

For best performance all the video footages are converted to .avi format using App 'Free WMV AVI Converter' from Mac App Store

Open two separate terminals

In the first one terminal, run the following command to start docker container

```docker run -it --rm algebr/openface:latest```

Then you'll see the following:

```root@26e0533c5dcb:/home/openface-build# ```

take note of the container ID 26e0533c5dcb (your ID are most likely to be different from this)

In the second terminal, navigate to where the footages are, and run copy all the footage into docker container using your container ID (FILE_NAME is the name of the file you want to transfer):

```docker cp FILE_NAME  YOUR_CONTAINER_ID:/home/openface-build```

Go back to the first terminal, you should now see the files in the container if you run ```ls```, then to process the video with OpenFace, run the following for each video:

```build/bin/FeatureExtraction -f VIDEO_NAME.avi```

The processing results can be found under '/processed' directory. Once all the video are processed, go back to the second terminal and use the same command to copy the results back to your main file system (you can choose your own DIRECTORY_NAME):

```docker cp YOUR_CONTAINER_ID:/home/openface-build/processed DIRECTORY_NAME```

To exit the container, in the first terminal, type ```exit``` or ```control+D```
