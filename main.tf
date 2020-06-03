provider "aws" {
    access_key = "${var.access}"
    secret_key = "${var.secret}"
    region = "${var.region}"
}
resource "aws_instance" "bahmni" {
    ami = "ami-01e36b7901e884a10"
    instance_type = "t2.medium"
    key_name = "yum"
    security_groups = ["alltraffic"]

    connection{
        type = "ssh"
        user = "centos"
        host = "${aws_instance.bahmni.public_ip}"
        private_key = "${file("./yum.pem")}"

    }
    tags{
        Name = "Bahmni"
    }
    provisioner "remote_exec"{
        inline = [
            "chmod +x ./bahmni_installation.sh",
            "./bahmni_installation.sh args"
        ]
    }
    provisioner "file"{
        source        = "/tmp/bahmni"
        destination   = "/etc/bahmni-installer/deployment-artifacts/"

    }

}


