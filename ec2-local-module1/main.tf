resource "null_resource" "dummy" {

}

module "ec2-local-module" {
  source  = "../ec2-local-module2"
}
