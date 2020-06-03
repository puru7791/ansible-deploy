provider "aws" {
    access_key = ""
    secret_key = ""
    region = "us-east-2"
  
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
}
provisioners "remote_exec"{
    inline = [
        "chmod +x ./bahmni_installation.sh",
        "./bahmni_installation.sh args"
    ]

}
provisioners "file"{
    source        = "/tmp/bahmni"
    destination   = "/etc/bahmni-installer/deployment-artifacts/"

}


