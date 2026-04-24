let templateFile = await fetch("./component/MovieDetail/template.html");
let template = await templateFile.text();
let templateLiFile = await fetch("./component/MovieDetail/templateLi.html");
let templateLi = await templateLiFile.text();

let MovieDetail = {};

MovieDetail.format = function (data) {
    let html = template;

    let listHtml = "";
    for (let movie of data) {
        let li = templateLi;
        li = li.replaceAll("{{title}}", movie.name);
        li = li.replaceAll("{{image}}", "../server/images/" + movie.image);
        li = li.replaceAll("{{description}}", movie.description);
        li = li.replaceAll("{{realisateur}}", movie.director);
        li = li.replaceAll("{{annee}}", movie.year);
        li = li.replaceAll("{{category}}", movie.id_category);
        li = li.replaceAll("{{age}}", movie.min_age);
        li = li.replaceAll("{{trailer}}", movie.trailer);

        listHtml += li;
    }
    html = html.replaceAll("{{detailList}}", listHtml);
    return html;
};

export { MovieDetail };