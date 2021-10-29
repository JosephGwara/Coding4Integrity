const express = require("express");
const app = express();
const postRoute = require('./routes/posts');


//middleware
app.use('/posts',postRoute);

//Home route
app.get('/',(req,res) => {

    res.send('We are running');
});


app.listen(3000);