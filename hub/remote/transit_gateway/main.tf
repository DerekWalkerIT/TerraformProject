resource "aws_ec2_transit_gateway_vpc_attachment" "remote_transit_attatchment" {
  subnet_ids         = [var.remote_1_subnet_id, var.remote_2_subnet_id]
  transit_gateway_id = var.transit_gateway_id
  vpc_id             = var.remote_vpc_id
  tags = {
    Name = "remote-transit-gateway-attatchment"
  }
}