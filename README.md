# Deploying a "Hello, World!" Go web server to AWS using Terraform

![Image of Gopher Interviwing](https://github.com/smithlabs/github-assets/blob/main/web/dancing-gopher-hello-world.gif?raw=true)

Image auto-generated using the [dancing gopher web server](https://gist.github.com/Deleplace/240675c1a70e7df4cd5b04aa204aeeba).

Credit: [Valentin Deleplace](https://github.com/Deleplace)

## 🛰️ Technologies

![Amazon AWS](https://img.shields.io/badge/Amazon%20AWS-232F3E?style=flat-square&logo=amazon-aws)
![Terraform](https://img.shields.io/badge/-Terraform-623ce4?style=flat-square&logo=terraform)
![Go](https://img.shields.io/badge/-Go-3E3E3E?style=flat-square&logo=Go)
![HTML5](https://img.shields.io/badge/-HTML5-E34F26?style=flat-square&logo=html5&logoColor=white)

This folder contains an example [Terraform](https://www.terraform.io/) configuration that deploys a simple Golang "[Hello, World](https://github.com/smithlabs/go-example-servers#example-hello-world-http-server)" application across a cluster of web servers (using [EC2](https://aws.amazon.com/ec2/) and
[Auto Scaling](https://aws.amazon.com/autoscaling/) in an [Amazon Web Services (AWS) account](http://aws.amazon.com/).

## 🔭 Overview

This project will deploy the following [AWS](https://aws.amazon.com/) resources.

- [Elastic Load Balancer](https://aws.amazon.com/elasticloadbalancing/) (Also known as the [Classic Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/introduction.html))
- [Auto Scaling groups](https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroup.html)
- 2 x [EC2 instances](https://aws.amazon.com/ec2/) of [Amazon Linux 2](https://aws.amazon.com/amazon-linux-2/)
- [Security Groups for the Classic Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-security-groups.html)
- [Security Groups for the EC2 instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-security-groups.html)

💡 Below are links to the examples and tests included in this repo.

- [Complete Example](https://github.com/smithlabs/hello-world-terraform-go-demo/tree/main/examples/complete) - A complete example of the "Hello, World!" web app being deployed with all of the resources listed above.
- [Test](https://github.com/smithlabs/hello-world-terraform-go-demo/tree/main/test) - Automatically deploy the example above, see if the ELB returns "Hello, World!", and then destroy the deployed resources.

## ⚙️ Modules

`main.tf` utilizes my two custom Terraform modules. These modules should be pinned to `v1.0.0`.

| Name                                                                                                        | Version |
| ----------------------------------------------------------------------------------------------------------- | ------- |
| [smithlabs/terraform-aws-asg-rolling-deploy](https://github.com/smithlabs/terraform-aws-asg-rolling-deploy) | v1.0.0  |
| [smithlabs/terraform-aws-elb](https://github.com/smithlabs/terraform-aws-elb)                               | v1.0.0  |

[Here](https://github.com/smithlabs/hello-world-terraform-go-demo/blob/main/main.tf#L12-L31) is where these modules are used in `main.tf`.

## 🐾 Pre-requisites

- You must have [Terraform](https://www.terraform.io/) installed on your computer.
- You must have an [Amazon Web Services (AWS) account](http://aws.amazon.com/).
- (Optional) - [AWS CLI v2](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) is recommended if you want to deploy Terraform code using [multiple AWS credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html).

Please note that this code was written for Terraform 0.13.x.

## 🔬 Requirements

| Name      | Version   |
| --------- | --------- |
| terraform | >= 0.13.0 |
| aws       | >= 2.35   |

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

| Name        | Description                                                              | Type     | Default       | Required |
| ----------- | ------------------------------------------------------------------------ | -------- | ------------- | :------: |
| name        | The name to prepend to the auto scaling group and ELB resources.         | `string` | `hello-world` |    no    |
| environment | The environment name to add to the auto scaling group and ELB resources. | `string` | `test`        |    no    |
| server_port | The port the server will use for HTTP requests.                          | `number` | `8080`        |    no    |

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

[MIT](https://github.com/smithlabs/hello-world-terraform-go-demo/blob/main/LICENSE)
