module "web_server" {
  source         = "./module/"
  az 		 = var.az
  region 	 = var.region
  env_name       = var.env_name
  instance_count = var.instance_count
  instance_type  = var.instance_type
  volume_size	 = var.volume_size
}
