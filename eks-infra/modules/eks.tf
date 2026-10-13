module "eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = local.name
  kubernetes_version = "1.33"

  endpoint_public_access = true

  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.intra_subnets
  
  eks_managed_node_groups = {
    cluster-node = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      ami_type       = ""
      instance_types = ["t3.micro"]

      min_size     = 2
      max_size     = 3
      desired_size = 2

      capacity_type = "SPOT"
    }
  }
  tags = {
    env = local.env
    Terraform = "true"
  }
}