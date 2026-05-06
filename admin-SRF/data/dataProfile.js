let HOST_URL = ".."; 

let DataProfile = {};

DataProfile.add = async function (fdata) {
    let config = {
        method: "POST",
        body: fdata
    };
    let answer = await fetch(HOST_URL + "/server/script.php?todo=addProfile", config);
    let data = await answer.json();
    return data;
};

DataProfile.read = async function () {
    let answer = await fetch(HOST_URL + "/server/script.php?todo=readProfiles");
    let data = await answer.json();
    return data;
};


DataProfile.readOne = async function (id) {
    let profiles = await DataProfile.read();
    for (let p of profiles) {
        if (p.id == id) {
            return p;
        }
    }
};

export { DataProfile };