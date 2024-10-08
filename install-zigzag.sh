git clone https://github.com/suchard-group/hdtg.git zigzag
cd zigzag
ls -lah
mkdir build
cd build
ls -lah
cmake .. \
        -DTBB_ROOT=/usr \
        -DTBB_INCLUDE_DIR=/usr/include \
        -DTBB_LIBRARY=/usr/lib/x86_64-linux-gnu/libtbb.so \
        -DCMAKE_PREFIX_PATH=/usr/share/cmake/Modules/ \
        -DCMAKE_POLICY_DEFAULT_CMP0074=NEW
cmake .. \
        -DTBB_ROOT=/usr \
        -DTBB_INCLUDE_DIR=/usr/include \
        -DTBB_LIBRARY=/usr/lib/x86_64-linux-gnu/libtbb.so \
        -DCMAKE_PREFIX_PATH=/usr/share/cmake/Modules/ \
        -DCMAKE_POLICY_DEFAULT_CMP0074=NEW \
make
