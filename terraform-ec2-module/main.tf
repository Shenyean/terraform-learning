module "web_app" {
  source         = "./modules/web_app"
  name_prefix    = "yeosy"
  instance_count = 2
  vpc_id         = "vpc-0bce6847fdfeea730"
}
