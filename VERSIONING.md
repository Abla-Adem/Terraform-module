# Versionnement des modules

## Principe

Chaque **dossier module** est versionné **séparément** via des **tags Git dédiés**. Un tag est associé à un module (ex. `gcp-vpc/v1.0.0` pour `GCP/vpc`). Ainsi, VPC et GKE peuvent évoluer en versions différentes (ex. VPC en 1.2.0, GKE en 1.0.0).

Lorsque vous appelez un module, fixez sa version avec `?ref=<tag>` pour éviter les changements non maîtrisés.

## Convention de tags par module

| Module   | Dossier   | Préfixe de tag  | Exemples de tags      |
|----------|-----------|------------------|------------------------|
| VPC GCP  | `GCP/vpc` | `gcp-vpc/`       | `gcp-vpc/v1.0.0`       |
| GKE GCP  | `GCP/gke` | `gcp-gke/`       | `gcp-gke/v1.0.0`       |

Pour un nouveau module (ex. `GCP/cloud-run`), ajoutez un préfixe cohérent : `gcp-cloud-run/v1.0.0`.

## Appeler un module avec une version

Utilisez l’URL du repo + le chemin du module + `?ref=` et **le tag de ce module** :

```hcl
# VPC à la version 1.0.0
module "vpc" {
  source = "git::https://github.com/VOTRE_ORG/Terraform-module.git//GCP/vpc?ref=gcp-vpc/v1.0.0"
  # ...
}

# GKE à la version 1.0.0 (peut être différente de VPC)
module "gke" {
  source = "git::https://github.com/VOTRE_ORG/Terraform-module.git//GCP/gke?ref=gcp-gke/v1.0.0"
  # ...
}
```

- Sans `?ref=` : Terraform utilise la branche par défaut (souvent `main`), donc le code peut changer dans le temps.
- Avec `?ref=gcp-vpc/v1.0.0` : vous restez sur la version 1.0.0 du module VPC, indépendamment de la version de GKE.

## Créer et publier une version pour un module

Vous versionnez **un seul module à la fois** : vous créez un tag dont le préfixe correspond à ce module.

1. Commiter les changements (du module concerné ou d’autres fichiers).
2. Créer un tag avec le **préfixe du module** et une version [SemVer](https://semver.org/) (`vMAJOR.MINOR.PATCH`) :

   **Exemple : nouvelle version du module VPC uniquement**
   ```bash
   git tag -a gcp-vpc/v1.1.0 -m "GCP VPC v1.1.0 - ajout support custom routing"
   git push origin gcp-vpc/v1.1.0
   ```

   **Exemple : nouvelle version du module GKE uniquement**
   ```bash
   git tag -a gcp-gke/v1.0.0 -m "GCP GKE v1.0.0 - release initiale"
   git push origin gcp-gke/v1.0.0
   ```

3. Pousser le tag vers le dépôt distant (voir commandes ci‑dessus).

Pour lister les tags existants (tous ou par préfixe) :

```bash
git tag -l
git tag -l 'gcp-vpc/*'
git tag -l 'gcp-gke/*'
```

## Résumé

- **Oui, c’est faisable** : chaque dossier (VPC, GKE, etc.) a ses propres tags et donc ses propres versions.
- Utilisez un tag par module (ex. `gcp-vpc/v1.0.0`, `gcp-gke/v1.0.0`) et appelez avec `?ref=<ce-tag>`.
- Créez un nouveau tag uniquement pour le module que vous publiez (ex. après un changement dans `GCP/vpc`, créez `gcp-vpc/v1.1.0`).

## Changelog

Les changements par module peuvent être documentés dans [CHANGELOG.md](CHANGELOG.md), en séparant par préfixe (ex. `## [gcp-vpc/v1.1.0]`, `## [gcp-gke/v1.0.0]`).
