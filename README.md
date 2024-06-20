# CloudUploader

## Overview

CloudUploader is a batch-based CLI tool that allows users to quickly upload files to Azure Blob Storage.

## Prerequisites

- An Azure account
- Azure CLI installed and configured
- Environment variables set up for Azure credentials

### Step 1: Install Azure CLI

1. **Download and install Azure CLI** from the [official website](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli).
2. **Log in to your Azure account**:
In cmd
   az login

### Step 2: Create Azure Resources
## Resource Group
az group create --name MyResourceGroup --location ukwest

## Storage Account
az storage account create --name mirajstoragemydude --resource-group MyResourceGroup --location ukwest --sku Standard_LRS

## Storage Container
az storage container create --name mirajcontainermydude --account-name mystorageaccount

### Step 3: Set Up Authentication
az storage account keys list --resource-group MyResourceGroup --account-name mirajstoragemydude --output table

Copy one of the keys (value of the key1 or key2 field).

## Set Enivronment Variables
In CMD:
set AZURE_STORAGE_ACCOUNT=mystorageaccount
set AZURE_STORAGE_KEY=your-storage-account-key
set AZURE_STORAGE_CONTAINER=mycontainer

## Step 4: Create the CloudUploader Script
Which is in the clouduploader.bat file

## Usage

```batch
clouduploader.bat C:\path\to\file.txt
