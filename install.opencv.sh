apt-get install -y qt5-default
mkdir /opencv-build && cd /opencv-build
wget 'https://github.com/Itseez/opencv/archive/2.4.13.tar.gz' -O opencv-2.4.13.tar.gz && tar xvzf opencv-2.4.13.tar.gz
cd ./opencv-2.4.13 && mkdir build && cd ./build
cmake -DWITH_QT=ON -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON -DWITH_XINE=ON -DBUILD_EXAMPLES=ON ..
make && make install && ldconfig
cd /
rm -rf /opencv-build
