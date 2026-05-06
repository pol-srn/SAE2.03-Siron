import { Movie } from "../Movie/script.js";
let templateFile = await fetch("./component/MovieCategory/template.html");
let template = await templateFile.text();

let MovieCategory = {};

MovieCategory.format = function (container, data) {
    let html = template;
    html = html.replaceAll("{{name}}", container);
    let htmlList = Movie.format(data);
    html = html.replaceAll("{{list}}", htmlList);
    return html;
};

export { MovieCategory };