## Module VPC GCP

Ce module crée un VPC et un sous‑réseau dans GCP.

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

