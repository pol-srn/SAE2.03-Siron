let templateFile = await fetch('./component/MovieForm/template.html');
let template = await templateFile.text();
let templateLiFile = await fetch("./component/MovieForm/templateLi.html");
let templateLi = await templateLiFile.text();


let MovieForm = {};

MovieForm.format = function (data,handler) {
    let html = template;
    let listMovie = "";
    for (let movie of data) {
        let li = templateLi;
        li = li.replaceAll("{{id}}", movie.id);
        li = li.replaceAll("{{name}}", movie.name);

        listMovie += li;
    }
    html = html.replaceAll('{{idList}}', listMovie);
    html = html.replaceAll('{{handler}}', handler);
    return html;
}


export { MovieForm };

