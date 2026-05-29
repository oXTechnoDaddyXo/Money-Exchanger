const body = document.body;

window.addEventListener("message", function(event){

    const data = event.data;

    // OPEN

    if(data.action === "open"){

        body.style.display = "block";

        document.getElementById("welcome").innerText =
            data.language.welcome;

        document.getElementById("description").innerText =
            data.language.description;

        document.getElementById("rateTitle").innerText =
            data.language.currentRate;
    }

    // UPDATE

    if(data.action === "updateData"){

        document.getElementById("cash").innerText =
            data.cash;

        document.getElementById("gold").innerText =
            data.gold;

        document.getElementById("goldRate").innerText =
            `${data.goldToCash} CASH`;

        document.getElementById("cashRate").innerText =
            `${data.cashToGold} GOLD`;
    }

    // NOTIFY

    if(data.action === "notify"){

        ShowNotify(
            data.notifyType,
            data.message
        );
    }

    // CLOSE

    if(data.action === "close"){

        body.style.display = "none";
    }
});

function ShowNotify(type, message){

    const notify =
        document.getElementById("notify");

    notify.innerHTML = `

        <div class="notify-title">
            ${
                type === "success"
                ? "GOLD EXCHANGE"
                : "ERROR"
            }
        </div>

        <div class="notify-message">
            ${message}
        </div>
    `;

    if(type === "success"){

        notify.style.background =
            "rgba(30,90,45,0.95)";
    }

    else{

        notify.style.background =
            "rgba(120,20,20,0.95)";
    }

    notify.style.display = "block";

    setTimeout(() => {

        notify.style.opacity = "1";

        notify.style.transform =
            "translateX(0px)";

    }, 10);

    setTimeout(() => {

        notify.style.opacity = "0";

        notify.style.transform =
            "translateX(60px)";

        setTimeout(() => {

            notify.style.display = "none";

        }, 300);

    }, 2000);
}

document
.getElementById("cashButton")
.addEventListener("click", function(){

    fetch(`https://${GetParentResourceName()}/exchangeCashToGold`, {

        method: "POST",

        headers: {
            "Content-Type": "application/json"
        },

        body: JSON.stringify({

            amount:
                document.getElementById("cashAmount").value
        })
    });
});

document
.getElementById("goldButton")
.addEventListener("click", function(){

    fetch(`https://${GetParentResourceName()}/exchangeGoldToCash`, {

        method: "POST",

        headers: {
            "Content-Type": "application/json"
        },

        body: JSON.stringify({

            amount:
                document.getElementById("goldAmount").value
        })
    });
});

document
.getElementById("closeButton")
.addEventListener("click", function(){

    fetch(`https://${GetParentResourceName()}/close`, {

        method: "POST"
    });
});

document.addEventListener("keydown", function(e){

    if(e.key === "Escape"){

        fetch(`https://${GetParentResourceName()}/close`, {

            method: "POST"
        });
    }
});