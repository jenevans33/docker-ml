FROM bvlc/caffe:cpu

RUN apt-get update

# install python packages
RUN pip install tensorflow scikit-learn

# build opencv
add install.opencv.sh /install.opencv.sh
run /bin/sh /install.opencv.sh
run rm -rf /install.opencv.sh
