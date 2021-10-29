const express = require('express');
const router = express.Router();
const getAccount = require('../utils/getAccount').getAccount


router.get('/',(req,res) => {

    res.send('We are running on posts good work ');
});


async function awaitWrapper(){
    let account = await getAccount()

    router.get('/account',(req,res) => {

        res.send(`Account address: ${account.address}`);
    });
    
}
awaitWrapper()

module.exports = router;