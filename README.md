Overview
====

Deploy [AWX](https://github.com/ansible/awx) environment to Azure VM.

How to deploy to Azure
====

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
az group deployment create -g <resource group name> --template-file azure/zuredeploy.json --parameters @azure/arameters.json
```

After deployment finished, you can access the vm by http. You can get public IP of the vm by following command.

```bash
az vm list-ip-addresses -g <resource group name> --query "[].virtualMachine.network.publicIpAddresses[].ipAddress" -o tsv
```

If first time, you may need wait a moment until finish provisioning.