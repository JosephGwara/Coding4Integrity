const express = require("express");
const app = express();
const getAccount = require('./utils/getAccount').getAccount


async function awaitWrapper(){
    let account = await getAccount()

    app.get('/',(req,res) => {

        res.send(`Account address: ${account.address}`);
    });
    
}

awaitWrapper()

app.listen(3000);