git clone https://github.com/suchard-group/hdtg.git zigzag
cd zigzag
mkdir build
cd build
cmake .. --DTBB_LIBRARYDIR=/usr/include/tbb/ -DCMAKE_PREFIX_PATH=/usr/share/cmake/Modules/
cmake .. --DTBB_LIBRARYDIR=/usr/include/tbb/ -DCMAKE_PREFIX_PATH=/usr/share/cmake/Modules/
make
