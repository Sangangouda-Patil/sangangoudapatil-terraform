resource "random_id" "rand_id" {
  byte_length = 8

}

resource "aws_s3_bucket" "my-bucket" {
  bucket = "my-bucket-${random_id.rand_id.hex}"

  tags = {
    Name = "my-bucket"
  }
}
