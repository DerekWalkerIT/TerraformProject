resource "aws_ec2_transit_gateway" "wwl_transit_gw" {
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  dns_support                     = "enable"
  amazon_side_asn                 = "64512"
  auto_accept_shared_attachments  = "enable"
  tags = {
    Name = "wwl-transit-gw"
  }
}

resource "aws_ram_resource_share" "wwl_resource_share" {
  name                      = "wwl-resource-share"
  allow_external_principals = false
}

resource "aws_ram_principal_association" "wwl_ram_pricipal_association" {
  principal          = "arn:aws:organizations::311178072844:organization/o-f6jy5kciox"
  resource_share_arn = aws_ram_resource_share.wwl_resource_share.arn
}

resource "aws_ram_resource_association" "shared_transit_gateway" {
  resource_arn       = aws_ec2_transit_gateway.wwl_transit_gw.arn
  resource_share_arn = aws_ram_resource_share.wwl_resource_share.arn
}

resource "aws_ec2_transit_gateway_vpc_attachment" "hub_transit_attatchment" {
  subnet_ids         = [var.hub_private_app_1_subnet_id, var.hub_private_app_2_subnet_id, var.hub_private_backup_subnet_id]
  transit_gateway_id = aws_ec2_transit_gateway.wwl_transit_gw.id
  vpc_id             = var.hub_vpc_id
  tags = {
    Name = "hub-transit-gateway-attatchment"
  }
}