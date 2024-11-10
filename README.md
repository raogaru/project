# CI/CD Pipeline for Containerized Applications on the AWS Cloud

### [Link to demo video](https://www.youtube.com/watch?v=tR4UmLa0-Qo)

### [Link to slideshow (with diagrams)](https://docs.google.com/presentation/d/15Ocx_kM3NZPsPPqHI3kOabuNE8D6miDCyZqYyA8qD-o/edit?usp=sharing)

## Description

This project consists of a CI/CD pipeline for applications hosted on the AWS cloud. This means that given a repository of source code for an application, such as a codebase hosted on GitHub, the pipeline deploys the application into a Kubernetes cluster, managed by AWS EKS. In addition, the pipeline continuously integrates/continuously delivers any changes to the application source code by updating the Kubernetes cluster which represents the production environment.

Technologies used: Jenkins, Terraform, AWS services (EKS, ECR, EC2), Docker, Kubernetes

## Additional Info

To view the steps to set up the various technologies for this project, read [this](./Setup.md).
