import {dbank} from "../../declarations/dbank";

async function update(){
    const balance = await dbank.getBalance();
    document.getElementById("value").innerText = Math.round(balance*100)/100;
    document.getElementById("input-amount").value="";
    document.getElementById("withdrawal-amount").value="";
}

window.addEventListener("load", async function(){
    await update();
})

document.getElementById("form").addEventListener("submit", async function(event){
    event.preventDefault();
    const button = event.target.querySelector("#submit-btn");
    //getting the input value from the user 
    const addAmount = parseFloat(document.getElementById("input-amount").value);
    const withdrawalAmount = parseFloat(document.getElementById("withdrawal-amount").value);
    // disabling the button once the submit event is occured
    button.setAttribute("disabled",true);
    if(document.getElementById("input-amount").value.length!= 0)
    {
        await dbank.topUp(addAmount);
    }
    if(document.getElementById("withdrawal-amount").value.length!=0)
    {
        await dbank.withdraw(withdrawalAmount);
    }
    await dbank.compoundInterest();
    update();
    button.removeAttribute("disabled");
})