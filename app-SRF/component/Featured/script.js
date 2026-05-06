let templateFile = await fetch("./component/Featured/template.html");
let template = await templateFile.text();
let templateLiFile = await fetch("./component/Featured/templateLi.html");
let templateLi = await templateLiFile.text();

let Featured = {};

Featured.format = function (data) {
    let html = template;
    if (data.length === 0) {
        html = html.replaceAll("{{list}}", "<p class='featured__empty'>Aucun film mis en avant pour le moment.</p>");
    } else {
        let htmlList = "";
        for (let movie of data) {
            let li = templateLi;
            li = li.replaceAll("{{image}}", "../server/images/" + movie.image);
            li = li.replaceAll("{{title}}", movie.name);
            li = li.replaceAll("{{description}}", movie.description);
            li = li.replaceAll("{{id}}", movie.id);

            htmlList += li;
        }
        html = html.replaceAll("{{list}}", htmlList);
    }
    return html;
};

export { Featured };