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
app.get('/pharmciesinfo', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split(":");
  
  const idd = myArray[1];
 
 
  let result;
  
  let t;
  const [rows] = await db.query("SELECT `name` FROM `pharmacies`" );
  //const [rows] = await db.query("show columns FROM `pharmacies in med_aid`" );
  if(rows.length>0){
    var len = rows.length
   
    for (let i = 0; i < len; i++) {
      var str = JSON.stringify(rows[i]);

console.log(str);
  const myArr = str.split(":");
   console.log(myArr);
  //console.log(myArr[1]);
   const p1 = myArr[1].split("\"");
    console.log(p1);
    // const p11=p1[1];
    // console.log(p11);

    
   
  t = t+p1[1] + "&"  ;
  t=t.replaceAll("undefined", "");

  //result = t.replaceAll("\"", "");
}
console.log(t);
res.json(t);
}
else{  

 res.json("not found");}
 

  next();
});
app.get('/pharmcyid', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split(":");
  const pname = myArray[1];
  const pname1 = myArray[1].split("%22");
  const name1=pname1[1];
  let t=name1.replaceAll("%20"," ")
 
  const [rows] = 

     await db.query("SELECT `id` FROM `pharmacies` WHERE `name` = (?);", [t]);
   
     var str = JSON.stringify(rows);
     console.log(str);
     const p2 = str.split(":");
     const p3 = p2[1].split("}");
     console.log(p3[0]);
   
   


  res.json(p3[0]);

  next();
});
app.get('/showdrugs', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");
  const idd = myArray[3];
  const name1=myArray[7]; 
  const [rows] = await db.query("SELECT * FROM `drugs` WHERE `category` = (?)and `pharmacy_id`= (?);", [name1,idd] );
  //const [rows] = await db.query("show columns FROM `pharmacies in med_aid`" );
  let t ="";
  if(rows.length>0){
    var len = rows.length
   
    for (let i = 0; i < len; i++) {
      var str = JSON.stringify(rows[i]);
     // console.log(str);
      const p1 = str.split(":");
   //console.log(p1);
      const p11=p1[2];
  // console.log(p11);
   
     const p2 = p11.split("\"");
     //console.log(p2);
  //   const p3 = myArr[3].split("\"");
     t =  t+p2[1] + "&" ;
    }
   console.log(t);
    res.json(t);
  }
  else{  

    res.json("not found");}
 // res.json("kkk");
  next();
});
app.get('/showonlinedrugs', async (req, res, next) => {
  const text = req.url;
  console.log(text);
  const myArray = text.split("%22");
  const idd = myArray[3];
  const online="1"; 
  const [rows] = await db.query("SELECT name FROM `drugs` WHERE `online` = (?)and `pharmacy_id`= (?);", [online,idd] );
  //const [rows] = await db.query("show columns FROM `pharmacies in med_aid`" );
  let t ="";
  if(rows.length>0){
    var len = rows.length
   
    for (let i = 0; i < len; i++) {
      var str = JSON.stringify(rows[i]);
      console.log(str);
      const p1 = str.split(":");
   //console.log(p1);
      const p11=p1[1];
  // console.log(p11);
   
     const p2 = p11.split("\"");
     //console.log(p2);
  //   const p3 = myArr[3].split("\"");
    t =  t+p2[1] + "&" ;
    }
   //console.log(t);
    res.json(t);
  }
  else{  

    res.json("not found");}
 // res.json("kkk");
  next();
});
app.get('/showdescription', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");
  console.log(text);
  const namedrug = myArray[3];
  const [rows] = await db.query("SELECT `description` FROM `drugs` WHERE `name` = (?);", [namedrug] );
  let t ="";
  if(rows.length>0){
    var len = rows.length
   
    for (let i = 0; i < len; i++) {
      var str = JSON.stringify(rows[i]);
     // console.log(str);
      const p1 = str.split(":");
  // console.log(p1);
    const p2 = p1[1].split("\"");
     t = p2[1]  ;
    }
    res.json(t);
  }
  else{  

    res.json("not found");}
  next();
});
app.get('/showprice', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");
  console.log(text);
  const namedrug = myArray[3];
  const [rows] = await db.query("SELECT `price` FROM `drugs` WHERE `name` = (?);", [namedrug] );
  let t ="";
  if(rows.length>0){
    var len = rows.length
      var str = JSON.stringify(rows);
    //  console.log(str);
      const p1 = str.split(":");
   //console.log(p1);
    const p2 = p1[1].split("}");
     t = p2[0]  ;
 
    res.json(t);
  }
  else{  

    res.json("not found");}
  next();
});
app.get('/showtype', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");
  console.log(text);
  const namedrug = myArray[3];
  const [rows] = await db.query("SELECT `type` FROM `drugs` WHERE `name` = (?);", [namedrug] );
  let t ="";
  if(rows.length>0){
    var len = rows.length
      var str = JSON.stringify(rows);
      console.log(str);
      const p1 = str.split(":");
   console.log(p1);
    const p2 = p1[1].split("}");
    const p3=p2[0].split("\"")
     t = p3[1]  ;
 
    res.json(t);
  }
  else{  

    res.json("not found");}
  next();
});
app.get('/showlocation', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");
  console.log(text);
  const name = myArray[3];
  const [rows] = await db.query("SELECT `location` FROM ` pharmacies` WHERE `name` = (?);", [name] );
  let t ="";
  if(rows.length>0){
    var len = rows.length
      var str = JSON.stringify(rows);
      console.log(str);
      const p1 = str.split(":");
   console.log(p1);
    const p2 = p1[1].split("}");
    const p3=p2[0].split("\"")
     t = p3[1]  ;
 
    res.json(t);
  }
  else{  

    res.json("not found");}
  next();
});

app.get('/getdrug', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");
  const name1 = myArray[3];
  let id_d="";  let t ="";
  const [rows2] = await db.query("SELECT `pharmacy_id` FROM `drugs` WHERE `name` = (?);", [name1] );
  if(rows2.length>0){
    var len = rows2.length;
     for (let i = 0; i < len; i++) {
      var str1 = JSON.stringify(rows2);
      const a=str1.split(",");
     
        const p2 = a[i].split(":");
        const p3 = p2[1].split("}");
        console.log(p3[0]);
         id_d=p3[0];
       const [rows] = await db.query("SELECT `name` FROM `pharmacies` WHERE `id` = (?);", [id_d]);
       var str = JSON.stringify(rows[0]);
       console.log(str);
       const p1 = str.split(":");
       console.log(p1);
       const p11=p1[1];
      console.log(p11);
      const p22= p11.split("\"");
      t =  t+p22[1] + "&" ;
    }}
   
    else t="not";
    res.json(t);
  
    next();
});
app.get('/fridayshift', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");
  const friday = 1;
 const name1=myArray[7]; 
  const [rows] = await db.query("SELECT `name` FROM `pharmacies` WHERE `friday` = (?);", [friday] );
  var str = JSON.stringify(rows);
   const myArr = str.split(":");
   const t=myArr[1];
   let result = t.replaceAll("\"", "");
let r2=result.replaceAll("}","");
let r3=r2.replaceAll("]","");
  res.json(r3);
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
  const idd = myArray[1];

  const [rows] = await db.query("SELECT `Password` FROM `userreg` WHERE `id` = (?);", [idd]);

  var str = JSON.stringify(rows[0]);
  const password  = str.split(":");
  const password1= password[1].split("}");
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
app.get('/delete_order', async (req, res, next) => {
 
  const text = req.url;
  const myArray = text.split("%22");
 const uid =myArray[3]; 
const pid= myArray[7];
 const dname=myArray[11];
 const [rows] = await db.query("SELECT `number` FROM `online_order` WHERE `user_id` = (?)and `pharmacy_id`= (?)and `drug_name`= (?);", [uid, pid,dname]);
 var str = JSON.stringify(rows);
const t1=str.split("\"");
let t2=t1[2].replaceAll(":","");
let t3=t2.replaceAll("}","");
let t4=t3.replaceAll("]","");
await db.query("DELETE FROM `online_order` WHERE `number` = (?);", [t4]);
  res.json(t4);
  next();
});
app.get('/status_order', async (req, res, next) => {
 
  const text = req.url;
  const myArray = text.split("%22");
 const uid =myArray[3]; 
const pid= myArray[7];
 const dname=myArray[11];
 const [rows] = await db.query("SELECT `number` FROM `online_order` WHERE `user_id` = (?)and `pharmacy_id`= (?)and `drug_name`= (?);", [uid, pid,dname]);
 var str = JSON.stringify(rows);
const t1=str.split("\"");
let t2=t1[2].replaceAll(":","");
let t3=t2.replaceAll("}","");
let t4=t3.replaceAll("]","");

const [rows1] =await db.query("SELECT `status` FROM `online_order` WHERE `number` = (?);", [t4]);
var str1 = JSON.stringify(rows1);
const s1=str1.split("\"");
  res.json(s1[3]);
  next();
});
app.get('/delete_timer', async (req, res, next) => {
 
  const text = req.url;
  const myArray = text.split("%22");
  console.log(text);
 
 const id =myArray[3]; 
const timer= myArray[7];
 
 const [rows] = await db.query("SELECT `number` FROM `reminder` WHERE `id` = (?)and `time`= (?);", [id,timer]);
 var str = JSON.stringify(rows);
console.log(str);
const t1=str.split("\"");
let t2=t1[2].replaceAll(":","");
let t3=t2.replaceAll("}","");
let t4=t3.replaceAll("]","");
console.log(t4);
await db.query("DELETE FROM `reminder` WHERE `number` = (?);", [t4]);
console.log(str);
  res.json("lll");
  next();
});
app.post('/create-reminder', async (req, res, next) => {

  const name = req.body.name;
  const id= req.body.id;
  const amount = req.body.amount;
  const time= req.body.time;
    await db.query("INSERT INTO reminder (`id`, `name`, `amount`, `time`) VALUES (?,?,?,?);", [id,name, amount, time]);
    res.json({ status: "OK" });
  next();
});
app.get('/get_time', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");
  console.log(text);
 
 const idd=myArray[3]; 
 const [rows] = await db.query("SELECT `time` FROM `reminder` WHERE `id` = (?);", [idd] );
 
   let t;
  let result;
  let result1;
 let result2;
  let t2;
   if(rows.length>0){
     var len = rows.length;
     var str = JSON.stringify(rows);
     console.log(str);
     for (let i = 0; i < len; i++) {
      const myArr = str.split(",");
   const timer1 = myArr[i].split(":");
   console.log("lll");
   console.log(timer1);
   t = timer1[1] + ":" +timer1[2] ;
   console.log(t);
   result = t.replaceAll("\}", "");
   result1 = result.replaceAll("]", "");
    result2=result1.replaceAll("\"","");
t2="\""+result2+"\"";
   }}
   else result=null;
   console.log(t2);
   res.json(str);
  next();
});
app.get('/get_timere', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");
  console.log(text);
 const idd=myArray[3]; 
 const [rows] = await db.query("SELECT `time` FROM `reminder` WHERE `id` = (?);", [idd] );
 
   let t;
  let result;
  let result1;
 let result2;
  let t2;
   if(rows.length>0){
     var str = JSON.stringify(rows);
     console.log(str);
     for (let i = 0; i < rows.length; i++) {
      const myArr = str.split(",");
   const timer1 = myArr[i].split(":");
   console.log("lll");
   console.log(timer1);
   t = timer1[1] + ":" +timer1[2] ;
   console.log(t);
   result = t.replaceAll("\}","");
   result1 = result.replaceAll("]","");
    result2=result1.replaceAll("\"","");
t2=t2+result2+"&";
t2=t2.replaceAll("undefined","");
   }}
   
   else result=null;
   console.log(t2);
   res.json(t2);
  next();
});
app.get('/get_timer', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");
  console.log(text);
 const idd=myArray[3]; 
 const [rows] = await db.query("SELECT `time` FROM `reminder` WHERE `id` = (?);", [idd] );
 
   let t;
  let result;
  let result1;
 let result2;
  let t2;
   if(rows.length>0){
     var str = JSON.stringify(rows);
     console.log(str);
     for (let i = 0; i < rows.length; i++) {
      const myArr = str.split(",");
   const timer1 = myArr[i].split(":");
   console.log("lll");
   console.log(timer1);
   t = timer1[1] + ":" +timer1[2] ;
   console.log(t);
   result = t.replaceAll("\}","");
   result1 = result.replaceAll("]","");
    result2=result1.replaceAll("\"","");
t2=t2+result2+"&";
t2=t2.replaceAll("undefined","");
   }}
   
   else result=null;
   console.log(t2);
   res.json(t2);
  next();
});
app.post('/create-order', async (req, res, next) => {

  const user_id = req.body.user_id;
  const pharmacy_id= req.body.pharmacy_id;
  const drug_name = req.body.drug_name;
  const price= req.body.price;
  const status= "pending";
  const [rows] = await db.query("SELECT `name` FROM `userreg` WHERE `id` = (?);", [user_id] );
  var str = JSON.stringify(rows);
  const na=str.split("\"");
  const user_name=na[3];
    await db.query("INSERT INTO online_order (`user_id`,`user_name`, `pharmacy_id`, `drug_name`, `price`,`status`) VALUES (?,?,?,?,?,?);", [user_id,user_name,pharmacy_id, drug_name, price,status]);
    res.json({ status: "OK" });


 
  next();
});
app.get('/get_order', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");
  console.log(text);
 
 const uidd=myArray[3]; 
 const pid=myArray[7];
 const [rows] = await db.query("SELECT `drug_name` FROM `online_order` WHERE `user_id` = (?)and `pharmacy_id`= (?);", [uidd,pid] );
 
   let t;
  let result;
  let result1;
 let result2;
  let t2;
   if(rows.length>0){
     var len = rows.length;
     var str = JSON.stringify(rows);
     for (let i = 0; i < len; i++) {
      const myArr = str.split(",");
   const item1 = myArr[i].split(":");
   const item2=item1[1].split("\"");
   t = t+item2[1] + "&";
    result = t.replaceAll("\'", "");
    result=result.replaceAll("undefined", "");
   }}
   else result="not found";
   console.log(result);
   res.json(result);
  next();
});
app.get('/get_priceorder', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");
 const uidd=myArray[3]; 
 const pid=myArray[7];
 const oprice=myArray[11];
 const [rows] = await db.query("SELECT `price` FROM `online_order` WHERE `user_id` = (?)and `pharmacy_id`= (?)and `drug_name`= (?);", [uidd,pid,oprice] );
   let t;
  let result;
  let result1;
 let result2;
  let t2;
   if(rows.length>0){
     var len = rows.length;
     var str = JSON.stringify(rows);
     console.log(str);
  const myArr = str.split("{");
  const i1=myArr[1].split("}");
  
  result=i1[0]}
   else result=null;
   console.log(result);
   res.json(result);
  next();
});
app.get('/adds', async (req, res, next) => {
  const text = req.url;
  const myArray = text.split("%22");
let result="";
 
  const [rows] = 

     await db.query("SELECT `url` FROM `url`");
     if(rows.length>0){
      var len = rows.length;
      var str = JSON.stringify(rows);
      for (let i = 0; i < len; i++) {
        const myArr = str.split(",");
         const im1=myArr[i].split("{");
        const im2=im1[1].split("}");
        const im3=im2[0].split("\"");
        result=result+im3[3]+"&";
        
     
      }
    }
   else result="not found";

console.log(result);
  res.json(result);

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