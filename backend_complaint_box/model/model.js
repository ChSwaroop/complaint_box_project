const mongoose = require('mongoose')
const UserSchema = mongoose.Schema({

    id:{
        required:true,
        type: String,
        unique: true
    },

    name:{
        required: true,
        type: String
    },
    email:{
        required: true,
        type:String
    },
    linkedUrl:{
        type:String
    },
    profile_url:{
        type: String,
    },

    phone:{
        required:true,
        type:Number
    }
})

const model = mongoose.model('user' , UserSchema)
module.exports = model;
