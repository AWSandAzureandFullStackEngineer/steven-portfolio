resource "aws_instance" "ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.public_subnet_az1_id
  vpc_security_group_ids = [var.security-group_id]
  iam_instance_profile   = aws_iam_instance_profile.instance-profile.name
  root_block_device {
    volume_size = 30
  }
  user_data = templatefile("${path.module}/install-tools.sh", {})

  tags = {
    Name = var.instance_name
  }
}

resource "aws_iam_instance_profile" "instance-profile" {
  name = "Jumphost-instance-profile"
  role = aws_iam_role.iam-role.name
}

resource "aws_iam_role" "iam-role" {
  name               = var.iam-role
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "iam-policy" {
  role = aws_iam_role.iam-role.name
  # Just for testing purpose, don't try to give administrator access in production
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
