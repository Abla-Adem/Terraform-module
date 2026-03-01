## Module GKE GCP

Ce module crée un cluster GKE et un node pool dans GCP, en réutilisant un VPC et un sous‑réseau existants.

### Provider (entrée obligatoire)

Le module **n’utilise pas de provider par défaut** : l’appelant doit lui passer le provider `google` via l’argument `providers`. Cela permet de contrôler projet, région et credentials depuis la configuration racine.

### Appel avec version

Ce module est versionné **séparément** : utilisez le tag dédié `gcp-gke/<version>` (voir [VERSIONING.md](../../VERSIONING.md)) :

```hcl
provider "google" {
  project = "mon-projet"
  region  = "europe-west1"
}

module "gke" {
  source = "git::https://github.com/VOTRE_ORG/Terraform-module.git//GCP/gke?ref=gcp-gke/v1.0.0"

  providers = {
    google = google
  }

  project_id        = "mon-projet"
  region            = "europe-west1"
  network_name      = "mon-vpc"
  subnetwork_name   = "mon-subnet"
  cluster_name      = "mon-cluster"
  node_count        = 3
  node_machine_type = "e2-medium"
}
```

### Inputs

| Name              | Description                                              | Type   | Default        | Required |
|-------------------|----------------------------------------------------------|--------|----------------|----------|
| `project_id`      | ID du projet GCP où créer le cluster GKE.               | string | n/a            | yes      |
| `region`          | Région GCP (ex: europe-west1).                           | string | n/a            | yes      |
| `network_name`    | Nom du VPC existant à utiliser.                          | string | n/a            | yes      |
| `subnetwork_name` | Nom du sous-réseau existant à utiliser.                  | string | n/a            | yes      |
| `cluster_name`    | Nom du cluster GKE.                                      | string | `"gke-principal"` | no    |
| `node_count`      | Nombre de nœuds dans le node pool principal.            | number | `3`            | no       |
| `node_machine_type` | Type de machine pour les nœuds (ex: e2-medium).       | string | `"e2-medium"`  | no       |

### Commande pour régénérer cette doc

Avec `terraform-docs` installé localement :

```bash
terraform-docs markdown table --output-file README.md --output-mode inject .
```

