var axios = require('axios');





function getTransHistory(){

  var config = {
    method: 'get',
    url: `https://alfajores-blockscout.celo-testnet.org/api?module=account&action=txlist&address=0x8FBbC71c7CbDd4d5F84436A441163632aF3444d9&sort=desc`,
    headers: { }
  };
  
  axios(config)
  .then(function (response) {
   // console.log(JSON.stringify(response.data));
    var History = JSON.stringify(response.data);
    //var myObj = JSON.parse(response.data);
   
  


  })
  .catch(function (error) {
    console.log(error);
  });


}
getTransHistory();


//This function gets the current Balance of CZAR within the specified address
function getAccountBalance(){

  const api = 'https://alfajores-blockscout.celo-testnet.org/api?module=account&action=tokenbalance&contractaddress=0x8D222281967aa33315dE3F422cD11787baEbFd97&address='
  var address = '0x8FBbC71c7CbDd4d5F84436A441163632aF3444d9'

  var config = {
    method: 'get',
    url: api + address,
    headers: { }
  };
  
  axios(config)
  .then(function (response) {
  // console.log(JSON.stringify(response.data));

    const accBalance = JSON.stringify(response.data);
 
   const accountBalance = JSON.parse(accBalance);
   //console.log(`Account Balance is ${accountBalance.result}`);
  
  })
  .catch(function (error) {
    console.log(error);
  });
  
  
}
//getAccountBalance();


module.exports = {
  getAccountBalance
};