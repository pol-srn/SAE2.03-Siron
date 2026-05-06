let templateFile = await fetch('./component/ProfileForm/template.html');
let template = await templateFile.text();
let templateLiFile = await fetch('./component/ProfileForm/templateLi.html');
let templateLi = await templateLiFile.text();

let ProfileForm = {};

ProfileForm.format = function(handler, handlerChange, data) {
    let html = template;
    let listProfiles = "";
    for (let profile of data) {
        let li = templateLi;
        li = li.replaceAll("{{id}}", profile.id);
        li = li.replaceAll("{{name}}", profile.nom);
        
        listProfiles += li;
    }
    html = html.replaceAll("{{idList}}", listProfiles);
    html = html.replaceAll("{{handler}}", handler);
    html = html.replaceAll("{{handlerChange}}", handlerChange);
    return html;
}
ProfileForm.fill = function (profil) {
    let form = document.querySelector('.addProfile__form');
    
    if (!profil) {
        form.reset();
    } else {
        form.querySelector('input[name="nom"]').value = profil.nom;
        form.querySelector('input[name="avatar"]').value = profil.avatar;
        form.querySelector('select[name="age"]').value = profil.age_restriction;
    }
};

export { ProfileForm };