provider "aws" {
    access_key = "${var.access}"
    secret_key = "${var.secret}"
    region = "${var.region}"
}
resource "aws_instance" "bahmni" {
    ami = "ami-01e36b7901e884a10"
    instance_type = "t2.medium"
    key_name = "yum"
    security_groups = ["openforall"]

    connection{
        type = "ssh"
        user = "centos"
        host = "${aws_instance.bahmni.public_ip}"
        private_key = "${file("./yum.pem")}"

    }
    tags{
        Name = "Bahmni"
    }
    provisioner "local-exec"{
        command = "chmod +x ./bahmni_installation.sh"  
    }

    provisioner "local-exec"{
        command = "./bahmni_installation.sh args"
    }

    provisioner "file"{
        source        = "/tmp/bahmni"
        destination   = "/etc/bahmni-installer/deployment-artifacts/"

    }
    provisioner "remote-exec"{
        inline = [
            "echo 'export BAHMNI_INVENTORY=local' >> ~/.bashrc",
            "source ~/.bashrc"
        ]
        
    }
    provisioner "remote_exec"{
        inline = [
            "bahmni install"
        ]
    }

}


