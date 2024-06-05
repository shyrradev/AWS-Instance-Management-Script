# AWS-Instance-Management-Script
This Script will help manage instances.
# AWS EC2 Instance Management Script

This is a Bash script to manage AWS EC2 instances. The script provides options to start, stop, list, and exit instance management operations.

## Prerequisites

- AWS CLI installed and configured on your system.
- Proper IAM permissions to manage EC2 instances.
- A Bash-compatible terminal.

## Setup

1. **Install AWS CLI**: If you haven't installed AWS CLI, follow the instructions [here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).

2. **Configure AWS CLI**: Run the following command and enter your AWS Access Key, Secret Key, region, and output format:
    ```sh
    aws configure
    ```

3. **Download the Script**: Save the script as `im-aws.sh` on your local machine.

4. **Make the Script Executable**: Run the following command to make the script executable:
    ```sh
    chmod +x im-aws.sh
    ```

## Usage

Run the script by executing the following command:
```sh
./im-aws.sh
