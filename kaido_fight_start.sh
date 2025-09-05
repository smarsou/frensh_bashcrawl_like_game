#!/bin/bash

# Script pour générer le jeu One Piece Bash
# Aventure de Luffy à la recherche du One Piece

echo "🏴‍☠️ Génération de l'aventure One Piece..."

# Nettoyer d'éventuels restes précédents
rm -rf grand_line/ ../modele_iles/ inventaire/

# Créer la structure de base
mkdir grand_line
mkdir inventaire
mkdir -p ../modele_iles/{zou,onigashima,kaido}

# === CRÉATION DES MODÈLES (en dehors de grand_line) ===

# Modèle île de Zou - Village
mkdir -p ../modele_iles/zou/{village,foret}
mkdir -p ../modele_iles/zou/village/taverne

cat > ../modele_iles/zou/village/README.txt << 'EOF'
🏝️ Bienvenue sur l'île de Zou ! 🐘

Tu es arrivé dans le village des Minks. Les habitants semblent amicaux
mais affamés après une longue bataille.

👥 Des villageois te regardent avec espoir...
🍖 Tu sens une odeur délicieuse venant de la taverne !
🌳 Une forêt mystérieuse s'étend plus loin...

💡 Explore la taverne pour te réapprovisionner !
EOF

cat > ../modele_iles/zou/village/README.txt << 'EOF'
🏴‍☠️ Luffy explore le village de Zou...
🐘 Les Minks t'accueillent chaleureusement !

🍖 Une délicieuse odeur vient de la taverne...
EOF

# Modèle Taverne
cat > ../modele_iles/zou/village/taverne/README.txt << 'EOF'
🍖 LA TAVERNE DES MINKS 🍺

La taverne est remplie de Minks qui festoient !

🥩 Un délicieux festin est préparé !
🍖 Luffy s'approche de la table...
😋 'Waah ! Ça a l'air délicieux !' dit Luffy
🥩 Tu trouves un sac de provisions !

🐘 Les Minks te sourient: 'Prends tout ce dont tu as besoin, pirate !'

📦 Un fichier nourriture.txt contient tes provisions !
💡 Déplace-le dans ton inventaire avec la commande mv.
(Astuce: dans la commande mv expliqué dans le GUIDE, ici la destination est '../../../../inventaire/')
💡 Ensuite, explore la forêt pour rencontrer un allié important !
EOF

# Créer les provisions
cat > ../modele_iles/zou/village/taverne/nourriture.txt << 'EOF'
🍖 Provisions de Zou 🍖
- Viande grillée des Minks
- Fruits tropicaux
- Eau fraîche
- Biscuits de mer
EOF

# Modèle Forêt
cat > ../modele_iles/zou/foret/README.txt << 'EOF'
🌳 FORÊT DE ZOU 🌿

La forêt est dense et mystérieuse. Tu entends des bruits étranges...
Au loin, tu aperçois une silhouette familière !

🦊 Un Mink semble t'attendre près d'un arbre ancien...
✨ Il a l'air de connaître des secrets importants...

💡 Parle-lui en exécutant le script pour obtenir des informations : ./parler.sh
EOF

cat > ../modele_iles/zou/foret/parler.sh << 'EOF'
#!/bin/bash

echo "🦊 Tu t'approches du Mink mystérieux..."
echo ""

# Vérifier si Luffy a pris les provisions
if [ ! -f ../../../inventaire/nourriture.txt ]; then
  echo "🦊 Mink: 'Chapeau de paille ! Tu sembles affamé et mal préparé...'"
  echo "😤 'Je ne peux pas t'aider dans cet état !'"
  echo "🍖 'Va d'abord te réapprovisionner à la taverne !'"
  echo ""
  echo "❌ Tu dois d'abord prendre les provisions à la taverne !"
  echo "📍 Indice : va à la taverne qui se trouve dans le village et suis les instructions."
  exit 1
fi

echo "🦊 Mink: 'Ah ! Chapeau de paille ! Tu es bien préparé !'"
echo "😊 'Je vois que tu as pris des provisions... Parfait !'"
echo ""
echo "🗺️ 'Tu cherches l'île du démon Kaido, c'est bien ça ?'"
echo "🏯 'On l'appelle Onigashima !'"
echo "💪 'Si tu veux devenir le Roi des Pirates, tu dois l'affronter !'"
echo ""
echo "⚡ 'Je vais t'aider à la trouver...'"

# Générer l'île d'Onigashima
mkdir -p ../../onigashima
cp -r ../../../../modele_iles/onigashima ../../
chmod +x ../../onigashima/kaido/*.sh

echo ""
echo "🏴‍☠️ L'île d'Onigashima est maintenant accessible !"
echo "💡 Pour y aller, reviens dans Grand Line."
EOF

# === MODÈLE ONIGASHIMA ===

cat > ../modele_iles/onigashima/README.txt << 'EOF'
🏯 ÎLE D'ONIGASHIMA - TERRITOIRE DE KAIDO 🐉

Tu es arrivé sur l'île la plus dangereuse du Nouveau Monde !
L'aura de Kaido, l'Empereur, plane sur cette île maudite...

⚡ L'air crépite d'une énergie terrifiante...
🏯 Un château imposant se dresse au sommet...
🌊 Les vagues elles-mêmes semblent avoir peur...

🗺️ Kaido n'est plus très loin !
EOF

# === MODÈLE KAIDO ===
mkdir -p ../modele_iles/onigashima/kaido

cat > ../modele_iles/onigashima/kaido/README.txt << 'EOF'
🐉 SALLE DU TRÔNE DE KAIDO 👑

Tu es face au plus puissant des Empereurs !
Kaido, la "Créature la Plus Forte au Monde" !

                   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⡤⠆⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠒⢦⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⢯⠊⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠡⡳⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⢁⠃⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢡⠸⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠴⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⢸⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠈⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣧⠀⠀⢀⣠⡆⣠⠞⠁⠀⠀⠀⠀⣰⣷⠄⠀⠀⣾⡇⠀⠀⠀⢀⣄⠀⠀⠀⠀⠀⠀⠘⡇⠈⡆⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⡄⠀⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣼⣿⣧⡿⠟⠛⢀⣿⡄⠀⠀⠀⠀⣠⣿⡟⣀⢀⣼⡿⠃⠀⣤⢀⣼⡿⠃⠀⠀⠀⠀⠀⠀⡇⠀⢸⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⡸⠀⢰⠇⠀⠀⠀⠀⠀⠀⠀⠀⣀⣾⣿⢿⡟⠀⠀⠀⠀⢿⣷⣄⣀⣠⣼⣿⠏⣠⣿⣿⠏⠀⢀⣼⣯⡾⠋⠀⠀⠀⠀⢀⣿⣿⠁⠹⡀⠀⢣⠀⠀⠀⠀⠀⢀
⠀⠀⠀⠀⠀⠀⠀⡰⠁⠀⡜⠀⡀⠀⠀⣀⣠⣴⣶⣿⠿⣫⣤⡘⣿⣄⠀⠀⠀⢈⣽⣿⣿⣿⣿⣷⣾⣿⣿⣿⣶⣾⣿⣿⣿⡷⣀⣀⠀⠀⢠⣾⣿⠇⠀⢰⣧⠀⠀⠢⡀⠀⠀⣠⣾
⠀⠀⠀⠀⠀⠀⡰⠁⠀⡾⣠⣾⣿⣤⣿⣿⣿⣿⣿⢡⣾⡏⢁⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣛⣻⣷⣤⣿⡿⠋⠀⣠⣿⣯⣗⠀⠀⢹⣿⣿⣿⣯
⠀⠀⠀⠀⠀⡼⠁⠀⢸⣷⣿⠟⢱⣿⣿⣿⣿⣿⣿⣬⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⣿⣿⡿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⠀⠀⠀⣿⣏⠉⠛
⠀⠀⠀⠀⣰⠇⠀⠀⢻⣿⣿⣆⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢋⢫⣼⣿⣿⣿⣯⣿⣿⠟⠛⢿⢛⣿⣿⣿⣿⣿⢠⠈⠛⠛⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠧⠀⠀⠀⣿⣿⣷⡀
⠀⠀⠀⢠⣿⡁⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠉⠀⠈⣀⣾⣿⣿⣿⣿⣟⠙⢌⠺⣸⠱⠏⢘⣿⣿⣿⣿⣾⣆⠀⠀⠀⠀⠈⠉⠋⠙⠛⠛⠋⠟⠉⠁⠀⠀⠀⡀⣿⣿⣿⣿
⠀⢀⡄⢸⣿⡧⠀⠀⠀⠉⠙⠈⠛⠛⠋⠀⠀⠀⠀⠀⣀⣴⣿⣿⣿⣿⣿⣿⣿⡿⣷⣦⣴⣡⣤⣷⡟⣿⣿⣿⣿⣿⣿⣿⣤⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣰⣾⣿⣿⣿⣿
⠀⣿⣧⣈⣻⣷⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⡿⣷⠞⣛⣍⣦⣧⡙⡯⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣤⣄⣤⣠⣀⣄⢠⣤⣤⣿⣿⣿⣿⣿⣿⣿
⡀⢈⣻⣿⣿⣿⣿⣿⣶⣦⣴⣤⣴⣦⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡭⠈⣸⣷⢞⡿⣿⡛⠿⣻⣦⡣⠚⣻⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢾⣿⣷⣄⣾⣻⣧⣥⣾⣶⣪⣽⣿⣿⣿⡟⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡗⢚⡶⠍⣡⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⠛⢻⣮⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣿⣿⣿⣿⣄⢠⣼⢟⣞⣾⣿⣻⡿⣿⣿⠿⣿⣷⣯⢑⣦⢿⢷⣄⢹⣭⡭⣛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡯⢭⣿⣿⢹⣿⡏⢹⣿⣿⡏⢻⣿⡟⢡⠏⠁⠤⡵⢞⢫⠃⣻⠀⣼⣮⠃⢩⡏⠛⣆⠻⣧⣰⡭⡲⠘⣿⡇⢹⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠉⢸⣿⣏⣼⣿⣀⡼⣿⣿⣿⡿⢿⣿⠃⠀⠤⢰⢯⠛⠚⠋⣡⢶⣿⠂⢠⡝⢀⡀⢜⡄⣻⣿⡁⢀⣠⣿⣵⣾⣿⡟⣿⣿⡾⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⡿⢻⣿⣿⢿⣉⣻⣿⣷⣄⣻⣿⣿⠿⣯⣷⣼⣿⣿⣷⣞⠿⢯⠭⣿⣷⣾⣧⢄⣚⣕⣱⢁⢔⣠⣿⣏⣶⠟⠋⢀⣹⣿⣷⣿⣿⣟⢿⣿⣿⣿⣿⣷⣽⣿⣿⣿⣿⣧⣿⣿⠿
⣿⣿⣿⡟⡝⣯⢱⣯⡝⢲⡟⣭⠙⢢⢻⣿⣷⢰⣿⡟⣵⣿⣿⣿⣿⢹⢳⣿⣿⣿⣿⣿⢻⣯⣿⡗⣥⡟⢻⠀⠀⣤⣾⡏⣯⣿⣿⡟⡟⢫⣿⢹⣿⣿⣯⣿⣿⣿⣷⣿⣿⣿⣮⣿⣾
⣯⣿⣿⣟⡽⢏⡲⡛⠝⡋⠥⠞⠀⠈⠀⢻⣿⣿⣿⣷⠋⠈⠻⡿⣿⣿⣄⠀⠈⠀⠉⠭⡗⣺⣽⠞⠋⡰⢋⣁⣶⣿⣿⡇⣿⣿⣿⣿⣿⡘⣿⣿⣿⣿⣧⠻⢿⢿⡿⣿⢿⣿⣿⣷⣿
⢟⠟⠝⠈⢸⡶⠊⠂⠁⣠⣒⣐⠶⠒⠶⢴⣿⡿⣷⣃⣠⠤⡀⠘⡼⢿⣿⣧⠀⠀⠀⠈⣠⡿⠤⠚⠗⠁⢠⣄⢙⡻⠿⠷⡹⢿⣿⣿⣿⣷⡮⣟⣿⣟⣯⢽⣶⣶⣾⣿⣎⠻⣿⣿⣿
⠁⣔⣶⣴⣿⣔⣲⢶⣿⠽⠐⠉⠀⠀⠀⢸⣿⣿⠟⠁⠀⠘⠂⠑⣜⠺⣿⡿⠃⡠⡖⢴⡟⡀⠁⠀⠀⠀⣾⡇⣿⣿⣿⣿⣷⣿⣿⣭⣭⣥⢰⣿⣿⣿⣿⣭⢿⣿⣿⣿⣿⣿⣏⣿⣿
⢸⣞⣿⣫⡵⠝⠉⠳⠂⠀⠀⠀⠀⠀⠀⠈⢿⣿⡟⠲⠀⠀⠀⠀⠀⠰⠋⠀⠀⠈⠙⢻⠗⠃⠀⠀⠀⠀⢻⣧⡻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣌⣻⢿⣿⠿⢟⣩⢹⣿⣿⣿⣿⣿⣾⣿
⣼⣣⡿⡈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠀⠀⠀⠀⠀⠀⠀⠀⣴⣶⣿⣿⣿⣟⢉⣛⣿⣿⣋⣥⢻⣶⣿⣿⡿⠎⠛⠋⢉⣵⣿⠟⣻
⣿⣯⠚⣇⠔⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣟⡒⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⡿⠷⠉⢉⣤⣖⡀⠀⣴⣿⣿⡿⡝⡭
⠸⣿⣷⠟⣎⠁⣶⣶⡦⡀⠀⠀⠀⠀⠀⠀⠀⢨⣿⣿⡇⠀⠀⠀⠀⢀⣠⣠⣴⣾⢯⡽⣿⣶⣿⣶⣤⣤⣤⣾⣿⣿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⣋⣵⣽⣿⣿⣿⡏⠩⠇
⢂⣟⣿⢿⡸⣷⣾⢿⣥⣄⣀⣀⣀⢀⣀⢀⣰⣿⣿⣿⠃⢠⣴⣶⠿⠟⠛⠉⣩⣄⣼⠖⠁⠁⠀⠀⠀⠉⣿⣿⣿⣿⣀⡴⣶⣂⣴⣤⡤⢤⣄⣶⣴⣶⠷⣿⣯⢗⣚⠿⠿⣿⡇⠀⠅

⚡ "Alors... c'est toi le Chapeau de Paille ?"
🐉 "WAHAHAHA ! Tu veux devenir le Roi des Pirates ?"
💪 "Montre-moi ta force !"

🥊 Il est temps du combat final !

💡 Exécute le script ./combat.sh pour affronter Kaido !
EOF

# Créer le script attaque_kaido
cat > ../modele_iles/onigashima/kaido/.attaque_kaido.sh << 'EOF'
#!/bin/bash

gear=$2

case $gear in
  1|2|3|4)
    echo ""
    echo "💪 Luffy active le Gear $gear !"
    echo "👊 'Gomu Gomu no...'"
    echo ""
    echo "🐉 Kaido: 'WAHAHAHA ! C'est tout ce que tu as ?!'"
    echo "💥 BOOM ! Kaido te repousse facilement !"
    echo "😵 Luffy s'écrase contre un mur..."
    echo ""
    echo "❌ Le Gear $gear n'est pas assez puissant !"
    echo "😵 'Je dois devenir plus fort...' pense Luffy"
    echo ""
    echo "💡 Essaie de modifier le script combat.sh et utilise le Gear le plus puissant ! (indice: gear entre 1 et 5)"
    echo "💡 Astuce : Utilise la commande nano pour modifier le script."
    echo "💡 Astuce : Avec la commande nano, pour sauvegarder il faut suivre les étapes indiquées : CTRL+X, puis taper la touche Y, puis Entrée."
    ;;
  5)
    echo ""
    echo "⚡ Luffy ferme les yeux et se concentre..."
    sleep 3
    echo "💫 Son cœur bat comme un tambour de libération..."
    echo ""
    sleep 3
    echo "🎵 Dum-da-da-dum ! "
    echo ""
    echo "🎵 Dum-da-da-dum ! Dum-da-da-dum !"
    echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⠀⠀⠀⢠⣾⣧⣤⡖⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⠋⠀⠉⠀⢄⣸⣿⣿⣿⣿⣿⣥⡤⢶⣿⣦⣀⡀
⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡆⠀⠀⠀⣙⣛⣿⣿⣿⣿⡏⠀⠀⣀⣿⣿⣿⡟
⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⠷⣦⣤⣤⣬⣽⣿⣿⣿⣿⣿⣿⣿⣟⠛⠿⠋⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⠋⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⡆⠀⠀
⠀⠀⠀⠀⣠⣶⣶⣶⣿⣦⡀⠘⣿⣿⣿⣿⣿⣿⣿⣿⠿⠋⠈⢹⡏⠁⠀⠀
⠀⠀⠀⢀⣿⡏⠉⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡆⠀⢀⣿⡇⠀⠀⠀
⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣟⡘⣿⣿⣃⠀⠀⠀
⣴⣷⣀⣸⣿⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⠹⣿⣯⣤⣾⠏⠉⠉⠉⠙⠢⠀
⠈⠙⢿⣿⡟⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣄⠛⠉⢩⣷⣴⡆⠀⠀⠀⠀⠀
⠀⠀⠀⠋⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣀⡠⠋⠈⢿⣇⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⠿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    sleep 3
    echo "🎵 Dum-da-da-dum ! Dum-da-da-dum ! Dum-da-da-dum ! Dum-da-da-dum !"
    sleep 3
    echo ""
    echo "🌟 ✨ GEAR 5 - NIKA ! ✨ 🌟"
    echo ""
    sleep 3
    echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠤⠄⠠⡀⠀⠀⢠⠻⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠊⠀⠀⠀⠹⠤⠔⢋⣰⡇⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠄⢒⣒⢲⡦⠀⢘⠀⡠⠊⠉⣩⠗⠈⠉⠉⢀⣀⡀⠀⠀⠀⡜⡝⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠣⢄⠁⣸⡀⠀⠀⠘⠀⢇⠀⠀⢧⠀⠀⡠⢊⢠⣤⠞⠇⠀⠀⡆⣧⠀⠀⠀⠀⠀⢀⠀⠠⠀⠤⢖⠀⠀⠁⠀⠒⠤⢀⡀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢡⢈⠓⡲⠊⠁⡄⠈⠉⠒⠚⠉⠉⢰⢁⣸⣀⣀⣀⠠⠖⠀⡱⠑⣀⠠⠊⠁⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠁⠀⠀⠉⠒⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠄⠠⢄⠀⢠⠔⠒⠂⢄⠀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⡆⠀⠀⢀⠌⠈⠉⠀⠀⢰⢇⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⢀⡄⠀⠀⡰⠃⠀⢻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡉⠀⠀⠀⠀⠀⠀⠈⢂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠊⠀⢀⣠⢤⣱⣇⣤⣔⣲⣸⣏⣄⣀⢈⡦⠒⢄⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣇⠙⠠⣶⢁⡶⡄⠘⡄⠀⢸⠀⠉⠉⠈⠝⠀⠀⠀⢀⡀⠤⢪⠃⠀⣼⣿⣟⡳⣏⠀⠀⣠⠇⠀⠀⠀⠀⠀⠀⣠⠖⢲⠋⠀⠈⡇⠀⠀⠀⠀⠂⠀⠀⠱⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠁⢀⡴⣋⣶⠥⠚⢉⡁⠄⠀⠀⠉⠉⠉⠛⠶⢦⣄⡗⠢⡀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡜⢸⠀⢸⡰⢼⣻⠃⢀⠛⣄⠸⣀⠀⡀⠀⠀⠀⠀⠀⠀⠀⡴⠁⠀⣴⡿⢉⡀⠱⣿⠀⢰⡏⠀⠀⠀⠀⠀⠀⢸⣁⣀⠀⠀⠀⠀⣹⠀⠀⠀⠀⠀⢡⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⣏⣶⠟⠁⢠⠶⠷⠶⠶⠶⠶⠶⠶⢴⣤⣄⣀⠈⠛⢦⡇⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠔⠉⡰⠃⠀⡀⠑⠚⠁⠀⢸⠀⣠⠟⠉⢉⠩⣉⣙⣲⣦⣤⣀⡀⢧⠀⠀⢿⡼⣿⣾⠀⠛⠦⢏⠣⠎⠁⠐⠂⠒⠈⠲⡇⠀⠀⠀⢀⡰⠃⠀⠀⠀⠀⠀⠀⠀⠀⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡼⡵⠃⠀⡰⣁⣀⣄⣠⣀⣄⣠⣀⣄⣀⣀⣀⣉⡁⠀⠀⠱⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⣸⠀⠀⠀⠟⠒⠐⠒⠒⣺⠛⢀⣠⣾⠵⠒⠒⠒⠒⠒⠲⣦⣿⣿⡦⠤⠠⠝⢛⡩⠀⠀⠀⢸⠀⡇⠀⠀⠀⠀⠀⠀⠈⡝⠋⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠳⠁⠀⡰⠁⠀⠈⠀⠁⠀⠀⠀⠀⠀⠀⠀⠈⠈⠉⠁⠀⠀⢇
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡄⠘⡄⠀⠀⠘⢆⠀⣠⠞⠁⠾⠋⣩⣤⠛⢶⡶⣶⠶⡶⣶⣾⣿⠿⢷⣀⠤⠔⠒⠁⠀⢀⡤⠊⢀⠇⠀⠀⠀⠀⠀⢠⠊⢀⡴⠒⠒⣄⠀⠀⠀⠀⠀⠀⢀⡜⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠃⠀⠀⡇⠰⠶⠯⠾⠵⠛⠾⠙⠛⠛⠛⠟⠿⠭⠼⠑⠚⠐⠸
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢦⠈⠢⡀⠀⠘⡴⠁⠀⠀⣠⣿⡿⠛⠆⠈⠃⢉⣙⣻⣉⣃⣀⣤⠘⢷⣤⣀⡀⠀⡴⣃⠄⠊⠁⠀⠀⠀⠀⠀⢀⠇⢠⡏⠀⠀⠀⢸⠀⠀⠀⠀⢀⣴⠃⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡘⠀⠀⠀⡇⢀⡤⣠⢤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣄⣀⠀⠐
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠴⠂⠀⢀⣴⠊⠉⠆⠀⣀⣀⠤⠤⠘⠒⠒⠛⠂⠉⣁⣤⢶⣿⡿⠋⢀⡠⠔⠊⠉⠉⠉⠉⠉⠙⠛⡇⠀⢸⣽⣷⠉⠉⣰⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢆⠀⠓⠤⡀⠀⡟⠀⠀⠠⠚⠉⠀⠀⠀⡥⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⡇⢈⣀⣁⣀⣠⡠⠤⠤⠤⠤⠤⠤⠤⠤⣄⣈⠉⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠝⠈⠓⠒⠉⠀⠀⢸⠉⠀⠀⠀⠀⣀⣀⣠⢤⠴⣶⣯⣷⣾⠿⠋⣠⠖⠁⢀⣠⣴⣶⣿⣿⣷⣶⣦⣤⠃⠀⣸⡿⡟⢀⡤⠼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠂⠀⠀⣠⠞⠀⠀⠀⡀⠀⠀⠀⠀⢀⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡆⠀⠀⠀⡟⠁⠂⠁⠉⠀⠉⠉⠉⠉⠉⠉⠉⠉⠉⠁⠈⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠃⠀⠀⠀⢀⡀⠀⠀⠀⠙⠒⢲⡞⣍⣳⠬⢶⠻⡏⡟⣾⣷⢧⣤⣴⠃⢀⣴⣿⣿⣿⠿⣟⡿⣿⣿⣿⡟⠀⢀⡯⠊⠀⠘⢦⠰⠀⢀⠤⠀⠂⠤⣀⠀⠀⠀⢀⣨⠔⠊⠁⠀⠀⠀⠊⠀⠀⠀⠀⣠⠊⠀⠀⠀⠀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⢸⡴⢦⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠂⠀⠸
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠐⠈⠀⠀⠀⢰⣄⠀⠿⡀⠀⠀⠀⠀⢀⡏⠁⢀⠴⠚⠈⢷⣾⢿⣼⡄⠙⠧⣀⣾⣿⣿⣿⣭⢟⢫⡙⢭⣹⠟⠀⢀⡾⠒⠉⠉⠉⠀⣀⠆⠁⠀⠀⠀⠀⠀⠈⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠠⠔⠋⠀⡠⠔⠀⠈⠀⠀⠀⠁⠢⡀⢀⣠⡀⠀⢀⠔⠈⣁⠱⠄⠀⠀⠀⠀⢸⠀⠀⠀⠸⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣬
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡔⠁⡆⠀⠀⠀⠀⠰⣌⡣⣽⡀⢳⡀⢀⣴⡾⠟⠁⠀⠘⣗⣒⣊⠥⣀⠸⣿⣿⡦⣀⠈⠙⠻⠿⢯⣔⣊⣦⡽⠖⠋⠀⣠⣾⠁⠀⠀⠀⠀⡔⠁⠀⠀⠀⢀⣀⠠⠠⠤⠀⠠⠀⠀⠐⠒⠒⠒⠒⠈⠁⠀⠀⠀⠀⠎⠀⠀⠀⣠⡴⢢⡀⠀⠀⢳⠎⡘⢀⡴⠡⠊⠀⠀⠀⠀⠀⠀⠀⠀⡿⡆⠀⠀⠀⡷⠶⠶⠶⠶⠶⠶⠶⠶⠶⠾⠾⠿⠳⠶⠖⠂⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⡇⠀⠀⠀⠀⠀⢨⣋⠈⢷⡘⡏⠁⠙⡆⠀⠀⠀⢠⠚⠀⠀⠀⠈⠣⡘⠛⢯⠭⠵⠢⢄⣀⡀⠀⠀⢀⣀⣠⢴⣺⡝⠱⠀⠀⠀⢀⠌⠀⠀⢀⡴⠚⠉⠉⠉⠐⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⠀⠀⠠⢠⠏⡆⢠⠇⠀⠀⣸⠀⠙⠊⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⣤⣷⢧⠀⠀⠀⢳⠀⡀⢀⡀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠐⠀⢣⠀⠀⠀⠀⠀⠀⠀⠙⢶⣿⠛⠉⠉⣠⠤⠐⠊⠁⠀⠀⠀⠀⠀⠀⠈⠉⠑⠛⠒⠊⠁⠙⢦⢹⠸⣌⠳⣘⠶⠃⠀⠀⣇⠀⣀⡎⠀⠀⢪⡏⠀⠀⣆⠀⠀⠀⠀⠡⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡸⠀⠀⠁⣏⠀⠛⠋⣀⡤⠞⠁⠀⠀⠀⠀⡆⠀⠀⠀⠀⠀⠀⣠⣾⠟⣿⣿⠀⠀⠀⢺⠛⠛⠛⠛⠛⠛⠻⠟⠿⠿⠿⠿⠿⠭⠃⠀⠸⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢆⠀⠀⢣⠀⠀⠀⠀⠀⠀⠀⠀⠙⢤⡀⡜⠁⠀⠀⠀⠀⣀⠤⠐⠈⠉⠉⠁⠢⡤⡀⠀⠀⠀⠀⠀⡯⠷⣌⡷⠋⠀⠀⠀⠀⠘⢯⢼⠁⠀⠠⡏⢳⣄⠀⣿⠀⠀⠀⠀⠀⢣⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠁⠀⠀⠀⠘⢲⣒⠉⠁⠀⠀⠀⠀⠀⢀⡜⠀⠀⠀⠀⢀⡠⢚⣵⠋⠀⢻⣿⠀⠀⠀⢸⣦⣴⣦⣶⣶⣶⣶⣶⣦⣶⣤⣦⣤⣀⣀⢠⠃⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠣⣀⠀⠣⡀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠐⠢⠤⠒⡈⢁⠀⠤⠠⠤⣤⠤⣀⠀⢁⠀⠱⡀⣀⠠⣤⠇⠀⠀⠀⠀⠀⠀⠀⣀⣠⣼⠾⡀⠀⠀⣷⢄⢿⡂⣹⡇⠀⠀⠀⠀⠀⠡⡀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠃⠀⠀⠀⢀⠎⠥⠜⠀⠀⠀⠀⣀⡤⠖⠋⣀⠠⠄⠒⠈⠁⠀⠘⠁⠀⠀⢸⣿⠀⠀⠀⡎⠀⢀⡀⡀⡀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⣦⡘⠢⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⡌⣧⠘⡀⠀⢣⡏⣸⠀⣀⣀⣀⡀⠀⠀⠀⣼⡟⠋⠀⠀⣷⡀⠀⠹⡌⠳⣷⣸⡏⢆⠀⠀⠀⠀⠀⠐⢄⠀⠀⠀⠀⠀⢀⠔⠁⠀⠀⠀⣀⠮⠤⢄⡠⢤⠤⣶⡯⠗⠒⠉⠀⠀⠀⠀⠀⠀⠀⠀⠠⡀⠀⠀⢸⣾⠀⠀⠀⡗⠛⠛⠛⠙⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠀⡇⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠔⠈⠀⠈⠓⠾⣦⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢀⠀⢠⡄⢸⣺⡄⠁⠀⡸⢧⣻⠍⠟⠛⠛⢿⠷⠀⡀⠉⣠⣆⣤⡾⣿⣷⣄⠀⠈⢦⡈⢎⠳⣄⠱⡀⠀⠀⠀⠀⠀⠱⡆⠒⠒⠀⠁⠀⣠⠤⡤⠊⢀⣄⠀⡠⣤⡾⠒⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡄⠀⠀⡏⠀⠀⢸⠀⣀⣀⣀⣄⣀⣀⣀⣀⣀⣀⣀⣀⠀⠀⣸⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡎⠀⠀⠀⠀⠀⠀⠀⠉⠓⠢⠄⣀⠀⠀⠀⠀⠀⠠⣄⡀⠘⢆⠣⠀⢧⠀⣿⠃⠀⠀⣽⢬⢯⡳⣷⢦⣤⠤⣿⠷⣷⡞⠉⢿⣿⡿⠃⣿⣏⢶⣄⠀⠙⠮⣀⠈⠳⡌⢢⡀⠀⠀⣀⡀⠈⠣⡀⠀⢠⠋⠀⠀⠀⢀⠎⢸⢉⡵⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣧⠀⠀⠀⢸⢻⡄⢰⡇⠀⠀⢸⠀⠀⠀⠈⠈⠉⠉⠉⠉⠉⠉⠋⠙⠛⠀⡏⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢃⣀⡴⠀⠂⠠⡀⠀⠀⠀⠀⠀⠀⠈⠑⠒⠠⢄⡀⠉⢮⠂⡌⣆⠱⡘⠀⣿⠀⠀⠘⠀⠀⢳⡑⡞⣾⢋⣶⣀⠀⢹⣷⠀⠀⢀⡄⣠⡿⢿⡈⠙⢵⡢⢄⣈⣉⡒⠼⢦⠈⢦⣼⢫⣿⠞⠉⢉⡦⡇⠀⠀⠀⢠⢻⣆⡼⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣯⡳⣄⠀⠘⡧⣇⢸⡇⠀⠀⢸⠰⠴⣶⣶⣶⣶⣖⣶⣲⣖⣶⣶⡶⠦⢰⠁⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠬⠒⠂⢄⡀⡾⠀⠀⠀⠀⠀⠀⠀⠀⠀⡔⠃⠀⠑⠢⢙⠢⢸⡄⢷⠀⡏⠠⠀⠀⠀⠀⠘⣷⡄⠘⣿⣯⢿⣧⠀⢻⡆⠀⠺⡼⢋⣷⢬⣣⠀⡀⣀⢉⡒⢦⣌⣉⣉⡳⣼⢰⠏⣏⡀⣠⡿⠀⠀⠀⠀⢀⣼⢼⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠻⣼⣷⣤⣷⡹⡼⡇⠀⠀⢸⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡇⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⠁⠀⣠⠖⠀⠘⣇⠀⠀⠀⠀⠀⠀⠀⠀⠸⠀⠀⠀⠀⠀⠀⠑⠢⡇⢼⢸⠁⠁⠀⠀⠀⠀⠀⡏⢣⠀⣿⣿⠏⠃⠀⢸⣷⣄⣤⣤⡽⠶⠚⠉⠛⡣⠄⠀⢀⠉⠈⠁⠀⠉⠉⠉⠉⠉⠉⢓⠃⠀⠀⠀⣠⣞⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣷⣉⣧⠀⠀⢸⠀⠉⠿⠷⠶⠶⠾⠶⠿⠿⠻⠯⠉⢰⠃⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠳⣄⣀⡴⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⢇⠀⠀⠀⠀⠀⠀⠀⢱⣸⡏⠈⠀⠀⣄⢀⣠⣾⣴⣦⡄⣻⠏⢠⣠⣿⣿⣝⣹⡞⣡⣴⠶⠛⣛⣩⣴⠎⢉⣉⣀⠀⠀⣀⣠⣴⣋⣠⣤⣴⠾⡀⠀⠀⠀⠽⣌⡟⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣤⣤⣤⢤⡒⠒⠪⠳⣼⠀⠀⠈⡄⠲⠤⣤⢤⣤⢤⡤⢤⠤⡤⠶⠀⡜⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠓⠄⢠⠀⠀⠀⠀⠀⠀⢀⡆⠀⠀⠀⠀⠀⠀⢘⠀⠀⠀⠀⠀⠀⠀⢨⠞⠀⠀⠀⠀⡅⠉⠟⢻⠟⢻⠀⢹⣶⣿⡿⣿⠿⢡⣾⣿⠟⣡⣾⠟⠋⣁⣤⢤⣃⣤⡴⠞⡻⠍⠁⠀⠀⢠⡞⡍⠀⠙⠀⠀⠀⡴⡸⣏⢿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⢖⡫⣵⠶⠛⠉⠁⠀⠀⣱⠀⠀⠀⠀⢆⠀⠀⢣⠀⠀⠈⠉⠈⠁⠉⠈⠀⠁⠀⡴⠁⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡀⠀⠀⠀⠀⢠⡎⠀⠀⠀⠀⠀⣀⠤⠊⠀⠀⠀⠀⢀⠠⠐⠁⠀⠀⠀⠈⠀⡇⠀⠀⣼⣤⠏⠀⢸⣷⠏⠀⠃⠀⠘⢿⣯⣴⣿⢇⣴⣿⡟⣡⣾⡏⠭⠘⠦⣄⠤⠤⠤⣤⠏⠀⣇⠀⠀⠀⠀⠀⢫⢉⣽⡾⡄⠀⠀⠀⠀⠀⠀⠀⢀⡴⣋⢦⢿⢋⡧⠀⢀⣤⠦⣤⠀⠸⢤⠀⠀⠀⠀⠠⡀⠈⡇⠠⠿⠽⠯⠟⠹⠋⢋⡩⠚⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠂⠤⠐⠊⠁⠀⠉⠈⠁⠉⠀⠀⠀⠀⠀⠀⡤⠊⠀⠀⠀⠀⠀⠀⠠⠃⢀⠇⠰⠾⠛⣉⣀⣀⢸⡿⢀⣠⣴⣶⣶⣿⡟⢻⣿⣿⠟⣹⣴⡿⢻⣧⡀⠀⠀⠀⠉⠓⠳⢿⡀⠀⡽⠄⠀⠀⠀⠀⠘⡟⢸⡇⣧⠀⠀⠀⠀⠀⢀⡴⣋⢶⠝⠁⠈⢻⢠⠄⠉⠀⠀⠈⠀⢠⢾⠀⠀⠀⠀⠀⠀⠁⠲⠤⠠⠄⠄⠤⠔⠊⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡎⠀⣿⡍⣦⠀⠀⠀⠐⠀⢀⠞⣠⡄⠀⠰⣁⣠⡏⢨⣗⣾⠟⠋⢀⣀⠀⡇⣨⠿⣶⣶⣿⠛⠀⠀⠻⣿⣶⣦⢤⡒⠲⣊⣿⠃⠀⢷⠀⠀⠀⠀⠀⠀⠘⢤⣻⡌⣧⡀⠀⢀⣠⢏⡲⡱⠃⠀⠀⠀⠈⣏⣰⠄⠰⠚⠓⣆⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠸⠂⠒⠊⠁⠀⠀⢀⣠⢶⠿⣊⠟⠀⢀⣴⠿⠋⠀⣸⣷⠈⢠⣾⡿⠛⠛⠹⠟⠉⠀⠀⠉⠁⣀⣀⣾⣄⠣⡙⢷⡌⢦⣟⡿⠀⠀⡾⡆⠀⠀⠀⠀⠀⠀⠀⡱⢿⡰⣍⡛⢭⢢⡓⡼⠁⠀⠀⠀⠀⠀⢸⣁⣤⠠⣤⣌⠁⠀⠈⡇⠀⠀⠀⠀⡀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡅⠀⠀⠀⠀⢀⠤⢚⣹⣾⡿⠋⠁⠀⢀⣈⡠⢞⡍⢀⠏⣷⠀⠻⠋⠀⠀⢀⣀⣤⣤⠶⠒⢋⣩⣡⠴⠚⠙⢷⠘⡈⣹⠏⡞⢱⡏⡆⡷⠙⣄⠀⠀⠀⠀⠀⠀⠓⢬⢻⡴⡹⢌⡖⣭⠃⠀⠀⠀⠀⠀⠀⣜⡥⠄⠀⠀⠸⡆⠀⢈⣇⠠⠐⠈⠀⠀⠀⠀⢱⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠃⠀⠀⢀⠞⣡⣴⣿⡿⠉⠀⠀⠀⢸⠁⢀⡽⠎⢀⣎⣤⣿⣀⣤⢶⣶⠿⠿⠛⠉⣀⠤⠚⠛⠛⠒⠒⠒⠒⠊⢣⡿⠃⡼⠁⠸⡇⢹⣿⢠⠸⡄⠀⠀⠀⠀⠀⠀⠀⢯⣽⣎⠵⡸⡼⠀⠀⠀⠀⠀⠀⢰⡫⠴⠂⣶⣶⢦⡀⢰⡟⠁⠀⠀⠀⠀⠀⠀⠀⡰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡖⠈⠀⠀⢀⡴⢃⣨⠾⢻⠋⠀⠀⠀⠀⢠⠾⠚⠉⣠⣴⣿⠟⠋⣡⠔⠋⢉⣀⣤⠶⠾⠭⠖⠒⠒⠛⠛⠚⠓⠒⠋⣩⠏⠀⣸⠃⠀⠀⠀⠈⢿⡼⡀⠱⣄⠀⠀⠀⠀⠀⠀⠘⢄⣈⣷⡵⠃⠀⠀⠀⢀⡀⠴⣅⣀⠤⠚⠀⢨⠿⢁⣠⠇⠀⠀⠀⠀⠀⠀⢀⡴⠇⠒⠀⠁⠒⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⢀⡀⠀⠀⣀⠧⠄⣢⠤⠟⠒⠛⠒⠢⢦⣽⠶⢦⣄⣀⠀⣠⡴⠚⣩⠴⢃⠴⢋⡠⠔⢊⡵⣎⡵⠴⡒⠒⣎⢉⣉⡭⠝⠋⣑⣲⡞⢡⠃⡰⠃⣴⠃⠀⠀⠀⠈⢆⢣⠀⠈⠑⡄⠀⠀⠀⠀⠀⠀⠀⠙⠙⠨⠭⠮⢭⡹⣄⣠⠒⠉⢢⣄⣰⠊⠀⡏⡩⠄⠒⠈⠐⡄⠀⠔⠋⠀⠀⠀⠀⠀⠀⣡⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠎⠀⢀⣠⠤⠃⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠒⠬⣍⢻⡯⠴⣉⣁⡖⠡⠂⠁⢠⡴⠿⠭⠴⠦⢤⠟⠛⣯⣁⣰⠤⢟⡋⡡⠊⠰⠁⡴⢡⢪⠎⠀⠀⠀⠀⠀⠈⢦⣣⠀⠀⠸⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⢠⡾⠁⠀⣠⠔⠋⠀⠀⠀⠀⠀⡜⠀⠀⠀⠀⠀⠀⠀⠀⠀⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠀⡾⢀⠾⠁⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢦⡈⠓⢤⡀⠈⠹⠶⣖⠧⠤⠴⠶⢶⠶⢺⠛⠛⢹⣀⣤⠞⢋⠜⠀⡴⢁⡴⡑⡡⠃⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠈⠒⢤⣀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠔⠊⠑⠜⠀⠀⠀⡎⠀⠀⠀⠀⠀⠀⠀⡜⠀⠀⠀⠀⠀⠀⠀⠀⢀⠞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⠀⣸⠗⡏⠀⠀⠀⢀⠤⠤⢤⠤⢤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⢦⠀⠉⠲⣤⣀⠀⠈⠁⠀⠀⣀⣠⡬⣷⠺⡋⡏⠀⠔⠁⢀⢞⡠⢋⠖⠜⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠤⠒⠀⠈⠱⡄⠐⠂⠒⠐⠂⠤⠚⠀⠀⠀⣀⡤⠒⠉⠁⠀⠀⠀⠀⠀⡠⠊⠀⠀⠀⠀⠀⠀⠀⠀⡔⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⡔⠉⠉⠐⠤⡀⠀⠀⠀⠀⠀⠀⢀⠆⣇⠀⠀⠀⠀⣾⠉⠀⢰⡏⣀⣠⣈⣿⢧⣌⡑⠤⡠⠤⣀⡀⠀⠀⠀⠀⠀⠈⢷⣦⡀⠙⢯⣙⠛⠶⣤⡀⣑⠊⠁⠀⠀⢱⣹⡀⠀⣴⠿⠋⣰⡫⠊⠀⠀⠀⢶⡒⠒⠒⠶⠶⣖⣦⡬⠭⠥⠤⠶⠖⠶⠆⠀⠙⠳⠖⠛⣦⣤⡤⠖⣲⠖⠊⠁⠀⠀⠀⠀⠀⠀⡠⠐⠁⢠⡴⢢⡀⠀⠀⠀⠀⢠⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠸⠀⣠⠤⣤⡀⠈⡄⠀⠀⠀⠀⠀⣼⠏⠉⢀⠔⢦⠚⠹⠃⠀⣸⣾⠟⠛⠉⠛⠚⠶⣝⣒⢒⢶⣯⡇⠀⠀⠀⠀⠀⠀⠘⠻⣷⣄⠀⠉⠳⣄⠀⠉⠒⠬⣑⡚⢶⠦⠟⡇⠈⠁⣠⡾⠋⠀⠀⠀⠀⠀⠀⠈⠉⠐⠒⠒⠐⠂⠒⠒⠲⠤⢤⣤⣤⠴⠶⠶⠒⠛⢋⡩⠤⠶⠍⣀⠀⠀⠀⠀⠀⠀⠀⠀⡜⠀⠀⠀⡜⢡⠀⣷⠀⠀⠀⢠⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⠖⠉⢀⡽⣿⣬⢓⣦⡙⠶⢷⡀⠀⠀⠀⠀⣧⢦⠀⡯⣆⠘⠇⠘⣇⣼⡟⠁⠀⠀⠀⠀⠀⠀⠀⠈⠻⣬⢿⣞⢆⠀⠀⠀⠀⠀⠀⠀⢱⠙⠷⣝⠢⢌⡑⠢⠄⣀⠀⠀⠈⠉⢹⢸⠀⠐⠋⠀⢀⣤⡶⠖⠂⠀⠀⠀⠀⠐⢄⠀⡀⠀⠤⠄⠒⣀⡀⠀⠀⢀⣠⣤⡴⠛⠓⠒⠒⠒⠤⣀⠉⠢⠀⠀⠀⠀⠀⢰⠀⠀⠄⢰⣣⠎⠀⣿⠀⠀⢠⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣀⣸⣠⢞⣭⠖⠓⠉⠉⠈⠉⠉⠒⠼⣒⠤⢄⡠⡇⠀⠀⡇⠳⣄⡀⠀⣼⡞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢞⢯⡻⣦⡀⠀⠀⠀⠀⠀⠈⡇⠀⠀⠀⢠⡏⠒⠤⣒⠬⣉⠀⠂⠀⢏⣆⠀⠀⢰⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢑⣠⠴⠖⢚⣉⡥⠔⢒⡮⠙⠊⠀⠉⠉⠉⠐⠒⠤⡀⠈⢧⢣⠈⣦⠀⠀⠀⠸⠀⠀⠀⠀⠁⠀⣰⠃⠀⠀⡎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢰⠉⣠⢲⣹⠟⠁⠀⣩⡽⢋⣴⠦⣀⠀⠀⠈⠙⢷⣝⢵⢢⡐⠁⢀⠈⠙⣶⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢳⡜⣽⡗⢄⠀⠀⠀⠀⠀⢳⠀⠀⠀⣾⠀⠀⡄⠀⠉⠙⠛⠶⠤⠸⠸⡆⠀⠉⠀⠀⠀⠀⠀⠀⣀⠤⠔⠒⠉⠁⠀⠊⠉⢉⡠⠔⠊⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⣸⢠⠀⣿⢣⠀⠀⠀⠣⡀⠀⠀⣠⠜⠁⠀⠀⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠸⣴⣵⠚⠀⠀⢀⣼⠟⣡⡾⠁⣠⣾⠟⢂⡀⠀⠀⠹⣿⣏⣿⣀⡘⣶⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣷⢸⣇⢨⡂⠀⠀⠀⠀⠀⡇⠀⢸⡭⠀⣰⡇⠀⢀⡆⠀⠀⠀⠀⢣⠱⡀⠀⠀⠀⠀⠀⠀⠙⠒⣒⠀⠀⠀⣀⠤⠒⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡜⢸⠀⢿⢘⠀⠀⠀⠀⠀⠉⢻⠀⠀⠀⠀⠀⢈⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠰⡟⠁⠀⠀⣰⡿⢃⣾⠏⢀⣶⠟⠁⢀⣴⡕⢤⠀⠀⠈⢿⣿⡗⠛⠛⠷⠶⠦⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⢟⢢⢻⣆⠉⢆⠀⠀⠀⠀⢸⠀⣦⠇⣰⡟⠀⢀⠎⡇⠀⠀⠀⠀⠀⡇⠱⡤⠤⠄⠒⠐⠂⣉⣉⠠⠔⠊⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠎⢀⠏⢸⣸⠸⠀⠀⠀⠀⠀⢠⠃⠀⠀⠀⠀⠀⠘⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠃⢱⠁⠀⢠⣾⠟⣰⡿⠁⣰⡿⠃⠀⣰⡿⠋⣠⣾⠵⡄⠀⠀⠡⣱⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠏⣎⢲⡏⡸⠀⠈⢢⠀⠀⠀⢸⢰⡟⢠⡹⠀⢀⠎⠀⡇⠀⠀⣀⠠⠒⣁⠤⠴⠤⠔⠒⠊⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠐⠡⢂⠎⠀⣇⡏⢸⠀⠀⢀⠠⠒⠁⠀⠀⠀⠀⠀⠀⠀⢣⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢾⠀⣴⡿⢃⣾⠏⣠⡾⠋⠀⣠⣾⠟⢀⣾⠟⢁⡴⡾⢆⠀⠀⠘⣇⡀⠀⠀⠀⠀⠈⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⣴⢣⣹⣰⠏⠀⡇⠀⠰⡏⠀⠀⠀⢸⡞⠁⡵⠁⡠⢻⠀⠸⡁⣒⡡⠔⠒⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠔⡁⠊⡰⠋⠀⣸⡟⠀⡎⠀⡐⠁⠀⠀⠀⠀⠀⠀⣀⡤⠤⣄⠀⢃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢸⡸⠋⣰⡟⢁⣴⠟⠁⣠⣾⠟⢁⣼⠟⠁⣠⣾⠟⠁⣠⣷⠀⠀⠨⣷⠀⠀⠀⠀⠀⠘⣟⢧⡀⠀⠀⠀⠀⢠⣾⠵⠊⠁⠀⠀⡴⡷⠀⠀⡇⠀⠀⠀⢻⣀⡾⢁⠜⡱⢋⡠⠖⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡔⠒⠠⠀⢀⠀⠀⠀⠀⠀⠀⠠⠔⠊⢀⡨⢤⠞⠁⠀⢰⡟⠀⡜⠀⡘⠀⠀⠈⠀⠀⠀⠀⡰⠁⠀⡴⠸⡄⠀⠡⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⡇⠘⠃⣴⡿⠁⢀⣶⠟⢁⣴⡿⠉⢠⢞⡵⠃⢠⢞⡽⠃⣳⡃⠀⠈⢿⡀⠀⠀⠀⠀⠘⣞⡧⠀⠀⠀⣴⡿⠁⢀⣀⣀⡤⠔⣇⠀⠀⡴⠃⠀⢀⠔⣻⠏⠀⢡⠾⠓⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⢄⣀⡀⠀⠀⠈⢁⡠⠤⠐⠂⣠⠴⠋⡰⠋⠀⠀⢠⠟⠀⣰⠃⠀⡅⠀⡄⠀⠀⠀⠀⢰⡇⠀⠸⣇⣰⠃⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠸⡄⠾⠋⢀⣴⡟⢁⣴⡿⠋⢀⡴⡻⠋⢀⡴⣫⠋⢀⣴⡟⠙⣄⠆⠈⢳⡄⠀⠀⠀⠀⢿⠇⠀⠀⢠⡟⣩⠟⠁⠀⡞⠀⠀⠈⠳⠾⠔⠈⠀⣨⣿⠁⣀⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢟⢤⡀⠀⠉⠉⠉⠀⢀⣠⠴⠋⠁⣠⠞⠀⠀⠀⣰⠋⠀⣰⠋⠀⢠⠀⠀⠀⠀⠀⠀⠀⠘⡇⠀⠀⠀⠁⠀⠀⣠⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠱⣄⠐⠿⠃⣠⡿⠋⠀⣤⣯⠞⠁⡴⣫⠞⠁⣠⣾⠋⢀⣼⡿⠳⢄⠀⠹⣦⡀⠀⠀⠀⢰⣤⡀⢸⢡⡟⠀⠀⢸⡇⠀⠀⠀⡴⠃⠀⡠⢮⡥⡮⠜⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡀⠈⠙⠒⠒⠒⢋⡡⠔⠀⣠⠜⠁⠀⠀⣠⡾⠁⠀⡰⠃⠀⠀⠈⡀⠀⠣⠀⠀⠀⠀⠀⢣⠈⠑⠒⠒⠂⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠈⠢⡀⠚⠁⠀⣠⣾⠟⠁⣠⢞⡽⠁⢀⣾⠟⠁⣠⢯⠞⠀⠀⣸⡿⡀⠈⠓⢦⡀⠀⠀⢿⣷⣼⠀⠻⢤⠀⠀⠙⠶⠖⠀⠈⣍⣉⣀⡼⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡔⠒⠒⠒⠈⠁⠀⣠⠞⠁⠀⣀⠤⣺⠋⠀⠀⡴⠁⠀⠀⠀⠀⢣⠀⠀⢀⡀⠀⠀⠀⠸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠈⠳⢄⠈⠛⠁⣠⢞⡵⠋⢀⡴⣻⠋⢀⡼⡵⠋⠀⢀⣾⠟⠀⠈⣵⠦⣀⠈⠛⢯⣏⡹⢻⡄⠀⠰⣄⡀⠀⠀⣦⣀⣀⠤⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠢⣀⠀⢀⡠⠞⠃⠠⢔⣈⡠⠖⠉⡇⢀⠞⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⣽⠀⠀⢀⣸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⢤⠐⠓⠋⠀⣠⢏⡼⠁⣠⢏⠞⠁⠀⣰⡿⠃⠀⣠⡾⠋⠀⣠⣷⢄⡀⠉⢷⡩⡏⠓⠒⠚⠈⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⠊⠀⠀⠀⠀⠀⢁⠀⢀⠎⡠⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠏⠀⡴⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠢⣀⠀⠑⠋⢀⡴⣣⠋⠀⣀⣾⠏⠀⢀⣾⠏⠀⢀⣴⡟⠁⠀⣩⣦⠀⠙⡃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⡀⢃⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢇⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠓⢤⡀⠉⠞⠁⠀⣴⡟⠁⢀⣴⡿⠁⠀⣤⣿⠋⠀⣠⣾⠟⠀⢑⣄⢡⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢂⣸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠒⢄⡀⠛⠉⠀⣠⣾⠋⠀⢀⣾⡟⠁⢀⣴⡟⠁⠀⣴⠟⠀⣼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠒⠤⡀⠁⠀⠀⣰⡿⠋⠀⣠⢾⠏⠀⣠⣾⠋⠀⡰⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⠢⣄⠉⠁⢀⡴⡷⠋⢀⣴⠟⠁⢀⠜⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠑⠦⢄⣀⢠⣎⣉⠤⠚⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    sleep 3
    echo "😄 Luffy sourit avec une joie pure !"
    sleep 3
    echo "🎈 Son corps devient blanc et élastique !"
    sleep 3
    echo "⚡ Il contrôle maintenant la réalité elle-même !"
    echo ""
    sleep 3
    echo "🐉 Kaido: 'QU-QUOI ?! Cette puissance...!'"
    echo ""
    sleep 3
    echo "👊 'Gomu Gomu no... BAJRANG GUN !'"
    echo "🔥 Un poing géant de la taille d'une île !"
    echo ""
    sleep 3
    echo "💥💥💥 BOOOOOOOM ! 💥💥💥"
    echo ""
    sleep 3
    echo "🏯 L'île entière tremble !"
    echo "🐉 Kaido s'effondre, vaincu !"
    echo ""
    echo "🎊 🎉 VICTOIRE ! 🎉 🎊"
    echo ""
    echo "🏆 FÉLICITATIONS ! TU AS VAINCU KAIDO ! 🏆"
    cp ../../../../modele_iles/certificat_reussite.txt .
    echo "Un certificat de réussite à été ajouté à ton inventaire !"
    ;;
  *)
    echo "🤔 Luffy se gratte la tête..."
    echo "'Gear $gear ? Ça existe ça ?'"
    echo ""
    echo "💡 Utilise: gear 5"
    ;;
esac
EOF

cat > ../modele_iles/onigashima/kaido/combat.sh << 'EOF'
#!/bin/bash

echo "🥊 LE COMBAT FINAL COMMENCE !"
echo ""
echo "🐉 Kaido: 'Viens, Chapeau de Paille !'"
echo "😤 Luffy: 'Je vais te battre et devenir le Roi des Pirates !'"
echo ""
echo "⚡ Le combat légendaire commence..."
echo ""

# L'enfant doit modifier cette ligne pour gagner
./.attaque_kaido.sh gear 1
EOF

cat > ../modele_iles/certificat_reussite.txt << 'EOF'
🏴‍☠️ ════════════════════════════════════════════════════ 🏴‍☠️
      
       ⚓    CERTIFICAT DE RÉUSSITE    ⚓
            AVENTURE ONE PIECE
              
          🎩    Félicitations !    🎩
          
    Tu as accompli l'impossible avec Luffy !
    
╔══════════════════════════════════════════════════════╗
║                                                      ║
║         🌟 MAÎTRE PIRATE CERTIFIÉ 🌟                ║
║                                                      ║
║  🏆 Tes exploits héroïques :                        ║
║                                                      ║
║  ⚓ Navigation sur Grand Line                        ║
║  🏝️ Exploration de l'île de Zou                      ║
║  🍖 Récupération des provisions                      ║
║  🗣️ Communication avec les Minks                     ║
║  🏯 Traversée du labyrinthe d'Onigashima             ║
║  🐉 Défaite de Kaido avec le Gear 5                  ║
║  💻 Maîtrise des scripts bash                        ║
║                                                      ║
║         👑 FUTUR ROI DES PIRATES 👑                 ║
║                                                      ║
║  Date : XX/XX/XXXX                                   ║
║                                                      ║
║       "L'aventure continue !" - Luffy                ║
║                                                      ║
╚══════════════════════════════════════════════════════╝

🏴‍☠️ ════════════════════════════════════════════════════ 🏴‍☠️
EOF

# === CRÉATION DE LA ZONE DE DÉPART ===

cp -r ../modele_iles/zou/ grand_line/.
chmod +x grand_line/zou/foret/*.sh


cat > grand_line/README.txt << 'EOF'
🌊 GRAND LINE - DÉPART DE L'AVENTURE 🏴‍☠️

⠀⠀⠀⣠⠞⢠⠖⠉⠉⠉⢭⣭⣀⡉⣍⠉⠉⠒⠭⣑⠤⡀⠀⠀⠀⠀
⠀⠀⡞⠁⡰⠳⢦⣼⣿⡿⣿⣿⣿⣿⣿⣿⣶⣤⡀⠈⠓⣌⢢⡀⠀⠀
⠀⣸⠁⣰⣵⣾⣿⣿⡿⠹⣿⣿⢿⣟⣿⣿⣿⣿⣿⣦⡀⠈⢣⠱⡀⠀
⠀⢯⢠⣿⠟⣿⣿⣿⡇⠀⣿⠛⣷⢙⣻⢌⣻⠟⣿⣿⣿⣆⠀⢧⢳⠀
⠀⠘⡞⢡⣼⣿⣿⣯⣧⠀⠘⠆⢨⠋⢠⡤⢘⣆⢻⣿⣿⣿⠇⢸⠀⡇
⠀⠀⢱⡼⢟⣿⣿⣿⠋⢑⣄⠀⠈⠢⠤⠔⣺⣏⠀⣿⣿⡏⠀⡼⠀⡇
⠀⠀⠁⠘⢺⣿⣿⣿⣦⣈⣽⠀⠀⢀⡤⠊⢡⣾⠀⠸⣿⢃⡴⠁⡜⠁
⠀⠀⠀⠀⠀⠻⠙⠟⣿⡀⢨⠭⠊⡡⠔⠀⢠⠃⡜⣿⡋⣁⡠⠊⠀⠀
⠀⠀⠀⠀    ⠀⠈⠳⢌⡳⢄⣀⠤⠒⢁⠞⡼⠙⡄⠀⠀⠀⠀⠀
           ⠀⠀⠀⠉⠑⠒⠤⢲⣥⠼⣤⣤⣱⡀⠀⠀⠀⠀
           ⠀⠀⠀⠀⠀⠀⣴⠏⠀⠀⠀⠙⢿⣿⣧⡀⠀⠀
            ⠀⠀⠀⠀⣼⠃⠀⠀⠀⠀⠀⢸⣿⣿⣧⠀⠀
              ⠀⢠⡟⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⡆⠀

Luffy au Chapeau de Paille est prêt pour une nouvelle aventure !
Son rêve : devenir le Roi des Pirates et trouver le One Piece !
Kaido, l'Empereur des Mers, est son plus grand obstacle...

🚢 Ton navire, le Thousand Sunny, flotte sur les eaux...

💡 Commence par explorer l'île de Zou !
EOF

cat > grand_line/zou/README.txt << 'EOF'
🏝️ ÎLE DE ZOU - PREMIÈRE ÉTAPE 🐘

🏴‍☠️ 'Yosh ! En route vers l'aventure !' crie Luffy
🌊 Le Thousand Sunny navigue sur Grand Line...
⚓ Tu aperçois au loin une île sur le dos d'un éléphant géant !

🐘 'Waah ! C'est un éléphant énorme !' s'exclame Luffy
🏝️ 'C'est l'île de Zou !' dit Nami

🚢 Vous accostez sur l'île mystérieuse...

💡 Explore la forêt et le village des Minks !
EOF

# === GUIDE SIMPLIFIÉ ===

cat > GUIDE.txt << 'EOF'
🏴‍☠️ GUIDE DE L'AVENTURE ONE PIECE

⠀⠀⡶⠛⠲⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡶⠚⢲⡀⠀
⣰⠛⠃⠀⢠⣏⠀⠀⠀⠀⣀⣠⣤⣤⣤⣤⣤⣤⣤⣀⡀⠀⠀⠀⣸⡇⠀⠈⠙⣧
⠸⣦⣤⣄⠀⠙⢷⣤⣶⠟⠛⢉⣁⣠⣤⣤⣤⣀⣉⠙⠻⢷⣤⡾⠋⢀⣠⣤⣴⠟
⠀⠀⠀⠈⠳⣤⡾⠋⣀⣴⣿⣿⠿⠿⠟⠛⠿⠿⣿⣿⣶⣄⠙⢿⣦⠟⠁⠀⠀⠀
⠀⠀⠀⢀⣾⠟⢀⣼⣿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣿⣷⡄⠹⣷⡀⠀⠀⠀
⠀⠀⠀⣾⡏⢠⣿⣿⡯⠤⠤⠤⠒⠒⠒⠒⠒⠒⠒⠤⠤⠽⣿⣿⡆⠹⣷⡀⠀⠀
⠀⠀⢸⣟⣠⡿⠿⠟⠒⣒⣒⣈⣉⣉⣉⣉⣉⣉⣉⣁⣒⣒⡛⠻⠿⢤⣹⣇⠀⠀
⠀⠀⣾⡭⢤⣤⣠⡞⠉⠉⢀⣀⣀⠀⠀⠀⠀⢀⣀⣀⠀⠈⢹⣦⣤⡤⠴⣿⠀⠀
⠀⠀⣿⡇⢸⣿⣿⣇⠀⣼⣿⣿⣿⣷⠀⠀⣼⣿⣿⣿⣷⠀⢸⣿⣿⡇⠀⣿⠀⠀
⠀⠀⢻⡇⠸⣿⣿⣿⡄⢿⣿⣿⣿⡿⠀⠀⢿⣿⣿⣿⡿⢀⣿⣿⣿⡇⢸⣿⠀⠀
⠀⠀⠸⣿⡀⢿⣿⣿⣿⣆⠉⠛⠋⠁⢴⣶⠀⠉⠛⠉⣠⣿⣿⣿⡿⠀⣾⠇⠀⠀
⠀⠀⠀⢻⣷⡈⢻⣿⣿⣿⣿⣶⣤⣀⣈⣁⣀⡤⣴⣿⣿⣿⣿⡿⠁⣼⠟⠀⠀⠀
⠀⠀⠀⢀⣽⣷⣄⠙⢿⣿⣿⡟⢲⠧⡦⠼⠤⢷⢺⣿⣿⡿⠋⣠⣾⢿⣄⠀⠀⠀
⢰⠟⠛⠟⠁⣨⡿⢷⣤⣈⠙⢿⡙⠒⠓⠒⠓⠚⣹⠛⢉⣠⣾⠿⣧⡀⠙⠋⠙⣆
⠹⣄⡀⠀⠐⡏⠀⠀⠉⠛⠿⣶⣿⣦⣤⣤⣤⣶⣷⡾⠟⠋⠀⠀⢸⡇⠀⢠⣤⠟
⠀⠀⠳⢤⠼⠃⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠘⠷⢤⠾⠁⠀

REGLES DU JEU:
1. Toujours lire les fichiers README.txt pour les instructions.
2. Le dossier inventaire/ contient tes objets. Tu dois y déplacer ce que tu trouves.
3. Explorer les dossiers pour avancer dans l'histoire.

COMMANDES UTILES:
📂 ls                              - "qu'y a-t-il ici ?"
📂 cd dossier/                     - se déplacer
📂 cd ..                           - revenir en arrière
📖 cat README.txt                  - lire un fichier
📖 nano fichier                    - écrire/modifier un fichier
📖 mv fichier.txt destination/     - déplacer un fichier
🚀 ./script.sh                     - exécuter un script

COMMENT COMMENCER:
📂 ls : pour voir ce qu'il y a dans le dossier actuel
📂 cd grand_line/ : pour se déplacer sur Grand Line
📖 cat README.txt : pour lire les instructions

PROGRESSION:
1. 🏝️ Zou/village → Explorer le village
2. 🍖 Zou/taverne → Prendre les provisions
3. 🌳 Zou/forêt → Parler au Mink (nécessite provisions)
4. 🏯 Onigashima → Combat final

🏴‍☠️ Bon voyage, futur Roi des Pirates ! 🏴‍☠️
EOF

# === FINALISATION ===

# Rendre les scripts exécutables
find grand_line/ ../modele_iles/ -name "*.sh" -exec chmod +x {} \;

echo ""
echo "🏴‍☠️ Aventure One Piece générée avec succès !"
echo ""
echo "🚢 Pour commencer l'aventure :"
echo "   cd grand_line/"
echo "   cat README.txt"
echo ""
echo "📖 Pour voir le guide :"
echo "   cat grand_line/GUIDE.txt"
echo ""
echo "🌟 Que l'aventure commence, futur Roi des Pirates ! 🌟"