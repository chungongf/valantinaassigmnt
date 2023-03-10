# valantinaassigmnt
Why the homework?

We’re looking to hire the best employees – those with a burning desire to deliver great results. That’s why for engineering candidates we want to see a sample of code – it helps us have a more productive conversation during the final interview.

Option A

24 hours before your interview, please send us a link to your public repository (GitHub, GitLab, etc.) with sample cloud-related code. It could be IaC (Terraform, CloudFormation, ARM templates, Pulumi, CDK, etc.) or scripting (Python, Golang, CLI, etc.). Something that you’re proud of and can explain.You should be the sole author of the work.

Option B

Using the IaC tool of your choice, create a free-tier VM in either AWS or Azure that meets the following objectives:
●	The instance should use a 1 GB attached block storage volume and contain a valid partition table with one partition. The partition should contain a valid file system.
●	The filesystem residing on the attached volume should be mounted automatically upon reboot of the instance.
●	The instance should serve web pages via an appropriate service such as Apache, Nginx or IIS. This service should start automatically upon boot.
●	The instance should serve a web page index.html containing the text “Hello GR World”. This file should reside on the filesystem within the attached volume and be served from the Document Root directory.
●	The instance should effectively use security groups to restrict traffic to HTTP and either RDP or SSH.
●	The instance should be associated with a static IP address.

24 hours before your interview, please send us the link to your public repository with your solution. On the day of your interview, be prepared to answer questions such as:
●	Why did you choose X?
●	What would the impact be of adding Y architectural component to this solution?
●	What other security controls would you recommend?
●	What are some options for scaling this solution?
●	What are the pros/cons of your IaC-based solution vs. scripting?

