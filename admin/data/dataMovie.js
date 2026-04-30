// URL où se trouve le répertoire "server" sur mmi.unilim.fr
let HOST_URL = "..";//"http://mmi.unilim.fr/~????"; // CHANGE THIS TO MATCH YOUR CONFIG

let DataMovie = {};


DataMovie.add = async function (fdata) {
    let config = {
        method: "POST", // méthode HTTP à utiliser
        body: fdata // données à envoyer sous forme d'objet FormData
    };
    let answer = await fetch(HOST_URL + "/server/script.php?todo=addmovie", config);
    
    let data = await answer.json();
    console.log(answer, data);
    return data;
}

DataMovie.requestCategories = async function(){
    let answer = await fetch(HOST_URL + "/server/script.php?todo=readCategories");
    let data = await answer.json();
    return data;
}

DataMovie.requestMovieDetails = async function (id_film) {
    let answer = await fetch(HOST_URL + "/server/script.php?todo=readMovieDetail&id=" + id_film);
    let data = await answer.json();
    return data;
};

export {DataMovie};
