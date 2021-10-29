const express = require("express");
const app = express();
const postRoute = require('./routes/posts');



app.use('/posts',postRoute);


app.get('/',(req,res) => {

    res.send('We are running');
});


app.listen(3000);