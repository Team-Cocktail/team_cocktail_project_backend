
CREATE DATABASE tipple;

 USE tipple;

 CREATE TABLE user (username VARCHAR(20), firstName VARCHAR(30), lastName VARCHAR(30), PRIMARY KEY (username));

 CREATE TABLE cocktail(id VARCHAR(36),
                       name VARCHAR(30),
                       difficulty SMALLINT(2),
                       glass VARCHAR(20),
                       alcoholic BOOLEAN,
                       recipe VARCHAR(500),
                       PRIMARY KEY (id)
 );

 CREATE TABLE drink(id VARCHAR(36),
                     name VARCHAR(30),
                     PRIMARY KEY (id)
);

CREATE TABLE cocktail_drink (id         VARCHAR(36),
                             cocktailid VARCHAR(36),
                             drinkid    VARCHAR(36),
FOREIGN KEY (cocktailid) REFERENCES cocktail(id),
FOREIGN KEY (drinkid) REFERENCES drink(id)
);

CREATE TABLE favourite_cocktail (id VARCHAR(36),
                                 cocktailid VARCHAR(36),
                                 username VARCHAR(36),
FOREIGN KEY (cocktailid) REFERENCES cocktail(id),
FOREIGN KEY (username) REFERENCES user(username)
);




-- INSERT INTO cocktail (id, name, difficulty, glass, alcoholic, recipe)
-- VALUES (UUID(), "Mojito",5, "Hi Ball", true, "Mix everything together and add vegetables");
INSERT INTO cocktail (id, name, difficulty, glass, alcoholic, recipe)
VALUES ("1", "Mojito",5, "Hi Ball", true, "Mix everything together and add vegetables");

INSERT INTO cocktail (id, name, difficulty, glass, alcoholic, recipe)
VALUES ("2", "Cosmopolitan",4, "Martini", true, "Put everything in a shaker with ice and pour into glass");

INSERT INTO cocktail (id, name, difficulty, glass, alcoholic, recipe)
VALUES ("3", "Snow Ball",6, "Hi Ball", true, "Put lemonade in glass. Stir until most of the bubbles had gone. Pour in advacaat followed by a dash of lime. Mix with a spoon to get a froth on top");

INSERT INTO cocktail (id, name, difficulty, glass, alcoholic, recipe)
VALUES ("4", "Black Russian",1,"Hi Ball", true, "Pour vodka and coke into a glass over ice" );

INSERT INTO cocktail (id, name, difficulty, glass, alcoholic, recipe)
VALUES ("5", "B52", 8, "Scooner", true, "Carefully pour the Tia Maria into the glass. Next the Baileys. Finally the Cointreau");

INSERT INTO cocktail (id, name, difficulty, glass, alcoholic, recipe)
VALUES ("6", "Sunset", 2, "Hi Ball", false, "Pour the orange into a galss. Next mix the in the cranberry juic and stir");

INSERT INTO cocktail (id, name, difficulty, glass, alcoholic, recipe)
VALUES ("7", "Tropical brach", 2, "Hi Ball", false, "Pour the orange juice and pineapple juice into a galss. Next stir and add an umbrella");


INSERT INTO drink (id, name)
VALUES ("1", "vodka");

INSERT INTO drink (id, name)
VALUES ("2", "gin");

INSERT INTO drink (id, name)
VALUES ("3", "cola");

INSERT INTO drink (id, name)
VALUES ("4", "lemonade");

INSERT INTO drink (id, name)
VALUES ("5", "cointreau");

INSERT INTO drink (id, name)
VALUES ("6", "tia maria");

INSERT INTO drink (id, name)
VALUES ("7", "baileys");

INSERT INTO drink (id, name)
VALUES ("8", "advocaat");

INSERT INTO drink (id, name)
VALUES ("9", "orange juice");

INSERT INTO drink (id, name)
VALUES ("10", "cranberry juice");

INSERT INTO drink (id, name)
VALUES ("11", "tequilla");

INSERT INTO cocktail_drink (id, cocktailid, drinkid)
VALUES ("1","1","1");

INSERT INTO cocktail_drink (id, cocktailid, drinkid)
VALUES ("2","1","2");

INSERT INTO cocktail_drink (id, cocktailid, drinkid)
VALUES ("3","1","4");

INSERT INTO cocktail_drink (id, cocktailid, drinkid)
VALUES ("4","2","1");

INSERT INTO cocktail_drink (id, cocktailid, drinkid)
VALUES ("5","2","10");

INSERT INTO cocktail_drink (id, cocktailid, drinkid)
VALUES ("6","3","4");

INSERT INTO cocktail_drink (id, cocktailid, drinkid)
VALUES ("7","3","8");

-- SELECT DISTINCT cocktail.name 
-- FROM cocktail 
-- INNER JOIN cocktail_drink ON cocktail_drink.cocktailid = cocktail.id
-- INNER JOIN drink ON cocktail_drink.drinkid = drink.id
-- WHERE drink.name="gin" 
-- OR drink.name="cola";
