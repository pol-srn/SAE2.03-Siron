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
define("DBNAME", "siron2");
define("DBLOGIN", "siron2");
define("DBPWD", "siron2");



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