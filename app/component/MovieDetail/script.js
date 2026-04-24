let templateFile = await fetch("./component/MovieDetail/template.html");
let template = await templateFile.text();
let templateLiFile = await fetch("./component/MovieDetail/templateLi.html");
let templateLi = await templateLiFile.text();

let MovieDetail = {};

MovieDetail.format = function (data) {
    let html = template;

    let mDetail = "";
    for (let mDetail of data) {
        let li = templateLi;
        li = li.replaceAll("{{title}}", mDetail.name);
        li = li.replaceAll("{{image}}", "../server/images/" + mDetail.image);
        li = li.replaceAll("{{description}}", mDetail.description);
        li = li.replaceAll("{{realisateur}}", mDetail.director);
        li = li.replaceAll("{{annee}}", mDetail.year);
        li = li.replaceAll("{{category}}", mDetail.id_category);
        li = li.replaceAll("{{age}}", mDetail.min_age);
        li = li.replaceAll("{{trailer}}", mDetail.trailer);

        mDetail += li;
    }
    html = html.replaceAll("{{detailList}}", mDetail);
    return html;
};

export { MovieDetail };