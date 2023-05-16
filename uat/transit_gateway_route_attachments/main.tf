resource "aws_route" "uat_to_on_prem" {
  route_table_id         = "rtb-070b219ed29befc99"
  destination_cidr_block = "192.168.0.0/16"
  transit_gateway_id     = var.transit_gw_id
}

resource "aws_route" "uat_to_hub" {
  route_table_id         = "rtb-070b219ed29befc99"
  destination_cidr_block = "10.1.0.0/16"
  transit_gateway_id     = var.transit_gw_id
}

resource "aws_route" "uat_to_remote" {
  route_table_id         = "rtb-070b219ed29befc99"
  destination_cidr_block = "10.10.0.0/16"
  transit_gateway_id     = var.transit_gw_id
}