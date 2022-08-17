# Automation_project
Problem Statement 1:

You have recently joined a new company named Dogecoin, which is growing very fast. As a DevOps engineer, you are required to perform  a set of tasks.  
 
Task 1: Set Up Necessary Infrastructure
Create an IAM role, a security group, an S3 bucket and launch an EC2 instance.
 
Details of the task:
 
Firstly, create an IAM role that can be attached to an EC2 instance, and attach a policy ‘AmazonS3FullAccess’. Use the role name as ‘YourFirstName_CourseAssignment’ and tag (key, value) as (EC2, S3Full).
 
Next, create a security group with the name ‘SG_YourFirstName’ and description as ‘Required for Course Assignment’ which opens inbound connections to ports 80, 443 and 22. Put the name tag as ‘WebServer Sec’ on the security group.
 
Now, set up an EC2 instance in the North Virginia (us-east-1) region:
	•	Select AMI as ‘Ubuntu Server 18.04 LTS (HVM)’ and instance type as ‘t2.micro’.
	•	This EC2 instance has to be created in default VPC.
	•	Attach the IAM role which was created previously.
	•	Create a tag with the key ‘Name’ and value ‘Web Server’ for the EC2 instance.
	•	Attach the security group to the EC2 instance and launch it.
Finally, create an S3 bucket with the name ‘upgrad-<YourFName>’ or anything if not available.


Problem Statement 2:

Subtask Details
You have been assigned to write an automation bash script named ‘automation.sh’ to perform the following subtasks. 
(Hint: Running ./automation.sh with root privileges must do the following listed tasks.)
 
Your Script Should 
	1	Perform an update of the package details and the package list at the start of the script.sudo apt update -y
	2	
	3	Install the apache2 package if it is not already installed. (The dpkg and apt commands are used to check the installation of the packages.)
	4	Ensure that the apache2 service is running. 
	5	Ensure that the apache2 service is enabled. (The systemctl or service commands are used to check if the services are enabled and running. Enabling apache2 as a service ensures that it runs as soon as our machine reboots. It is a daemon process that runs in the background.)
	6	Create a tar archive of apache2 access logs and error logs that are present in the /var/log/apache2/ directory and place the tar into the /tmp/ directory. Create a tar of only the .log files (for example access.log) and not any other file type (For example: .zip and .tar) that are already present in the /var/log/apache2/ directory. The name of tar archive should have following format:  <your _name>-httpd-logs-<timestamp>.tar. For example: Ritik-httpd-logs-01212021-101010.tar                                                             Hint : use timestamp=$(date '+%d%m%Y-%H%M%S') )
	7	The script should run the AWS CLI command and copy the archive to the s3 bucket. 
#Hint : use timestamp=$(date '+%d%m%Y-%H%M%S') ) to name  the  tar
aws s3 \
cp /tmp/${myname}-httpd-logs-${timestamp}.tar \
s3://${s3_bucket}/${myname}-httpd-logs-${timestamp}.tar
 
Copying to the S3 bucket will require AWS Command Line Interface (CLI)  to be installed in the system. You can install AWS CLI manually before writing and testing the script. 
# Installing awscli 
sudo apt update
sudo apt install awscli
 
Important:
	•	Your script must have a variable with a value as the name of your s3-bucket at the start. Use that variable at all places where the s3 bucket is to be referred to in the script. In the same manner, your script must initialise a variable with your name. 
	•	This project involves learning new concepts. So, you are encouraged to Google the commands and try out different things such as learn about cron job, services and commands like systemctl, dpkg and apt.
	•	Place your script in '/root/Automation_Project/' directory.
	•	Always run scripts with root privileges or first switch to the root user with sudo su and then run the scripts.#Make the script executible
	•	chmod  +x  /root/Automation_Project/automation.sh
	•	#switch to root user with sudo su
	•	sudo  su
	•	./root/Automation_Project/automation.sh
	•	
	•	# or run with sudo privileges
	•	sudo ./root/Automation_Project/automation.sh
	•	
 
Host Script On Github
	1	Initialise a Git repository with the name ‘Automation_Project’ and update the readme.md file which explains the project. This repository will now host your automation script 
	2	Create a new ‘Dev’ branch and commit the script into it. 
	3	Create a pull request from the ‘Dev’ to the master (called as ‘main’) branch in your GitHub repository. 
	4	Finally, create a tag named ‘Automation-v0.1’ after you merge the ‘Dev’ branch to the main branch. You can use Github UI for the pull request and tagging 
 
Note: "Plagiarism is strictly not acceptable. The submissions go through a plagiarism check after receiving them from all the learners. Even if your submission is caught under plagiarism after the scores are published, the submission score will be reduced to 0."
