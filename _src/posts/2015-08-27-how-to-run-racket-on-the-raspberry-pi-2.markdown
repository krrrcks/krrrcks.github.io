	Title: "How to run Racket on the Raspberry Pi 2"
	Date: 2015-08-27T13:25:45
	Tags: IT, Lisp, Racket

I got a
[Raspberry Pi 2 Model B](https://www.raspberrypi.org/products/raspberry-pi-2-model-b/)
to play with. I used Raspbian image as operating system.  I was
wondering how difficult it is to get Racket running on the Raspberry
Pi. I downloaded the
[Unix source + built packages](http://mirror.racket-lang.org/installers/6.2.1/racket-6.2.1-src-builtpkgs.tgz)
tarball from [Racket's homepage](http://racket-lang.org) because I
only wanted to compile the core of Racket. After unpacking the tarball
I was suprised that the instructions were quite short:

```
From this directory (where the `configure' file is), run the following
commands:

  mkdir build
  cd build
  ../configure
  make
  make install
```

Between `make` and `make install` I had to wait for about 40 minutes
but then everything was fine and I could even use DrRacket on the
Raspberry Pi:

![DrRacket on Raspberry Pi](/img/2015-08-27-racket-pi.png)

Very nice and easy to get Racket running on ARM.

PS: Because the Raspberry Pi 2 Model B has an ARMv7 processor the
binary runs on my Jolla smart phone as well.




