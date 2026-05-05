let templateFile = await fetch('./component/FeaturedList/template.html');
let template = await templateFile.text();

let templateLiFile = await fetch('./component/FeaturedList/templateLi.html');
let templateLi = await templateLiFile.text();

let FeaturedList = {};

FeaturedList.formatContainer = function (hSearch) {
    let html = template;
    html = html.replaceAll("{{hSearch}}", hSearch);
    return html;
};
FeaturedList.formatItems = function (movies) {
    let listHtml = "";
    if (movies && movies.length > 0) {
        for (let movie of movies) {
            let li = templateLi;
            let isFeatured = (movie.mis_en_avant == 1);
            let newStatus = isFeatured ? 0 : 1;

            li = li.replaceAll("{{name}}", movie.name);
            li = li.replaceAll("{{category}}", movie.category_nom ? movie.category_nom : "Inconnue");
            li = li.replaceAll("{{statusText}}", isFeatured ? "Mis en avant" : "Normal");
            li = li.replaceAll("{{btnText}}", isFeatured ? "Retirer" : "Mettre en avant");
            li = li.replaceAll("{{btnState}}", isFeatured ? "remove" : "add");
            li = li.replaceAll("{{hUpdate}}", `C.handlerUpdateFeatured(${movie.id}, ${newStatus})`);

            listHtml += li;
        }
    } else {
        listHtml = "<p class='featuredList__empty'>Aucun film trouvé.</p>";
    }
    return listHtml;
};

export { FeaturedList };