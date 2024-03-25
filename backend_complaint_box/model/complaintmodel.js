const mongoose = require('mongoose')

const complaint_schema = mongoose.Schema({

    id:{
        required: true,
        type: String
    },
    
    category:{
        required: true,
        type: String
    },

    description:{
        required: true,
        type: String
    },

    status:{
        required: true,
        type: String    
    }
});

const model = mongoose.model('complaint' , complaint_schema);

module.exports = model;
