resource "aws_ec2_transit_gateway_vpc_attachment" "prod_transit_attatchment" {
  subnet_ids         = [var.prod_private_app_1_subnet_id, var.prod_private_app_2_subnet_id, var.prod_private_backup_subnet_id]
  transit_gateway_id = var.wwl_transit_gw_id
  vpc_id             = var.prod_vpc_id
  tags = {
    Name = "prod-transit-gateway-attatchment"
  }
}