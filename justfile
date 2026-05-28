
[private]
default: build

# Build the image.
build:
     buildah build -t go2-humble-jetson .
