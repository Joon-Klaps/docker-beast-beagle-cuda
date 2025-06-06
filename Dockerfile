FROM nvidia/cuda:11.0.3-devel-ubuntu20.04

# CUDA version must be compatible with driver version of host:
#       via: https://docs.nvidia.com/cuda/cuda-toolkit-release-notes/index.html
#
# Note: The container-optimized OS (COS) images used to host dsub docker containers
#       have NVIDIA driver versions that lag current versions. The nvidia/cuda baseimage
#       baseimage above should use a CUDA version compatible with the driver in the
#       current COS image.
#           see: https://cloud.google.com/container-optimized-os/docs/how-to/run-gpus#install
#                https://cloud.google.com/container-optimized-os/docs/release-notes
#
# CUDA Toolkit          Linux x86_64 Driver Version
# -------------------------------------------------
# CUDA 11.5.1           >= 495.29.05
# CUDA 11.4.3           >= 470.82.01
# CUDA 11.4.2           >= 470.57.02
# CUDA 11.4.1           >= 470.57.02
# CUDA 11.4.0           >= 470.42.01
# CUDA 11.3.1           >= 465.19.01
# CUDA 11.3.0           >= 465.19.01
# CUDA 11.2.2           >= 460.32.03
# CUDA 11.2.1           >= 460.32.03
# CUDA 11.2.0           >= 460.27.03
# CUDA 11.1.1           >= 455.32
# CUDA 11.1             >= 455.23
# CUDA 11.0.3           >= 450.51.06
# CUDA 11.0.2           >= 450.51.05
# CUDA 10.2             >= 440.33
# CUDA 10.1             >= 418.39
# CUDA 10.0 (10.0.130)  >= 410.48
# CUDA 9.2 (9.2.88)     >= 396.26
# CUDA 9.1 (9.1.85)     >= 390.46
# CUDA 9.0 (9.0.76)     >= 384.81
# CUDA 8.0 (8.0.61 GA2) >= 375.26
# CUDA 8.0 (8.0.44)     >= 367.48
# CUDA 7.5 (7.5.16)     >= 352.31
# CUDA 7.0 (7.0.28)     >= 346.46

LABEL maintainer "Joon Klaps <joon.klaps@kuleuven.be>"
LABEL maintainer_other "Daniel Park <dpark@broadinstitute.org>"
LABEL maintainer_other "Christopher Tomkins-Tinch <tomkinsc@broadinstitute.org>"

# Set default locale to en_US.UTF-8 and library paths
ENV LANG="en_US.UTF-8" LANGUAGE="en_US:en" LC_ALL="en_US.UTF-8" \
    LD_LIBRARY_PATH="/usr/local/lib:${LD_LIBRARY_PATH}" \
    PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:${PKG_CONFIG_PATH}" \
    LIBRARY_PATH="/usr/local/cuda/lib64/stubs:${LIBRARY_PATH}" \
    DEBIAN_FRONTEND="noninteractive"

# Step 1: Install system packages (least likely to change)
COPY install-apt_packages.sh /opt/docker/
RUN /opt/docker/install-apt_packages.sh

# Step 2: Install BEAGLE library
COPY install-beagle.sh /opt/docker/
RUN /opt/docker/install-beagle.sh

ENV BEAST="/usr/local"

# COPY install-beast-from-source.sh /opt/docker/
# RUN /opt/docker/install-beast-from-source.sh

# COPY install-zigzag.sh /opt/docker/
# RUN /opt/docker/install-zigzag.sh

COPY install-beast.sh /opt/docker/
RUN /opt/docker/install-beast.sh

# COPY beast /usr/local/bin/
# RUN chmod +x /usr/local/bin/beast

# # Final verification
RUN beast -beagle_info

CMD ["/bin/bash"]
