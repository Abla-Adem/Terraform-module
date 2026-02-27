output "cluster_name" {
  value       = google_container_cluster.primary.name
  description = "Nom du cluster GKE."
}

output "kubernetes_endpoint" {
  value       = google_container_cluster.primary.endpoint
  description = "Endpoint de l'API Kubernetes."
}
