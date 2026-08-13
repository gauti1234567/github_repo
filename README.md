# 🚀 Azure Infrastructure Automation with Terraform & GitHub Actions

![Terraform](https://img.shields.io/badge/Terraform-v1.x-purple?style=for-the-badge&logo=terraform)
![Azure](https://img.shields.io/badge/Microsoft_Azure-0089D6?style=for-the-badge&logo=microsoft-azure&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white)

This repository contains modular and automated Infrastructure as Code (IaC) using **Terraform** to provision Azure resources dynamically. It includes a complete **GitHub Actions CI/CD pipeline** for continuous integration, automated planning, deployment (`apply`), and teardown (`destroy`).

---

## 📌 Features & Architecture

- 🏗️ **Dynamic Resource Provisioning**: Manages multiple Azure Resource Groups and Storage Accounts dynamically using HCL maps and `for_each` meta-arguments.
- 🔐 **Secure Azure Integration**: Authenticates via Azure Service Principal credentials (`ARM_CLIENT_ID`, `ARM_CLIENT_SECRET`, `ARM_TENANT_ID`, `ARM_SUBSCRIPTION_ID`).
- ⚡ **Automated CI/CD Pipeline**: Runs `terraform fmt`, `init`, `validate`, `plan`, and `apply` automatically on push to the `main` branch.
- 🎛️ **Manual Workflow Dispatch**: Supports manual workflow triggers in GitHub Actions to run `apply` or `destroy` on demand.

---

## 📁 Project Structure

```
.
├── .github/
│   └── workflows/
│       └── terraform.yml     # GitHub Actions CI/CD pipeline configuration
├── main.tf                    # Core Terraform logic (Providers, Resource Groups, Storage Accounts)
├── variable.tf                # Input variable declarations
├── terraform.tfvars           # Variable definition values
└── README.md                  # Project documentation
```

---

## 🛠️ Prerequisites

Before executing locally or through GitHub Actions, ensure you have:

1. **Azure CLI**: Installed and logged in (`az login`).
2. **Terraform CLI**: Installed (v1.5+).
3. **Azure Subscription**: Active subscription with sufficient RBAC permissions (Contributor/Owner).
4. **GitHub Secrets**: Configure the following Repository Secrets (`Settings` -> `Secrets and variables` -> `Actions`):
   - `ARM_CLIENT_ID`
   - `ARM_CLIENT_SECRET`
   - `ARM_TENANT_ID`
   - `ARM_SUBSCRIPTION_ID`

---

## 🚀 Getting Started

### Local Deployment

1. **Initialize Terraform:**
   ```bash
   terraform init
   ```

2. **Validate Configuration:**
   ```bash
   terraform fmt
   terraform validate
   ```

3. **Generate Execution Plan:**
   ```bash
   terraform plan
   ```

4. **Apply Infrastructure Changes:**
   ```bash
   terraform apply -auto-approve
   ```

5. **Clean Up Resources (Optional):**
   ```bash
   terraform destroy -auto-approve
   ```

---

## 🔄 CI/CD Workflow (`.github/workflows/terraform.yml`)

- **Automated Workflow**: Triggers on `push` and `pull_request` events targeting the `main` branch.
- **Manual Trigger**: Under **Actions** tab -> **Terraform CI/CD** -> **Run workflow**, choose:
  - `apply` to deploy infrastructure.
  - `destroy` to tear down infrastructure.

---

## 🔧 Configuration (`terraform.tfvars`)

Custom resources can be configured in [terraform.tfvars](file:///d:/Gautam%20Folder/Terraform%20practice/Github_repo/github_repo/terraform.tfvars):

```hcl
rgs = {
  rg1 = {
    name     = "dev_13"
    location = "centralindia"
  }
}

stgs = {
  stg1 = {
    name                     = "storagedevinder"
    location                 = "centralindia"
    resource_group_name      = "dev_13"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}
```

---

## 📄 License

This repository is open-source and available under the [MIT License](LICENSE).