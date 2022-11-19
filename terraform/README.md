# Terraform

## Usage
 
GitHub Actions workflows have been created under .github/workflows directory to kick off various workflows including terraform workflow.  In addition, we can run terraform CLI as listed below to run terraform init/plan/apply etc.
 
*You'll need to install Terraform CLI if you haven't already done so. The instructions can be found
here: https://learn.hashicorp.com/tutorials/terraform/install-cli.*

Make sure you've updated **terraform.tfvars** to indicate your aws region before creating.

```bash
terraform fmt
terraform init -backend-config='./.env/dev/backend.tfvars'
terraform get
terraform plan -input=false -var-file='./.env/dev/terraform.tfvars' -no-color
terraform apply -input=false -var-file='./.env/dev/terraform.tfvars' --auto-approve
terraform destroy -input=false -var-file='./.env/dev/terraform.tfvars' --auto-approve
```
 
### `terraform fmt`
*The `terraform fmt` command formats the terraform tf files.

### `terraform get`

*The `terraform get` command is used to download and update modules mentioned in the root
module (https://www.terraform.io/docs/commands/get.html).*

**Note:** When installing a remote module, Terraform will download it into the .terraform directory in your
configuration's root directory. When installing a local module, Terraform will instead refer directly to the source
directory. Because of this, Terraform will automatically notice changes to local modules without having to re-run
terraform init or terraform get.

### `terraform plan -input=false -var-file='./.env/dev/terraform.tfvars'

*The `terraform plan` command is used to create an execution plan. This command is a convenient way to check whether the
execution plan for a set of changes matches your expectations without making any changes to real resources or to the
state. For example, `terraform plan` might be run before committing a change to version control, to create confidence
that it will behave as expected (https://www.terraform.io/docs/commands/plan.html).*

`-input=false` specifies that we don't want prompted for input for variables not directly set.

`-var-file='./.env/dev/terraform.tfvars'` specifies that we want to specify variables in our terraform configuration
from the **terraform.tfvars** file.

### `terraform apply -input=false -var-file='./.env/dev/terraform.tfvars'`

*The `terraform apply` command is used to apply the changes required to reach the desired state of the
configuration. (https://www.terraform.io/docs/commands/apply.html).*

`-input=false` specifies that we don't want prompted for input for variables not directly set.

`-var-file='./.env/dev/terraform.tfvars'` specifies that we want to specify variables in our terraform configuration
from the **terraform.tfvars** file.


### infracost

Runs Infracost break down of the cost based on terraform code

`infracost breakdown --path . --show-skipped --terraform-var-file='./.env/dev/terraform.tfvars' --no-color`

Runs Infracost break down of the cost based on terraform code and projected usage

`infracost breakdown --path . --usage-file infracost-usage.yml --terraform-var-file='./.env/dev/terraform.tfvars' --no-color`

Generate json output file first

`infracost breakdown --path . --usage-file infracost-usage.yml  --terraform-var-file='./.env/dev/terraform.tfvars' --format json --out-file infracost-with-usage.json --show-skipped`

Then render the json into html

`infracost output --path infracost-with-usage.json --format html --out-file report.html`

