
# resource "aws_ec2_client_vpn_endpoint" "remote_client" {
#   description            = "Client VPN Endpoint for remote end users."
#   server_certificate_arn = var.remote_server_certificate_arn
#   client_cidr_block      = "10.0.0.0/16"

#   dns_servers           = ["192.168.100.3", "8.8.8.8"] # [on-prem, google]
#   transport_protocol    = "tcp"
#   vpn_port              = "443"
#   session_timeout_hours = "8"

#   vpc_id             = var.remote_vpc_id
#   security_group_ids = ["sg-0fcea00b6478fbf49"] # [] default one - todo; reconfigure

#   authentication_options {
#     type                       = "certificate-authentication"
#     root_certificate_chain_arn = var.remote_client_certificate_arn
#   }
#   connection_log_options {
#     enabled = false
#     # cloudwatch_log_group  = aws_cloudwatch_log_group.lg.name
#     # cloudwatch_log_stream = aws_cloudwatch_log_stream.ls.name
#   }
#   tags = {
#     Name = "wwl-remote-client-vpn-endpoint-1"
#   }
# }

# resource "aws_ec2_client_vpn_network_association" "remote_target_1" {
#   client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.remote_client.id
#   subnet_id              = var.remote_1_subnet_id

#   # TODO - sets to default by defacto
#   # security_groups        = [aws_security_group.example1.id, aws_security_group.example2.id]
# }

# resource "aws_ec2_client_vpn_authorization_rule" "hub_cidr" {
#   client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.remote_client.id
#   target_network_cidr    = "10.10.0.0/16"
#   authorize_all_groups   = true
#   description            = "Enables authorization to all wwl-hub resources"
# }

# resource "aws_ec2_client_vpn_authorization_rule" "open_cidr" {
#   client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.remote_client.id
#   target_network_cidr    = "0.0.0.0/0"
#   authorize_all_groups   = true
#   description            = "Enables authorization to all IPs"
# }

# resource "aws_ec2_client_vpn_route" "access_to_public_internet" {
#   client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.remote_client.id
#   destination_cidr_block = "0.0.0.0/0"
#   target_vpc_subnet_id   = aws_ec2_client_vpn_network_association.remote_target_1.subnet_id
#   description            = "Enables access to public internet"
# }