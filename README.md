# InSpec Sample Profiles
InSpec is a testing tool made by Chef. It is used for testing purposes. It's using so-called 'profiles' which contains the logic for testing specific resources like an Operating System, code, or Azure reources.
In this repository I'm collecting my custom profiles.

## Install InSpec on Ubuntu 18.04

### Prerequisites
#### Creating directory structure
```
sudo mkdir -p /opt/cicd/test/inspec
sudo chmod -R 777 /opt/cicd
```
#### Install direnv to make handling environment variables easier
`sudo apt-get install direnv`
#### Creating the environment file
`sudo touch /opt/cicd/.envrc`
#### Making sure direnv loads
```
sudo sh -c "cat >> ~/.bashrc <<EOF
eval "$(direnv hook bash)"
EOF
"
```
#### Putting in Azure environment variables that will be loaded by direnv and be used by InSpec
```
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
```
wget https://packages.chef.io/files/current/inspec/2.3.8/ubuntu/18.04/inspec_2.3.8-1_amd64.deb
sudo dpkg -i inspec_2.3.8-1_amd64.deb
```
### Clone InSpec Azure Profile
`git clone https://github.com/rdtechie/inspec_sample_profiles.git /opt/cicd/test/inspec/inspec_sample_profiles`

### Test Azure InSpec test
```
cd /opt/cicd/test/inspec
inspec exec inspec_sample_profiles/azure -t azure://
```
