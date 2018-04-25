Overview
====

Deploy [AWX](https://github.com/ansible/awx) environment to Azure VM.

Environment to be deployed
====

Azure VM
----
### OS

- Ubuntu 17.10

### Installed software

- Ansible
- Docker CE
- docker-py
- build-essential
- git

About AWX
----
About AWX, please refer [awx/INSTALL.md at devel · ansible/awx](https://github.com/ansible/awx/blob/devel/INSTALL.md).

How to deploy to Azure
====

Deploy by using Azure portal
----
[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmdobrzyn%2Fawx-on-azure%2Fmaster%2Fazure%2Fazuredeploy.json)

Deploy by using Azure CLI 2.0
----
You need [Azure CLI 2.0](https://docs.microsoft.com/en-us/cli/azure/overview?view=azure-cli-latest).

First you should fill `parameters.publicKey.value` in `azure/parameters.json` by your public key.

```json
{
    ...
    "parameters": {
        ...
        "publicKey": {
            "value": "ssh-rsa ..."
        },
        ...
```

Then you can deploy like following commands.

```bash
az login
az group create -n <resource group name> -l japaneast
az group deployment create -g <resource group name> --template-file azure/azuredeploy.json --parameters @azure/parameters.json
```

After deployment finished, you can access the vm by http. You can get public IP of the vm by following command.

```bash
az vm list-ip-addresses -g <resource group name> --query "[].virtualMachine.network.publicIpAddresses[].ipAddress" -o tsv
```

Default password to AWX 

http://ipaddress
admin/password


If first time, you may need wait a moment until finish provisioning.
