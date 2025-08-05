###############################################
# SSH Key Pair
###############################################
resource "aws_key_pair" "webapp_key" {
  key_name   = "webapp-key"
  public_key = file("webapp-key.pub") # <-- Put your public key in a separate file
}
