const express = require("express");
const serverless = require("serverless-http");
const cors = require("cors");
const bodyParser = require("body-parser");
const mysql = require("mysql");

const app = express();

const connection = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: "tipple"
});


app.use(cors());
app.use(bodyParser.json());

app.get("/getallcocktails", function(req, res) {


  connection.query("SELECT id, name FROM cocktail ",
                  function(err, data) {
    if (err) {
      console.log("Error fetching all cocktails", err);
      res.status(500).json({
        error: err
      });
    } else {
      res.json({
        cocktails: data
      });
    }
  });

});


app.get("/getcocktailbyname/:name", function(req, res) {

const name = req.params.name;

  connection.query("SELECT id, name FROM cocktail " +
                   "WHERE name = ?",
                   [name],
                  function(err, data) {
    if (err) {
      console.log("Error fetching cocktail by name", err);
      res.status(500).json({
        error: err
      });
    } else {
      res.json({
        cocktails: data
      });
    }
  });

});


app.get("/getcocktaildrink/:drink1name/:drink2name/:drink3name", function(req, res) {
  // app.get("/drinks/:drink1name", function(req, res) {
    const drink1name = req.params.drink1name;
    const drink2name = req.params.drink2name;
    const drink3name = req.params.drink3name;

    let querypart1 = "SELECT DISTINCT cocktail.id, cocktail.name FROM cocktail " +
    "INNER JOIN cocktail_drink ON cocktail_drink.cocktailid = cocktail.id " +
    "INNER JOIN drink ON cocktail_drink.drinkid = drink.id ";
    let querypart2 = "";
    let querypart3 = "";
    let querypart4 = "";

  if (drink1name != "empty") {
    querypart2 = "WHERE drink.name= ?"
  }
  if (drink2name != "empty") {
    querypart3 = " OR drink.name= ?"
  }
  if (drink3name != "empty") {
    querypart4 = " OR drink.name= ?"
  }

  // connection.query("SELECT DISTINCT cocktail.id, cocktail.name FROM cocktail " +
  //                  "INNER JOIN cocktail_drink ON cocktail_drink.cocktailid = cocktail.id " +
  //                  "INNER JOIN drink ON cocktail_drink.drinkid = drink.id " +
  //                  "WHERE drink.name= ?" + 
  //                  " OR drink.name= ?" +
  //                  " OR drink.name = ?",

  connection.query(querypart1 + querypart2 + querypart3 + querypart4,
                  [drink1name, drink2name, drink3name], 
                  function(err, data) {
    if (err) {
      console.log("Error fetching cocktails using drinks", err);
      res.status(500).json({
        error: err
      });
    } else {
      res.json({
        cocktails: data
      });
    }
  });

});



app.post("/cocktail", function(req, res) {
  const name = req.body.name;
  const alcoholic = req.body.alcoholic;
  const drinks = req.body.drinks;
  const recipe = req.body.recipe;

  res.json({
    message: "Received a request to add a cocktail " + name
  });
});
app.delete("/cocktail/:cocktailid", function(req, res) {
  const id = req.params.cocktailid;

  res.json({
    message: "Received a request to delete a cocktail "
  });
  // Respond to the request somehow
});

app.put("/favourite/:cocktailid/:username", function(req, res) {
  const cocktailid = req.params.cocktailid;
  const username = req.params.username;

  res.json({
    message: "Received a request to set a favourite cocktail for " + username
  });
  // Respond to the request somehow
});

app.put("/cocktail/:cocktailid/:recipe", function(req, res) {
  const cocktailid = req.params.cocktailid;
  const recipe = req.params.recipe;

  res.json({
    message: "Received a request to set a favourite cocktail for " + recipe
  });
  // Respond to the request somehow
});

module.exports.cocktail = serverless(app);
