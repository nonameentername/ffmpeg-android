#!/bin/bash

ROOTDIR=$(cd `dirname $BASH_SOURCE` && pwd)

if [ ! -e $ROOTDIR/'ffmpeg' ]; then
    git clone git://source.ffmpeg.org/ffmpeg.git ffmpeg
    (cd $ROOTDIR/ffmpeg && git checkout 4f7d2fe)

    for i in `find diffs -type f`; do
        (cd $ROOTDIR/ffmpeg && patch -p1 < ../$i)
    done
fi
