###############################################
# Key Pair for EC2 Access
###############################################
resource "aws_key_pair" "dove_key" {
  key_name   = "dove-key"
  public_key = file("${path.module}/dove-key.pub")
}
