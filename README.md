# InSpec Sample Profiles
InSpec is a testing tool made by Chef. It is used for testing purposes. It's using so-called 'profiles' which contains the logic for testing specific resources like an Operating System, code, or Azure reources.
In this repository I'm collecting my custom profiles.

## Install InSpec on Ubuntu 18.04

### Prerequisites
```
sudo mkdir /opt/cicd/test/inspec
sudo apt-get install direnv
sudo nano /opt/cicd/.envrc

sudo sh -c "cat > /opt/cicd/.envrc <<EOF
# Environment Variables for InSpec
export AZURE_TENANT_ID=<insert>
export AZURE_SUBSCRIPTION_ID=<insert>
export AZURE_CLIENT_ID=<insert>
export AZURE_CLIENT_SECRET=<insert>
EOF
"
```
### Download InSpec - Current Release
wget https://packages.chef.io/files/current/inspec/2.3.8/ubuntu/18.04/inspec_2.3.8-1_amd64.deb
sudo dpkg -i inspec_2.3.8-1_amd64.deb

### Clone InSpec Azure Profile
git clone https://github.com/rdtechie/inspec_sample_profiles.git /opt/cicd/test/inspec/inspec_sample_profiles

### Test Azure InSpec test
cd /opt/cicd/test/inspec
inspec exec inspec_sample_profiles/azure -t azure://
