## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.


![Network-Diagram](https://github.com/KirtiSikarwar/CyberSec--UTS/blob/main/Diagrams/ELK%20Project.png)


These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the ansible file may be used to install only certain pieces of it, such as Filebeat.



List of Playbook Files
 1. [ansible.yml]( https://github.com/KirtiSikarwar/CyberSec--UTS/blob/main/Ansible/ansible.cfg.yaml)
 2. [install-elk.yml]( https://github.com/KirtiSikarwar/CyberSec--UTS/blob/main/Ansible/install-elk.yml)
 3. [filebeat-config.yml]( https://github.com/KirtiSikarwar/CyberSec--UTS/blob/main/Ansible/filebeat-config.yml)
 4. [filebeat-playbook.yml]( https://github.com/KirtiSikarwar/CyberSec--UTS/blob/main/Ansible/filebeat-playbook.yml)
 5. [metricbeat-config.yml]( https://github.com/KirtiSikarwar/CyberSec--UTS/blob/main/Ansible/metricbeat-config.yml)
 6. [metricbeat-playbook.yml]( https://github.com/KirtiSikarwar/CyberSec--UTS/blob/main/Ansible/metricbeat-playbook.yml)



This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build



### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly efficient, in addition to restricting traffic to the network.

### Concept of Load Balancers: 
 Load balancing provide centralized security across the group of servers that is easier to manage. Load balancing performs these critical tasks: Manages traffic spikes and prevents spikes on a single server. 
Minimizes user request response time

### Concept of Jump Servers:

Jump servers are often placed between a secure zone and a DMZ to provide transparent management of devices on the DMZ once a management session has been established. The jump server acts as a single audit point for traffic and also a single place where user accounts can be managed. A prospective administrator must log into the jump server in order to gain access to the DMZ assets and all access can be logged for later audit.


Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.


###FileBeat
What does Filebeat watch for?
- Filebeat monitors the log files or locations that you specify collects log events and forwards them either to Elasticsearch or Logstash for indexing.

What does Metricbeat record?
- Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash. Metricbeat helps you monitor your servers by collecting metrics from the system and services running on the server, such as Apache, Nginx

The configuration details of each machine may be found below.

Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.


| Name     | Function | IP Address | Operating System    |
|----------|----------|------------|------------------   |
| Jump Box | Gateway  | 10.0.0.8   | Linux (ubuntu 18.04)|
| Web-1    | Server   | 10.1.0.9   | Linux (ubuntu 18.04)|
| Web-2    | Server   | 10.1.0.10  | Linux (ubuntu 18.04)|
| Elk-Web3 | Server   | 10.2.0.4   | Linux (ubuntu 18.04)|

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jumpbox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:

* Add whitelisted IP addresses - 20.53.227.25

Machines within the network can only be accessed by SSH. Only JumpBox machine was allowed to access the ELK VM- JumpBox VM, its private Ip address- 10.1.0.7

A summary of the access policies in place can be found in the table below.


| Name       | Publicly Accessible | Allowed IP Addresses |
|------------|---------------------|----------------------|
| Jump Box   |      Yes/No         | 10.0.0.1 & 10.0.0.2  |
| Web 1      |        No           |    10.1.0.9          |
| Web 2      |        No           |    10.1.0.10         |
| ELK – Web3 |        No           |    10.2.0.4          | 

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because..

What is the main advantage of automating configuration with Ansible? -  This allows you to deploy to multiple servers using a single playbook

The playbook implements the following tasks:

* Creating a new VM which is ELK -Web 3 to run ELK 
* By using the Docker command which is sudo docker ps we check for the ansible container.  
* We locate the ansible container by using sudo docker container list -a
* We start the container by start and attach to the magical Khorana container
* We then copy the ssh key from the Ansible container from the jumpbox and configure the new VM (ELK – Web3)
* We then add the ELK-Web3 machine to the Ansible hosts file
* We have then created a new ansible playbook for the new ELK virtual machine and also increased the memory

We then run the playbook which installs the below services 
* docker.io 
* python3-pip 
* docker, which is the Docker Python pip module.

After the docker is installed, we run the elk container

We then SSH from our Ansible container to the ELK machine to verify the connection before we run your playbook.

After the ELK container is installed, we SSH to our container to check that the elk-docker container is running.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

Run sudo docker ps

![ELK-Docker](https://github.com/KirtiSikarwar/CyberSec--UTS/blob/main/Screenshots/ELK%20Docker.png)
![Installing ELK.yml](https://github.com/KirtiSikarwar/CyberSec--UTS/blob/main/Screenshots/Install%20ELK%20yml.png)


### Target Machines & Beats

This ELK server is configured to monitor the following machines:
* List the IP addresses of the machines you are monitoring - Web-1(10.1.0.9) Web-2(10.1.0.10)

We have installed the following Beats on these machines:
* Specify which Beats you successfully installed - Filebeat - Metricbeat

These Beats allow us to collect the following information from each machine:
Filebeat is a lightweight shipper for forwarding and centralizing log data. Installed as an agent on your servers, Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing.

Metricbeat is a lightweight shipper that you can install on your servers to periodically collect metrics from the operating system and from services running on the server. Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash.

![FileBeat Dashboard](https://github.com/KirtiSikarwar/CyberSec--UTS/blob/main/Screenshots/FileBeat%20Syslog%20Dashboard.png)

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the YAML file to /ansible/ folder
- Update the ansible.cfg file to include the Web1-VM, Web-2 VM and ELK- Web3 VM private IP Address)e
- Run the playbook, and navigate to ELK-VM to check that the installation worked as expected.
- Then Navigate to the /etc/ansible/host file and cat it.  It should include

[webservers]
[10.1.0.9] ansible_python_interpreter=/usr/bin/python3 
[10.1.0.10] ansible_python_interpreter=/usr/bin/python3 
[10.1.0.11] ansible_python_interpreter=/usr/bin/python3
[elk] [10.0.0.4] ansible_python_interpreter=/usr/bin/python3


Answer the following questions to fill in the blanks:_
Which file is the playbook? Where do you copy it?_ 
- The files in the /etc/ansible/roles/ have the playbooks that need to be copied on the /etc/ansible directory on the ansible machine

Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- We need to edit the /etc/ansible/hosts file to add the webserver (Web 1 & Web2) and ELK- Web3 VM ip address

Which URL do you navigate to in order to check that the ELK server is running?
- http://52.243.65.62:5601/app/kibana#/home

![Kibana](https://github.com/KirtiSikarwar/CyberSec--UTS/blob/main/Screenshots/KIbana%20landing.png)
 
As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc.

In order to use the playbooks, you will need to have an Ansible control node already configured. We use the jump box for this purpose.
To use the playbooks, we must perform the below steps:
* Copy the playbooks to the jumpbox
* Run each playbook on the appropriate targets
* Copy the filebeat.yml file to the /etc/ansible/files/ directory.
* Update the configuration file to include the Private IP of the Elk-Server to the ElasticSearch and Kibana sections of the configuration file.
* Create a new playbook in the /etc/ansible/roles/ directory that will install, drop in the updated configuration file, enable and configure system module, run the filebeat setup, and start the filebeat service.
* Create a new playbook in the /etc/ansible/roles/ directory that will install, drop in the updated configuration file, enable and configure system module, run the metricbeat setup, and start the metricbeat service.
* Run the playbooks, and navigate back to the installation page on the ELk-Server GUI, click the check data on the Module Status
* Click the verify incoming Data to check and see the receiving logs from the DVWA machines.

The below syslog data is observed.


The commands needed to run the Ansible configuration for the Elk-Server are:
- ssh azadmin@Jumpbox(Public IP)
- sudo docker container list -a (locate your ansible container)
- sudo docker start container (Magical_Khorana)
- sudo docker attach container (Magical_Khorana)
