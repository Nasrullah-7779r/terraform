
module "EC2" {
  source    = "./modules/EC2"
}

module "VPC" {
  source = "./modules/VPC"
}