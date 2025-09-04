#!/bin/bash

# Script pour générer le jeu de donjon Bash
# Version améliorée avec nouvelles spécifications

echo "🏰 Génération du donjon d'aventure..."

# Nettoyer d'éventuels restes précédents
rm -rf donjon/ modele_salles/

# Créer la structure de base
mkdir -p donjon/{entree,inventaire}
mkdir -p modele_salles/{salle_gardes,salle_coffres,couloir_sombre,salle_secrete,salle_dragon,salle_tresor}

# === CRÉATION DES MODÈLES (en dehors du dossier donjon) ===

# Modèle Salle des gardes
cat > modele_salles/salle_gardes/README.txt << 'EOF'
Des squelettes gisent au sol. Ils protégeaient sûrement quelque chose...
Tu aperçois quelque chose qui brille parmi les débris !
Un couloir mène vers la Salle des coffres.

💡 Exécute le script pour fouiller la salle et voir ce que tu peux trouver !
EOF

cat > modele_salles/salle_gardes/fouiller.sh << 'EOF'
#!/bin/bash
echo "🛡️ Tu fouilles les restes des anciens gardes..."
echo "⚔️ Tu trouves une épée rouillée mais utilisable !"

# Créer l'épée dans le dossier courant
echo "      /| ________________
O|===|* >________________>
      \|" > epee.txt

echo ""
echo "📦 Une épée.txt est apparue dans cette salle ! 
      /| ________________
O|===|* >________________>
      \|"
echo "💡 Déplace-la dans ton inventaire ! (indice: voir le guide)"
echo ""
echo "Le passage vers la Salle des coffres est ouvert. Reviens en arrière et continue ton aventure !"
mkdir -p ../salle_coffres
cp ../../modele_salles/salle_coffres/* ../salle_coffres/
chmod +x ../salle_coffres/*.sh
EOF

# Modèle Salle des coffres
cat > modele_salles/salle_coffres/README.txt << 'EOF'
Plusieurs coffres vides jonchent le sol... sauf un qui brille étrangement.
Un mécanisme complexe semble protéger ce dernier coffre.
Un couloir sombre continue vers le fond du donjon.

💡 Essaie d'ouvrir le coffre brillant en exécutant le script !
EOF

cat > modele_salles/salle_coffres/coffre.sh << 'EOF'
#!/bin/bash
echo "🔑 Tu t'approches du coffre brillant..."
echo "🔒 Le mécanisme s'active avec un déclic..."
echo "✨ Le coffre s'ouvre dans une lumière dorée !"
echo ""
echo "📜 Un parchemin ancien révèle un secret :"
echo "   'Le mot de passe pour ouvrir la salle du dragon est : DRACO'"
echo ""
echo "💡 Note ce mot de passe ! Crée un fichier 'mot_de_passe.txt' dans ton inventaire !"
echo ""

echo "Le couloir sombre s'est ouvert... Reviens en arrière et continue ton aventure !"
mkdir -p ../couloir_sombre
cp ../../modele_salles/couloir_sombre/* ../couloir_sombre/
chmod +x ../couloir_sombre/*.sh
EOF

# Modèle Couloir sombre
cat > modele_salles/couloir_sombre/README.txt << 'EOF'
Le couloir est sombre et humide. On entend des bruits inquiétants.
Des torches s'allument mystérieusement sur ton passage.
Le couloir semble se diviser plus loin...

💡 Astuce: Avance prudemment dans le couloir en exécutant le script !
EOF

cat > modele_salles/couloir_sombre/avancer.sh << 'EOF'
#!/bin/bash
echo "🚶 Tu avances prudemment dans le couloir..."
echo "🔥 Les torches s'allument une à une sur ton passage..."
sleep 1
echo "🏛️ Tu découvres une bifurcation mystérieuse..."
echo "   Une salle secrète apparaît sur ta droite..."

mkdir -p salle_secrete
cp ../../modele_salles/salle_secrete/* salle_secrete/
chmod +x salle_secrete/*.sh

echo ""
echo "✅ La salle secrète est maintenant accessible dans ce couloir !"
EOF

# Modèle Salle secrète
cat > modele_salles/salle_secrete/README.txt << 'EOF'
Un autel ancien se dresse devant toi.
Une inscription mystérieuse dit : 
"Seul celui qui possède le mot de passe pourra affronter le dragon."

Un mécanisme semble attendre une clé magique...

💡 Astuce: Si tu as trouvé le mot de passe et que tu l'as dans ton inventaire, ouvre la serrure en exécutant le script !
EOF

cat > modele_salles/salle_secrete/serrure.sh << 'EOF'
#!/bin/bash

if [ ! -f ../../inventaire/mot_de_passe.txt ]; then
  echo "❌ Aucun mot de passe trouvé dans ton inventaire !"
  echo "Tu dois d'abord explorer les coffres et noter le mot de passe..."
  echo "📍 Chemin attendu: ../../inventaire/mot_de_passe.txt"
  exit 1
fi

echo "🔍 Tu examines l'autel et saisis le mot de passe..."
mdp=$(cat ../../inventaire/mot_de_passe.txt | tr -d '\n\r' | tr '[:lower:]' '[:upper:]')

if [ "$mdp" = "DRACO" ]; then
  echo "✅ Le mot de passe est correct !"
  echo "🗿 L'autel bouge et révèle un passage secret..."
  echo "🐉 Tu entends un rugissement terrifiant qui résonne..."
  
  # Créer la salle du dragon dans le couloir_sombre
  mkdir -p ../salle_dragon
  cp ../../../modele_salles/salle_dragon/* ../salle_dragon/
  chmod +x ../salle_dragon/*.sh
  
  echo ""
  echo "🏰 La salle du dragon est maintenant accessible dans le couloir ! Reviens en arrière !"
else
  echo "❌ Mauvais mot de passe ! L'autel reste immobile..."
  echo "Mot de passe essayé: '$mdp'"
fi
EOF

# Modèle Salle du dragon
cat > modele_salles/salle_dragon/README.txt << 'EOF'
🐉 LE DRAGON EST LÀ !

⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⣠⣼⠂⠀⠀⠀⠀⠙⣦⢀⠀⠀⠀⠀⠀⢶⣤⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⠷⢦⠀⣹⣶⣿⣦⣿⡘⣇⠀⠀⠀⢰⠾⣿⣿⣿⣟⣻⣿⣿⣿⣷⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⢺⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⢟⣥⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⢻⣿⣿⡏⢹⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣮⣝⢷⣄⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢛⣿⣿⣿⡇⠀⠀⠀⠀⠛⣿⣿⣷⡀⠘⢿⣧⣻⡷⠀⠀⠀⠀⠀⠀⣿⣿⣿⣟⢿⣿⣿⣿⣿⣿⣿⣿⣿⣝⢧⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢠⣾⣿⠟⣡⣾⣿⣿⣧⣿⡿⣋⣴⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⢻⣿⣿⣿⣶⡄⠙⠛⠁⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣷⣝⢻⣿⣟⣿⣿⣷⣮⡙⢿⣽⣆⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⡿⢋⣴⣿⣿⣿⣿⣿⣼⣯⣾⣿⣿⡿⣻⣿⣿⣿⣦⠀⠀⠀⠀⢀⣹⣿⣿⣿⣿⣶⣤⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⠻⣿⣿⣿⣮⣿⣿⣿⣿⣿⣿⣦⡙⢿⣇⠀⠀⠀⠀
⠀⠀⠀⣠⡏⣰⣿⣿⡿⢿⣿⣿⣿⣿⣿⣿⡿⢋⣼⣿⣿⣿⣿⣿⣷⡤⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⢠⣾⣿⣿⣿⣿⣿⣷⡜⢿⣿⣿⣿⣿⣿⣿⡿⠿⣿⣿⣦⡙⣦⠀⠀⠀
⠀⠀⣰⢿⣿⣿⠟⠋⣠⣾⣿⣿⣿⣿⣿⠛⢡⣾⡿⢻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠻⣿⡟⣿⣿⣿⠻⢿⣿⣿⣿⣿⣿⣿⣿⣟⠻⣿⣆⠙⢿⣿⣿⣿⣿⣿⣦⡈⠻⣿⣿⣟⣧⠀⠀
⠀⣰⢣⣿⡿⠃⣠⡾⠟⠁⠀⣸⣿⡟⠁⢀⣿⠋⢠⣿⡏⣿⣿⣿⣿⣿⢿⠁⢀⣠⣴⢿⣷⣿⣿⣿⠀⠀⠽⢻⣿⣿⣿⣿⡼⣿⡇⠈⢿⡆⠀⠻⣿⣧⠀⠈⠙⢿⣆⠈⠻⣿⣎⢧⠀
⠀⢣⣿⠟⢀⡼⠋⠀⠀⢀⣴⠿⠋⠀⠀⣾⡟⠀⢸⣿⠙⣿⠃⠘⢿⡟⠀⣰⢻⠟⠻⣿⣿⣿⣿⣿⣀⠀⠀⠘⣿⠋⠀⣿⡇⣿⡇⠀⠸⣿⡄⠀⠈⠻⣷⣄⠀⠀⠙⢷⡀⠙⣿⣆⠁
⢀⣿⡏⠀⡞⠁⢀⡠⠞⠋⠁⠀⠀⠀⠈⠉⠀⠀⠀⠿⠀⠈⠀⠀⠀⠀⠀⣿⣿⣰⣾⣿⣿⣿⣿⣿⣿⣤⠀⠀⠀⠀⠀⠉⠀⠸⠃⠀⠀⠈⠋⠀⠀⠀⠀⠙⠳⢤⣀⠀⠹⡄⠘⣿⡄
⣸⡟⠀⣰⣿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠿⠿⠿⠟⠁⠀⠹⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣧⠀⢹⣷
⣿⠃⢠⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣄⣤⣀⠀⠀⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⡇⠀⣿
⣿⠀⢸⠅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⡿⠋⠉⢻⣧⢀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⢸
⡇⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣧⡀⠀⠀⣿⣾⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⢸
⢸⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⠿⣿⣿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡾
⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠃
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣧⢀⣾⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡼⣿⣿⣾⣤⣠⡼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀

Un dragon immense bloque le passage vers le trésor final.
Ses yeux brillent d'une lueur maléfique et des flammes 
sortent de ses narines.

Seule une arme pourra le vaincre dans ce combat épique...

⚠️ Assure-toi d'avoir une épée avant de le défier !
EOF

cat > modele_salles/salle_dragon/combattre.sh << 'EOF'
#!/bin/bash

if [ ! -f ../../inventaire/epee.txt ]; then
  echo "🐉 Le dragon rugit et crache du feu !"
  echo "⠤⢁⠄⠀⠀⠀⠀⠈⠙⠛⠷⣦⡄⡀⠀⠀⠀⠀⠀⠀⠤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡤⠀⠀⢀⣴⠟⠁⠀⠀
⣶⢦⣦⣤⣤⣤⣤⣤⣄⣀⣀⣀⣉⠛⠳⣔⣤⡀⠀⠀⠀⣿⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣇⡀⣠⡿⠋⣀⣴⠶⠛
⠠⠀⠀⠀⠀⠀⠈⠀⠀⠀⠉⠈⠉⠉⠉⢛⣻⣿⣷⣶⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢙⣿⣿⣿⡟⣛⠁⠀⠀⠀
⢂⠡⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⡴⠾⠛⠉⣹⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣀⣀⣤⣤⣤⣶⣶⢶⣤⣀⣀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⢯⣍⠙⠛⠛⠛⠛
⠀⠄⠀⠀⠀⠀⢀⣀⣤⡼⠿⠟⠃⠀⠀⠀⣠⡿⢻⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⠿⠿⢿⢻⣿⣿⢿⣿⢿⣼⣿⡀⠀⠀⠀⠀⠀⠀⠀⢿⣿⠀⠘⢿⣄⠀⠀⠀
⠈⢄⣶⣶⣶⠿⠟⠋⠉⠀⠀⠀⠀⠀⠀⣼⠟⠅⢸⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣾⢷⡯⢗⣻⡖⠓⢒⣃⣤⣄⣠⣾⣿⡇⠀⠀⠀⠀⠀⠀⠀⣿⣿⠀⠀⠀⠙⢻⣦⡄
⣼⡿⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⠃⠰⠀⣿⣿⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡺⣻⣯⣿⣙⣾⡟⢸⠺⣿⣿⣿⡟⢉⠏⠉⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡄⠀⠀⠀⠀⠙⢿
⢡⠀⠄⠀⢀⠀⠀⠀⠀⠀⠀⠀⣴⡿⠁⠀⠀⢰⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢼⣇⠎⣸⢣⡟⢃⣏⣓⢷⡹⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⡇⠀⠀⠄⠀⠀⠌
⢢⢉⠄⠃⢄⠀⠂⠀⠀⠀⠀⣼⡟⠁⠀⠀⠀⣾⣿⣽⠨⠀⡀⠀⠀⠀⠀⠀⠀⠀⠠⢿⠀⠁⣇⠊⠠⢞⠋⠉⠉⠑⣽⢿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⡄⠀⠀⡜⢠⡉⠖
⠥⣊⠌⡅⢢⠈⢅⠂⠄⠂⣸⡿⢁⠀⠤⠀⠀⣿⣿⠇⠀⠀⠀⠐⠀⠀⠀⠀⠀⠀⠀⣿⣁⡆⡟⠀⠀⢲⠀⠀⠀⠀⠈⠪⠾⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⡤⣿⣿⠂⡀⡐⣌⠣⡜⣩
⢒⡡⢊⠴⣁⠚⣄⠊⠤⣡⣿⠁⠆⡈⠔⠀⠀⣿⣿⢇⠀⠀⠀⠀⠀⠑⠀⠀⠀⠀⠈⢙⣏⣴⠹⡠⢀⠠⠐⠠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡐⠤⡑⣌⠳⣜⡵
⢢⠘⣌⠲⢌⡓⡌⣍⢲⡿⡡⢎⡐⠬⠀⠐⠀⣿⣯⢧⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠹⣖⡆⠈⠢⡢⠀⠀⠈⠐⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⣾⡿⣿⢀⠧⣑⠮⣝⢮⣳
⢀⢉⡀⢷⡈⢶⢱⣈⣿⢇⡱⢆⡸⠆⠀⠁⠀⣿⣏⢿⠀⠀⠀⠀⠀⠀⠆⠀⠀⠀⠀⠀⠀⠈⢿⣇⠁⣀⠆⠆⠀⠀⠀⠰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣾⣿⡇⡎⢶⣉⡾⣹⡾⢷
⢈⠢⡘⢆⡙⣆⢧⣿⣏⠞⣔⠣⡜⢡⠂⡁⠀⢿⣿⣟⡀⠄⠂⠀⠀⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⣬⠦⠀⢄⠀⠀⠀⠀⠢⠀⠀⠀⠀⠀⠀⠀⢰⣟⣾⡿⢱⡘⢦⡻⣼⣳⢟⡿
⠀⢢⠑⡎⣵⢪⣿⣟⣬⢻⣌⠷⣌⢣⡘⠀⠀⢸⣿⣿⡷⣈⠁⠈⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⣮⠠⡵⠀⠀⠀⠀⢁⠀⠀⠀⠀⢀⠴⢋⣿⢻⢃⠧⣜⢧⣟⣳⢯⣿⠙
⠀⢢⡙⡜⣶⣻⣟⡾⣼⢳⣎⢷⣊⢦⡙⠤⠀⣼⣿⣿⣿⣦⡑⠀⠄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣷⣷⡀⠀⠀⠀⠘⠀⠀⢀⠴⡁⣰⠞⣿⣿⢘⢮⡝⣾⡽⣫⠟⠁⠀
⠀⢥⢪⢵⣣⣿⣻⢾⣽⣳⣻⢮⣝⡮⡵⣉⢦⣿⡿⠀⠈⠙⠻⢷⣦⣀⡅⢠⠐⠠⠄⣀⠀⣠⠄⠢⠂⠝⠋⢻⣿⡒⠠⠄⣀⠀⢐⠆⠂⠐⣴⠟⠉⠀⣿⣏⢞⣮⣽⣳⡟⠁⠀⠀⠀
⠣⣎⢮⣳⣿⣻⣽⣻⣞⡷⣯⣟⡾⣵⡳⣕⣾⣿⠃⡄⠀⠀⠀⠀⠈⠉⠛⠿⢶⣥⣴⣠⡞⠀⠂⠀⣥⠈⡁⡢⠗⣀⠠⠀⡀⠀⢸⢘⡼⠟⠁⠀⢠⠌⣿⣏⡾⣮⢷⡛⠁⠀⠀⠀⠀
⠀⠻⣮⢷⣿⣳⢯⡷⣯⣟⡷⣯⣟⣷⣻⢞⣿⢧⣋⠴⡩⢔⢢⡐⡀⠄⡀⢀⠀⣤⣾⢻⠄⠒⡉⠐⡬⠐⠈⠊⡀⠀⠡⠁⠒⠐⠻⣨⠇⣠⢂⡍⢦⡙⣿⣯⢷⣯⡟⠀⠀⠀⠀⠀⠀
⠀⠀⢫⣿⢷⣯⠿⠙⠓⠯⣟⣷⣻⢾⣽⣻⣟⣳⣎⢷⣙⣎⢦⡱⣍⣶⡷⣞⢿⣛⣬⡻⡌⠡⡀⣷⠇⠁⢀⠀⠈⠂⢁⣐⡀⡼⢨⢈⡗⣦⢳⡜⣧⣻⣽⣯⣟⡞⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢺⣿⠋⠀⠀⠀⠀⠀⠘⣷⣯⣿⣾⣿⣽⢳⡞⣯⣾⣼⢣⣷⣾⣯⣷⠛⡏⢹⡌⡆⢱⣤⡞⡍⠈⡄⠀⠑⡄⠈⡄⠀⠀⠀⢸⡌⢹⡞⣧⡟⣷⢻⣾⢳⣯⠃⠀⠀⠀⠀⠀⠀⠀
⠀⢀⡿⠉⠀⠀⠀⠀⠀⠀⠀⣿⣞⡷⣿⣯⣟⣯⢿⡽⣞⣧⣿⡿⣫⣿⢶⣎⣳⡼⣷⢿⠛⢡⠀⠱⡀⢈⠢⡀⢈⠠⠐⠀⠀⠈⣟⠁⣼⡿⣽⣻⣽⣻⢾⣟⡏⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠸⠁⠀⠀⠀⠀⠀⠀⠀⠀⢸⣯⢿⣟⣾⡽⣞⣯⢿⡽⣞⣯⣿⣟⣯⣿⡿⠿⡽⢃⠁⢃⠀⠳⠀⡑⢄⠀⠉⠐⠠⠤⠄⠐⣸⢧⣾⢿⣽⣳⣟⡾⣽⣻⣟⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⠂⠀⠀⠀⠀⢸⣯⣿⣟⡾⣽⣻⣞⣯⢿⡽⣿⣻⡿⣾⣿⣵⢐⢳⡘⡄⠘⡂⠄⡑⢄⠠⠑⠪⠄⢀⠀⢀⣾⣽⣻⣞⡿⣞⡷⣯⣟⣷⣻⡝⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠈⠀⠀⠀⠈⠀⠀⣼⣻⣷⢯⡿⣽⣳⣟⡾⣯⣟⡷⣯⢿⡿⡟⣿⠘⡴⡅⠘⢄⠐⠠⢀⡂⢈⠐⢠⣐⣤⣾⣟⡽⣞⡷⣯⢿⣽⣻⢷⣻⢾⣽⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀"
  echo "💀 Tu n'as pas d'épée pour te défendre... Tu dois fuir !"
  echo "Retourne chercher une arme dans les salles précédentes !"
  echo "📍 Épée attendue: ../../inventaire/epee.txt"
  exit 1
fi

echo "⚔️ Tu brandis ton épée face au terrible dragon !"
echo "🐉 Le dragon attaque... Le combat commence !"
echo "⠤⢁⠄⠀⠀⠀⠀⠈⠙⠛⠷⣦⡄⡀⠀⠀⠀⠀⠀⠀⠤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡤⠀⠀⢀⣴⠟⠁⠀⠀
⣶⢦⣦⣤⣤⣤⣤⣤⣄⣀⣀⣀⣉⠛⠳⣔⣤⡀⠀⠀⠀⣿⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣇⡀⣠⡿⠋⣀⣴⠶⠛
⠠⠀⠀⠀⠀⠀⠈⠀⠀⠀⠉⠈⠉⠉⠉⢛⣻⣿⣷⣶⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢙⣿⣿⣿⡟⣛⠁⠀⠀⠀
⢂⠡⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⡴⠾⠛⠉⣹⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣀⣀⣤⣤⣤⣶⣶⢶⣤⣀⣀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⢯⣍⠙⠛⠛⠛⠛
⠀⠄⠀⠀⠀⠀⢀⣀⣤⡼⠿⠟⠃⠀⠀⠀⣠⡿⢻⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⠿⠿⢿⢻⣿⣿⢿⣿⢿⣼⣿⡀⠀⠀⠀⠀⠀⠀⠀⢿⣿⠀⠘⢿⣄⠀⠀⠀
⠈⢄⣶⣶⣶⠿⠟⠋⠉⠀⠀⠀⠀⠀⠀⣼⠟⠅⢸⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣾⢷⡯⢗⣻⡖⠓⢒⣃⣤⣄⣠⣾⣿⡇⠀⠀⠀⠀⠀⠀⠀⣿⣿⠀⠀⠀⠙⢻⣦⡄
⣼⡿⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⠃⠰⠀⣿⣿⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡺⣻⣯⣿⣙⣾⡟⢸⠺⣿⣿⣿⡟⢉⠏⠉⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡄⠀⠀⠀⠀⠙⢿
⢡⠀⠄⠀⢀⠀⠀⠀⠀⠀⠀⠀⣴⡿⠁⠀⠀⢰⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢼⣇⠎⣸⢣⡟⢃⣏⣓⢷⡹⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⡇⠀⠀⠄⠀⠀⠌
⢢⢉⠄⠃⢄⠀⠂⠀⠀⠀⠀⣼⡟⠁⠀⠀⠀⣾⣿⣽⠨⠀⡀⠀⠀⠀⠀⠀⠀⠀⠠⢿⠀⠁⣇⠊⠠⢞⠋⠉⠉⠑⣽⢿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⡄⠀⠀⡜⢠⡉⠖
⠥⣊⠌⡅⢢⠈⢅⠂⠄⠂⣸⡿⢁⠀⠤⠀⠀⣿⣿⠇⠀⠀⠀⠐⠀⠀⠀⠀⠀⠀⠀⣿⣁⡆⡟⠀⠀⢲⠀⠀⠀⠀⠈⠪⠾⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⡤⣿⣿⠂⡀⡐⣌⠣⡜⣩
⢒⡡⢊⠴⣁⠚⣄⠊⠤⣡⣿⠁⠆⡈⠔⠀⠀⣿⣿⢇⠀⠀⠀⠀⠀⠑⠀⠀⠀⠀⠈⢙⣏⣴⠹⡠⢀⠠⠐⠠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡐⠤⡑⣌⠳⣜⡵
⢢⠘⣌⠲⢌⡓⡌⣍⢲⡿⡡⢎⡐⠬⠀⠐⠀⣿⣯⢧⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠹⣖⡆⠈⠢⡢⠀⠀⠈⠐⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⣾⡿⣿⢀⠧⣑⠮⣝⢮⣳
⢀⢉⡀⢷⡈⢶⢱⣈⣿⢇⡱⢆⡸⠆⠀⠁⠀⣿⣏⢿⠀⠀⠀⠀⠀⠀⠆⠀⠀⠀⠀⠀⠀⠈⢿⣇⠁⣀⠆⠆⠀⠀⠀⠰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣾⣿⡇⡎⢶⣉⡾⣹⡾⢷
⢈⠢⡘⢆⡙⣆⢧⣿⣏⠞⣔⠣⡜⢡⠂⡁⠀⢿⣿⣟⡀⠄⠂⠀⠀⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⣬⠦⠀⢄⠀⠀⠀⠀⠢⠀⠀⠀⠀⠀⠀⠀⢰⣟⣾⡿⢱⡘⢦⡻⣼⣳⢟⡿
⠀⢢⠑⡎⣵⢪⣿⣟⣬⢻⣌⠷⣌⢣⡘⠀⠀⢸⣿⣿⡷⣈⠁⠈⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⣮⠠⡵⠀⠀⠀⠀⢁⠀⠀⠀⠀⢀⠴⢋⣿⢻⢃⠧⣜⢧⣟⣳⢯⣿⠙
⠀⢢⡙⡜⣶⣻⣟⡾⣼⢳⣎⢷⣊⢦⡙⠤⠀⣼⣿⣿⣿⣦⡑⠀⠄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣷⣷⡀⠀⠀⠀⠘⠀⠀⢀⠴⡁⣰⠞⣿⣿⢘⢮⡝⣾⡽⣫⠟⠁⠀
⠀⢥⢪⢵⣣⣿⣻⢾⣽⣳⣻⢮⣝⡮⡵⣉⢦⣿⡿⠀⠈⠙⠻⢷⣦⣀⡅⢠⠐⠠⠄⣀⠀⣠⠄⠢⠂⠝⠋⢻⣿⡒⠠⠄⣀⠀⢐⠆⠂⠐⣴⠟⠉⠀⣿⣏⢞⣮⣽⣳⡟⠁⠀⠀⠀
⠣⣎⢮⣳⣿⣻⣽⣻⣞⡷⣯⣟⡾⣵⡳⣕⣾⣿⠃⡄⠀⠀⠀⠀⠈⠉⠛⠿⢶⣥⣴⣠⡞⠀⠂⠀⣥⠈⡁⡢⠗⣀⠠⠀⡀⠀⢸⢘⡼⠟⠁⠀⢠⠌⣿⣏⡾⣮⢷⡛⠁⠀⠀⠀⠀
⠀⠻⣮⢷⣿⣳⢯⡷⣯⣟⡷⣯⣟⣷⣻⢞⣿⢧⣋⠴⡩⢔⢢⡐⡀⠄⡀⢀⠀⣤⣾⢻⠄⠒⡉⠐⡬⠐⠈⠊⡀⠀⠡⠁⠒⠐⠻⣨⠇⣠⢂⡍⢦⡙⣿⣯⢷⣯⡟⠀⠀⠀⠀⠀⠀
⠀⠀⢫⣿⢷⣯⠿⠙⠓⠯⣟⣷⣻⢾⣽⣻⣟⣳⣎⢷⣙⣎⢦⡱⣍⣶⡷⣞⢿⣛⣬⡻⡌⠡⡀⣷⠇⠁⢀⠀⠈⠂⢁⣐⡀⡼⢨⢈⡗⣦⢳⡜⣧⣻⣽⣯⣟⡞⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢺⣿⠋⠀⠀⠀⠀⠀⠘⣷⣯⣿⣾⣿⣽⢳⡞⣯⣾⣼⢣⣷⣾⣯⣷⠛⡏⢹⡌⡆⢱⣤⡞⡍⠈⡄⠀⠑⡄⠈⡄⠀⠀⠀⢸⡌⢹⡞⣧⡟⣷⢻⣾⢳⣯⠃⠀⠀⠀⠀⠀⠀⠀
⠀⢀⡿⠉⠀⠀⠀⠀⠀⠀⠀⣿⣞⡷⣿⣯⣟⣯⢿⡽⣞⣧⣿⡿⣫⣿⢶⣎⣳⡼⣷⢿⠛⢡⠀⠱⡀⢈⠢⡀⢈⠠⠐⠀⠀⠈⣟⠁⣼⡿⣽⣻⣽⣻⢾⣟⡏⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠸⠁⠀⠀⠀⠀⠀⠀⠀⠀⢸⣯⢿⣟⣾⡽⣞⣯⢿⡽⣞⣯⣿⣟⣯⣿⡿⠿⡽⢃⠁⢃⠀⠳⠀⡑⢄⠀⠉⠐⠠⠤⠄⠐⣸⢧⣾⢿⣽⣳⣟⡾⣽⣻⣟⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⠂⠀⠀⠀⠀⢸⣯⣿⣟⡾⣽⣻⣞⣯⢿⡽⣿⣻⡿⣾⣿⣵⢐⢳⡘⡄⠘⡂⠄⡑⢄⠠⠑⠪⠄⢀⠀⢀⣾⣽⣻⣞⡿⣞⡷⣯⣟⣷⣻⡝⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠈⠀⠀⠀⠈⠀⠀⣼⣻⣷⢯⡿⣽⣳⣟⡾⣯⣟⡷⣯⢿⡿⡟⣿⠘⡴⡅⠘⢄⠐⠠⢀⡂⢈⠐⢠⣐⣤⣾⣟⡽⣞⡷⣯⢿⣽⣻⢷⣻⢾⣽⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀"
sleep 2

echo "💥 Tu esquives ses flammes mortelles..."
sleep 2
echo "⚔️ Tu portes un coup d'épée bien placé..."
sleep 2
echo "🩸 Le dragon rugit de douleur et de rage..."
sleep 2
echo "💥 Après un duel épique, tu l'abats d'un coup final !"
sleep 2

echo ""
echo "🎆 Le dragon s'effondre dans un dernier souffle..."
echo "✨ La magie noire se dissipe et un passage secret s'ouvre..."
echo "💰 Tu aperçois des reflets dorés dans la salle suivante..."

mkdir -p salle_tresor
cp ../../../modele_salles/salle_tresor/* salle_tresor/
chmod +x salle_tresor/*.sh

echo ""
echo "🏆 La salle du trésor est maintenant accessible !"
EOF

# Modèle Salle du trésor
cat > modele_salles/salle_tresor/tresor.sh << 'EOF'
#!/bin/bash

echo "🏆================================🏆"
echo "      FÉLICITATIONS AVENTURIER !"
echo "🏆================================🏆"
echo ""
echo "💰 Tu as trouvé le trésor légendaire du donjon !"
echo "💎 Des gemmes étincelantes de toutes les couleurs..."
echo "🪙 Des pièces d'or anciennes par milliers..."
echo "📜 Des grimoires mystiques aux pouvoirs oubliés..."
echo ""

echo "██╗   ██╗██╗ ██████╗████████╗ ██████╗ ██╗██████╗ ███████╗"
echo "██║   ██║██║██╔════╝╚══██╔══╝██╔═══██╗██║██╔══██╗██╔════╝"
echo "██║   ██║██║██║        ██║   ██║   ██║██║██████╔╝█████╗  "
echo "╚██╗ ██╔╝██║██║        ██║   ██║   ██║██║██╔══██╗██╔══╝  "
echo " ╚████╔╝ ██║╚██████╗   ██║   ╚██████╔╝██║██║  ██║███████╗"
echo "  ╚═══╝  ╚═╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝╚═╝  ╚═╝╚══════╝"


echo ""
echo "🌟 Tu es désormais une légende vivante !"
echo "📖 Ton nom sera gravé dans les annales des héros..."

# Créer un certificat de victoire
cat > ../../../inventaire/certificat_victoire.txt << 'CERT'
🏆 CERTIFICAT DE VICTOIRE 🏆

Cet aventurier courageux a:
✅ Exploré toutes les salles du donjon
✅ Trouvé l'épée des gardes déchus
✅ Découvert le mot de passe secret
✅ Vaincu le terrible dragon
✅ Récupéré le trésor légendaire

Date de l'exploit: $(date)
CERT

echo "📜 Un certificat de victoire a été ajouté dans ton inventaire !"
EOF

# === CRÉATION DE L'ENTRÉE ===

cat > donjon/entree/README.txt << 'EOF'
🏰 BIENVENUE DANS LE DONJON ANCIEN 🏰

Tu es à l'entrée d'un donjon mystérieux et dangereux...
Des légendes parlent d'un trésor gardé par un dragon redoutable.

👀 Observe autour de toi:
- Des torches éteintes bordent les murs de pierre
- Un passage sombre mène vers l'intérieur du donjon
- L'air est chargé de magie ancienne et mystérieuse

🚪 Un couloir mène à la Salle des gardes...
Exécute le script ./entrer.sh pour commencer ton aventure !
EOF

cat > donjon/entree/entrer.sh << 'EOF'
#!/bin/bash

echo "🏰 Bienvenue, brave aventurier !"
echo "🗡️ Tu pénètres courageusement dans le donjon ancien..."
echo ""
echo "⚠️ Des squelettes de gardes apparaissent au loin..."
echo "🚪 La salle des gardes s'ouvre devant toi..."

mkdir -p ../salle_gardes
cp ../../modele_salles/salle_gardes/* ../salle_gardes/
chmod +x ../salle_gardes/*.sh

echo ""
echo "✅ Tu peux maintenant explorer la salle des gardes ! Reviens en arrière et débute l'aventure !"
EOF

# === GUIDE SIMPLIFIÉ ===

cat > donjon/GUIDE.txt << 'EOF'
🎮 GUIDE DU DONJON

COMMENT COMMENCER:
📂 cd entree/
📖 cat README.txt

COMMANDES UTILES:
📖 cat README.txt    - Lire la description de la salle
📂 ls -la           - Voir le contenu de la salle
🚀 ./script.sh      - Exécuter l'action de la salle
📦 mv fichier dest/ - Déplacer un objet

DOSSIER INVENTAIRE:
Le dossier inventaire/ contient tes objets trouvés.
Tu dois y déplacer les objets que tu trouves pour les utiliser.

Exemple: mv objet.txt inventaire/

Bon voyage, aventurier ! 🏰
EOF

# # === ARBORESCENCE FINALE ===
# cat > ARBORESCENCE.txt << 'EOF'
# Structure finale attendue après toute l'aventure:

# donjon/
# ├── entree/
# │   ├── entrer.sh
# │   └── README.txt
# ├── inventaire/
# │   ├── epee.txt          (déplacé par le joueur)
# │   └── mot_de_passe.txt  (créé par le joueur)
# ├── salle_gardes/
# │   ├── README.txt
# │   ├── fouiller.sh
# │   └── epee.txt          (généré, à déplacer)
# ├── salle_coffres/
# │   ├── README.txt
# │   └── coffre.sh
# ├── couloir_sombre/
# │   ├── README.txt
# │   ├── avancer.sh
# │   ├── salle_secrete/
# │   │   ├── README.txt
# │   │   └── indice.sh
# │   └── salle_dragon/
# │       ├── README.txt
# │       ├── combattre.sh
# │       └── salle_tresor/
# │           └── tresor.sh
# ├── GUIDE.txt
# └── certificat_victoire.txt  (créé à la fin)

# modele_salles/  (en dehors de donjon/)
# ├── salle_gardes/
# ├── salle_coffres/
# ├── couloir_sombre/
# ├── salle_secrete/
# ├── salle_dragon/
# └── salle_tresor/
# EOF

# === FINALISATION ===

# Rendre les scripts exécutables
find donjon/ modele_salles/ -name "*.sh" -exec chmod +x {} \;

echo ""
echo "🎉 Donjon généré avec succès !"
echo ""
echo "📖 Pour voir le guide:"
echo "   cat donjon/GUIDE.txt"
echo ""
echo "🏰 Bonne aventure !"