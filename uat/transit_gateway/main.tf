resource "aws_ec2_transit_gateway_vpc_attachment" "uat_transit_attatchment" {
  subnet_ids         = [var.uat_private_app_1_subnet_id, var.uat_private_app_2_subnet_id, var.uat_private_backup_subnet_id]
  transit_gateway_id = var.wwl_transit_gw_id
  vpc_id             = var.uat_vpc_id
  tags = {
    Name = "uat-transit-gateway-attatchment"
  }
}