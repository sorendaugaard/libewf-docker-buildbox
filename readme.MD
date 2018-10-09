# Docker build box for libewf
This repository contains a docker build box that can be used to build libewf.

# Build libewf
To build libewf do the following:
```
docker build . --tag build-box
docker run -it build-box
```
Once inside the box run:
```
cd ~/src/libewf
make
```

# Build libewf debian packages
To build the libewf debian packages do the following:
```
docker build . --no-cache --tag build-box
docker run --volume $(pwd)/debs:/tmp/debs -it build-box
```
Once inside the box run:
```
cd ~/src/libewf
cp -rf dpkg debian
dpkg-buildpackage -b
cd ..
cp *.deb /tmp/debs
```
Exit out of the box and your debs should now be in the folder: `./debs`.

## Increment version
If you wish to increment the version prior to building the debs with `dpkg-buildpackage -b` run:
```
dch -l-[version name] "[version description]"
```


# To build a specific version
Do the following once inside the box prior to building:
```
cd ~/src/libewf
git checkout feature-branch-to-build
./synclibs.sh --use-head
./autogen.sh
./configure
```
