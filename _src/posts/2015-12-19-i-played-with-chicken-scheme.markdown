	Title: "I played with CHICKEN Scheme, Docker and Alpine Linux"
	Date: 2015-12-19T17:54:50
	Tags: IT, Lisp, Scheme, CHICKEN, Docker, Linux

I am looking forward to meet LISP people at the
[32c3's](https://events.ccc.de/congress/2015/wiki/Main_Page) [LISP assembly](https://events.ccc.de/congress/2015/wiki/Assembly:The_%28un%29employed_schemers_%26_lispers_guild). The last days I played a bit with different Scheme
implementations including 
[CHICKEN scheme](http://call-cc.org). The main feature of CHICKEN is
that it compiles the Scheme code to C and then creates dynamic
libraries and binaries with the C compiler. I thought that combining
these binaries with a minimal Docker container could give me a very
small deployment. So here are my steps:

## Choosing Alpine Linux as a "small" Linux

The smallest Linux image for Docker is undoubtly busybox with a size
of about 2.489 MB. But busybox lacks a package manager which makes
installing software painful. Therefore I have chosen
[Alpine Linux](http://alpinelinux.org) which comes with package
manager and it's image's size is about 5.234 MB. That's double the
size of the busybox image but still quite small compared to the Ubuntu
image which is about 266 MB.

## Creating a Docker container with CHICKEN 

Alpine Linux comes with the [musl libc](http://www.muscl-libc.org) and
I thought it would be best to compile all the CHICKEN stuff with that
libc. Therefore I created a Docker container with gcc and all the
other stuff with this Dockerfile
([Github repository](https://github.com/krrrcks/chicken-docker-alpine)):

```
FROM alpine:3.2

RUN apk update && apk add make gcc musl-dev 
RUN wget -O - http://code.call-cc.org/releases/4.10.0/chicken-4.10.0.tar.gz | tar xz

WORKDIR /chicken-4.10.0

RUN make PLATFORM=linux && make PLATFORM=linux install

RUN rm -fr /chicken-4.10.0 

WORKDIR /

CMD ["csi"]
```

This image is quite big (about 161.7 MB) and is available for download
at the [Docker Hub](https://hub.docker.com/r/krrrcks/chicken-alpine/).

## Compiling some CHICKEN code

For testing purposes I wanted a minimal web server running in the Alpine
Linux image. Therefore I looked through the
[egg index](http://wiki.call-cc.org/chicken-projects/egg-index-4.html)
and found [spiffy](http://wiki.call-cc.org/eggref/4/spiffy). I fired
up the `chicken-alpine` container (but I used `ash` as command instead
of the `csi` Scheme interpreter) and created a small web server that
serves some static pages. I wrote a `main.scm`:

```
(use spiffy)
(start-server)
```

and added some static pages to a `./web` sub-directory. Then
everything had to be compiled and prepared for deployment:

```
chicken-install spiffy
csc -deploy main.scm
chicken-install -deploy -p $PWD/main spiffy
```

## Deploy in a fresh Alpine Linux image

After the compilation I copied the `main` and `web` directories on my
host machine using `docker cp` and created the following Dockerfile:

``` 
FROM alpine:3.2

ADD main /main
ADD web main/web
WORKDIR main

CMD /main/main
``` 

and let `docker build -t krrrcks/spiffy-test .` do the job. The size
of the resulting image is about 12.37 MB and that's pretty small. I
uploaded that image to the
[Docker Hub](https://hub.docker.com/r/krrrcks/spiffy-test/) as well. 

To serve the pages I did a `docker run -d -p 8080:8080 krrrcks/spiffy-test` 
(spiffy listens on port 8080 in the default install) and browsed my
static pages. 

