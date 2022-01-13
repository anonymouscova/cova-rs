#!/bin/bash

LOCATION=/ssd1/archie/day1-10s.mp4

# Test raw
# GST_DEBUG=metapreprocess:7 \
# GST_PLUGIN_PATH=../target/debug/ \
# rust-gdb --args \
#     gst-launch-1.0 \
#     filesrc location=$LOCATION \
#         ! qtdemux ! h264parse ! avdec_h264 max-threads=1 \
#         ! metapreprocess timestep=1 \
#         ! filesink location=/tmp/metapreprocess.dump

# Test time stacking
# GST_DEBUG=metapreprocess:7,"*BUFFER*:7" \
GST_PLUGIN_PATH=../target/debug/ \
    gst-launch-1.0 \
    filesrc location=$LOCATION \
        ! qtdemux ! h264parse ! avdec_h264 max-threads=1 \
        ! metapreprocess timestep=4 \
        ! filesink location=/tmp/metapreprocess-t4.dump
