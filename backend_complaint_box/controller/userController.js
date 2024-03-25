const User = require('../model/userModel.js')
const Complaint  = require('../model/complaintmodel.js')

// const post_details = (req , res) => {

//     console.log("Update Called")
//     try{
//         const {id , linkedIn , email , phone} = req.body;
//         // const new_user = new User({ 
//         //     id: id,
//         //     linkedUrl: linkedIn,
//         //     profile_url: profile_url,
//         //     phone: phone
//         // });

//         User.findOneAndUpdate({id: id} , {
//             linkedUrl: linkedIn,
//             email: email,
//             phone: phone
//         })  .then((result) => res.status(201).json({msg: "Updated Sucessfully"}))
//             .catch((err) => {
//                 console.log(err)
//                 res.status(404).json({msg: "Error"})
//             })
//     }
//     catch{
//         res.status(500).json({msg:"Internal server error"});
//     }
// }

// const post_me = (req , res) => {

//     console.log('called');

//     try{
//         const {name , id, profile_url , linkedIn , email , phone} = req.body;
//         const new_user = new User({
//             id: id,
//             name: name,
//             email: email,
//             linkedUrl: linkedIn,
//             profile_url: profile_url,
//             phone: phone
//         });

//         new_user.save()
//             .then((val) => {
//                 res.status(201).json({msg: "Inserted Successfully"});
//             })
//             .catch((err) => res.status(404).json({msg:"Incorrect Details"}))
//     }
//     catch{
//         res.status(500).json({msg:"Internal server error"});
//     }
// }

// const get_details = (req , res) => {

//     console.log("Called");
//     try{
//     const id = req.params.id;
//     User.findOne({id:id})
//         .then((result) => res.status(200).json({det: result}))
//         .catch((err) => {
//             console.log(err)
//             res.status(404).json({msg: "Error"})
//         })
//     }
//     catch{
//         res.status(500).json({msg: "Internal Server error"})
//     }
// }

const add_complaint = (req , res) => {

    console.log("called")
    console.log(req.body)

    try{
        const {id ,category , des , status} = req.body;
        // console.log(req.body);
        console.log(id , category , des);
        const new_complaint = new Complaint({
            id,
            category,
            description : des,
            status: status
        });

        new_complaint.save()
                    .then((result) => res.status(200).json({msg: "Added Successfull"}))
                    .catch((err) => {
                        console.log(err);
                        res.status(404).json({msg: "Error"})
                    })
    }
    catch(err){
        console.log(err)
        res.status(500).json({msg: "Internal Server error"})
    }
}

const get_complaints_user = (req , res) =>{

    try{

        Complaint.find({id: req.params.id})
                .then((result) => res.status(200).json(result))
                .catch((err) => res.status(404).json({msg: "Error"}))
    }
    catch{
        res.status(500).json({msg: "Internal Server error"})
    }
}

const get_all_queries = (req , res) => {

    console.log("called")
    try{
        Complaint.find()
                .then((result) => {
                    res.status(200).json({complaints: result})
                })
    }
    catch{
        res.status(500).json({msg:"Internal server error"})
    }
}

const solve_query = (req , res) => {

    try{
        console.log(req.params.id);
        Complaint.findByIdAndUpdate(req.params.id , {
            status: "solved"
        })
            .then((result) => res.status(201).json({msg:"Updated sucessfully"}))
            .catch((err) => {
                console.log(err);
                res.status(404).json({msg: "Error"})
            })
    }
    catch{
        res.status(500).json({msg: "Internal server error"})
    }
}

const accept_query = (req , res) => {

    try{
        console.log("Accept called")
        console.log(req.params.id);
        Complaint.findByIdAndUpdate(req.params.id , {
            status: "accepted"
        })
            .then((result) => res.status(201).json({msg:"Updated sucessfully"}))
            .catch((err) => {
                console.log(err);
                res.status(404).json({msg: "Error"})
            })
    }
    catch{
        res.status(500).json({msg: "Internal server error"})
    } 
}

const login_user = (req , res) => {

    try{
        // print("Login Called")

        const {name , password} = req.body;
        User.findOne({name : name , password : password})
            .then((result) => res.status(200).json({msg: "Sucessfull" , det: result}))
            .catch((err) => {
                console.log(err);
                res.status(404).json({msg : "User not found"})
            })
    }
    catch(err){
        console.log(err)
        res.status(500).json({msg: "Internal server error"})
    }
}

const sigin_user = (req, res) => {

    try{

        const {name , password} = req.body;
        const new_user = new User({
            name,
            password
        })

        new_user.save()
                .then((result) => res.status(200).json({det: result}))
                .catch((err) => {
                console.log(err);
                res.status(404).json({msg : "Error"})
            })
    }
    catch(err){
        console.log(err);
        res.status(500).json({msg: "Internal server error"})
    }
}

module.exports = {

    // post_details,
    // post_me,
    // get_details,
    add_complaint,
    get_complaints_user,
    get_all_queries,
    solve_query,
    login_user,
    sigin_user,
    accept_query
}