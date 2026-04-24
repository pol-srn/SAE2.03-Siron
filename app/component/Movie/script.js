let templateFile = await fetch("./component/Movie/template.html");
let template = await templateFile.text();
let templateLiFile = await fetch("./component/Movie/templateLi.html");
let templateLi = await templateLiFile.text();

let Movie = {};

Movie.format = function (data) {
    let html = template;
    if (data.length == 0) {
        return html.replaceAll(
            "{{list}}",
            "<p class='movie__empty'>Aucun film n'est disponible pour le moment</p>",
        );
    } else {

        let htmlList = "";
        for (let list of data) {
            let li = templateLi;
            li = li.replaceAll("{{image}}", "../server/images/" +  list.image);
            li = li.replaceAll("{{title}}", list.name);
            li = li.replaceAll("{{id}}", list.id);
    
            htmlList += li;
        }
        html = html.replaceAll("{{list}}", htmlList);
        return html;
    }
};

export { Movie };