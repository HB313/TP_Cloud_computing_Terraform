# Module: network (GCP)

Objet:
-  Crée un VPC custom, un subnet principal (public/usable) et des règles firewall de base.

Inputs:
-  project_id (string)
-  environment (string)
-  network_name (string)
-  region (string)
-  cidr_block (string)
-  labels (map(string), optionnel)

Outputs:
-  vpc_id (string)
-  subnet_self_link (string)

Notes:
-  Les labels GCP ne sont pas supportés par toutes les ressources réseau.
-  Les règles firewall avancées seront paramétrables (Étape 6).
