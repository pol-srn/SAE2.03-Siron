let templateFile = await fetch("./component/NavBar/template.html");
let template = await templateFile.text();

let templateLiFile = await fetch("./component/NavBar/templateLi.html");
let templateLi = await templateLiFile.text();

let NavBar = {};

NavBar.format = function (hHome, hSelectProfile, hStats, hLogout, profiles) {
    let html = template;
    
    html = html.replaceAll("{{hHome}}", hHome);
    html = html.replaceAll("{{hSelectProfile}}", hSelectProfile);
    html = html.replaceAll("{{hStats}}", hStats);
    html = html.replaceAll("{{hLogout}}", hLogout);

    let listHtml = "";
    for (let profile of profiles) {
        let li = templateLi;
        li = li.replaceAll("{{id}}", profile.id);
        li = li.replaceAll("{{nom}}", profile.nom);
        listHtml += li;
    }
    html = html.replaceAll("{{profileOptions}}", listHtml);

    return html;
};
export { NavBar };