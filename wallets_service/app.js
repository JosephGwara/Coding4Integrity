const express = require("express");
const app = express();
const postRoute = require('./routes/posts');
const getRoute = require('./routes/get');


//middlewares
app.use('/posts',postRoute);
app.use('/get',getRoute);


//Home route
app.get('/',(req,res) => {

    res.send('We are running');
});

const PORT = process.env.PORT || 3000;
app.listen(PORT,_ => {

    console.log(`App deployed at port  ${PORT}`); }
);