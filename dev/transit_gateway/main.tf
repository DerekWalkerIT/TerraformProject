resource "aws_ec2_transit_gateway_vpc_attachment" "dev_transit_attatchment" {
  subnet_ids         = [var.dev_private_app_1_subnet_id, var.dev_private_app_2_subnet_id, var.dev_private_backup_subnet_id]
  transit_gateway_id = var.transit_gw_id
  vpc_id             = var.dev_vpc_id
  tags = {
    Name = "dev-transit-gateway-attatchment"
  }
}