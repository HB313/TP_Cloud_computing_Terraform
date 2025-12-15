# Conventions — TP Terraform (GCP)

## Contexte
-  Cloud: Google Cloud Platform (GCP)
-  Provider Terraform: hashicorp/google (~> 5.x)
-  Auth recommandée (local/TP): Application Default Credentials (ADC)
  - gcloud auth login
  - gcloud auth application-default login
-  Projet GCP: 1 projet par env idéalement (au minimum prod séparé)

## Régions et zones
-  Région principale: europe-west1
-  Zone par défaut (si nécessaire): europe-west1-b

## Nommage
-  Format général (kebab-case, caractères [a-z0-9-]):
  - {app}-{env}-{role}-{suffix}
-  Exemples:
  - VPC: flaskdemo-dev-vpc
  - Subnet: flaskdemo-dev-public
  - Buckets GCS: flaskdemo-dev-artifacts, flaskdemo-dev-static, flaskdemo-dev-logs
-  Contraintes GCS:
  - Unicité globale, 3–63 chars, [a-z0-9._-], commencer par lettre ou chiffre
  - Recommandé: pas de majuscules, pas d’underscore; privilégier [a-z0-9-]
  - Ajouter un suffixe si collision (ex: -123abc)

## Labels (tags) obligatoires
-  app: nom logique (ex: flaskdemo)
-  environment: dev | staging | prod
-  owner: votre email (ex: prenom.nom@ecole.fr)
-  cost_center: ex: CC123
-  Application: appliquer ces labels à toutes les ressources qui supportent `labels`

## State Terraform
-  Backend: GCS (config en Étape 4)
-  Clés/chemins par environnement:
  - terraform/state/dev/terraform.tfstate
  - terraform/state/staging/terraform.tfstate
  - terraform/state/prod/terraform.tfstate
-  Bonnes pratiques:
  - Versioning du bucket activé
  - State = secret (accès restreint)
  - Pas d’édition manuelle du state

## Versions et dépendances
-  Terraform: >= 1.6.0
-  Providers: contraintes explicites (ex: google ~> 5.40)
-  Lockfile (.terraform.lock.hcl): committé (recommandé)

## Workflow
-  Local:
  - terraform init
  - terraform fmt
  - terraform validate
  - terraform plan
  - terraform apply
-  Toujours lire le plan avant apply
-  Limiter les changements manuels dans la console; en cas de drift: `plan/apply -refresh-only`
