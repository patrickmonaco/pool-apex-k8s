#!/bin/bash

# Configuration
DB_USER="sys"
DB_PASSWORD=${ORACLE_PWD}  # mot de passe SYS
DB_SERVICE="FREEPDB1"      # service de la base de données
APEX_FILE="appmd.sql"   # Nom du fichier SQL à importer
WORKSPACE="DEMO" # Nom du workspace cible

# Vérification de l'existence du fichier SQL
if [ ! -f "$APEX_FILE" ]; then
  echo "Erreur : Le fichier $APEX_FILE n'existe pas !"
  exit 1
fi

# Connexion et import de l'application APEX
echo "Importation de l'application dans le workspace $WORKSPACE..."
sql -S $DB_USER/$DB_PASSWORD@$DB_SERVICE as sysdba <<EOF
BEGIN
    apex_util.set_workspace('$WORKSPACE');
END;
/
@$APEX_FILE
EXIT;
EOF

# Vérification du succès de l'importation
if [ $? -eq 0 ]; then
  echo "Importation réussie !"
else
  echo "Échec de l'importation."
fi