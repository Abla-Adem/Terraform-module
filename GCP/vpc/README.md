## Module VPC GCP

Ce module crée un VPC et un sous‑réseau dans GCP.

### Provider (entrée obligatoire)

Le module **n’utilise pas de provider par défaut** : l’appelant doit lui passer le provider `google` via l’argument `providers`. Cela permet de contrôler projet, région et credentials depuis la configuration racine.

### Appel avec version

Ce module est versionné **séparément** : utilisez le tag dédié `gcp-vpc/<version>` (voir [VERSIONING.md](../../VERSIONING.md)) :

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
```

### Inputs

| Name             | Description                                         | Type   | Default          | Required |
|------------------|-----------------------------------------------------|--------|------------------|----------|
| `project_id`     | ID du projet GCP où créer le VPC.                  | string | n/a              | yes      |
| `region`         | Région GCP principale (ex: europe-west1).          | string | n/a              | yes      |
| `network_name`   | Nom du VPC à créer.                                | string | `"vpc-principal"`| no       |
| `subnetwork_name`| Nom du sous-réseau à créer.                        | string | `"subnet-principal"` | no   |
| `subnetwork_cidr`| CIDR du sous-réseau.                               | string | `"10.0.0.0/24"`  | no       |

### Commande pour régénérer cette doc

Avec `terraform-docs` installé localement :

```bash
terraform-docs markdown table --output-file README.md --output-mode inject .
```

