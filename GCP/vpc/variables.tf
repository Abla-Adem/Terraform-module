variable "project_id" {
  description = "ID du projet GCP où créer le VPC."
  type        = string
}

variable "region" {
  description = "Région GCP principale (ex: europe-west1)."
  type        = string
}

variable "network_name" {
  description = "Nom du VPC à créer."
  type        = string
  default     = "vpc-principal"
}

variable "subnetwork_name" {
  description = "Nom du sous-réseau à créer."
  type        = string
  default     = "subnet-principal"
}

variable "subnetwork_cidr" {
  description = "CIDR du sous-réseau."
  type        = string
  default     = "10.0.0.0/24"
}
