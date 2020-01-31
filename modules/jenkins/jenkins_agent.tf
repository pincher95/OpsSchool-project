//data "template_file" "user_data_slave" {
//  template = file("scripts/join-cluster.sh.tpl")
//
//  vars {
//    jenkins_url            = "http://${aws_instance.jenkins_master.private_ip}:8080"
//    //    jenkins_username       = "${var.jenkins_username}"
//    //    jenkins_password       = "${var.jenkins_password}"
//    //    jenkins_credentials_id = "${var.jenkins_credentials_id}"
//  }
//}

//resource "aws_instance" "jenkins_agent" {
//  ami = "ami-00068cd7555f543d5"
//  instance_type = var.jenkis_ec2_type
//  subnet_id = var.private_subnet[1]
//  key_name = var.public_aws_key[0]
//  vpc_security_group_ids = [var.jenkis_sg, var.private_sg]
////  user_data = data.template_file.user_data_slave.rendered
//  depends_on = [aws_instance.jenkins_master]
//
//  connection {
//    host = self.private_ip
//    user = "ec2-user"
//    private_key = file(var.private_key_path)
//
//    bastion_host = var.bastion_ip[0]
//    bastion_user = "ubuntu"
//  }
//
//  provisioner "remote-exec" {
//    inline = [
//      "sudo yum update -y",
//      "sudo yum install java-1.8.0 docker git -y",
//      "sudo alternatives --install /usr/bin/java java /usr/java/latest/bin/java 1",
//      "sudo alternatives --config java <<< '1'",
//      "sudo service docker start",
//      "sudo usermod -aG docker ec2-user"
//    ]
//  }
//
//
//  tags = {
//    Name = "Jenkins Agent"
//  }
//}