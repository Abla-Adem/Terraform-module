variable "project_id" {
  description = "ID du projet GCP où créer le cluster GKE."
  type        = string
}

variable "region" {
  description = "Région GCP (ex: europe-west1)."
  type        = string
}

variable "network_name" {
  description = "Nom du VPC existant à utiliser."
  type        = string
}

variable "subnetwork_name" {
  description = "Nom du sous-réseau existant à utiliser."
  type        = string
}

variable "cluster_name" {
  description = "Nom du cluster GKE."
  type        = string
  default     = "gke-principal"
}

variable "node_count" {
  description = "Nombre de nœuds dans le node pool principal."
  type        = number
  default     = 3
}

variable "node_machine_type" {
  description = "Type de machine pour les nœuds (ex: e2-medium)."
  type        = string
  default     = "e2-medium"
}
