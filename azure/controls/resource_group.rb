location        = attribute('location')
resource_group  = attribute('network_resource_group')
name            = attribute('subnet_name')
vnet            = attribute('vnet_name')
address_prefix  = attribute('subnet_address_prefix')
nsg             = attribute('subnet_nsg')

control 'check-if-resource-group-exists' do
  impact 1.0
  title 'Ensure Resource Group Exists'
  describe azurerm_resource_groups.where(name: resource_group) do
    it { should exist }
  end
end

control 'check-resource-group-properties' do
  impact 1.0
  title 'Ensure Resource Group properties are correct'
  describe azure_generic_resource(group_name: resource_group) do
    its('location') { should eq location }
    it { should have_tags }
    its('tag_count') { should be 2 }
  end
end

