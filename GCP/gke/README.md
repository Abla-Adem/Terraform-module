## Module GKE GCP

Ce module crée un cluster GKE et un node pool dans GCP, en réutilisant un VPC et un sous‑réseau existants.

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

