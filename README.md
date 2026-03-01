## Modules Terraform

Ce dépôt contient des modules Terraform réutilisables.

### Versionnement

Chaque **module est versionné séparément** via des tags Git dédiés :

| Module   | Dossier   | Tag à utiliser (ex.)   |
|----------|-----------|-------------------------|
| VPC      | `GCP/vpc` | `?ref=gcp-vpc/v1.0.0`   |
| GKE      | `GCP/gke` | `?ref=gcp-gke/v1.0.0`   |

**Exemple (Git HTTPS) :**

Configurez le provider `google` dans le projet appelant, puis passez-le aux modules avec l’argument `providers` :

```hcl
provider "google" {
  project = "mon-projet"
  region  = "europe-west1"
}

module "vpc" {
  source = "git::https://github.com/VOTRE_ORG/Terraform-module.git//GCP/vpc?ref=gcp-vpc/v1.0.0"

  providers = {
    google = google
  }

  project_id      = "mon-projet"
  region          = "europe-west1"
  network_name    = "mon-vpc"
  subnetwork_name = "mon-subnet"
  subnetwork_cidr = "10.0.0.0/24"
}

module "gke" {
  source = "git::https://github.com/VOTRE_ORG/Terraform-module.git//GCP/gke?ref=gcp-gke/v1.0.0"

  providers = {
    google = google
  }

  project_id       = "mon-projet"
  region           = "europe-west1"
  network_name     = module.vpc.network_name
  subnetwork_name  = module.vpc.subnetwork_name
  cluster_name     = "mon-cluster"
  node_count       = 3
  node_machine_type = "e2-medium"
}
```

**Exemple (SSH) :**

```hcl
source = "git::ssh://git@github.com/VOTRE_ORG/Terraform-module.git//GCP/vpc?ref=gcp-vpc/v1.0.0"
```

**Créer une version pour un module donné :**

```bash
# Exemple : nouvelle version du module VPC uniquement
git tag -a gcp-vpc/v1.1.0 -m "GCP VPC v1.1.0"
git push origin gcp-vpc/v1.1.0

# Exemple : nouvelle version du module GKE uniquement
git tag -a gcp-gke/v1.0.0 -m "GCP GKE v1.0.0"
git push origin gcp-gke/v1.0.0
```

Remplacez `VOTRE_ORG` et l’URL du dépôt par les vôtres. Détails et convention des tags : [VERSIONING.md](VERSIONING.md).

### GCP

La partie GCP se trouve dans le dossier `GCP` et contient deux modules séparés :

- **VPC** : création d'un réseau VPC et de sous‑réseaux (`GCP/vpc`).
- **GKE** : création d'un cluster GKE qui réutilise le VPC existant (`GCP/gke`).

Chaque module possède son propre dossier Terraform pour permettre des déploiements séparés.
