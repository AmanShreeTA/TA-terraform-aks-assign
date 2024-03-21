module "aks-cluster" {
  source           = "../Modules/aks"
  aks-cluster-name = "dev-${var.aks-name}"
  rs-location      = var.reso-loc
  rg-name          = var.rsgp-name
  node-count       = var.dflt-nodes
  max-nodes        = var.max-no-nodes
  min-nodes        = var.min-no-nodes
  max-pods         = var.no-o-pods
  vm-size          = var.vm-size-type
  env              = var.env
  your-name        = var.your-name
}