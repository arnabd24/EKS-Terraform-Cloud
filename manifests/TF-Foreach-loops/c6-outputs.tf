#latest splat instance in vm
/*
output "Latest_Splat_instance_publicdns" {
  description = "Latest splat operator"
  value = [for instance in aws_instance.myec2vm: instance.public_dns]
}

output "Public_IP" {
  description = "Latest splat operator"
  value = [for instance in aws_instance.myec2vm: instance.public_ip]
}
*/
output "instance_publicdns_2_map" {
  value = ({ for az, instance in aws_instance.myec2vm: az=> instance.public_dns})
}

output "instance_p_ip" {
  value = { for az, instance in aws_instance.myec2vm: az=> instance.public_ip}
  #value = tomap({ for az, instance in aws_instance.myec2vm: az=> instance.public_ip})
}

output "output_v1" {
  value = { for az, details in data.aws_ec2_instance_type_offerings.my-instance-offerings: 
  az=> details.instance_types if length(details.instance_types) !=0 }
}

/*
you can use keys function / values function to 
output "output_v1" {
  value = keys({ for az, details in data.aws_ec2_instance_type_offerings.my-instance-offerings: 
  az=> details.instance_types if length(details.instance_types) !=0 })
}
*/