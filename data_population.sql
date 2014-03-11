USE Catabase;
/*
INSERT INTO Client (lName, fName, phone, address, email, status, notes) VALUES('Heller', 'Chasity', 9158877604, 'Gabon', 'Nova@keagan.com', 'RandomStuff', 'labore nihil velit'); 
INSERT INTO Client (lName, fName, phone, email, status, address, notes) values ('Paul', 'Peters', 70237967852, 'ppeters@layo.edu', 'Found', '050 Portage Point', 'Quisque id justo sit amet sapien dignissim vestibulum.');
INSERT INTO Client (lName, fName, phone, email, status, address, notes) values ('Deborah', 'Webb', 61756075020, 'dwebb@topicware.com', 'Found','40 Bobwhite Parkway', 'In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.');
INSERT INTO Client (lName, fName, phone, email, status, address, notes) values ('Ruth', 'Hernandez', 09949844276, 'rhernandez@jaxworks.net', 'Looking','02947 Victoria Center', 'Integer ac neque. Duis bibendum.');
INSERT INTO Client (lName, fName, phone, email, status, address, notes) values ('Steve', 'Edwards', 28692085989, 'sedwards@gabtype.biz', 'Found','57907 Mifflin Drive', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.');
INSERT INTO Client (lName, fName, phone, email, status, address, notes) values ('Benjamin', 'Taylor', 5840576816, 'btaylor@eare.com', 'Looking','52916 Shelley Circle', 'Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.');
INSERT INTO Client (lName, fName, phone, email, status, address, notes) values ('Stephen', 'Lawson', 1793486716, 'slawson@rhyzio.name', 'Found','270 Lillian Park', 'Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. ');
INSERT INTO Client (lName, fName, phone, email, status, address, notes) values ('Kevin', 'Woods', 06572711116, 'kwoods@skiba.biz', 'Looking','784 Gale Circle', 'Praesent lectus.');
INSERT INTO Client (lName, fName, phone, email, status, address, notes) values ('Shirley', 'Mitchell', 45328840309, 'smitchell@realbridge.com', 'Looking', '7843 Welch Trail', 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.');
INSERT INTO Client (lName, fName, phone, email, status, address, notes) values ('Kathy', 'Richardson', 3161604410, 'krichardson@linklinks.com', 'Found','00805 Fordem Center', 'Suspendisse potenti. In eleifend quam a odio. In haolestie lorem.  ipsum.');
INSERT INTO Client (lName, fName, phone, email, status, address, notes) values ('Patricia', 'Hicks', 6008692853, 'phicks@wordware.net', 'Found','5171 Forest Dale Hill', 'Duis at velit eu est congue elementum. In hac habitasse platea dictumst.'); 

insert into Staff (manager, lName, fName, position, address, phone, email) values ('Y', 'Elliott', 'Paul', null, '991 Hagan Avenue', 29242615303, 'pelliott@kwinu.gov');
insert into Staff (manager, lName, fName, position, address, phone, email) values ('Y', 'Larson', 'Robin', null, '3 Butterfield Terrace', 88164880695, 'rlarson@riffpath.mil');
insert into Staff (manager, lName, fName, position, address, phone, email) values ('N', 'Kelly', 'Eugene', 'Employee', '3427 Twin Pines Alley', 40114241329, 'ekelly@flipopia.com');
insert into Staff (manager, lName, fName, position, address, phone, email) values ('N', 'Perkins', 'Lucy', 'Volunteer', '6 Meadow Ridge Junction', 55568498994, 'dperkins@geba.org');
insert into Staff (manager, lName, fName, position, address, phone, email) values ('Y', 'Wright', 'Benjamin', null, '53 Jana Point', 4375763311, 'bwright@jaloo.net');
insert into Staff (manager, lName, fName, position, address, phone, email) values ('N', 'Jones', 'Joyce', 'Employee', '957 Daystar Plaza', 19586907890, 'jjones@divape.gov');
insert into Staff (manager, lName, fName, position, address, phone, email) values ('N', 'Crawford', 'Chris', 'Employee', '18 Golden Leaf Circle', 06040938441, 'ccrawford@quamba.gov');
insert into Staff (manager, lName, fName, position, address, phone, email) values ('N', 'Alexander', 'Mildred', 'Employee', '035 Crowley Junction', 75484608771, 'malexander@jabbersphere.name');
insert into Staff (manager, lName, fName, position, address, phone, email) values ('N', 'Spencer', 'Jimmy', 'Volunteer', '70 Gerald Way', 27288927685, 'jspencer@jetpulse.biz');
insert into Staff (manager, lName, fName, position, address, phone, email) values ('N', 'Murphy', 'Gerald', 'Volunteer', '3940 Dapin Place', 7934742182, 'gmurphy@skiptube.edu');

insert into Veterinarian (lName, fName, address, city, state, zip, phone, email) values ('Wright', 'Joyce', '302 Independence Plaza', 'Escalon', 'Michigan', 38683, 6408371380, 'jwright@vinder.info');
insert into Veterinarian (lName, fName, address, city, state, zip, phone, email) values ('James', 'Mark', '70677 Eliot Park', 'Westlake Village', 'Kansas', 70767, 61727550240, 'mjames@devcast.name');
insert into Veterinarian (lName, fName, address, city, state, zip, phone, email) values ('Weaver', 'Martha', '4142 Dennis Plaza', 'Ceres', 'Wyoming', 30208, 77998862246, 'mweaver@zoomcast.org');
insert into Veterinarian (lName, fName, address, city, state, zip, phone, email) values ('Perez', 'Joseph', '2622 Victoria Point', 'Reedley', 'Connecticut', 77470, 96776900946, 'jperez@photobug.name');
insert into Veterinarian (lName, fName, address, city, state, zip, phone, email) values ('Adams', 'Eugene', '7 Manley Hill', 'Mount Shasta', 'New York', 77723, 65439147743, 'eadams@devshare.info');
insert into Veterinarian (lName, fName, address, city, state, zip, phone, email) values ('Tucker', 'Arthur', '853 Schiller Avenue', 'Monterey', 'Indiana', 28774, 71848007585, 'atucker@vimbo.org');
insert into Veterinarian (lName, fName, address, city, state, zip, phone, email) values ('Pierce', 'Ryan', '6989 Shopko Circle', 'Rocklin', 'North Dakota', 59351, 75475969989, 'rpierce@devify.gov');
insert into Veterinarian (lName, fName, address, city, state, zip, phone, email) values ('Sims', 'Terry', '223 Kedzie Road', 'Ripon', 'Georgia', 13179, 50352000765, 'tsims@divanoodle.edu');
insert into Veterinarian (lName, fName, address, city, state, zip, phone, email) values ('Clark', 'Maria', '5 Dayton Trail', 'Santa Cruz', 'Maryland', 95280, 5194256473, 'mclark@zoombeat.mil');
insert into Veterinarian (lName, fName, address, city, state, zip, phone, email) values ('Gray', 'Christopher', '386 Lunder Plaza', 'Live Oak', 'Missouri', 65891, 5552060255, 'cgray@voomm.mil');
insert into Veterinarian (lName, fName, address, city, state, zip, phone, email) values ('Parker', 'Carol', '75119 Pepper Wood Plaza', 'American Canyon', 'Idaho', 27368, 6045791415, 'cparker@chatterpoint.biz');
insert into Veterinarian (lName, fName, address, city, state, zip, phone, email) values ('Martinez', 'Lori', '83 Namekagon Trail', 'Garden Grove', 'Louisiana', 78170, 2580282435, 'lmartinez@skinte.net');
insert into Veterinarian (lName, fName, address, city, state, zip, phone, email) values ('Henderson', 'Alan', '7948 Swallow Park', 'Laguna Niguel', 'Connecticut', 05750, 2284610369, 'ahenderson@wordpedia.edu');
insert into Veterinarian (lName, fName, address, city, state, zip, phone, email) values ('Richards', 'Brenda', '59 Almo Parkway', 'Anaheim', 'Vermont', 54293, 2226663615, 'brichards@feedfire.org');
insert into Veterinarian (lName, fName, address, city, state, zip, phone, email) values ('Myers', 'Ann', '52336 Thierer Lane', 'Half Moon Bay', 'Illinois', 38842, 9161639328, 'amyers@nlounge.com');
*/

/*
insert into FosterFamily (lName, fName, phone, address, email) values ('Fowler', 'Howard', 9381053828, '200 Muir Pass', 'hfowler@thoughtstorm.org');
insert into FosterFamily (lName, fName, phone, address, email) values ('Williams', 'Steven', 95762610020, '59617 Maple Wood Center', 'swilliams@twinder.edu');
insert into FosterFamily (lName, fName, phone, address, email) values ('Wagner', 'Carol', 60755192988, '16238 Lotheville Court', 'cwagner@twitterbridge.biz');
insert into FosterFamily (lName, fName, phone, address, email) values ('Romero', 'Joan', 75437831520, '03 Gina Road', 'jromero@wikizz.org');
insert into FosterFamily (lName, fName, phone, address, email) values ('Gray', 'Patrick', 89765526800, '2 Mitchell Lane', 'pgray@edgepulse.org');
insert into FosterFamily (lName, fName, phone, address, email) values ('Austin', 'Shirley', 97162147138, '6481 Pearson Terrace', 'saustin@realcube.info');
insert into FosterFamily (lName, fName, phone, address, email) values ('Fowler', 'Kenneth', 06343966704, '50 Loftsgordon Pass', 'kfowler@brainverse.org');
insert into FosterFamily (lName, fName, phone, address, email) values ('Gonzalez', 'Pamela', 47262509013, '3527 Harper Trail', 'pgonzalez@twitterbridge.biz');
insert into FosterFamily (lName, fName, phone, address, email) values ('Butler', 'Jeremy', 72940287279, '10113 South Lane', 'jbutler@quaxo.edu');
insert into FosterFamily (lName, fName, phone, address, email) values ('Patterson', 'Aaron', 71169042318, '25 Washington Pass', 'apatterson@realcube.info');
insert into FosterFamily (lName, fName, phone, address, email) values ('Hall', 'Frances', 20488807019, '62 Warner Lane', 'fhall@skynoodle.edu');
insert into FosterFamily (lName, fName, phone, address, email) values ('Taylor', 'Judy', 1463566056, '352 Village Way', 'jtaylor@babbleblab.mil');
insert into FosterFamily (lName, fName, phone, address, email) values ('Duncan', 'Arthur', 5888364451, '4752 Calypso Pass', 'aduncan@centidel.mil');
insert into FosterFamily (lName, fName, phone, address, email) values ('Martin', 'Tina', 99708458127, '70868 Bultman Alley', 'tmartin@cogibox.name');
insert into FosterFamily (lName, fName, phone, address, email) values ('Mills', 'Chris', 9401064414, '2297 Red Cloud Hill', 'cmills@kazio.name');*/