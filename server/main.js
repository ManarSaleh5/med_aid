const e = require("express");
const express = require("express");
const mysql = require("mysql2/promise");

let db = null;
const app = express();

app.use(express.json());


app.get('/hi', async (req, res, next) => {
  
  const text = req.url;
  const myArray = text.split("%22");
  let result = "hh";

  res.json(result);

  next();
});

app.post('/create-user', async (req, res, next) => {

  const User_Name = req.body.name;
  const email = req.body.email;
  const password = req.body.password;
  const city= req.body.city;
  const town = req.body.town;
  const street = req.body.street;
  const phone = req.body.phone;
  const [rows] = await db.query("SELECT * FROM `userreg` WHERE `email` = (?);", [email]);
  if(rows.length==0){
    await db.query("INSERT INTO userreg (`name`, `email`, `Password`, `city`, `town`, `street`, `phone`) VALUES (?,?,?,?,?,?,?);", [User_Name,email, password, city, town, street , phone]);
    res.json({ status: "OK" });
  }
  else  res.json({ status: "email already exist" });

 
  next();
});

app.get('/userlog', async (req, res, next) => {
 const text = req.url;
  const myArray = text.split("%22");

  
   const email = myArray[3];
   const password =myArray[7];
   console.log(text);
 
  const [rows] =
  await db.query("SELECT id FROM `userreg` WHERE `email` = (?)and `password`= (?);", [email,password]);

  var str = JSON.stringify(rows[0]);
  const n2 = " ";
  console.log(rows);
if(rows.length>0){const n = str.split(":");
console.log("jj");
  const n2 = n[1].split("}");
  console.log(n2[0]);
  res.json(n2[0]);
}
 else  res.json( "email or password are not correct" );
  next();
});

app.get('/accountinfo', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split(":");
  
  const idd = myArray[1];
 
  const [rows] = await db.query("SELECT  * FROM `userreg` WHERE `id` = (?);", [idd]);

  var str = JSON.stringify(rows[0]);
  //console.log(str);
  const myArr = str.split(",");
  const Fullname = myArr[1].split(":");
  const city = myArr[4].split(":");
  const email = myArr[2].split(":");
  const street = myArr[6].split(":");
  const town = myArr[5].split(":");
  const p = myArr[7].split(":");
  const  phone= p[1].split("}");
  let t = Fullname[1] + "&" + city[1] + "&" + email[1] + "&" + street[1]+ "&" + town[1]+ "&" + phone[0];
  let result = t.replaceAll("\"", "");

  res.json(result);

  next();
});

app.post('/change-account', async (req, res, next) => {
  const id = req.body.id;
  const name = req.body.name;
  const email = req.body.email;
  const city = req.body.city;
  const town = req.body.town;
   const street = req.body.street; 
  const phone = req.body.phone;

  await db.query("UPDATE `userreg` SET `name`= (?) , `email`= (?) , `city`= (?) , `town`= (?) , `street`= (?) , `phone`= (?) WHERE `id`= (?);", [name,email,city,town,street,phone,id]);

  res.json({ status: "OK" });
  next();
});
app.get('/userpassword', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split(":");
  console.log(text);
  const idd = myArray[1];

  const [rows] = await db.query("SELECT `Password` FROM `userreg` WHERE `id` = (?);", [idd]);

  var str = JSON.stringify(rows[0]);
  console.log(str);
  const password  = str.split(":");
  //var str1=password;
  console.log(password)
  const password1= password[1].split("}");
  console.log(password1[0]);
  let result = password1[0].replaceAll("\}", "");
  res.json(result);


  next();
});
app.post('/change-password', async (req, res, next) => {
  const id = req.body.id;
  const password = req.body.password;
  await db.query("UPDATE `userreg` SET `Password`= (?) WHERE `id`= (?);", [password, id]);

  res.json({ status: "OK" });
  next();
});


async function main() {
  db = await mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "med_aid",
    timezone: "+00:00",
    charset: "utf8mb4_general_ci",
  });

  app.listen(8000);
}
main();