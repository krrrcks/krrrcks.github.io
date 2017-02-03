	Title: Running Racket on AWS Lambda
	Date: 2015-08-27T12:46:57
	Tags: IT, Lisp, Racket, AWS

I started to use AWS for some projects recently. But I only use few of
their services. From time to time I look into some of there services
and wonder if they are useful for my tasks. I looked into
[AWS Lambda](http://aws.amazon.com/lambda), "... a compute service
that runs your code in response to events and automatically manages
the compute resources for you, making it easy to build applications
that respond quickly to new information." Nowadays these "lambda
functions" could be written in NodeJS or Java. When I was looking for
a roadmap of the supported languages I found an interesting
[blog post](http://blog.0x82.com/2014/11/24/aws-lambda-functions-in-go/)
by [Ruben Fonseca](https://www.twitter.com/rubenfonseca). He explaind
how to run Go code on AWS Lambda.

I tried the same with [Racket](http://racket-lang.org) and wrote a
short Racket programm `test.rkt`:

```
#lang racket/base

(display (format "Hello from Racket, args: ~a~%" (current-command-line-arguments)))
```

Then I used `raco` to create a binary `test`:

```
raco exe --orig-exe test.rkt
```

I took the NodeJS wrapper from Ruben's blog post and put it in a file
`main.js`:

```
var child_process = require('child_process');

exports.handler = function(event, context) {
  var proc = child_process.spawn('./test', [ JSON.stringify(event) ], { stdio: 'inherit' });

  proc.on('close', function(code) {
    if(code !== 0) {
      return context.done(new Error("Process exited with non-zero status code"));
    }

    context.done(null);
  });
}
```

Then I put both files in a zip archive, created a new AWS Lambda
function, uploaded the zip file and invoked the function:

![Invocation of AWS Lambda function](/img/2015-08-27-racket-aws-lambda.png)

Fine!

PS: Only question is: When is AWS Lambda coming to the region
`eu-central-1`, located in Frankfurt?

*Upate (2016-03-15):* AWS Lambda is [now available](https://aws.amazon.com/de/about-aws/whats-new/2016/03/aws-lambda-available-in-eu-frankfurt/) in the EU (Frankfurt)
 region! 
