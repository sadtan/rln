var express = require("express")
    app = express();
    bodyParser = require("body-parser"),
    methodOverride = require("method-override"),
    AWS = require("aws-sdk");

var flash = require("connect-flash");
const dotenv = require("dotenv");
dotenv.config();

app.use(express.static(__dirname + "/public"));
app.use(express.static(__dirname + "/views"));
app.use(methodOverride("_method"));

app.use(flash());
app.use(bodyParser.urlencoded({
    extended: true
  }));
app.use(bodyParser.json());
app.set("view engine", "ejs");

const Fondos  = require("./app/routes/fondoRoutes.js")

app.use("/fondos", Fondos);
app.use("/", require("./app/routes/index.js"));

port = process.env.PORT || 3000;
app.listen(port, function() {
	console.log("\t >>> UNPROJECT started at port " + port);
});


////////////////////////////////////////////////////// LOAD s3 SDK
//////////////////////////////////////////////////////
// // Load the AWS SDK for Node.js
// var AWS = require('aws-sdk');
// // Set the region 
// AWS.config.update({region: 'us-east-2'});

// // Create S3 service object
// s3 = new AWS.S3({apiVersion: '2006-03-01'});

// // Call S3 to list the buckets
// s3.listBuckets(function(err, data) {
//   if (err) {
//     console.log("Error", err);
//   } else {
//     console.log("Success", data.Buckets);
//   }
// });


////////////////////////////////////////////////////// CREATE BUCKET
//////////////////////////////////////////////////////
//// Create the parameters for calling createBucket
// var bucketParams = {
//     Bucket : process.argv[2],
//     ACL : 'public-read'
//   };
  
//   // call S3 to create the bucket
//   s3.createBucket(bucketParams, function(err, data) {
//     if (err) {
//       console.log("Error", err);
//     } else {
//       console.log("Success", data.Location);
//     }
//   });

////////////////////////////////////////////////////// CONFIGURE BUCKET (CORS)
//////////////////////////////////////////////////////
// // Create initial parameters JSON for putBucketCors
// var thisConfig = {
//     AllowedHeaders:["Authorization"],
//     AllowedMethods:[],
//     AllowedOrigins:["*"],
//     ExposeHeaders:[],
//     MaxAgeSeconds:3000
//   };
  
//   // Assemble the list of allowed methods based on command line parameters
//   var allowedMethods = [];
//   process.argv.forEach(function (val, index, array) {
//     if (val.toUpperCase() === "POST") {allowedMethods.push("POST")};
//     if (val.toUpperCase() === "GET") {allowedMethods.push("GET")};
//     if (val.toUpperCase() === "PUT") {allowedMethods.push("PUT")};
//     if (val.toUpperCase() === "PATCH") {allowedMethods.push("PATCH")};
//     if (val.toUpperCase() === "DELETE") {allowedMethods.push("DELETE")};
//     if (val.toUpperCase() === "HEAD") {allowedMethods.push("HEAD")};
//   });
  
//   // Copy the array of allowed methods into the config object
//   thisConfig.AllowedMethods = allowedMethods;
//   // Create array of configs then add the config object to it
//   var corsRules = new Array(thisConfig);
  
//   // Create CORS params
//   var corsParams = {Bucket: process.argv[2], CORSConfiguration: {CORSRules: corsRules}};
  
//   // set the new CORS configuration on the selected bucket
//   s3.putBucketCors(corsParams, function(err, data) {
//     if (err) {
//       // display error message
//       console.log("Error", err);
//     } else {
//       // update the displayed CORS config for the selected bucket
//       console.log("Success", data);
//     }
//   });

// call S3 to retrieve upload file to specified bucket

////////////////////////////////////////////////////// UPLOAD FILE
//////////////////////////////////////////////////////
// var uploadParams = {Bucket: process.argv[2], Key: '', Body: ''};
// var file = process.argv[3];

// // Configure the file stream and obtain the upload parameters
// var fs = require('fs');
// var fileStream = fs.createReadStream(file);
// fileStream.on('error', function(err) {
//   console.log('File Error', err);
// });
// uploadParams.Body = fileStream;
// var path = require('path');
// uploadParams.Key = path.basename(file);

// // call S3 to retrieve upload file to specified bucket
// s3.upload (uploadParams, function (err, data) {
//   if (err) {
//     console.log("Error", err);
//   } if (data) {
//     console.log("Upload Success", data.Location);
//   }
// });

////////////////////////////////////////////////////// LIST FILES
////////////////////////////////////////////////////// DELETE BUCKET
// var bucketParams = {
//     Bucket : process.argv[2],
//   };
  
//   // Call S3 to obtain a list of the objects in the bucket
//   s3.listObjects(bucketParams, function(err, data) {
//     if (err) {
//       console.log("Error", err);
//     } else {
//       console.log("Success", data);
//     }
//   });

// // Call S3 to delete the bucket
// s3.deleteBucket(bucketParams, function(err, data) {
//   if (err) {
//     console.log("Error", err);
//   } else {
//     console.log("Success", data);
//   }
// });