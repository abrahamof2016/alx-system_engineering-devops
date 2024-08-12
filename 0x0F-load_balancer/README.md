# 0x0F. Load Balancer

### Background

This project aims to enhance web stack by introducing redundancy through additional web servers. This will increase capacity to handle traffic and improve system reliability.

I will be working with two new servers:

* gc-[STUDENT_ID]-web-02-XXXXXXXXXX
* gc-[STUDENT_ID]-lb-01-XXXXXXXXXX
  
The primary goal is to configure these servers to act as a web server and load balancer respectively, using Bash scriptsfor automation.

### Project Objectives

* Set up a load balancer to distribute incoming traffic across multiple web servers.
* Implement a redundant web server setup to improve system availability.
* Automate server configuration using Bash scripts for efficiency.

### Structure

The repository will contain the following Bash scripts:
* 0-custom_http_response_header: Configures a new Ubuntu server as a web server.
* 1-install_load_balancer: Configures a new Ubuntu server as a load balancer.


