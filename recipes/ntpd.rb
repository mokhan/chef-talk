package "ntp"

service "ntpd" do
  action [:enable, :start]
end
