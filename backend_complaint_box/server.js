const express = require('express')
const app = express()
const mongoose = require('mongoose')
const routes = require('./routes/route.js')
const bodyParser = require('body-parser')
const cors = require('cors')

var url = 'mongodb+srv://swaroopch1234:Swaroop_89@Cluster0.qsvj1tn.mongodb.net/pro_space?retryWrites=true&w=majority';

mongoose.connect(url)
        .then(() => {
            console.log("connected to db")
            app.listen(3000 , '0.0.0.0' , () => {
                console.log("Server is running");
            })
        })
        .catch((err) => console.log("hi"))

app.use(express.urlencoded())
app.use(bodyParser.json())
app.use(cors())

app.use('/' , routes)