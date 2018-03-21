#!/bin/bash

echo "Temporal dirs /tmp and ~/tmp:"
du -sh /tmp
du -sh ~/tmp

echo "Clearing root tmp dir..."
rm -fr /tmp/*

echo "Clearing this user tmp dir..."
rm -fr ~/tmp/*

du -sh /tmp
du -sh ~/tmp

echo "The purge... has been done... >:)"

