# Doc Base de Données - SAE 2.03

## 1. Choix des types de données

- Clés primaires (id) : `INT` en Auto-Incrément pour toutes les tables.
- Textes courts (noms, réalisateurs, noms de fichiers images/trailers) : `VARCHAR` (de 50 à 250 selon le besoin).
- Textes longs (description) : `TEXT` pour éviter de tronquer les synopsis un peu trop longs.
- Nombres (année, durée, âge requis) : `INT` tout simplement, pas besoin de décimales.
- Entier (mis_en_avant) : `INT` (0 = non, 1 = oui) pour gérer ça facilement dans le code.

## 2. Cardinalités et relations
- Movie & Category : Un film appartient au minimu à une seule catégorie et au maximum à une seule catégorie`(1,1)`, mais une catégorie peut regrouper au minimu aucun films et au maximum plein de films `(0,n)`.
- Profile & Movie (Favoris) : Un profil peut avoir au minimu aucun films en favoris et au maximum plusieurs films en favoris `(0,n)` et un film peut être le favori de au minimu aucun profils et au maximu de plusieurs profils `(0,n)`

## 3. Requêtes SQL utilisées par itération


* Itération 1 : Consulter la liste des films
  Cette requête récupère les infos de base des films en y joignant le nom de leur catégorie pour l'affichage.
  `SELECT Movie.id, Movie.name, Movie.image, Category.name AS category_nom FROM Movie, Category WHERE Movie.id_category = Category.id AND Movie.min_age <= :age`

* Itération 2 : Ajouter des films dans la base de données
  Permet d'insérer un nouveau film depuis le formulaire d'administration avec toutes ses caractéristiques.
  `INSERT INTO Movie (name, year, length, description, director, id_category, image, trailer, min_age) VALUES (:name, :year, :length, :description, :director, :id_category, :image, :trailer, :min_age)`

* Itération 3 : Consulter les détails d'un film
  On cible un film précis grâce à son identifiant (`:id`). Je fais une jointure (`INNER JOIN`) pour récupérer en même temps le nom de sa catégorie au lieu d'afficher son `id_category`.
  `SELECT Movie.*, Category.name AS category_name FROM Movie INNER JOIN Category ON Movie.id_category = Category.id WHERE Movie.id = :id`

* Itération 4 : Afficher les films par catégorie
  Pour afficher les films triés, on récupère d'abord la liste des catégories existantes, puis on charge les films associés via la requête de l'itération 1.
  `SELECT id, name FROM Category`

* Itération 5 : Ajouter des profils utilisateur
  Insertion pour enregistrer le nom, l'avatar et l'âge d'un nouveau profil depuis le panel admin.
  `INSERT INTO Profile (nom, avatar, age_restriction) VALUES (:nom, :avatar, :age)`

* Itération 6 : Pouvoir choisir un profil utilisateur
  Récupère la liste complète des profils stockés en base pour les afficher sur l'écran de sélection de profil.
  `SELECT * FROM Profile`

* Itération 7 : Filtrer les contenus selon l'âge du profil
  C'est la même requête que pour l'itération 1, mais on utilise le paramètre `:age` (l'âge du profil actif) pour s'assurer que l'âge minimum requis pour le film (`min_age`) est inférieur ou égal à l'âge du profil.
  `SELECT Movie.id, Movie.name, Movie.image, Category.name AS category_nom FROM Movie, Category WHERE Movie.id_category = Category.id AND Movie.min_age <= :age`

* Itération 8 : Modifier un profil utilisateur
  Met à jour les informations d'un profil ciblé par son identifiant (`:id`).
  `UPDATE Profile SET nom = :nom, avatar = :avatar, age_restriction = :age WHERE id = :id`

* Itération 9 : Ajouter aux favoris
  On insère une nouvelle ligne dans la table de liaison `favoris` pour relier le profil actif et le film cliqué.
  `INSERT INTO favoris (id_profil, id_film) VALUES (:id_profil, :id_film)`
  Pour afficher la liste de favoris ensuite, on fait une jointure entre `Movie` et `favoris` :
  `SELECT Movie.* FROM Movie INNER JOIN favoris fav ON Movie.id = fav.id_film WHERE fav.id_profil = :id_profil`

* Itération 10 : Retirer des favoris
  On supprime la ligne correspondante dans la table de liaison si l'utilisateur décoche le cœur.
  `DELETE FROM favoris WHERE id_profil = :id_profil AND id_film = :id_film`

* Itération 11 : Films mis en avant
  On récupère uniquement les films dont l'entier `mis_en_avant` est à 1 (vrai) pour les afficher dans le grand carrousel de l'accueil.
  `SELECT id, name, image, description FROM Movie WHERE mis_en_avant = 1`

* Itération 12 : Statistiques
  J'ai créé plusieurs requêtes spécifiques pour faire les calculs directement côté base de données :
  - Total des profils et films :
    `SELECT COUNT(*) as total FROM Profile`
    `SELECT COUNT(*) as total FROM Movie`
  - Moyenne de favoris par profil :
    `SELECT ROUND(COUNT(id_film) / COUNT(DISTINCT id_profil), 1) as moyenne FROM favoris`
  - Film et catégorie les plus populaires (avec COUNT, JOIN et GROUP BY) :
    `SELECT Movie.name, COUNT(fav.id_film) as total_fav FROM Movie INNER JOIN favoris fav ON Movie.id = fav.id_film GROUP BY Movie.id ORDER BY total_fav DESC LIMIT 1`
    `SELECT Category.name as category_name, COUNT(fav.id_film) as total_fav FROM Movie INNER JOIN favoris fav ON Movie.id = fav.id_film INNER JOIN Category ON Movie.id_category = Category.id GROUP BY Category.id ORDER BY total_fav DESC LIMIT 1`

* Itération 13 : Champ de recherche
  Je fais une recherche non sensible à la casse (`LOWER`) qui cherche le mot-clé n'importe où dans le titre avec le joker `%` (`LIKE`). Je conserve aussi le filtre de l'âge du profil.
  `SELECT Movie.*, Category.name AS category_nom FROM Movie INNER JOIN Category ON Movie.id_category = Category.id WHERE LOWER(Movie.name) LIKE LOWER(:keyword) AND Movie.min_age <= :age`

* Itération 14 : Rechercher et gérer le statut "mis en avant"
  J'utilise la même requête de recherche que l'itération 13 pour trouver le film côté admin, puis je lance une requête d'UPDATE pour changer son statut de mise en avant.
  `UPDATE Movie SET mis_en_avant = :status WHERE id = :id_film`