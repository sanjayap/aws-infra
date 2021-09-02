# Introduction to Infrastructure Repo
- This code setups infrastructure deployment pipeline using the bootstrap.
- Once pipeline is deployed, the pipeline is used to deploy ohter infrastructure resources using Terraform.
- Terraform state file is stored in s3 backend (The s3 name should be globally unique. Hence you will have to define a unique s3 name)
- Terraform lock state is stored in a DynamoDB Table.

# Running the bootstrap template to create the pipeline.
- Requirements
  - AWS CLI
  - AWS profile configured with access keys

- Execute the following command to deploy the pipeline.
  - cd bootstrap
  - aws cloudformation create-stack --stack-name bootstrap-stack --template-body file://bootstrap.yml --parameters file://bootstrap.json --profile `aws-profile-name` --capabilities CAPABILITY_NAMED_IAM

- Setting Up Initial AWS Resources
  - Any change to the `InfraSourceBranch` branch defined in the `bootstrap.json` will trigger the infrastructure pipeline to create / delete / update resources.

- Adding / Modifying Resources
  - Add new resources to ./dev/main.tf
  - Modify ./dev/var.tf, ./dev/output.tf as required.

- Removing Resources
  - Comment / Delete items in ./dev/main.tf and ./dev/output.tf