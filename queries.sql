DROP SCHEMA IF EXISTS db;
CREATE DATABASE IF NOT EXISTS db;
USE db;

CREATE TABLE Contents(
content_id integer NOT NULL PRIMARY KEY auto_increment,
id integer NOT NULL,
title varchar(1000) NOT NULL,
`time` date,
img varchar(1000) DEFAULT '...',
intro varchar(1000) NOT NULL,
body varchar(1000) NOT NULL,
conclusion varchar(1000) NOT NULL,
`reference` varchar(1000) NOT NULL,
upvotes integer,
downvotes integer,
contenttype varchar(100)
);

CREATE TABLE `User`(
id integer NOT NULL auto_increment,
firstname varchar(1000) NOT NULL,
lastname varchar(1000) NOT NULL,
username varchar(1000) NOT NULL,
email varchar(1000) NOT NULL,
password varchar(1000) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE Science AS
(SELECT id, title, `time`, img, intro, body, conclusion, `reference`, upvotes, downvotes, contenttype FROM Contents);
ALTER TABLE Science
ADD content_id integer NOT NULL PRIMARY KEY auto_increment;

CREATE TABLE Fav AS
(SELECT id, title, `time`, img, intro, body, conclusion, `reference`, upvotes, downvotes, contenttype FROM Contents);
ALTER TABLE Fav
ADD content_id integer NOT NULL PRIMARY KEY auto_increment;

CREATE TABLE News AS
(SELECT id, title, `time`, img, intro, body, conclusion, `reference`, upvotes, downvotes, contenttype FROM Contents);
ALTER TABLE News
ADD content_id integer NOT NULL PRIMARY KEY auto_increment;

CREATE TABLE Other AS
(SELECT id, title, `time`, img, intro, body, conclusion, `reference`, upvotes, downvotes, contenttype FROM Contents);
ALTER TABLE Other
ADD content_id integer NOT NULL PRIMARY KEY auto_increment;

CREATE TABLE Gaming AS
(SELECT id, title, `time`, img, intro, body, conclusion, `reference`, upvotes, downvotes, contenttype FROM Contents);
ALTER TABLE Gaming
ADD content_id integer NOT NULL PRIMARY KEY auto_increment;

USE db;
INSERT INTO Science VALUES (
1,
'Monkey',
'2022-1-01',
'...',
'Monkeys, including apes, can be distinguished from other primates by having only two pectoral nipples, a pendulous penis, and a lack of sensory whiskers',
'Before humans went into space in the 1960s, several other animals were launched into space, including numerous other primates, so that scientists could investigate the biological effects of spaceflight. The United States launched flights containing primate passengers primarily between 1948 and 1961 with one flight in 1969 and one in 1985. France launched two monkey-carrying flights in 1967. The Soviet Union and Russia launched monkeys between 1983 and 1996. Most primates were anesthetized before lift-off.',
'The first primate launched was Albert, a rhesus macaque, who on June 11, 1948, rode to over 63 km (39 mi) in Earths atmosphere on a V-2 rocket. Albert died of suffocation during the flight',
'https://www.nasa.gov/',
0,
0,
'Science',
1
);

INSERT INTO Science VALUES (
1,
'Dogs',
'2022-1-01',
'...',
'The dog or domestic dog (Canis familiaris or Canis lupus familiaris) is a domesticated descendant of the wolf, and is characterized by an upturning tail. The dog is derived from an ancient, extinct wolf, and the modern wolf is the dogs nearest living relative',
'The dog was the first species to be domesticated, by hunter–gatherers over 15,000 years ago, before the development of agriculture. Due to their long association with humans, dogs have expanded to a large number of domestic individuals and gained the ability to thrive on a starch-rich diet that would be inadequate for other canids',
'The dog has been selectively bred over millennia for various behaviors, sensory capabilities, and physical attributes. Dog breeds vary widely in shape, size, and color. They perform many roles for humans, such as hunting, herding, pulling loads, protection, assisting police and the military, companionship, therapy, and aiding disabled people. Over the millennia, dogs became uniquely adapted to human behavior, and the human-canine bond has been a topic of frequent study',
'https://www.petsmart.com/',
0,
0,
'Science',
2
);

INSERT INTO Science VALUES (
1,
'Cats',
'2022-1-01',
'...',
'The cat (Felis catus) is a domestic species of small carnivorous mammal.It is the only domesticated species in the family Felidae and is often referred to as the domestic cat to distinguish it from the wild members of the family. A cat can either be a house cat, a farm cat or a feral cat; the latter ranges freely and avoids human contact',
'The cat is similar in anatomy to the other felid species: it has a strong flexible body, quick reflexes, sharp teeth and retractable claws adapted to killing small prey. Its night vision and sense of smell are well developed. Cat communication includes vocalizations like meowing, purring, trilling, hissing, growling and grunting as well as cat-specific body language.',
'As of 2017, the domestic cat was the second-most popular pet in the United States, with 95.6 million cats owned and around 42 million households own at least one cat. In the United Kingdom, 26% of adults have a cat with an estimated population of 10.9 million pet cats as of 2020',
'https://www.petsmart.com/',
0,
0,
'Science',
3
);

INSERT INTO Science  VALUES (
2,
'Engineering',
'2022-1-07',
'...',
'Engineers, as practitioners of engineering, are professionals who invent, design, analyze, build and test machines, complex systems, structures, gadgets and materials to fulfill functional objectives and requirements while considering the limitations imposed by practicality, regulation, safety and cost',
'A professional engineer is competent by virtue of his/her fundamental education and training to apply the scientific method and outlook to the analysis and solution of engineering problems. He/she is able to assume personal responsibility for the development and application of engineering science and knowledge, notably in research, design, construction, manufacturing, superintending, managing and in the education of the engineer.',
'The work of engineers forms the link between scientific discoveries and their subsequent applications to human and business needs and quality of life',
'https://www.engineering.com/home',
0,
0,
'Science',
4
);

INSERT INTO Science  VALUES (
2,
'Dentist',
'2022-1-07',
'...',
'A dentist, also known as a dental surgeon, is a health care professional who specializes in dentistry (the diagnosis, prevention, and treatment of diseases and conditions of the oral cavity). The dentists supporting team aids in providing oral health services. The dental team includes dental assistants, dental hygienists, dental technicians, and sometimes dental therapists',
'In China as well as France, the first people to perform dentistry were barbers. They have been categorized into 2 distinct groups: guild of barbers and lay barbers. The first group, the Guild of Barbers, was created to distinguish more educated and qualified dental surgeons from lay barbers. Guild barbers were trained to do complex surgeries. The second group, the lay barbers, were qualified to perform regular hygienic services such as shaving and tooth extraction as well as basic surgery.',
'In the 20th century, new dental techniques and technology were invented such as: the porcelain crowns (1903), Novocain (a local anesthetic) 1905, precision cast fillings (1907), nylon toothbrushes (1938), water fluoridation (1945), fluoride toothpaste (1950), air driven dental tools (1957), lasers (1960), electric toothbrushes (1960), and home tooth bleaching kits (1989) were invented. Inventions such as the air driven dental tools ushered in a new high-speed dentistry.',
'https://lincolnfamilydentistry.com/high-end-dentures/',
0,
0,
'Science',
5
);

INSERT INTO Other VALUES (
1,
'Pizza an attraction for all!',
'2022-1-01',
'...',
'Pizza (Italian: [ˈpittsa], Neapolitan: [ˈpittsə]) is a dish of Italian origin consisting of a usually round, flat base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients (such as anchovies, mushrooms, onions, olives, pineapple, meat, etc.), which is then baked at a high temperature, traditionally in a wood-fired oven.[1] A small pizza is sometimes called a pizzetta. A person who makes pizza is known as a pizzaiolo.',
'The term pizza was first recorded in the 10th century in a Latin manuscript from the Southern Italian town of Gaeta in Lazio, on the border with Campania. Modern pizza was invented in Naples, and the dish and its variants have since become popular in many countries.It has become one of the most popular foods in the world and a common fast food item in Europe, North America and Australasia; available at pizzerias (restaurants specializing in pizza), restaurants offering Mediterranean cuisine, via pizza delivery, and as street food.[5] Various food companies sell ready-baked pizzas, which may be frozen, in grocery stores, to be reheated in a home oven.',
'n 2017, the world pizza market was US$128 billion, and in the US it was $44 billion spread over 76,000 pizzerias.[6] Overall, 13% of the U.S. population aged 2 years and over consumed pizza on any given day',
'http://www.joespizzanyc.com/',
0,
0,
'Other',
1
);

INSERT INTO Other VALUES (
1,
'Cake',
'2022-1-01',
'...',
'Cake is a form of sweet food made from flour, sugar, and other ingredients, that is usually baked. In their oldest forms, cakes were modifications of bread, but cakes now cover a wide range of preparations that can be simple or elaborate, and that share features with other desserts such as pastries, meringues, custards, and pies',
'The most commonly used cake ingredients include flour, sugar, eggs, butter or oil or margarine, a liquid, and a leavening agent, such as baking soda or baking powder. Common additional ingredients and flavourings include dried, candied, or fresh fruit, nuts, cocoa, and extracts such as vanilla, with numerous substitutions for the primary ingredients. Cakes can also be filled with fruit preserves, nuts or dessert sauces (like pastry cream), iced with buttercream or other icings.',
'Cake is often served as a celebratory dish on ceremonial occasions, such as weddings, anniversaries, and birthdays. There are countless cake recipes; some are bread-like, some are rich and elaborate, and many are centuries old. Cake making is no longer a complicated procedure; while at one time considerable labor went into cake making (particularly the whisking of egg foams), baking equipment and directions have been simplified so that even the most amateur of cooks may bake a cake.',
'https://en.wikipedia.org/wiki/Cake',
0,
0,
'Other',
2
);

INSERT INTO Other VALUES (
1,
'Rice',
'2022-1-01',
'...',
'Rice is the seed of the grass species Oryza sativa (Asian rice) or less commonly Oryza glaberrima (African rice). The name wild rice is usually used for species of the genera Zizania and Porteresia, both wild and domesticated, although the term may also be used for primitive or uncultivated varieties of Oryza.',
'The traditional method for cultivating rice is flooding the fields while, or after, setting the young seedlings. This simple method requires sound irrigation planning but reduces the growth of less robust weed and pest plants that have no submerged growth state, and deters vermin. While flooding is not mandatory for the cultivation of rice, all other methods of irrigation require higher effort in weed and pest control during growth periods and a different approach for fertilizing the soil.',
'Rice cultivation is well-suited to countries and regions with low labor costs and high rainfall, as it is labor-intensive to cultivate and requires ample water. However, rice can be grown practically anywhere, even on a steep hill or mountain area with the use of water-controlling terrace systems. Although its parent species are native to Asia and certain parts of Africa, centuries of trade and exportation have made it commonplace in many cultures worldwide.',
'https://en.wikipedia.org/wiki/Rice',
0,
0,
'Other',
3
);

INSERT INTO News VALUES (
2,
'There was a discovery of xyz',
'2022-1-07',
'...',
'In a shop, a cashier (or checkout operator) is a person who scans the goods through a cash register that the customer wishes to purchase at the retail store. In most modern shops, the items are scanned by a barcode positioned on the item with the use of a laser scanner. After all of the goods have been scanned, the cashier then collects the payment (in cash, check and/or by credit/debit card) for the goods or services exchanged, records the amount received, makes change, and issues receipts or tickets to customers.',
'Cashiers will record amounts received and may prepare reports of transactions, reads and record totals shown on cash register tape and verify against cash on hand. A cashier may be required to know value and features of items for which money is received; may cash checks; may give cash refunds or issue credit memorandums to customers for returned merchandise; and may operate ticket-dispensing machines and the like.',
'Cashiers are at risk of repetitive strain injuries due to the repeated movements often necessary to do the job, such as entering information on a keypad or moving product over a scanner. Included also is the physical strain of standing on ones feet for several hours in one spot. Because of this, many cashiers are only able to do a six-hour-long shift under different policies.',
'https://en.wikipedia.org/wiki/Cashier',
0,
0,
'News',
1
);

INSERT INTO Gaming Values (
1,
'Gaming',
'2022-1-01',
'...',
'Space smells like a combination of diesel fuel and barbecue, according to astronauts. The smell is caused by dying stars.',
'In the Vietnam protest rally scene in Forrest Gump where Tom Hank’s mic is cut, what he actually says is “Sometimes when people go to Vietnam, they go home to their mommas without any legs. Sometimes they don’t go home at all. That’s a bad thing. That’s all I have to say about that',
'The chocolate chip cookie was invented by Ruth Graves Wakefield in the mid-1930s. She owned the Toll House Inn, a popular restaurant in Whitman, Massachusetts. Wakefield claims to have invented the chocolate chip cooking while riffing on a classic butterscotch nut cookie recipe. To this day, every bag of Nestlé chocolate chips sold in North America has her original recipe on it.',
'https://www.gamestop.com//',
0,
0,
'Gaming',
1
);

INSERT INTO Fav VALUES (
1,
'Gaming',
'2022-1-01',
'...',
'Space smells like a combination of diesel fuel and barbecue, according to astronauts. The smell is caused by dying stars.',
'In the Vietnam protest rally scene in Forrest Gump where Tom Hank’s mic is cut, what he actually says is “Sometimes when people go to Vietnam, they go home to their mommas without any legs. Sometimes they don’t go home at all. That’s a bad thing. That’s all I have to say about that',
'The chocolate chip cookie was invented by Ruth Graves Wakefield in the mid-1930s. She owned the Toll House Inn, a popular restaurant in Whitman, Massachusetts. Wakefield claims to have invented the chocolate chip cooking while riffing on a classic butterscotch nut cookie recipe. To this day, every bag of Nestlé chocolate chips sold in North America has her original recipe on it.',
'https://www.gamestop.com//',
0,
0,
'Gaming',
1
);

INSERT INTO Fav VALUES (
2,
'There was a discovery of xyz',
'2022-1-07',
'...',
'In a shop, a cashier (or checkout operator) is a person who scans the goods through a cash register that the customer wishes to purchase at the retail store. In most modern shops, the items are scanned by a barcode positioned on the item with the use of a laser scanner. After all of the goods have been scanned, the cashier then collects the payment (in cash, check and/or by credit/debit card) for the goods or services exchanged, records the amount received, makes change, and issues receipts or tickets to customers.',
'Cashiers will record amounts received and may prepare reports of transactions, reads and record totals shown on cash register tape and verify against cash on hand. A cashier may be required to know value and features of items for which money is received; may cash checks; may give cash refunds or issue credit memorandums to customers for returned merchandise; and may operate ticket-dispensing machines and the like.',
'Cashiers are at risk of repetitive strain injuries due to the repeated movements often necessary to do the job, such as entering information on a keypad or moving product over a scanner. Included also is the physical strain of standing on ones feet for several hours in one spot. Because of this, many cashiers are only able to do a six-hour-long shift under different policies.',
'https://en.wikipedia.org/wiki/Cashier',
0,
0,
'News',
2
);

INSERT INTO Fav VALUES (
1,
'Rice',
'2022-1-01',
'...',
'Rice is the seed of the grass species Oryza sativa (Asian rice) or less commonly Oryza glaberrima (African rice). The name wild rice is usually used for species of the genera Zizania and Porteresia, both wild and domesticated, although the term may also be used for primitive or uncultivated varieties of Oryza.',
'The traditional method for cultivating rice is flooding the fields while, or after, setting the young seedlings. This simple method requires sound irrigation planning but reduces the growth of less robust weed and pest plants that have no submerged growth state, and deters vermin. While flooding is not mandatory for the cultivation of rice, all other methods of irrigation require higher effort in weed and pest control during growth periods and a different approach for fertilizing the soil.',
'Rice cultivation is well-suited to countries and regions with low labor costs and high rainfall, as it is labor-intensive to cultivate and requires ample water. However, rice can be grown practically anywhere, even on a steep hill or mountain area with the use of water-controlling terrace systems. Although its parent species are native to Asia and certain parts of Africa, centuries of trade and exportation have made it commonplace in many cultures worldwide.',
'https://en.wikipedia.org/wiki/Rice',
0,
0,
'Other',
3
);

INSERT INTO Fav VALUES (
2,
'Monkey',
'2022-1-01',
'...',
'Monkeys, including apes, can be distinguished from other primates by having only two pectoral nipples, a pendulous penis, and a lack of sensory whiskers',
'Before humans went into space in the 1960s, several other animals were launched into space, including numerous other primates, so that scientists could investigate the biological effects of spaceflight. The United States launched flights containing primate passengers primarily between 1948 and 1961 with one flight in 1969 and one in 1985. France launched two monkey-carrying flights in 1967. The Soviet Union and Russia launched monkeys between 1983 and 1996. Most primates were anesthetized before lift-off.',
'The first primate launched was Albert, a rhesus macaque, who on June 11, 1948, rode to over 63 km (39 mi) in Earths atmosphere on a V-2 rocket. Albert died of suffocation during the flight',
'https://www.nasa.gov/',
0,
0,
'Science',
4
);

INSERT INTO `User` Values (
    1, 
    'Elon',
    'Musk',
    'Musk',
    'test@gmail.com',
    '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D8'
);

INSERT INTO `User` Values (
    2, 
    'Elon2',
    'Musk2',
    'Musk2',
    'test2@gmail.com',
    'B9C950640E1B3740E98ACB93E669C65766F6670DD1609BA91FF41052BA48C6F3'
);

USE db;
INSERT INTO Contents VALUES (
1,
1,
'Monkey',
'2022-1-01',
'...',
'Monkeys, including apes, can be distinguished from other primates by having only two pectoral nipples, a pendulous penis, and a lack of sensory whiskers',
'Before humans went into space in the 1960s, several other animals were launched into space, including numerous other primates, so that scientists could investigate the biological effects of spaceflight. The United States launched flights containing primate passengers primarily between 1948 and 1961 with one flight in 1969 and one in 1985. France launched two monkey-carrying flights in 1967. The Soviet Union and Russia launched monkeys between 1983 and 1996. Most primates were anesthetized before lift-off.',
'The first primate launched was Albert, a rhesus macaque, who on June 11, 1948, rode to over 63 km (39 mi) in Earths atmosphere on a V-2 rocket. Albert died of suffocation during the flight',
'https://www.nasa.gov/',
0,
0,
'Science'
);

INSERT INTO Contents VALUES (
2,
1,
'Dogs',
'2022-1-01',
'...',
'The dog or domestic dog (Canis familiaris or Canis lupus familiaris) is a domesticated descendant of the wolf, and is characterized by an upturning tail. The dog is derived from an ancient, extinct wolf, and the modern wolf is the dogs nearest living relative',
'The dog was the first species to be domesticated, by hunter–gatherers over 15,000 years ago, before the development of agriculture. Due to their long association with humans, dogs have expanded to a large number of domestic individuals and gained the ability to thrive on a starch-rich diet that would be inadequate for other canids',
'The dog has been selectively bred over millennia for various behaviors, sensory capabilities, and physical attributes. Dog breeds vary widely in shape, size, and color. They perform many roles for humans, such as hunting, herding, pulling loads, protection, assisting police and the military, companionship, therapy, and aiding disabled people. Over the millennia, dogs became uniquely adapted to human behavior, and the human-canine bond has been a topic of frequent study',
'https://www.petsmart.com/',
0,
0,
'Science'
);

INSERT INTO Contents VALUES (
3,
1,
'Cats',
'2022-1-01',
'...',
'The cat (Felis catus) is a domestic species of small carnivorous mammal.It is the only domesticated species in the family Felidae and is often referred to as the domestic cat to distinguish it from the wild members of the family. A cat can either be a house cat, a farm cat or a feral cat; the latter ranges freely and avoids human contact',
'The cat is similar in anatomy to the other felid species: it has a strong flexible body, quick reflexes, sharp teeth and retractable claws adapted to killing small prey. Its night vision and sense of smell are well developed. Cat communication includes vocalizations like meowing, purring, trilling, hissing, growling and grunting as well as cat-specific body language.',
'As of 2017, the domestic cat was the second-most popular pet in the United States, with 95.6 million cats owned and around 42 million households own at least one cat. In the United Kingdom, 26% of adults have a cat with an estimated population of 10.9 million pet cats as of 2020',
'https://www.petsmart.com/',
0,
0,
'Science'
);

INSERT INTO Contents  VALUES (
4,
2,
'Engineering',
'2022-1-07',
'...',
'Engineers, as practitioners of engineering, are professionals who invent, design, analyze, build and test machines, complex systems, structures, gadgets and materials to fulfill functional objectives and requirements while considering the limitations imposed by practicality, regulation, safety and cost',
'A professional engineer is competent by virtue of his/her fundamental education and training to apply the scientific method and outlook to the analysis and solution of engineering problems. He/she is able to assume personal responsibility for the development and application of engineering science and knowledge, notably in research, design, construction, manufacturing, superintending, managing and in the education of the engineer.',
'The work of engineers forms the link between scientific discoveries and their subsequent applications to human and business needs and quality of life',
'https://www.engineering.com/home',
0,
0,
'Science'
);

INSERT INTO Contents VALUES (
5,
2,
'Dentist',
'2022-1-07',
'...',
'A dentist, also known as a dental surgeon, is a health care professional who specializes in dentistry (the diagnosis, prevention, and treatment of diseases and conditions of the oral cavity). The dentists supporting team aids in providing oral health services. The dental team includes dental assistants, dental hygienists, dental technicians, and sometimes dental therapists',
'In China as well as France, the first people to perform dentistry were barbers. They have been categorized into 2 distinct groups: guild of barbers and lay barbers. The first group, the Guild of Barbers, was created to distinguish more educated and qualified dental surgeons from lay barbers. Guild barbers were trained to do complex surgeries. The second group, the lay barbers, were qualified to perform regular hygienic services such as shaving and tooth extraction as well as basic surgery.',
'In the 20th century, new dental techniques and technology were invented such as: the porcelain crowns (1903), Novocain (a local anesthetic) 1905, precision cast fillings (1907), nylon toothbrushes (1938), water fluoridation (1945), fluoride toothpaste (1950), air driven dental tools (1957), lasers (1960), electric toothbrushes (1960), and home tooth bleaching kits (1989) were invented. Inventions such as the air driven dental tools ushered in a new high-speed dentistry.',
'https://lincolnfamilydentistry.com/high-end-dentures/',
0,
0,
'Science'
);
