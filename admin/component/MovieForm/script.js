let templateFile = await fetch('./component/MovieForm/template.html');
let template = await templateFile.text();
let templateLiFile = await fetch("./component/MovieForm/templateLi.html");
let templateLi = await templateLiFile.text();


let MovieForm = {};

MovieForm.format = function (handler) {
    let html = template;
    let listMovie = "";
    for (let movie of data) {
        let li = templateLi;
        li = li.replaceAll("{{id}}", movie.id);

        listMovie += li;
    }
    html = html.replace('{{handler}}', listMovie);
    return html;
}


export { MovieForm };

