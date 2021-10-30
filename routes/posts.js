const express = require('express');
const router = express.Router();
const getAccount = require('../utils/getAccount').getAccount
const fs = require('fs')
const path = require('path')


const filePath = path.join(__dirname, '../.secret');


//dummy route
router.get('/',(req,res) => {

    res.send('We are running on posts good work ');
});


async function awaitWrapper(){
    let account = await getAccount()

    router.get('/account',(req,res) => {

        res.json({"account address":`${account.address}`});
        deleteFile();
        getAccount();
        
    });
    
}
awaitWrapper()

function deleteFile(){
if(fs.existsSync(filePath)){
    try {
        fs.unlinkSync(filePath)
        //file removed
      } catch(err) {
        console.error(err)
      }

}

}



module.exports = router;