resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  network    = var.network_name
  subnetwork = var.subnetwork_name

  remove_default_node_pool = true
  initial_node_count       = 1

  release_channel {
    channel = "REGULAR"
  }

  ip_allocation_policy {}
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "${var.cluster_name}-nodes"
  cluster    = google_container_cluster.primary.name
  location   = var.region
  node_count = var.node_count

  node_config {
    machine_type = var.node_machine_type
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}
