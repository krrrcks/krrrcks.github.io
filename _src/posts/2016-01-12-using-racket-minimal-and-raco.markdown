	Title: "Using Racket Minimal and raco"
	Date: 2016-01-12T10:55:43
	Tags: IT, Lisp, Racket

I use Racket Minimal on my smart phone ([this](../2015/08/27/how-to-run-racket-on-the-raspberry-pi-2/)
describes how to compile the run time for an ARM based
system). It's is a very small installation of Racket (about 36 MB
after installation). After installation one only needs to install the
packages that are really neded. But this can be a bit tricky because a
lot of packages want to install their documentation and other
stuff and bring a whole bunch of files on your drive as
dependencies.

Some of the packages are divided up into a "-lib", "-doc" (and
sometimes "-test") as laid out in the
[documentation](https://docs.racket-lang.org/pkg/getting-started.html#%28part._.Naming_and_.Designing_.Packages%29). With
these packages it's easier to only install the implementation.

A small script of mine used only basic modules and relied on
`rackunit` for the tests. On a mobile device the start up time of such a program can be 
critical. Therefore it is wise to only
require the needed packages and to have the source code being compiled to
byte code. One could do this with `raco setup` (which is included in
Minimal Racket) but I wanted to have
`raco make` (which is not part of Minimal Racket) available. 

The commands of `raco` are added via a `raco-commands` variable in
packages' `info.rkt` file. I looked through the packages of my "full
install" and found the package `compiler-lib` which adds some commands
(`make`, `exe`, `pack`, `unpack`, `decompile`, `test`, `expand`,
`read`, `distribute`, `demodularize`) to
[`raco`](https://mirror.racket-lang.org/releases/6.3/doc/raco/index.html)
and relies on only a few other packages. As a result the source and
binary files need about 3.8 MB on my phone which is okay for me.

To sum up: After a simple `raco pkg install compiler-lib` I could easily use
`raco make` and `raco test` to play with my program on my phone.
