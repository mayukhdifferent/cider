#!/bin/bash
#
# This work is copyright 2011 - 2013 Jordon Mears. All rights reserved.
#
# This file is part of Cider.
#
# Cider is free software: you can redistribute it and/or modify it under the
# terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# Cider is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with
# Cider. If not, see <http://www.gnu.org/licenses/>.

cd `dirname $0`/..

find . -name "*.pyc" -exec rm '{}' ';'

VERSION=`cat version.txt | sed -e 's/\n//g'`
TARGET="cider-$VERSION-src"

rm -rf build

BUILD_TARGET="build/$TARGET"

mkdir -p $BUILD_TARGET

cp -r handlers $BUILD_TARGET/
cp -r static $BUILD_TARGET/
cp -r templates $BUILD_TARGET/
cp -r tornado $BUILD_TARGET/
cp cider $BUILD_TARGET/
cp collaborate.py $BUILD_TARGET/
cp configuration.json $BUILD_TARGET/
cp license.txt $BUILD_TARGET/
cp log.py $BUILD_TARGET/
cp options.py $BUILD_TARGET/
cp readme.md $BUILD_TARGET/
cp server.py $BUILD_TARGET/
cp util.py $BUILD_TARGET/

cd build
tar -czf $TARGET.tar.gz $TARGET

cd ..
mkdir -p dist
if [ -a "dist/$TARGET.tar.gz" ]; then
    echo "NOTE: Replacing existing target in dist."
    rm dist/$TARGET.tar.gz
fi
mv build/$TARGET.tar.gz dist/
