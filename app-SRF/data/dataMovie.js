let HOST_URL = "..";

let DataMovie = {};

DataMovie.requestMovies = async function (age) {
    if (age == undefined) {
        age = 0;
    }
    let answer = await fetch(HOST_URL + "/server/script.php?todo=readmovies&age=" + age);
    let data = await answer.json();
    return data;
};

DataMovie.requestMovieDetails = async function (id_film) {
    let answer = await fetch(HOST_URL + "/server/script.php?todo=readMovieDetail&id=" + id_film);
    let data = await answer.json();
    return data;
};

DataMovie.addFavorite = async function (id_profil, id_film) {
    let answer = await fetch(HOST_URL + "/server/script.php?todo=addFavorite&id_profil=" + id_profil + "&id_film=" + id_film);
    let data = await answer.json();
    return data;
};

DataMovie.readFavorites = async function (id_profil) {
    let answer = await fetch(HOST_URL + "/server/script.php?todo=readFavorites&id_profil=" + id_profil);
    let data = await answer.json();
    return data;
};

DataMovie.removeFavorite = async function (id_profil, id_film) {
    let answer = await fetch(HOST_URL + "/server/script.php?todo=removeFavorite&id_profil=" + id_profil + "&id_film=" + id_film);
    return await answer.json();
};

DataMovie.applyFavoriteTags = function (moviesData, favoritesData) {
    for (let fav of favoritesData) {
        fav.isFav = true;
    }
    for (let categoryName in moviesData) {
        for (let movie of moviesData[categoryName]) {
            movie.isFav = false;
            for (let fav of favoritesData) {
                if (fav.id == movie.id) {
                    movie.isFav = true;
                }
            }
        }
    }
};

DataMovie.readFeaturedMovies = async function () {
    let answer = await fetch(HOST_URL + "/server/script.php?todo=readFeaturedMovies");
    return await answer.json();
};

DataMovie.readStatistics = async function () {
    let answer = await fetch(HOST_URL + "/server/script.php?todo=readStatistics");
    let data = await answer.json();
    return data;
};

DataMovie.searchMovies = async function (keyword, age) {
    let answer = await fetch(HOST_URL + "/server/script.php?todo=searchMovies&keyword=" + keyword + "&age=" + age);
    let data = await answer.json();
    return data;
};

export { DataMovie };