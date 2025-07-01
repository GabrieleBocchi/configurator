# 🛠️ Configurator

**Configurator** is a lightweight container that listens for webhooks and automatically runs scripts (for example an Ansible playbook to deploy your infrastructure).

Ideal for small setups or personal projects that need GitOps-like automation without the complexity of tools like ArgoCD.

## 🚀 How It Works

1. When starting the container:
   - It clones your specified repository.
   - It starts a custom script if the `CUSTOM_SCRIPT_PATH` environment variable is set. This script can be used to perform any custom actions before the main functionality.
   - It starts the webhook server to listen for incoming requests.
2. A webhook notifies the Configurator container (for example when pushing to a Git repository).
3. The container pulls the latest changes from your repository and then executes the specified script to apply the changes.

## ⚙️ Usage

1. Clone this repo and create a `.env` file with your configuration. You can find an example in `.env.example`.
2. Add the useful files in your repository.
3. Start the container using Docker Compose:

   ```bash
   docker compose up -d
   ```

You can find a complete example in the `example` directory.

> [!WARNING]
> I suggest to run the container in a dedicated virtual machine or a dedicated server, as it needs an ssh key to access your repository and will run scripts that can modify your infrastructure.
