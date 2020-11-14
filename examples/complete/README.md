# Complete example

This folder contains a [Terraform](https://www.terraform.io/) configuration that shows an example of how to
use my [ELB module](https://github.com/smithlabs/terraform-aws-elb) and
[ASG module](https://github.com/smithlabs/terraform-aws-asg-rolling-deploy) to deploy a simple Golang
"[Hello, World](https://github.com/smithlabs/go-example-servers#example-hello-world-http-server)"
application across a cluster of web servers.

## Pre-requisites

- You must have [Terraform](https://www.terraform.io/) installed on your computer.
- You must have an [Amazon Web Services (AWS) account](http://aws.amazon.com/).

Please note that this code was written for Terraform 0.13.x.

## Quick start

**Please note that this example will deploy real resources into your AWS account. We have made every effort to ensure
all the resources qualify for the [AWS Free Tier](https://aws.amazon.com/free/), but we are not responsible for any
charges you may incur.**

Configure your [AWS access
keys](http://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys) as
environment variables:

```
export AWS_ACCESS_KEY_ID=(your access key id)
export AWS_SECRET_ACCESS_KEY=(your secret access key)
```

Deploy the code:

```
terraform init
terraform apply
```

Clean up when you're done:

```
terraform destroy
```
