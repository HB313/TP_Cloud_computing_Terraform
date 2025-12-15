# Module: logging (GCP)

Objet:
-  Crée un bucket GCS dédié à l’archivage/journalisation applicative (rétention simple pour TP).

Inputs:
-  project_id (string)
-  region (string)
-  environment (string)
-  app_name (string)
-  labels (map(string), optionnel)

Outputs:
-  logs_bucket_name (string)

Notes:
-  Pour une prod réelle, envisager Google Cloud Logging buckets + log sinks.
-  Ici, bucket GCS avec règle de rétention simplifiée (TP).
