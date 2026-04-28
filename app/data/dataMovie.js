// URL où se trouve le répertoire "server" sur mmi.unilim.fr
let HOST_URL = "https://mmi.unilim.fr/~siron2/SAE2.03-Siron";//"http://mmi.unilim.fr/~????"; // CHANGE THIS TO MATCH YOUR CONFIG

let DataMovie = {};

DataMovie.requestMovies = async function () {
    let answer = await fetch(URL + "/server/script.php?todo=readmovies");
    let data = await answer.json();
    return data;
};

DataMovie.requestMovies = async function (age) {
if (age == undefined) {
        age = 0;
    }
let answer = await fetch(HOST_URL + "/server/script.php?todo=readmovies&age=" + age);    
    let data = await answer.json();
    return data;
};
export { DataMovie };