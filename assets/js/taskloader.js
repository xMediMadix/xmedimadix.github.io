//Fájl feldolgozása után a helyes eredményeket itt tárolom
let results = new Map();

function getPageName(){
    //A linux, bash és awk feladatokat is ez a szkript dolgozza fel, így ezzel kérem be éppen melyikről van szó
    let path = window.location.pathname;
    return path.split("/").pop().split('.').shift();
}
function checkAnswer(number){
    //Az adott id alapján bekéri a felhasználó válaszát és összeveti az előre megadott helyes válasszal
    let answer = document.getElementById("textarea"+number);
    let rows = results[number].split("\\n");
    let process = rows.join("\n");
    let result;
    let result_img;
    if(answer.value.trim() === process.trim()){
        result = "Szép munka!";
        result_img = "../../assets/img/good.png"
    }else{
        result = "Ajjaj valami hiba van!";
        result_img = "../../assets/img/wrong.png"
    }
    document.getElementById("res-text").innerHTML = result;
    document.getElementById("res-img").src = result_img;
    document.getElementById("alert").style.display = "block";
}
function createTask(task_type, task_title, task_description, task_file){
    //Az az element, amely szülője a feladatoknak
    let root = document.getElementById(task_type+"-tasks");
    //A feladat sorszámával megegyezően kapják az elementek az id-t
    let number = task_title.split('.').shift();
    //feladat címe
    let title = document.createElement("h4");
    title.innerHTML = task_title;
    title.classList.add("display-4", "font-weight-bold");
    root.appendChild(title);

    //feladat leírása
    let task = document.createElement("p");
    task.classList.add("task");
    task.innerHTML = task_description;
    root.appendChild(task);

    //input file letöltése
    let input_task = document.createElement("p");
    input_task.classList.add("input-file");
    input_task.innerHTML = task_file;
    root.appendChild(input_task);

    //eredmény beírására szánt textarea
    let input_field = document.createElement("p");
    input_field.classList.add("result-input-field");
    root.appendChild(input_field);

    let input_label = document.createElement("label");
    input_label.for="exampleFormControlTextarea1";
    input_label.classList.add("form-label");
    input_label.innerHTML = "Írd/másold be a megfelelő eredményt az alábbi mezőbe:"
    input_field.appendChild(input_label);

    let textarea = document.createElement("textarea");
    textarea.classList.add("form-control");
    textarea.id = "textarea"+number; //azonosításra
    textarea.rows = "4";
    input_field.appendChild(textarea);

    let button = document.createElement("button");
    button.classList.add("btn","btn-dark","check-button");
    button.onclick = function(){
        //adott feladathoz tartozó eredmény ellenőrzés
        checkAnswer(number);
    }
    button.innerHTML = "Ellenőrzés";
    input_field.appendChild(button);

    let alertButton = document.getElementById("alert-button");
    alertButton.onclick = function(){
        document.getElementById("alert").style.display = "none";
    }
}


window.onload = function () {
    //Fájlból beolvasva elkészíti a feladatokat
    let type = getPageName();
    let rawFile = new XMLHttpRequest();
    rawFile.open("GET", "../../teaching/os/"+type+"-tasks.txt", false);
    rawFile.onreadystatechange = function (){
        if(rawFile.readyState === 4){
            if(rawFile.status === 200 || rawFile.status === 0){
                allText = rawFile.responseText;
                let datas = allText.split('\n');
                for(let i=0;i<datas.length;i=i+4){
                    let title = datas[i].split('$').pop();
                    let description = datas[i+1].split('$').pop();
                    let file = datas[i+2].split('$').pop();
                    results[title.split('.').shift()] = datas[i+3].split("$").pop();
                    createTask(type,title,description,file);
                }
            }
        }
    }
    rawFile.send(null);
}




