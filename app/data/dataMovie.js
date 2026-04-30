// URL où se trouve le répertoire "server" sur mmi.unilim.fr
let HOST_URL = "..";//"http://mmi.unilim.fr/~????"; // CHANGE THIS TO 

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

export { DataMovie };