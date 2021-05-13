# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]

* Rails version

Rails 5.2.3

* Configuration

$ rm ln-the-gossip-project-Facebook-style/Gemfile.lock

$ gem uninstall rails
(=> 3. All versions)

$ gem uninstall railties
(=> 3. All versions)

$ cd ln-the-gossip-project-Facebook-style

ln-the-gossip-project-Facebook-style$ bundle install

ln-the-gossip-project-Facebook-style$ rails -v
(=> Rails 5.2.3)

* Database creation

Mettre à jour le fichier config/database.yml (il faut "personnaliser" le nom de la database, - ainsi qu'éventuellement le username et le host -, pour le development).

ln-the-gossip-project-Facebook-style$ RUBYOPT='-W:no-deprecated -W:no-experimental' rails db:create

ln-the-gossip-project-Facebook-style$ RUBYOPT='-W:no-deprecated -W:no-experimental' rails db:migrate

* Database initialization

ln-the-gossip-project-Facebook-style$ RUBYOPT='-W:no-deprecated -W:no-experimental' rails db:seed 

Exemple d'exécution :

Warning: the running version of Bundler (2.1.4) is older than the version that created the lockfile (2.2.16). We suggest you to upgrade to the version that created the lockfile by running `gem install bundler:2.2.16`.
The dependency tzinfo-data (>= 0) will be unused by any of the platforms Bundler is installing for. Bundler is installing for ruby, x86_64-linux but the dependency is only for x86-mingw32, x86-mswin32, x64-mingw32, java. To add those platforms to the bundle, run `bundle lock --add-platform x86-mingw32 x86-mswin32 x64-mingw32 java`.
Warning: the running version of Bundler (2.1.4) is older than the version that created the lockfile (2.2.16). We suggest you to upgrade to the version that created the lockfile by running `gem install bundler:2.2.16`.
Resetting auto increment ID for users to 1
Resetting auto increment ID for cities to 1
Resetting auto increment ID for gossips to 1
Resetting auto increment ID for tags to 1
Resetting auto increment ID for join_table_tag_gossips to 1
Resetting auto increment ID for private_messages to 1
Resetting auto increment ID for join_table_recipient_pms to 1
Resetting auto increment ID for comments to 1

Création d'un utilisateur de prénom, de nom et de password "Anonymous", qui a pour email "anonymous@gmail.com" et qui habite Paris (75000).

Cet Anonymous écrit deux potins avec le même tag "#By_Anonymous" - et il les "taggue" aussi de manière "individuelle" -, puis chacun des potins est commenté une fois par Anonymous, et il envoie aussi un message privé dont il est à la fois l'expéditeur et l'un des destinataires (il est "en copie").

Génération plus aléatoire :

Le password du 2-ième utilisateur - de prénom "Brunehaut", de nom "Fleury" et d'email "Brunehaut_Fleury@gmail.com" - créé par ce seed sera : "XbNxUfQd".

Le password du 3-ième utilisateur - de prénom "Axeline", de nom "Poulain" et d'email "Axeline_Poulain@gmail.com" - créé par ce seed sera : "EaHm13ZhE".

Le password du 4-ième utilisateur - de prénom "Scholastique", de nom "Noël" et d'email "Scholastique_Noël@gmail.com" - créé par ce seed sera : "LhXtL1tI1".

Le password du 5-ième utilisateur - de prénom "Acanthe", de nom "Moreau" et d'email "Acanthe_Moreau@gmail.com" - créé par ce seed sera : "LoGdXh".

Le password du 6-ième utilisateur - de prénom "Didier", de nom "Benard" et d'email "Didier_Benard@gmail.com" - créé par ce seed sera : "NsGmI9cPdV".

Le password du 7-ième utilisateur - de prénom "Alcyone", de nom "Leroux" et d'email "Alcyone_Leroux@gmail.com" - créé par ce seed sera : "HpWzXf".

Le password du 8-ième utilisateur - de prénom "Adolphe", de nom "Collet" et d'email "Adolphe_Collet@gmail.com" - créé par ce seed sera : "CzFl5GfI89".

Le password du 9-ième utilisateur - de prénom "Henriette", de nom "Prévost" et d'email "Henriette_Prévost@gmail.com" - créé par ce seed sera : "HuP9jF".

Le password du 10-ième utilisateur - de prénom "Alphonse", de nom "Roger" et d'email "Alphonse_Roger@gmail.com" - créé par ce seed sera : "GhOyWjJ".

Le password du 11-ième utilisateur - de prénom "Eusébie", de nom "Durand" et d'email "Eusébie_Durand@gmail.com" - créé par ce seed sera : "CzF4fWg".

Choix aléatoire d'un "vrai" destinataire pour le message privé envoyé par Anonymous : ce sera Axeline Poulain (3).

gossip3 author.id : 9
gossip4 author.id : 10
gossip5 author.id : 3
gossip6 author.id : 2
gossip7 author.id : 5
gossip8 author.id : 4
gossip9 author.id : 7
gossip10 author.id : 6
gossip11 author.id : 2
gossip12 author.id : 11
gossip13 author.id : 11
gossip14 author.id : 7
gossip15 author.id : 6
gossip16 author.id : 8
gossip17 author.id : 4
gossip18 author.id : 9
gossip19 author.id : 10
gossip20 author.id : 5
gossip21 author.id : 8
gossip22 author.id : 3

11 users créés :
ID | FIRST_NAME   | LAST_NAME | EMAIL                       | AGE | DESCRIPTION                    | CITY.NAME            | CITY.ZIP_CODE
---|--------------|-----------|-----------------------------|-----|--------------------------------|----------------------|--------------
1  | Anonymous    | Anonymous | anonymous@gmail.com         | 25  | Utilisateur créé afin qu'il... | Paris                | 75000        
2  | Brunehaut    | Fleury    | Brunehaut_Fleury@gmail.com  | 63  | Brunehaut Fleury est une 0-... | Noisy-le-Grand       | 92170        
3  | Axeline      | Poulain   | Axeline_Poulain@gmail.com   | 35  | Axeline Poulain est une 1-i... | Lorient              | 46393        
4  | Scholastique | Noël      | Scholastique_Noël@gmail.com | 21  | Scholastique Noël est une 2... | Thionville           | 59225        
5  | Acanthe      | Moreau    | Acanthe_Moreau@gmail.com    | 98  | Acanthe Moreau est une 3-iè... | Houilles             | 71508        
6  | Didier       | Benard    | Didier_Benard@gmail.com     | 82  | Didier Benard est une 4-ièm... | Le Perreux-sur-Marne | 69539        
7  | Alcyone      | Leroux    | Alcyone_Leroux@gmail.com    | 74  | Alcyone Leroux est une 5-iè... | Metz                 | 75294        
8  | Adolphe      | Collet    | Adolphe_Collet@gmail.com    | 22  | Adolphe Collet est une 6-iè... | Blois                | 57439        
9  | Henriette    | Prévost   | Henriette_Prévost@gmail.com | 98  | Henriette Prévost est une 7... | Béziers              | 52368        
10 | Alphonse     | Roger     | Alphonse_Roger@gmail.com    | 27  | Alphonse Roger est une 8-iè... | Arles                | 89444        
11 | Eusébie      | Durand    | Eusébie_Durand@gmail.com    | 102 | Eusébie Durand est une 9-iè... | Grenoble             | 88128        

11 cities créées :
ID | NAME                 | ZIP_CODE | CREATED_AT              | UPDATED_AT             
---|----------------------|----------|-------------------------|------------------------
1  | Paris                | 75000    | 2021-05-13 16:25:38     | 2021-05-13 16:25:38    
2  | Noisy-le-Grand       | 92170    | 2021-05-13 16:25:38     | 2021-05-13 16:25:38    
3  | Lorient              | 46393    | 2021-05-13 16:25:39     | 2021-05-13 16:25:39    
4  | Thionville           | 59225    | 2021-05-13 16:25:39     | 2021-05-13 16:25:39    
5  | Houilles             | 71508    | 2021-05-13 16:25:39     | 2021-05-13 16:25:39    
6  | Le Perreux-sur-Marne | 69539    | 2021-05-13 16:25:40     | 2021-05-13 16:25:40    
7  | Metz                 | 75294    | 2021-05-13 16:25:40     | 2021-05-13 16:25:40    
8  | Blois                | 57439    | 2021-05-13 16:25:40     | 2021-05-13 16:25:40    
9  | Béziers              | 52368    | 2021-05-13 16:25:40     | 2021-05-13 16:25:40    
10 | Arles                | 89444    | 2021-05-13 16:25:41     | 2021-05-13 16:25:41    
11 | Grenoble             | 88128    | 2021-05-13 16:25:41     | 2021-05-13 16:25:41    

22 gossips créés :
ID | TITLE          | CONTENT                        | AUTHOR.FIRST_NAME | AUTHOR.LAST_NAME | TAGS.TITLE   
---|----------------|--------------------------------|-------------------|------------------|--------------
1  | Test potin n°1 | Ceci est le premier test de... | Anonymous         | Anonymous        | #By_Anonymous
   |                |                                |                   |                  | #Fabulous    
2  | Test potin n°2 | Ceci est le second test de ... | Anonymous         | Anonymous        | #By_Anonymous
   |                |                                |                   |                  | #Ridiculous  
3  | Qtyx1yw        | Unde necessitatibus eum. Si... | Henriette         | Prévost          | #odit        
4  | Ux0qvmd        | Et voluptates qui.             | Alphonse          | Roger            | #odit        
5  | 7h6ftu0        | Qui praesentium molestias.     | Axeline           | Poulain          | #consequatur 
6  | Crtnd5l        | Nostrum officiis repellat. ... | Brunehaut         | Fleury           | #consequatur 
7  | 3m58w6v        | Sit laudantium perferendis.... | Acanthe           | Moreau           | #sit         
8  | T3tlhbk        | Vel repellat autem. Reprehe... | Scholastique      | Noël             | #sit         
9  | S1zdboy        | At consequatur vel.            | Alcyone           | Leroux           | #quia        
10 | Jqtr4ua        | Sed enim quo.                  | Didier            | Benard           | #quia        
11 | Kinum85        | Quam soluta tempore. Placea... | Brunehaut         | Fleury           | #iusto       
12 | 8af6b5q        | Ipsa quos ut. Quia ipsa aut... | Eusébie           | Durand           | #iusto       
13 | Xch3pcw        | Esse quia minima.              | Eusébie           | Durand           | #aut         
14 | 4nyqeeb        | Cum qui nostrum. Doloribus ... | Alcyone           | Leroux           | #aut         
15 | 9qbxok2        | Vitae accusamus deserunt. L... | Didier            | Benard           | #possimus    
16 | H20hyjg        | Nihil voluptas molestiae. I... | Adolphe           | Collet           | #possimus    
17 | Uz1z670        | Error aliquam at. Ut archit... | Scholastique      | Noël             | #ut          
18 | Ficl5mw        | Ea quos commodi. Mollitia u... | Henriette         | Prévost          | #ut          
19 | 3g3z5bh        | Atque eius qui. Corrupti en... | Alphonse          | Roger            | #animi       
20 | Qk2bw3f        | Natus qui omnis. Est iste cum. | Acanthe           | Moreau           | #animi       
21 | Rcmhm1t        | Quia maxime et. Id in et. A... | Adolphe           | Collet           | #dolorum     
22 | Igrro6n        | Animi eveniet alias. Laudan... | Axeline           | Poulain          | #dolorum     

13 tags créés :
ID | TITLE        
---|--------------
1  | #By_Anonymous
2  | #Fabulous    
3  | #Ridiculous  
4  | #odit        
5  | #consequatur 
6  | #sit         
7  | #quia        
8  | #iusto       
9  | #aut         
10 | #possimus    
11 | #ut          
12 | #animi       
13 | #dolorum     

11 private messages créés :
ID | CONTENT                        | SENDER.FIRST_NAME | SENDER.LAST_NAME | RECIPIENTS.FIRST_NAME | RECIPIENTS.LAST_NAME
---|--------------------------------|-------------------|------------------|-----------------------|---------------------
1  | Ceci est le premier test d'... | Anonymous         | Anonymous        | Anonymous             | Anonymous           
   |                                |                   |                  | Axeline               | Poulain             
2  | Veniam ipsa molestiae. Illu... | Acanthe           | Moreau           | Henriette             | Prévost             
3  | Sunt vitae sunt.               | Alphonse          | Roger            | Scholastique          | Noël                
4  | Eos rerum ut. Non animi sun... | Eusébie           | Durand           | Acanthe               | Moreau              
5  | Et et voluptas. Vel laborio... | Adolphe           | Collet           | Axeline               | Poulain             
6  | Et sed id. Molestiae perspi... | Brunehaut         | Fleury           | Eusébie               | Durand              
7  | Eveniet fugit quaerat. Vel ... | Henriette         | Prévost          | Henriette             | Prévost             
8  | Incidunt repudiandae non. Q... | Axeline           | Poulain          | Acanthe               | Moreau              
9  | Ut et consequatur. Voluptas... | Eusébie           | Durand           | Alcyone               | Leroux              
10 | Eum accusamus velit. Qui al... | Adolphe           | Collet           | Adolphe               | Collet              
11 | Labore accusantium ea.         | Adolphe           | Collet           | Alcyone               | Leroux              

22 comments créés :
ID | CONTENT                        | AUTHOR.FIRST_NAME | AUTHOR.LAST_NAME | GOSSIP.TITLE  
---|--------------------------------|-------------------|------------------|---------------
1  | Ceci est le premier test de... | Anonymous         | Anonymous        | Test potin n°1
2  | Ceci est le second test de ... | Anonymous         | Anonymous        | Test potin n°2
3  | Blanditiis dolores velit. Q... | Acanthe           | Moreau           | Qtyx1yw       
4  | Ipsum id molestiae. Fugiat ... | Acanthe           | Moreau           | Ux0qvmd       
5  | Qui sed consequatur. Fuga q... | Henriette         | Prévost          | 7h6ftu0       
6  | Aut nesciunt alias. Praesen... | Alphonse          | Roger            | Crtnd5l       
7  | Nobis repellat deserunt.       | Didier            | Benard           | 3m58w6v       
8  | Laudantium ea est. Doloribu... | Alphonse          | Roger            | T3tlhbk       
9  | Vitae rem cupiditate.          | Alphonse          | Roger            | S1zdboy       
10 | Necessitatibus dolor quisquam. | Scholastique      | Noël             | Jqtr4ua       
11 | Iusto perferendis optio. Ma... | Adolphe           | Collet           | Kinum85       
12 | Adipisci quis facilis. Volu... | Alcyone           | Leroux           | 8af6b5q       
13 | Et animi eligendi. Possimus... | Brunehaut         | Fleury           | Xch3pcw       
14 | Magnam omnis odio. Ex ut mi... | Acanthe           | Moreau           | 4nyqeeb       
15 | Eos sint dolore. Aperiam vo... | Scholastique      | Noël             | 9qbxok2       
16 | Reiciendis adipisci ea. Mag... | Eusébie           | Durand           | H20hyjg       
17 | Itaque quia qui. Fugiat ips... | Brunehaut         | Fleury           | Uz1z670       
18 | Recusandae et ullam.           | Brunehaut         | Fleury           | Ficl5mw       
19 | Quia sit vero. Est autem fuga. | Scholastique      | Noël             | 3g3z5bh       
20 | Quo exercitationem fugiat. ... | Didier            | Benard           | Qk2bw3f       
21 | Exercitationem autem et.       | Alcyone           | Leroux           | Rcmhm1t       
22 | Et impedit facilis. Delenit... | Alphonse          | Roger            | Igrro6n       


* How to run the server
 
ln-the-gossip-project-Facebook-style$ RUBYOPT='-W:no-deprecated -W:no-experimental' rails server

* Application URL

http://localhost:3000/
