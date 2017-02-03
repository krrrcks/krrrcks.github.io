	Title: How to use GET Bucket location on Amazon S3 with Racket
	Date: 2015-09-04T07:23:43 
	Tags: IT, Lisp, Racket, AWS, S3

In [Racket](http://www.racket-lang.org) I want to iterate over my
buckets in Amazon S3. They are located in different regions. So how do
I get my bucket's location/region? In the API Reference there is a
call
[GET Bucket location](http://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketGETlocation.html). I
use
[Greg's AWS library for Racket](https://github.com/greghendershott/aws)
and this library authenticates its calls with
[signature version V4](http://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-auth-using-authorization-header.html). But
V4 requires the user to know the *region* to correctly sign the
request. So I need to know the region to ask Amazon S3 for the region
where the bucket is located. Otherwise Amazon S3 responds with an
error:

```
<?xml version="1.0" encoding="UTF-8"?>
<Error>
 <Code>AuthorizationHeaderMalformed</Code>
 <Message>The authorization header is malformed; the region 'us-east-1'
is wrong; expecting 'eu-central-1'</Message>
 <Region>eu-central-1</Region>
 <RequestId>XXXX</RequestId>
 <HostId>XXXX>
</Error>
```

After some search on the net I found a
[post on Stackoverflow](http://stackoverflow.com/questions/27091816/retrieve-buckets-objects-without-knowing-buckets-region-with-aws-s3-rest-api)
that helped to solve that issue: If I use the URL format (instead of
the normally used virtual host format) I could get the location of
any bucket. Every region responds with a *LocationConstraint* answer.

Therefore a code snippet for Racket could be:

```
(define (get-bucket-location bucket)
  (parameterize
      ([s3-path-requests? #t])
    (define xpr (get/proc (string-append bucket "/?location") read-entity/xexpr))
    (and (list? xpr)
         (= (length xpr) 3)
         (third xpr))))
```

For example:

```
> (get-bucket-location "my-bucket-somewhere")
"eu-central-1"
```

PS: I think official Amazon S3 documentation could be a bit more verbose on
the issues with GetBucketLocation and signature V4.

*Update:* Greg added a `bucket-location` function to his great [library](http://docs.racket-lang.org/aws/S3__Storage_.html#%28def._%28%28lib._aws%2Fs3..rkt%29._bucket-location%29%29)
