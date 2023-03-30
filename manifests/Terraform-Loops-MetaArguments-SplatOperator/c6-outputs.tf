#output - For Loop with List
output "for-output-list" {
  description = "For loop with list"
  value = [for instance in aws_instance.myec2vm: instance.public_dns]
}

#for loop with map

output "for-loop-with-map" {
  description = "For loop with map"
  value = { for instance in aws_instance.myec2vm: instance.id => instance.public_dns}
}

#for loop with map advanced

output "for-loop-wih-map-advanced" {
  value = { for c , instance in aws_instance.myec2vm: c => instance.public_dns}
}

#Legacy Splat Operator

output "legacy_splat_instance_public_dns" {
  description = "legacy Splat Operator"
  value = aws_instance.myec2vm.*.public_dns
}

#latest splat instance in vm

output "Latest_Splat_instance_publicdns" {
  description = "Latest splat operator"
  value = aws_instance.myec2vm[*].public_dns
}