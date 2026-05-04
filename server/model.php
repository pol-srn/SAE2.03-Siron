<?php
// Activer le rapport d'erreurs PHP
error_reporting(E_ALL);

// Forcer l'affichage des erreurs à l'écran
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);

/**
 * Ce fichier contient toutes les fonctions qui réalisent des opérations
 * sur la base de données, telles que les requêtes SQL pour insérer, 
 * mettre à jour, supprimer ou récupérer des données.
 */

/**
 * Définition des constantes de connexion à la base de données.
 *
 * HOST : Nom d'hôte du serveur de base de données, ici "localhost".
 * DBNAME : Nom de la base de données
 * DBLOGIN : Nom d'utilisateur pour se connecter à la base de données.
 * DBPWD : Mot de passe pour se connecter à la base de données.
 */
define("HOST", "localhost");
define("DBNAME", "SAE2.03");
define("DBLOGIN", "usersae203");
define("DBPWD", "Wnxbcv266400!");



function getAllMovies($age) {
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    
    $sql = "SELECT Movie.id, Movie.name, Movie.image, Category.name AS category_nom 
            FROM Movie, Category 
            WHERE Movie.id_category = Category.id 
            AND Movie.min_age <= :age";
            
    $stmt = $cnx->prepare($sql);
    
    $stmt->bindParam(':age', $age);
    
    $stmt->execute();
    
    $res = $stmt->fetchAll(PDO::FETCH_OBJ);
    return $res;
}

function addMovie($name, $year, $length, $description, $director, $id_category, $image, $trailer, $min_age){
    // Connexion à la base de données
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD); 
    // Requête SQL de mise à jour du menu avec des paramètres
    $sql = "INSERT INTO Movie (name, year, length, description, director, id_category, image, trailer, min_age) 
    VALUES (:name, :year, :length, :description, :director, :id_category, :image, :trailer, :min_age)";
    // Prépare la requête SQL
    $stmt = $cnx->prepare($sql);
    // Lie les paramètres aux valeurs
    $stmt->bindParam(':name', $name);
    $stmt->bindParam(':year', $year);
    $stmt->bindParam(':length', $length);
    $stmt->bindParam(':description', $description);
    $stmt->bindParam(':director', $director);
    $stmt->bindParam(':id_category', $id_category);
    $stmt->bindParam(':image', $image);
    $stmt->bindParam(':trailer', $trailer);
    $stmt->bindParam(':min_age', $min_age);
    // Exécute la requête SQL
    $stmt->execute();
    // Récupère le nombre de lignes affectées par la requête
    $res = $stmt->rowCount(); 
    return $res; // Retourne le nombre de lignes affectées
}

function getAllCategories(){
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD); 
    $sql = "SELECT id, name FROM Category";
    $stmt = $cnx->prepare($sql);
    $stmt->execute();
    $res = $stmt->fetchAll(PDO::FETCH_OBJ); 
    return $res;
}

function getMovieDetails($id){
$cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD); 
$sql = " SELECT Movie.*, Category.name AS category_name
    FROM Movie
    INNER JOIN Category ON Movie.id_category = Category.id
    WHERE Movie.id = :id";
    $stmt = $cnx->prepare($sql);
    $stmt->bindParam(':id', $id);
    $stmt->execute();
    $res = $stmt->fetchAll(PDO::FETCH_OBJ); 
    return $res;
}

function addProfile($nom, $avatar, $age) {
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    $sql = " INSERT INTO Profile (nom, avatar, 
    age_restriction)
             VALUES (:nom, :avatar, :age)";
    $stmt = $cnx->prepare($sql);
    $stmt->bindParam(':nom', $nom);
    $stmt->bindParam(':avatar', $avatar);
    $stmt->bindParam(':age', $age);
    $stmt->execute();
    $res = $stmt->rowCount(); 
    return $res;
}


function updateProfile($id, $nom, $avatar, $age) {
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    $sql = "UPDATE Profile SET nom = :nom, avatar = :avatar, age_restriction = :age WHERE id = :id";
    $stmt = $cnx->prepare($sql); 
    $stmt->bindParam(':nom', $nom);
    $stmt->bindParam(':avatar', $avatar);
    $stmt->bindParam(':age', $age);
    $stmt->bindParam(':id', $id);
    $res = $stmt->execute(); 
    return $res; 
}

function getAllProfiles(){
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    $sql = "SELECT * FROM Profile";
    $stmt = $cnx->prepare($sql);
    $stmt->execute();
    $res = $stmt->fetchAll(PDO::FETCH_OBJ);
    return $res;
}

function addFavorite($id_profil, $id_film) {
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    $sql = "INSERT INTO favoris (id_profil, id_film) VALUES (:id_profil, :id_film)";
    $stmt = $cnx->prepare($sql);
    $stmt->bindParam(':id_profil', $id_profil);
    $stmt->bindParam(':id_film', $id_film);
    return $stmt->execute();
}

function getFavorites($id_profil) {
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    $sql = "SELECT Movie.* FROM Movie INNER JOIN favoris fav ON Movie.id = fav.id_film WHERE fav.id_profil = :id_profil";
    $stmt = $cnx->prepare($sql);
    $stmt->bindParam(':id_profil', $id_profil);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_OBJ);
}

function removeFavorite($id_profil, $id_film) {
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    $sql = "DELETE FROM favoris WHERE id_profil = :id_profil AND id_film = :id_film";
    $stmt = $cnx->prepare($sql);
    $stmt->bindParam(':id_profil', $id_profil);
    $stmt->bindParam(':id_film', $id_film);
    return $stmt->execute();
}

function getFeaturedMovies() {
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    $sql = "SELECT id, name, image, description FROM Movie WHERE mis_en_avant = 1";
    $stmt = $cnx->prepare($sql);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_OBJ);
}



function getTotalProfiles() {
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    $sql = "SELECT COUNT(*) as total FROM Profile";
    $stmt = $cnx->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_OBJ);
    foreach($result as $row) { return $row->total; }
}

function getTotalMovies() {
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    $sql = "SELECT COUNT(*) as total FROM Movie";
    $stmt = $cnx->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_OBJ);
    foreach($result as $row) { return $row->total; }
}

function getAverageFavorites() {
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    $sql = "SELECT ROUND(COUNT(id_film) / COUNT(DISTINCT id_profil), 1) as moyenne FROM favoris";
    $stmt = $cnx->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_OBJ);
    foreach($result as $row) { return $row->moyenne ? $row->moyenne : 0; }
    return 0;
}

function getTopMovie() {
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    $sql = "SELECT Movie.name, COUNT(fav.id_film) as total_fav 
            FROM Movie 
            INNER JOIN favoris fav ON Movie.id = fav.id_film 
            GROUP BY Movie.id 
            ORDER BY total_fav DESC LIMIT 1";
    $stmt = $cnx->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_OBJ);
    foreach($result as $row) { return $row->name; }
    return "Aucun";
}

function getTopCategory() {
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    $sql = "SELECT Category.name as category_name, COUNT(fav.id_film) as total_fav 
            FROM Movie 
            INNER JOIN favoris fav ON Movie.id = fav.id_film 
            INNER JOIN Category ON Movie.id_category = Category.id
            GROUP BY Category.id 
            ORDER BY total_fav DESC LIMIT 1";
    $stmt = $cnx->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_OBJ);
    foreach($result as $row) { return $row->category_name; }
    return "Aucune";
}

function getStatistics() {
    $stats = new stdClass();
    $stats->total_profiles = getTotalProfiles();
    $stats->total_movies = getTotalMovies();
    $stats->moyenne_favoris = getAverageFavorites();
    $stats->top_movie = getTopMovie();
    $stats->top_category = getTopCategory();
    return $stats;
}













?>