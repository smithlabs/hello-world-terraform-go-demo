# Terraform + AWS + Go = "Hello, World!"

![Image of Gopher Interviwing](https://blog.pepo-le.com/wp-content/uploads/2018/08/gopher-hello.png)

## 🧩 Technologies

![Amazon AWS](https://img.shields.io/badge/Amazon%20AWS-232F3E?style=flat-square&logo=amazon-aws)
![HTML5](https://img.shields.io/badge/-HTML5-E34F26?style=flat-square&logo=html5&logoColor=white)
![Go](https://img.shields.io/badge/-Go-3E3E3E?style=flat-square&logo=Go)
![Terraform](https://img.shields.io/badge/-Terraform-623ce4?style=flat-square&logo=terraform)

This repo contains everything you need to deploy the [pre-compiled](https://github.com/smithlabs/go-example-servers#example-hello-world-http-server) "Hello, World!" [Go](https://golang.org/) binary as a load balanced web application to [AWS](https://aws.amazon.com/) using [Terraform](https://www.terraform.io/).

This project will deploy the following [AWS](https://aws.amazon.com/) infrastructure resources.

- [Elastic Load Balancer](https://aws.amazon.com/elasticloadbalancing/) (Also known as the [Classic Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/introduction.html))
- [Auto Scaling groups](https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroup.html)
- 2 x [EC2 Instances](https://aws.amazon.com/ec2/) of [Amazon Linux 2](https://aws.amazon.com/amazon-linux-2/)
- [Security Groups for the Classic Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-security-groups.html)
- [Security Groups for the EC2 instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-security-groups.html)

## 🛠️ Requirements

- Terraform (>= 0.13) - [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- AWS (~> 2.0) - [Install aws-cli version 2](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)

## 🐇 Quick start

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
curl http://<alb_dns_name>/
```

Clean up when you're done:

```
terraform destroy
```

**[⬆ back to top](#technologies)**

## 📚 Usage

More instructions

## 🤝Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests and examples as appropriate.

## 📝License

[MIT](https://choosealicense.com/licenses/mit/)
