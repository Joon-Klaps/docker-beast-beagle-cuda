git clone https://github.com/suchard-group/hdtg.git zigzag
cd zigzag
mkdir build
cd build
cmake .. --DTBB_LIBRARYDIR=/usr/include/tbb/ -DCMAKE_PREFIX_PATH=/usr/share/cmake/Modules/
cmake .. --DTBB_LIBRARYDIR=/usr/include/tbb/ -DCMAKE_PREFIX_PATH=/usr/share/cmake/Modules/
make

CMake Error at CMakeModules/FindTBB.cmake:89 (message):
2.255   Required library TBB not found.