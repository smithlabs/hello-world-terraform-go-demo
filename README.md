# Deploying a "Hello, World!" Go web server to AWS using Terraform

![Image of Gopher Interviwing](https://github.com/smithlabs/github-assets/blob/main/web/dancing-gopher-hello-world.gif?raw=true)

Image auto-generated using the [dancing gopher web server](https://gist.github.com/Deleplace/240675c1a70e7df4cd5b04aa204aeeba).

Credit: [Valentin Deleplace](https://github.com/Deleplace)

## 🛰️ Technologies

![Amazon AWS](https://img.shields.io/badge/Amazon%20AWS-232F3E?style=flat-square&logo=amazon-aws)
![Terraform](https://img.shields.io/badge/-Terraform-623ce4?style=flat-square&logo=terraform)
![Go](https://img.shields.io/badge/-Go-3E3E3E?style=flat-square&logo=Go)
![HTML5](https://img.shields.io/badge/-HTML5-E34F26?style=flat-square&logo=html5&logoColor=white)

This repo contains everything you need to deploy the [pre-compiled](https://github.com/smithlabs/go-example-servers#example-hello-world-http-server) "Hello, World!" [Go](https://golang.org/) binary as a load balanced web application to [AWS](https://aws.amazon.com/) using [Terraform](https://www.terraform.io/).

## 🔭 Overview

This project will deploy the following [AWS](https://aws.amazon.com/) resources.

- [Elastic Load Balancer](https://aws.amazon.com/elasticloadbalancing/) (Also known as the [Classic Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/introduction.html))
- [Auto Scaling groups](https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroup.html)
- 2 x [EC2 Instances](https://aws.amazon.com/ec2/) of [Amazon Linux 2](https://aws.amazon.com/amazon-linux-2/)
- [Security Groups for the Classic Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-security-groups.html)
- [Security Groups for the EC2 instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-security-groups.html)

## ⚙️ Modules

`main.tf` utilizes my two custom Terraform modules. These modules should be pinned to `v1.0.0`.

| Name                                                                                                        | Version |
| ----------------------------------------------------------------------------------------------------------- | ------- |
| [smithlabs/terraform-aws-asg-rolling-deploy](https://github.com/smithlabs/terraform-aws-asg-rolling-deploy) | v1.0.0  |
| [smithlabs/terraform-aws-elb](https://github.com/smithlabs/terraform-aws-elb)                               | v1.0.0  |

[Here](https://github.com/smithlabs/hello-world-terraform-go-demo/blob/main/main.tf#L12-L31) is where these modules are used in `main.tf`.

## 🔬 Requirements

- Terraform (>= 0.13) - [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- AWS (~> 2.0) - [Install aws-cli version 2](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)

## 🐇 Quickstart

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

When the `apply` command completes, it will output the DNS name of the load balancer. To test the load balancer:

```
curl http://<elb_dns_name>/
```

![GIF - Accessing the Go web app via AWS ELB DNS](https://github.com/smithlabs/github-assets/blob/main/gif/hello-world-terraform-go-demo-curl-output.gif?raw=true)

Clean up when you're done:

```
terraform destroy
```

**[⬆ back to top](#%EF%B8%8F-technologies)**

## 🧪 Usage

More instructions

## 📥Inputs

Inputs section

## 📤 Outputs

| Name         | Description                                |
| ------------ | ------------------------------------------ |
| elb_dns_name | The DNS name for the Elastic Load Balancer |

## 🤝 Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests and examples as appropriate.

## 🏆 Show your support

Please ⭐️ this repository if this project helped you!

## Resources

- [EmojiTerra](https://emojiterra.com/) - Copy and paste emojis into your README

## 📝License

[MIT](https://choosealicense.com/licenses/mit/)
