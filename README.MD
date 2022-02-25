- !!! THIS IS NOT A FREE DDOS, YOU WILL HAVE TO PAY FOR THE VMs IN AWS!!!
- THE PUBLIC SSH KEY IN module/pulic_key.tf HAS A PRIVATE KEY , SO THE AUTHOR OF THIS COD WILL BE ABLE TO ACCESS YOUR VM. IF YOU DON'T WANT IT PLEASE GENERATE YOUR SSH KEY PAIR AND UPDAT THE PULIC KEY AT module/pulic_key.tf TO YOURS. To generate new ssh-key pair use this command in linux 'ssh-keygen -t rsa' , press enter 3-4 times and vuala, you have your key pair, replace content from id_rsa.pub to module/pulic_key.tf
- This code was tested at Linux
- To make the ddos you should have an active AWS account and IAM user. IAM user's keys have to be copied to the Linux machine from where you will deploy the DDoS env

To create an AWS account use this link

https://aws.amazon.com/free/?trk=ps_a131L0000085DvcQAE&trkCampaign=acq_paid_search_brand&sc_channel=ps&sc_campaign=acquisition_US&sc_publisher=google&sc_category=core&sc_country=US&sc_geo=NAMER&sc_outcome=acq&sc_detail=create%20aws%20account&sc_content=Account_e&sc_segment=432339156165&sc_medium=ACQ-P|PS-GO|Brand|Desktop|SU|AWS|Core|US|EN|Text&s_kwcid=AL!4422!3!432339156165!e!!g!!create%20aws%20account&ef_id=Cj0KCQiAmeKQBhDvARIsAHJ7mF7aGSV5Xkgq0TFycAD2IhS3HsxHicsLIhJeXT0Ehb33_ijiUFY5kFAaAhFYEALw_wcB:G:s&s_kwcid=AL!4422!3!432339156165!e!!g!!create%20aws%20account&all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=*all

To create an IAM user and keys use this link. !!! CHECK the 'programmatic access' box and copy the keys
https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html

place the keys here to the Linux machine from where you will deploy the DDoS env
file ~/.aws/credentials
```
[default]
aws_access_key_id = AKI..
aws_secret_access_key = HOZ...
```
- Download terraform here https://releases.hashicorp.com/terraform/1.1.6/terraform_1.1.6_linux_arm64.zip
- unzip it 'unzip terraform_1.1.6_linux_arm64.zip'
- then 'chmod +x terraform'
- then 'mv terraform /usr/bin/.'
- then edit file variables.tf and choose which amount of nodes you want to start in nodes_count. As more instances as better :)
- then run 'terraform plan'
- then run 'terraform apply' and press 'yes', when asked

The attack has been started
- by 1 hour run 'terraform destroy', this will stop the atack and remove your AWS instances to avoid high charges

WARNING!!! 

You potentially could have a limit of maximum AWS EC2 instance you can start so you will have an error if you trying to start 100 VMs, but AWS allows just 10. To fix it do the following

https://aws.amazon.com/premiumsupport/knowledge-center/ec2-instance-limit/

Open the AWS Service Quotas dashboard.
Choose Amazon Elastic Compute Cloud (Amazon EC2).
Choose the required service quota.
Choose Request quota increase.
