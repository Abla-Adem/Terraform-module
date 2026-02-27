## Modules Terraform

Ce dépôt contient des modules Terraform réutilisables.

### GCP

La partie GCP se trouve dans le dossier `GCP` et contient deux modules séparés :

- **VPC** : création d'un réseau VPC et de sous‑réseaux (`GCP/vpc`).
- **GKE** : création d'un cluster GKE qui réutilise le VPC existant (`GCP/gke`).

Chaque module possède son propre dossier Terraform pour permettre des déploiements séparés.
