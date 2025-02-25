resource "aws_vpc" "durgadev" {
  cidr_block = var.CIDRValue
  tags       = var.devvpc
}
resource "aws_subnet" "public" {
  cidr_block = var.publicsubnet
  vpc_id     = aws_vpc.durgadev.id
}
resource "aws_subnet" "private" {
  cidr_block = var.privatesubnet
  vpc_id     = aws_vpc.durgadev.id

}
resource "aws_internet_gateway" "durgaigw" {
  vpc_id = aws_vpc.durgadev.id

}
#resource "aws_internet_gateway_attachment" "igwattachment" {
# vpc_id              = aws_vpc.durgadev.id
#internet_gateway_id = aws_internet_gateway.durgaigw.id
#}


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.durgadev.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.durgaigw.id
  }
}
resource "aws_route_table_association" "publicassociation" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.durgadev.id
}

resource "aws_route_table_association" "privateassociation" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}
resource "aws_instance" "publicinstace" {
  subnet_id     = aws_subnet.public.id
  instance_type = var.instacetype
  ami           = var.amiid

}
resource "aws_instance" "privateinstance" {
  subnet_id     = aws_subnet.private.id
  instance_type = var.instacetype
  ami           = var.amiid

}