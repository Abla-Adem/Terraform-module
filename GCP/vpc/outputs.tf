output "network_name" {
  value       = google_compute_network.vpc.name
  description = "Nom du réseau VPC créé."
}

output "subnetwork_name" {
  value       = google_compute_subnetwork.subnet.name
  description = "Nom du sous-réseau créé."
}
