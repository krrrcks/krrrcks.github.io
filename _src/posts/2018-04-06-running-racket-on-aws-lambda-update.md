    Title: Running Racket on AWS Lambda (Update)
    Date: 2018-04-06T12:46:32
    Tags: IT, Racket, AWS, DRAFT

In 2015
I [posted a short blog post](2015/08/27/running-racket-on-aws-lambda/)
on how to run Racket code on AWS Lambda. The downside of the approach
used is that the Racket process is spawned with every invocation of
the AWS Lambda function. That takes some time and time costs money.

... came up with another idea: His wrapper code starts the Racket
process and then communicates via standard input and output. With this
approach the Racket process does not terminate after the call and gets
reused in consequent calls to the Lambda function. This leads to a
very high performance and short computing time.

He wrote a short NodeJS module as well. I highly recommend this
approach and using the module. It has no dependencies to other
modules. Therefore one doesn't get stuck in the dependency hell. 


