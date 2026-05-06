let templateFile = await fetch("./component/Statistic/template.html");
let template = await templateFile.text();

let Statistic = {};

Statistic.format = function (data) {
    let html = template;

    html = html.replaceAll("{{total_profiles}}", data.total_profiles);
    html = html.replaceAll("{{total_movies}}", data.total_movies);
    html = html.replaceAll("{{moyenne_favoris}}", data.moyenne_favoris);
    html = html.replaceAll("{{top_movie}}", data.top_movie);
    html = html.replaceAll("{{top_category}}", data.top_category);

    return html;
};

export { Statistic };