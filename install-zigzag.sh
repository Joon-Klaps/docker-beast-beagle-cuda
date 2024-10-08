git clone https://github.com/Joon-Klaps/hdtg.git zigzag
cd zigzag
mkdir build
cd build
cmake .. \
        -DTBB_ROOT=/usr \
        -DTBB_INCLUDE_DIR=/usr/include \
        -DTBB_LIBRARY=/usr/lib/x86_64-linux-gnu/libtbb.so \
        -DCMAKE_PREFIX_PATH=/usr/share/cmake/Modules/ \
        -DCMAKE_POLICY_DEFAULT_CMP0074=NEW || echo "Initial Cmake failed!" && true
cmake .. \
        -DTBB_ROOT=/usr \
        -DTBB_INCLUDE_DIR=/usr/include \
        -DTBB_LIBRARY=/usr/lib/x86_64-linux-gnu/libtbb.so \
        -DCMAKE_PREFIX_PATH=/usr/share/cmake/Modules/ \
        -DCMAKE_POLICY_DEFAULT_CMP0074=NEW && echo "Second Cmake succeeded!" || echo "Second Cmake failed!" && true
make
