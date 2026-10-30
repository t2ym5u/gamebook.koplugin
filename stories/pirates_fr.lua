-- Generated story: La Baguette Stellaire (fr)
return {
    title = "La Baguette Stellaire",
    author = "Gamebook",
    lang = "fr",
    blurb = "Cuistot sur un vaisseau pirate, sauvez la capitaine Barbe-Comète et trouvez le trésor de la nébuleuse !",
    sheet = true,
    start = 1,
    start_gold = 5,
    start_items = { "louche" },
    items = {
        louche = "Louche en titane",
        baguette = "Baguette rassise",
        fromage = "Camembert explosif",
        boussole = "Boussole de Jules Verne",
        passeport = "Passeport galactique",
        cle = "Clé de cellule",
        globe = "Globe de verre",
        carte = "Carte de la nébuleuse",
    },
    sections = {
        [1] = { -- intro
            text = "Vous êtes le cuistot de La Baguette Stellaire, le vaisseau pirate le plus parfumé de la galaxie. Ce matin, pendant que vous montiez un soufflé au fromage en apesanteur, les sbires du baron Von Pétoncle ont abordé le navire et enlevé la redoutable capitaine Barbe-Comète, ainsi que tout l’équipage.\n\nIl ne reste que vous, votre soufflé retombé et Coco-Tron, le perroquet robot qui répète tout de travers. « Sauve-qui-peut ! Sauce-qui-peut ! » crie-t-il.",
            choices = {
                { text = "Fouiller la cambuse", to = 2 },
                { text = "Courir au poste de pilotage", to = 3 },
            },
        },
        [2] = { -- cambuse
            text = "La cambuse est sens dessus dessous. Les pirates de Von Pétoncle ont emporté le saucisson, ces mufles. Sous l’évier, vous dénichez une baguette rassise, si dure qu’elle pourrait servir de massue, et la cagnotte des pourboires de l’équipage : trois doublons stellaires.\n\nVous avalez aussi un reste de rillettes de comète. Ça requinque. Coco-Tron picore une miette et déclare : « Excellent ! Excrément ! » Vous préférez croire qu’il voulait dire la première chose.",
            gain = "baguette",
            gold = 3,
            stamina = 2,
            choices = {
                { text = "Monter au poste de pilotage", to = 3 },
            },
        },
        [3] = { -- cockpit
            text = "Sur la console clignote un message holographique de la capitaine. Sa barbe rousse, tressée de petites comètes, remplit l’écran : « Si tu vois ceci, cuistot, c’est que Von Pétoncle m’a eue. Il veut le trésor de la nébuleuse. Ne le laisse pas gagner, et pense à arroser mes géraniums. »\n\nCoco-Tron affiche une carte : le baron emmène ses prisonniers au Château d’If-en-Orbite, au-delà de la ceinture de Saturne-Saint-Denis. Mais une escale pourrait vous être utile.",
            choices = {
                { text = "Mettre le cap sur la planète Camembert", to = 6 },
                { text = "Faire escale à la station Tour-Eiffel-7", to = 22 },
                { text = "Visiter l’astéroïde B 612", to = 38 },
                { text = "Foncer tout droit vers le Château d’If", to = 4 },
            },
        },
        [4] = { -- raccourci
            text = "Vous poussez la manette des gaz à fond. Coco-Tron hurle : « Raccourci ! Rabougri ! » Le raccourci passe en effet tout près du trou noir de Pontoise, réputé pour avaler les vaisseaux comme d’autres avalent des escargots.\n\nLes moteurs toussent, les étoiles s’étirent comme de la pâte à crêpe. Tout dépend maintenant de la chance et de la gravité, deux dames capricieuses.",
            roll = { dice = 1, outcomes = { { upto = 2, to = 5 }, { upto = 6, to = 47 } } },
        },
        [5] = { -- trounoir
            text = "Le trou noir vous aspire avec un bruit de paille au fond d’un verre de grenadine. Vous êtes étiré, allongé, spaghettifié. Ironie du sort pour un cuistot : vous finissez en spaghetti cosmique, sans même une goutte de sauce.\n\nCoco-Tron, ressorti de l’autre côté de l’univers, raconte encore votre histoire à des extraterrestres qui ne comprennent rien. Votre aventure s’arrête ici.",
            ending = "death",
        },
        [6] = { -- cam
            text = "La planète Camembert est ronde, crémeuse et légèrement coulante sur les bords. Son odeur vous parvient avant même l’atterrissage : Coco-Tron se bouche les capteurs. « Ça sent le pied ! Ça sent le pied ! »\n\nAu spatioport de Livarot-les-Étoiles, des vaches cosmiques broutent l’herbe bleue entre deux cratères. Au loin, une cave d’affinage creusée dans la croûte ; tout près, un marché animé.",
            choices = {
                { text = "Descendre dans la cave d’affinage", to = 8 },
                { text = "Flâner au marché", to = 10 },
                { text = "Approcher les vaches cosmiques", to = 7 },
            },
        },
        [7] = { -- cam_vaches
            text = "Les vaches cosmiques ont des taches en forme de constellations et flottent à un mètre du sol. L’une d’elles, marquée de la Grande Ourse, vous regarde avec une infinie douceur et vous offre un bol de lait lunaire.\n\nIl est tiède, sucré, et il vous remet d’aplomb. Le vacher, un vieux Normand, vous remercie d’avoir aidé à rattraper un veau parti en orbite basse.",
            stamina = 3,
            choices = {
                { text = "Descendre dans la cave d’affinage", to = 8 },
                { text = "Flâner au marché", to = 10 },
            },
        },
        [8] = { -- cam_cave
            text = "La cave d’affinage est un labyrinthe de galeries tapissées de meules géantes. Il y fait frais et humide. Soudain, un grattement : un rat de cave mutant, gros comme un poney, garde un tas de fromages précieux. Il porte un petit béret, ce qui ne le rend pas plus aimable.\n\nIl montre les dents et fonce sur vous en couinant.",
            fight = { name = "Rat de cave mutant", skill = 6, stamina = 6, win = 9, flee = 6 },
        },
        [9] = { -- cam_tresor
            text = "Le rat s’enfuit en couinant vers sa mère. Derrière lui, sur une étagère, vous trouvez un camembert explosif : un fromage si fait, si puissant, que sa seule odeur peut faire fuir une flotte entière. Vous l’emballez dans trois couches de papier.\n\nDans le nid du rat brillent aussi quatre doublons stellaires. Il les avait sans doute volés. Vous les volez à votre tour, c’est le métier qui veut ça.",
            gain = "fromage",
            gold = 4,
            choices = {
                { text = "Flâner au marché", to = 10 },
                { text = "Regagner le vaisseau", to = 16 },
            },
        },
        [10] = { -- cam_marche
            text = "Au marché, un vieux gastronome à la perruque poudrée tient l’étal le plus fréquenté. Il se présente : « Brillat, comme Brillat-Savarin, mon illustre ancêtre. Dis-moi ce que tu manges, je te dirai qui tu es ! »\n\nIl vous propose une fondue réconfortante pour deux doublons. Il a aussi besoin d’aide pour soulever une meule de trois cents kilos tombée de sa charrette.",
            choices = {
                { text = "Commander la fondue (2 doublons)", to = 11, cost = 2 },
                { text = "Aider à soulever la meule", to = 13 },
                { text = "Lui parler des moules de l’espace", to = 12 },
                { text = "Descendre dans la cave d’affinage", to = 8 },
            },
        },
        [11] = { -- cam_fondue
            text = "La fondue arrive dans un caquelon fumant. Vous trempez votre pain, il ressort ruisselant de fromage filant qui s’étire jusqu’à la lune voisine. Brillat vous regarde manger avec émotion.\n\n« Tu manges comme un vrai pirate, mon garçon. Ou ma fille. Bref, comme un vrai cuistot. » Vous vous sentez capable d’affronter toute la galaxie, ou au moins une sieste.",
            stamina = 4,
            choices = {
                { text = "Aider Brillat à soulever la meule", to = 13 },
                { text = "Lui parler des moules de l’espace", to = 12 },
                { text = "Regagner le vaisseau", to = 16 },
            },
        },
        [12] = { -- cam_secret
            text = "Brillat baisse la voix. « Les moules-frites de la ceinture de Saturne-Saint-Denis ? Terribles. Elles dévorent les vaisseaux entiers, avec la mayonnaise. Mais elles ont une faiblesse : le cri du goéland. Elles en ont une peur bleue, depuis la nuit des temps. »\n\nIl vous apprend à imiter le cri, mains en porte-voix. Coco-Tron essaie aussi et produit un bruit de grille-pain.",
            set = "cri_goeland",
            choices = {
                { text = "Descendre dans la cave d’affinage", to = 8 },
                { text = "Regagner le vaisseau", to = 16 },
            },
        },
        [13] = { -- cam_meule
            text = "Vous crachez dans vos mains, vous pliez les genoux comme on vous l’a appris au cours de gym du lycée, et vous empoignez la meule de trois cents kilos. Elle sent fort et elle pèse lourd, comme tout bon fromage.\n\nBrillat vous encourage : « Hardi ! Pense à la tartiflette ! »",
            test = { stat = "skill", win = 14, lose = 15 },
        },
        [14] = { -- cam_meule_ok
            text = "Hop ! La meule retrouve sa place sur la charrette. Brillat applaudit et sort de son gilet un objet en cuivre : une boussole qui ne montre pas le nord, mais l’aventure.\n\n« Elle a appartenu à Jules Verne en personne. Il l’a emportée de la Terre à la Lune, puis vingt mille lieues sous les mers. Elle trouve toujours un passage secret. Prends-en soin. »",
            gain = "boussole",
            choices = {
                { text = "Descendre dans la cave d’affinage", to = 8 },
                { text = "Regagner le vaisseau", to = 16 },
            },
        },
        [15] = { -- cam_meule_ko
            text = "Crac ! Votre dos émet un bruit de biscotte. La meule ne bouge pas d’un millimètre, mais vous, vous voilà plié en deux comme une crêpe. Brillat, compatissant, vous frictionne avec un onguent au munster.\n\nIl vous tapote l’épaule. « C’est l’intention qui compte. Et la kiné. Repose-toi, mon petit. »",
            stamina = -2,
            choices = {
                { text = "Descendre dans la cave d’affinage", to = 8 },
                { text = "Regagner le vaisseau", to = 16 },
            },
        },
        [16] = { -- cam_depart
            text = "La Baguette Stellaire décolle dans un nuage parfumé. Mais à peine en orbite, une ombre gigantesque recouvre le hublot : une pieuvre de l’espace, violette et baveuse, enroule ses huit tentacules autour de la coque.\n\nSes yeux immenses vous fixent. Elle a faim, et la cuisine sent si bon. Coco-Tron couine : « Poulpe ! Pulpe ! »",
            choices = {
                { text = "Sortir la combattre à la louche", to = 17 },
                { text = "Lui jeter le camembert explosif", to = 18, need = "fromage" },
                { text = "Tenter de lui échapper", to = 19 },
            },
        },
        [17] = { -- cam_pieuvre
            text = "Vous enfilez votre scaphandre, vous sortez sur la coque, louche en titane au poing. La pieuvre agite ses tentacules comme un chef d’orchestre déchaîné. Chaque ventouse est grande comme une assiette à soupe. Coco-Tron, resté au chaud derrière le hublot, vous encourage en sifflant La Marseillaise, faux.",
            fight = { name = "Pieuvre de l’espace", skill = 8, stamina = 8, win = 21 },
        },
        [18] = { -- cam_fromage
            text = "Vous ouvrez le sas et déballez une seule des trois couches de papier. Cela suffit. L’odeur du camembert explosif frappe la pieuvre comme un coup de poêle. Elle devient verte, puis grise, puis lâche tout et s’enfuit à la vitesse de la lumière en se bouchant ce qui lui sert de nez.\n\nVous remballez vite le fromage. Coco-Tron a perdu connaissance quelques secondes.",
            choices = {
                { text = "Reprendre la route", to = 21 },
            },
        },
        [19] = { -- cam_fuite
            text = "Vous coupez tous les moteurs sauf un et virez sec, en espérant que la pieuvre lâche prise. Les tentacules glissent sur la coque fraîchement cirée. C’est le moment de vérifier si les étoiles sont de votre côté, ou du côté de la pieuvre.",
            test = { stat = "luck", win = 21, lose = 20 },
        },
        [20] = { -- cam_gifle
            text = "Raté. La pieuvre vous rattrape et secoue le vaisseau comme un shaker à cocktail. Vous traversez la cabine de part en part et rebondissez sur le frigo. Aïe.\n\nIl n’y a plus le choix : il faut sortir et l’affronter, ou elle va vous gober avec le vaisseau en guise de cornet.",
            stamina = -3,
            choices = {
                { text = "Sortir la combattre", to = 17 },
            },
        },
        [21] = { -- cam_victoire
            text = "La pieuvre disparaît dans le noir. Dans son sillage flotte un vieux coffre qu’elle gardait sans doute comme jouet. Vous le hissez à bord : cinq doublons stellaires et une chaussette dépareillée.\n\nLa route est libre. Coco-Tron propose une escale à la station Tour-Eiffel-7, où l’on trouve de tout, y compris des ennuis.",
            gold = 5,
            choices = {
                { text = "Filer vers la ceinture de Saturne-Saint-Denis", to = 47 },
                { text = "Faire un détour par l’astéroïde B 612", to = 38 },
            },
        },
        [22] = { -- tour
            text = "La station Tour-Eiffel-7 se dresse dans le vide, immense dentelle de fer de trois cents kilomètres, illuminée toutes les heures par un scintillement de mille lampions. Gustave lui-même en aurait pleuré.\n\nAu quai d’amarrage, deux robots douaniers vous font signe d’arrêter. « Papiers ! Taxe d’amarrage ! Rien à déclarer ? » Leurs tampons claquent avec impatience.",
            choices = {
                { text = "Payer la taxe d’amarrage (3 doublons)", to = 26, cost = 3 },
                { text = "Se faufiler par la soute à bagages", to = 23 },
                { text = "Affronter les robots douaniers", to = 24 },
            },
        },
        [23] = { -- tour_soute
            text = "Vous vous glissez dans un conteneur de cuisses de grenouilles lyophilisées en partance pour la station. Coco-Tron se tient tranquille, pour une fois. Les robots douaniers passent tout près, scannant les caisses une par une. Bip. Bip. Biiip. Vous retenez votre souffle, et Coco-Tron retient son bip.",
            test = { stat = "luck", win = 26, lose = 24 },
        },
        [24] = { -- tour_douane
            text = "« Contrebande ! Fraude ! Infraction à l’article 42 ! » Les deux robots douaniers sortent leurs matraques à tampons et foncent sur vous en roulant sur leurs petites chenilles. Ils sont carrés, têtus et parfaitement insensibles à l’humour. Vos blagues ne les arrêteront pas.",
            fight = { enemies = { { name = "Robot douanier", skill = 6, stamina = 5 }, { name = "Robot douanier chef", skill = 7, stamina = 5 } }, win = 25 },
        },
        [25] = { -- tour_douane_ok
            text = "Les deux robots gisent en tas de boulons, leurs tampons encore fumants. Dans la boîte à gants du chef, vous trouvez un passeport galactique vierge. Vous y collez votre photo, prise de profil pour mettre en valeur votre toque.\n\n« Officiel ! Artificiel ! » approuve Coco-Tron. Vous entrez dans la station d’un pas dégagé.",
            gain = "passeport",
            choices = {
                { text = "Entrer dans la station", to = 26 },
            },
        },
        [26] = { -- tour_dedans
            text = "Vous voici sur la grande promenade du premier étage. Des marchands vendent des marrons chauds de Mars, des accordéonistes à six bras jouent la valse, et des touristes de toutes les galaxies se prennent en photo.\n\nTrois enseignes attirent votre regard : le bazar « Chez Surcouf », le tripot du Croupier Rouillé et le bar « Le Mermoz », rendez-vous des pilotes.",
            choices = {
                { text = "Tenter sa chance au tripot", to = 31 },
                { text = "Boire un verre au Mermoz", to = 35 },
                { text = "Entrer au bazar Chez Surcouf", to = 27 },
                { text = "Quitter la station", to = 37 },
            },
        },
        [27] = { -- shop
            text = "Le bazar est tenu par un vieux robot corsaire à tricorne, qui se fait appeler Surcouf en l’honneur du célèbre corsaire de Saint-Malo. Ses étagères débordent de bricoles.\n\n« Bienvenue, moussaillon ! Aujourd’hui, j’ai un passeport galactique, une soupe à l’oignon cosmique qui ressuscite les morts, ou presque, et une clé passe-partout pour les cellules. »",
            choices = {
                { text = "Acheter le passeport (5 doublons)", to = 28, without = "passeport", cost = 5 },
                { text = "Acheter la soupe à l’oignon (3 doublons)", to = 29, cost = 3 },
                { text = "Acheter la clé passe-partout (6 doublons)", to = 30, cost = 6 },
                { text = "Ne rien acheter et partir", to = 37 },
            },
        },
        [28] = { -- shop_passeport
            text = "Surcouf sort de son tiroir un passeport galactique tout neuf, avec un hologramme de la tour qui scintille. Il y appose un tampon de six cent quarante-deux planètes. « Avec ça, tu passes partout, même chez les fonctionnaires de Bételgeuse. »\n\nVous le rangez précieusement dans votre tablier.",
            gain = "passeport",
            choices = {
                { text = "Quitter la station", to = 37 },
            },
        },
        [29] = { -- shop_soupe
            text = "La soupe à l’oignon cosmique gratine sous une croûte de fromage d’un centimètre. Vous la mangez avec un respect religieux. À chaque cuillerée, vos bleus s’effacent et vos muscles se regonflent.\n\n« Recette de ma grand-mère, une grille-pain de Brest », précise Surcouf avec émotion.",
            stamina = 6,
            choices = {
                { text = "Quitter la station", to = 37 },
            },
        },
        [30] = { -- shop_cle
            text = "Surcouf vous tend une clé dorée qui change de forme toute seule, comme un petit serpent métallique. « Elle ouvre toutes les cellules connues, sauf celles de mon ex-femme. Pour un pirate en mission de sauvetage, c’est l’outil idéal. »\n\nCoco-Tron essaie de la picorer ; elle le mord. Il ne recommencera pas.",
            gain = "cle",
            choices = {
                { text = "Quitter la station", to = 37 },
            },
        },
        [31] = { -- tripot
            text = "Le tripot est enfumé de vapeur de radiateur. Derrière une table de dés, le Croupier Rouillé, un robot à moustache peinte, fait claquer ses gobelets. « Mise de trois doublons ! Si les dés font plus de six, je te paie le double, et même un peu plus ! »\n\nAutour de la table, des joueurs fauchés soupirent en chœur.",
            choices = {
                { text = "Miser trois doublons", to = 32, cost = 3 },
                { text = "Aller boire un verre au Mermoz", to = 35 },
                { text = "Aller au bazar Chez Surcouf", to = 27 },
            },
        },
        [32] = { -- tripot_des
            text = "Le croupier secoue les gobelets avec un bruit de casseroles. Les dés roulent sur le tapis vert, rebondissent sur un verre de grenadine, hésitent, tournoient. Toute la salle retient son souffle, même le monsieur sans poumons du fond, qui n’en a pourtant pas besoin.",
            roll = { dice = 2, outcomes = { { upto = 6, to = 33 }, { upto = 12, to = 34 } } },
        },
        [33] = { -- tripot_perdu
            text = "Les dés s’arrêtent sur un score minable. Le croupier ramasse vos doublons avec un petit rire grinçant de charnière mal huilée. « La maison gagne toujours, moussaillon ! »\n\nLe croupier vous montre la porte : une partie par client et par jour, c’est le règlement. Coco-Tron vous conseille d’aller dépenser le reste ailleurs avant de tout perdre.",
            choices = {
                { text = "Aller boire un verre au Mermoz", to = 35 },
                { text = "Aller au bazar Chez Surcouf", to = 27 },
                { text = "Quitter la station", to = 37 },
            },
        },
        [34] = { -- tripot_gagne
            text = "Les dés affichent un score splendide ! Le croupier grince de dépit, ses moustaches peintes tombent d’un côté. Il vous aligne huit doublons stellaires étincelants.\n\nLes joueurs fauchés vous portent en triomphe autour de la table, puis vous lâchent un peu brusquement. Vous comptez votre fortune en vous frottant les fesses.",
            gold = 8,
            choices = {
                { text = "Aller boire un verre au Mermoz", to = 35 },
                { text = "Aller au bazar Chez Surcouf", to = 27 },
                { text = "Quitter la station", to = 37 },
            },
        },
        [35] = { -- mermoz
            text = "Le bar « Le Mermoz » est décoré d’hélices et de vieilles cartes de l’Aéropostale. Au comptoir, un vieil aviateur à écharpe blanche boit un chocolat chaud. Il se présente comme un admirateur de Saint-Exupéry.\n\n« Le Château d’If-en-Orbite ? J’y livrais le courrier. Les gardes demandent un mot de passe : Vol de nuit. Le baron n’a aucune imagination. » Il vous fait un clin d’œil.",
            set = "code_if",
            choices = {
                { text = "Lui offrir un chocolat chaud", to = 36 },
                { text = "Aller au bazar Chez Surcouf", to = 27 },
                { text = "Quitter la station", to = 37 },
            },
        },
        [36] = { -- mermoz_choco
            text = "L’aviateur trinque avec vous. « Un conseil, cuistot : sur l’astéroïde B 612, il y a une rose qui sait des choses. Elle est pénible, mais elle sait. Et méfie-toi des moules-frites de la ceinture. »\n\nLe chocolat est épais comme une crème, et il vous réchauffe jusqu’au bout des orteils.",
            stamina = 2,
            choices = {
                { text = "Aller au bazar Chez Surcouf", to = 27 },
                { text = "Quitter la station", to = 37 },
            },
        },
        [37] = { -- tour_depart
            text = "Vous détachez les amarres. La Tour-Eiffel-7 scintille derrière vous, comme pour vous souhaiter bonne chance. Coco-Tron consulte la carte : le Château d’If est droit devant, au-delà de la ceinture de Saturne-Saint-Denis. Mais l’astéroïde B 612 n’est qu’à un petit détour.",
            choices = {
                { text = "Filer vers la ceinture de Saturne-Saint-Denis", to = 47 },
                { text = "Faire un détour par l’astéroïde B 612", to = 38 },
            },
        },
        [38] = { -- b612
            text = "L’astéroïde B 612 est si petit qu’on en fait le tour en quarante-trois pas. On y voit trois volcans grands comme des genoux, des pousses de baobab menaçantes, et une rose sous un globe de verre, qui vous toise de toute la hauteur de ses épines.\n\nLe petit propriétaire des lieux est absent. Un mot sur un volcan dit seulement : « Parti voir un renard. Arrosez la rose. »",
            choices = {
                { text = "Parler à la rose", to = 39 },
                { text = "Arracher les baobabs", to = 40 },
                { text = "Ramoner un volcan", to = 42 },
                { text = "Repartir vers la ceinture", to = 45 },
            },
        },
        [39] = { -- rose
            text = "« Enfin quelqu’un ! » soupire la rose. « Personne ne m’arrose, personne ne m’admire. Je suis pourtant unique au monde. » Vous l’arrosez. Elle se radoucit.\n\n« Le trésor de la nébuleuse ? Je sais où il est caché. Retiens bien ceci : l’essentiel est invisible pour les yeux. Quand tu seras dans la nébuleuse, ferme-les et cherche avec ton cœur. » Elle tousse avec beaucoup d’élégance.",
            set = "secret_tresor",
            choices = {
                { text = "Arracher les baobabs pour elle", to = 40 },
                { text = "Ramoner un volcan", to = 42 },
                { text = "Repartir vers la ceinture", to = 45 },
            },
        },
        [40] = { -- baobab
            text = "Vous vous penchez sur une pousse de baobab. Mauvaise idée : celle-ci a eu le temps de grandir. Elle se redresse, agite ses racines comme des poings et pousse un grondement d’arbre vexé. Si on la laisse faire, elle fera éclater l’astéroïde.",
            fight = { name = "Baobab enragé", skill = 5, stamina = 5, win = 41 },
        },
        [41] = { -- baobab_ok
            text = "Le baobab vaincu, vous l’arrachez d’un coup sec et le jetez dans l’espace. La rose est ravie. « Tu es moins bête que tu en as l’air. » Venant d’elle, c’est un compliment immense.\n\nElle vous offre son globe de verre, dont elle n’a plus besoin, dit-elle, puisqu’elle a un ami. Il ferait un excellent casque de scaphandre.",
            gain = "globe",
            choices = {
                { text = "Ramoner un volcan", to = 42 },
                { text = "Repartir vers la ceinture", to = 45 },
            },
        },
        [42] = { -- volcan
            text = "Vous ramonez le volcan avec votre louche, comme le faisait le petit habitant des lieux chaque matin. Il y a de la suie partout et une drôle de chaleur. Quelque chose brille tout au fond, entre deux bouffées de fumée. Vous plongez le bras.",
            test = { stat = "luck", win = 43, lose = 44 },
        },
        [43] = { -- volcan_or
            text = "Vos doigts se referment sur une bourse de cuir oubliée là par un pirate d’autrefois : six doublons stellaires, à peine noircis. Vous ressortez couvert de suie, mais riche.\n\nCoco-Tron vous trouve une ressemblance avec un ramoneur savoyard. Vous prenez cela comme un compliment.",
            gold = 6,
            choices = {
                { text = "Repartir vers la ceinture", to = 45 },
            },
        },
        [44] = { -- volcan_suie
            text = "Le volcan crache un gros nuage de suie brûlante, pile au moment où vous regardiez dedans. Vous voilà noir comme un charbonnier, les sourcils frisés et une toux de vieux tracteur.\n\nCoco-Tron ne vous reconnaît plus et appelle la sécurité. Il faut dix minutes pour le convaincre.",
            stamina = -2,
            choices = {
                { text = "Repartir vers la ceinture", to = 45 },
            },
        },
        [45] = { -- b612_depart
            text = "À peine avez-vous quitté B 612 qu’un petit vaisseau vous aborde : un éclaireur du baron Von Pétoncle ! Un pirate au chapeau trop grand saute sur le pont, sabre laser au clair. « Rendez-vous, au nom du baron ! Enfin, rendez-vous… je veux dire : rendez-vous ! »\n\nIl n’a pas l’air très sûr de lui, mais son sabre, lui, l’est.",
            fight = { name = "Éclaireur de Von Pétoncle", skill = 7, stamina = 6, win = 46 },
        },
        [46] = { -- eclaireur
            text = "Désarmé, l’éclaireur se met à genoux. « Pitié ! Je n’ai signé que pour la mutuelle ! » En échange de sa liberté, il vous confie un secret : le Château d’If possède un vide-ordures qui débouche droit sur les cachots. Personne ne le surveille, à cause de l’odeur.\n\nIl vous laisse aussi trois doublons et repart dans sa coquille de noix.",
            set = "vide_ordures",
            gold = 3,
            choices = {
                { text = "Filer vers la ceinture de Saturne-Saint-Denis", to = 47 },
            },
        },
        [47] = { -- ceinture
            text = "Voici la ceinture de Saturne-Saint-Denis, un anneau scintillant de cailloux, de glaçons et de vieux caddies spatiaux. Au milieu dérive un banc de moules-frites géantes : des moules grandes comme des autobus, chacune escortée de frites volantes affamées.\n\nIl faut traverser. Coco-Tron tremble. « Moules ! Moules ! Maman ! »",
            choices = {
                { text = "Slalomer entre les anneaux", to = 48 },
                { text = "Traverser le banc de moules", to = 51 },
                { text = "Suivre la boussole de Jules Verne", to = 50, need = "boussole" },
            },
        },
        [48] = { -- ceint_slalom
            text = "Vous empoignez le manche et lancez La Baguette Stellaire entre les rochers et les glaçons. À gauche, un astéroïde ; à droite, un caddie ; en face, un frigo abandonné. Il va falloir piloter comme jamais, ou comme un taxi parisien un jour de grève.",
            test = { stat = "skill", win = 57, lose = 49 },
        },
        [49] = { -- ceint_choc
            text = "Bong ! Un astéroïde de la taille d’une église vous effleure. Le vaisseau tourne sur lui-même comme une toupie et vous vous cognez la tête contre l’étagère aux épices. Vous voyez des étoiles, ce qui, dans l’espace, ne change pas grand-chose.\n\nMais vous êtes passé, cabossé et couvert de paprika.",
            stamina = -3,
            choices = {
                { text = "Continuer vers le Château d’If", to = 57 },
            },
        },
        [50] = { -- ceint_boussole
            text = "L’aiguille de la boussole de Jules Verne s’affole, puis pointe une faille invisible entre deux rochers. Vous suivez sa direction et découvrez un tunnel de glace, creusé jadis par un certain capitaine Nemo en vacances.\n\nVous traversez la ceinture sans une égratignure. Sur la paroi, Nemo a gravé : « Mobilis in mobili ». Vous vous sentez béni des étoiles.",
            luck = 1,
            choices = {
                { text = "Continuer vers le Château d’If", to = 57 },
            },
        },
        [51] = { -- moules
            text = "Vous pénétrez dans le banc. Les moules-frites géantes s’ouvrent et se referment avec un bruit de clapet, et les frites volantes vous tournent autour en sifflant. L’une d’elles a déjà goûté votre antenne. Il faut agir vite, avant que tout le banc ne vous trouve à son goût.",
            choices = {
                { text = "Imiter le cri du goéland", to = 52, flag = "cri_goeland" },
                { text = "Les combattre à la louche", to = 53 },
                { text = "Foncer à travers en priant", to = 55 },
            },
        },
        [52] = { -- moules_cri
            text = "Vous mettez vos mains en porte-voix et poussez le plus beau cri de goéland jamais entendu hors de Bretagne. Les moules-frites se referment d’un coup, terrifiées, et les frites se cachent dans leurs coquilles. Tout le banc s’écarte devant vous, comme la mer Rouge.\n\nBrillat-Savarin serait fier. Coco-Tron essaie d’en faire autant et produit un bruit de klaxon.",
            choices = {
                { text = "Continuer vers le Château d’If", to = 57 },
            },
        },
        [53] = { -- moules_combat
            text = "Une moule-frite géante fonce sur vous, coquille grande ouverte, escortée de ses frites croustillantes. Elle sent le persil et l’échalote. Vous brandissez votre louche : ce soir, c’est vous qui cuisinez. Et vous avez déjà une idée de sauce marinière.",
            fight = { name = "Moule-frite géante", skill = 7, stamina = 7, win = 54 },
        },
        [54] = { -- moules_ok
            text = "La moule-frite vaincue se referme, vexée, et s’éloigne en traînant ses frites. Ses cousines n’osent plus approcher. Vous récupérez une barquette de frites égarées, encore tièdes, que vous partagez avec Coco-Tron.\n\nC’est gras, c’est salé, c’est délicieux, et ça vous redonne des forces pour la suite.",
            stamina = 3,
            choices = {
                { text = "Continuer vers le Château d’If", to = 57 },
            },
        },
        [55] = { -- moules_chance
            text = "Vous fermez les yeux, vous poussez les moteurs au maximum et vous foncez en récitant la recette de la blanquette de veau, pour vous porter bonheur. Autour de vous, les coquilles claquent comme des castagnettes, et une frite vous fait un clin d’œil inquiétant.",
            test = { stat = "luck", win = 57, lose = 56 },
        },
        [56] = { -- moules_mort
            text = "Clap ! Une moule-frite géante se referme sur La Baguette Stellaire. Il fait noir, il fait chaud, ça sent le vin blanc. Vous comprenez trop tard que vous êtes devenu la garniture.\n\nQuelque part dans la ceinture de Saturne-Saint-Denis, une moule digère tranquillement un vaisseau pirate, un perroquet robot et un cuistot. On dit qu’elle a trouvé le cuistot un peu trop salé.",
            ending = "death",
        },
        [57] = { -- chateau
            text = "Le Château d’If-en-Orbite apparaît enfin : une forteresse de pierre grise posée sur un rocher qui tourne lentement dans le vide. Ses tours sont hérissées de canons et de paraboles. Edmond Dantès lui-même n’y aurait pas passé ses vacances.\n\nPlusieurs entrées s’offrent à vous. Coco-Tron chuchote : « Discrétion ! Distraction ! »",
            choices = {
                { text = "Accoster au quai principal", to = 64 },
                { text = "Se glisser par le vide-ordures", to = 61, flag = "vide_ordures" },
                { text = "Se faire tirer au canon, casque au front", to = 58, need = "globe" },
            },
        },
        [58] = { -- canon
            text = "Comme dans De la Terre à la Lune, vous vous glissez dans le canon de secours du vaisseau, coiffé du globe de verre de la rose en guise de casque. Coco-Tron allume la mèche en criant « Feu ! Fou ! ». Vous allez traverser le vide et, avec un peu de chance, une fenêtre du château.",
            roll = { dice = 1, outcomes = { { upto = 1, to = 59 }, { upto = 6, to = 60 } } },
        },
        [59] = { -- canon_rate
            text = "Vous ratez le château de trois kilomètres et filez droit vers le soleil. La chaleur monte, monte. Votre tablier prend feu, puis vous aussi, mais avec beaucoup d’élégance, comme une crêpe Suzette.\n\nLes astronomes de la Terre notent ce soir-là une comète inexpliquée qui sent le Grand Marnier. Votre aventure finit en flambée.",
            ending = "death",
        },
        [60] = { -- canon_ok
            text = "Boum ! Vous traversez une lucarne dans une pluie de verre et atterrissez dans une pile de paillasses, au beau milieu des cachots. Vous avez mal partout, mais vous êtes dedans.\n\nUn garde endormi ronfle à l’autre bout du couloir. Vous vous relevez sans bruit en époussetant votre toque.",
            stamina = -2,
            choices = {
                { text = "Avancer dans les cachots", to = 70 },
            },
        },
        [61] = { -- ordures
            text = "Le vide-ordures est un toboggan gluant de pelures et de boîtes de conserve. Vous glissez longtemps, très longtemps, avant d’atterrir sur un tas de trognons. Un vieillard à longue barbe vous y attend, une cuillère à la main.\n\n« Je suis l’abbé du trognon. Je creuse un tunnel depuis vingt ans, avec cette cuillère. Vous avez à manger ? »",
            choices = {
                { text = "Lui donner votre baguette rassise", to = 62, need = "baguette" },
                { text = "Lui cuisiner un ragoût de trognons", to = 63 },
                { text = "Le saluer et filer vers les cachots", to = 70 },
            },
        },
        [62] = { -- abbe_pain
            text = "L’abbé croque la baguette rassise avec ses trois dents et pleure de joie. « Du vrai pain de France ! Depuis le temps ! » En remerciement, il soulève un trognon et vous montre une cachette.\n\nIl y a là une clé de cellule qu’il a fabriquée lui-même, en vingt ans de patience, avec des arêtes de sardine. « Moi, je préfère mon tunnel. »",
            gain = "cle",
            lose = "baguette",
            choices = {
                { text = "Filer vers les cachots", to = 70 },
            },
        },
        [63] = { -- abbe_ragout
            text = "Vous retroussez vos manches. Avec trois trognons, une pelure et un fond de bouillon, vous préparez un ragoût digne d’un grand restaurant. L’abbé en reprend quatre fois, vous aussi.\n\n« Vous êtes un génie, mon enfant. Le trésor de la nébuleuse ? On dit que l’essentiel y est invisible pour les yeux. Souvenez-vous-en. »",
            set = "secret_tresor",
            stamina = 3,
            choices = {
                { text = "Filer vers les cachots", to = 70 },
            },
        },
        [64] = { -- quai
            text = "Sur le quai principal, une sentinelle de fer de trois mètres de haut, aux yeux rouges, vous barre le passage avec une hallebarde laser. « Halte ! Qui va là ? Mot de passe, papiers ou pourboire ! »\n\nCoco-Tron, perché sur votre épaule, vous souffle : « Négocie ! Nécrologie ! » Charmant.",
            choices = {
                { text = "Donner le mot de passe", to = 66, flag = "code_if" },
                { text = "Montrer votre passeport galactique", to = 66, need = "passeport" },
                { text = "Glisser un pourboire (5 doublons)", to = 66, cost = 5 },
                { text = "Attaquer la sentinelle", to = 65 },
            },
        },
        [65] = { -- sentinelle
            text = "La sentinelle fait tournoyer sa hallebarde laser en grinçant. Elle est grande, elle est lourde, et elle a visiblement passé la nuit à lire le règlement. Elle charge. Sous ses pas, les dalles du quai tremblent comme des flans. Coco-Tron se cache dans votre toque.",
            fight = { name = "Sentinelle d’If", skill = 8, stamina = 8, win = 66 },
        },
        [66] = { -- quai_ok
            text = "La porte du château s’ouvre en grinçant. Vous voilà à l’intérieur, dans un grand hall glacé aux murs couverts de portraits du baron Von Pétoncle, chacun plus prétentieux que le précédent. Sur l’un d’eux, il pose en armure de coquillages.\n\nTrois couloirs partent du hall : l’un descend, l’autre monte, le troisième sent l’oignon frit.",
            choices = {
                { text = "Descendre vers les cachots", to = 70 },
                { text = "Monter à la passerelle du baron", to = 74 },
                { text = "Suivre l’odeur d’oignon frit", to = 67 },
            },
        },
        [67] = { -- cuisine
            text = "Vous débouchez dans les cuisines du château. Des robots marmitons s’affairent autour d’un chef à toque géante. Vous voyant arriver en tablier, il hurle : « Enfin, le renfort ! Le baron veut un soufflé pour son dîner, et tout de suite ! »\n\nVous voilà embauché. Le soufflé, vous connaissez. Le vôtre est retombé ce matin, d’ailleurs.",
            test = { stat = "skill", win = 68, lose = 69 },
        },
        [68] = { -- cuisine_ok
            text = "Votre soufflé monte, monte, et atteint une hauteur jamais vue dans la galaxie. Les marmitons applaudissent. Le chef pleure. On vous sert un repas de roi pour vous remercier.\n\nDans la confusion, vous empochez sur le crochet du chef la clé de cellule qu’il garde pour livrer la soupe aux prisonniers. Personne ne remarque rien : tout le monde regarde le soufflé.",
            gain = "cle",
            stamina = 4,
            choices = {
                { text = "Descendre vers les cachots", to = 70 },
                { text = "Monter à la passerelle du baron", to = 74 },
            },
        },
        [69] = { -- cuisine_ko
            text = "Votre soufflé enfle, enfle, et explose comme une bombe de crème. Les marmitons sont projetés contre les murs, le chef est repeint en jaune œuf. Vous en profitez pour filer dans la fumée, avec une brûlure au bout du nez.\n\nLe seul couloir libre descend vers les cachots.",
            stamina = -2,
            choices = {
                { text = "Descendre vers les cachots", to = 70 },
            },
        },
        [70] = { -- cachots
            text = "Les cachots sont humides et sombres. Derrière une grille, vous reconnaissez la barbe rousse de la capitaine Barbe-Comète, entourée de tout l’équipage qui chante pour garder le moral. Devant la grille, un geôlier à vapeur monte la garde en sifflant comme une cocotte-minute.\n\n« Cuistot ! » s’écrie la capitaine. « Tu as pensé aux géraniums ? »",
            choices = {
                { text = "Ouvrir avec la clé de cellule", to = 73, need = "cle" },
                { text = "Crocheter la serrure avec la louche", to = 71 },
                { text = "Attaquer le geôlier à vapeur", to = 72 },
            },
        },
        [71] = { -- crochetage
            text = "Pendant que le geôlier regarde ailleurs, vous glissez le manche de votre louche en titane dans la serrure. Il faut de la finesse, comme pour monter une mayonnaise. Un tour à gauche, un petit tour à droite, et surtout ne pas éternuer.",
            test = { stat = "skill", win = 73, lose = 72 },
        },
        [72] = { -- geolier
            text = "Le geôlier à vapeur se retourne en sifflant de rage. Ses bras de cuivre tournent comme des moulinets et de la vapeur sort de ses oreilles. « Évasion ! Évasion ! » crie-t-il d’une voix de bouilloire. Il fait chaud d’un coup.",
            fight = { name = "Geôlier à vapeur", skill = 7, stamina = 8, win = 73 },
        },
        [73] = { -- liberes
            text = "La grille s’ouvre ! L’équipage vous soulève et vous lance en l’air trois fois en criant « Hourra pour le cuistot ! ». La capitaine Barbe-Comète vous serre dans ses bras à vous en faire craquer les côtes.\n\n« Le baron m’a pris la carte de la nébuleuse. Allons la récupérer, et lui apprendre les bonnes manières. » L’équipage brandit ses cuillères.",
            set = "capitaine_libre",
            stamina = 4,
            choices = {
                { text = "Monter à l’assaut de la passerelle", to = 74, noflag = "baron_vaincu" },
                { text = "Filer vers la nébuleuse", to = 80, flag = "baron_vaincu" },
            },
        },
        [74] = { -- passerelle
            text = "La passerelle du baron domine le vide par une immense baie vitrée. Le baron Von Pétoncle, vêtu d’une cape en coquilles Saint-Jacques, se retourne lentement. À ses côtés, son second, le lieutenant Bigorneau, ricane bêtement.\n\n« Tiens, tiens, le cuistot ! Je vais te servir en entrée ! » Le baron dégaine son sabre laser.",
            choices = {
                { text = "Défier le baron, l’équipage s’occupe du second", to = 77, flag = "capitaine_libre" },
                { text = "Affronter le baron et son second", to = 78, noflag = "capitaine_libre" },
                { text = "Lancer la baguette rassise au baron", to = 75, need = "baguette" },
            },
        },
        [75] = { -- baguette_lancer
            text = "Vous lancez la baguette rassise comme un boomerang. Elle fend l’air en sifflant, dure comme du béton. Si elle touche le baron en pleine perruque, le combat sera fini avant d’avoir commencé. Sinon, il faudra se battre, et le baron n’a pas l’air d’aimer le pain.",
            test = { stat = "luck", win = 79, lose = 76 },
        },
        [76] = { -- baguette_rate
            text = "La baguette rebondit sur la baie vitrée et revient vous frapper le front. Le lieutenant Bigorneau se roule par terre de rire. Le baron, lui, ne rit pas du tout. Il s’avance, sabre au poing.\n\nPlus question de ruse : il va falloir croiser le fer.",
            stamina = -1,
            choices = {
                { text = "Défier le baron, l’équipage s’occupe du second", to = 77, flag = "capitaine_libre" },
                { text = "Affronter le baron et son second", to = 78, noflag = "capitaine_libre" },
            },
        },
        [77] = { -- duel
            text = "Pendant que l’équipage ficelle le lieutenant Bigorneau comme un rôti, vous affrontez le baron. Il manie le sabre laser comme Cyrano maniait les mots : « À la fin de l’envoi, je touche ! » Vous répliquez à la louche, ce qui est moins poétique mais très efficace.",
            fight = { name = "Baron Von Pétoncle", skill = 9, stamina = 9, win = 79 },
        },
        [78] = { -- duel_double
            text = "Seul contre deux ! Le lieutenant Bigorneau attaque le premier, en agitant une fourchette à escargots géante. Derrière lui, le baron attend son tour en lissant sa moustache. Vous serrez votre louche : pour l’honneur de la cuisine française !",
            fight = { enemies = { { name = "Lieutenant Bigorneau", skill = 6, stamina = 5 }, { name = "Baron Von Pétoncle", skill = 9, stamina = 8 } }, win = 79 },
        },
        [79] = { -- baron_vaincu
            text = "Le baron Von Pétoncle s’effondre en arrière, sa cape de coquillages en bataille. Il se rue dans sa capsule de sauvetage, qui démarre en toussant et part en vrille vers la planète Camembert. On ne le reverra pas de sitôt.\n\nSur son fauteuil, il a laissé la carte de la nébuleuse, roulée dans un étui en écaille d’huître. Vous l’empochez avec un sourire de pirate.",
            gain = "carte",
            set = "baron_vaincu",
            choices = {
                { text = "Délivrer l’équipage dans les cachots", to = 70, noflag = "capitaine_libre" },
                { text = "Filer vers la nébuleuse", to = 80 },
            },
        },
        [80] = { -- nebuleuse
            text = "La nébuleuse de la Crêpe s’étend devant vous, immense voile rose et doré, roulé comme une crêpe au sucre. Quelque part là-dedans se cache le trésor légendaire, que les pirates cherchent depuis Barbe-Noire.\n\nDes nuages tourbillonnent, des étoiles clignotent. Il est très facile de s’y perdre. Coco-Tron murmure : « Trésor ! Tracteur ! » Il est ému.",
            choices = {
                { text = "Suivre la carte de la nébuleuse", to = 83, need = "carte" },
                { text = "Fermer les yeux et chercher avec le cœur", to = 85, flag = "secret_tresor" },
                { text = "Se fier au hasard des courants", to = 81 },
            },
        },
        [81] = { -- hasard
            text = "Vous lâchez le gouvernail et laissez les courants cosmiques vous porter, comme une bouteille à la mer. Les nuages défilent, roses, jaunes, verts. Le vaisseau tourne lentement. Où allez-vous atterrir ? Coco-Tron croise les ailes. Vous, vous croisez les doigts et les orteils.",
            roll = { dice = 1, outcomes = { { upto = 1, to = 5 }, { upto = 3, to = 82 }, { upto = 6, to = 86 } } },
        },
        [82] = { -- perdu
            text = "Les courants vous déposent sur une petite planète tranquille, où il ne se passe jamais rien. Le trésor ? Introuvable. Mais l’herbe est verte, les habitants sont gentils et personne ne sait faire la cuisine.\n\nVous ouvrez un petit restaurant, « Le Cuistot Perdu », qui devient vite la meilleure table du coin. Ce n’est pas la gloire, mais c’est la paix. Votre aventure s’arrête là.",
            ending = "end",
        },
        [83] = { -- carte
            text = "La carte vous guide entre les nuages jusqu’à l’astéroïde Brie-sur-Marne, un caillou blanc et duveteux. En son centre, sur un socle, trône un coffre doré. Mais devant lui, des dalles gravées de pièges, et une inscription : « Seul un fin gourmet passera. »\n\nIl faut marcher sur les bonnes dalles : roquefort, comté, reblochon…",
            test = { stat = "skill", win = 86, lose = 84 },
        },
        [84] = { -- brie_piege
            text = "Vous posez le pied sur la dalle « fromage râpé en sachet ». Sacrilège ! Le sol s’ouvre et vous tombez dans une cuve géante de brie coulant. Vous vous enfoncez lentement, voluptueusement, dans la crème.\n\nLes archéologues du futur vous retrouveront, parfaitement affiné, dans mille ans. Ils vous serviront avec du raisin. Votre aventure s’arrête ici.",
            ending = "death",
        },
        [85] = { -- invisible
            text = "Vous fermez les yeux. Les paroles reviennent : l’essentiel est invisible pour les yeux. Vous pilotez au cœur, au flair, comme on goûte une sauce. Le vaisseau glisse, tourne, s’arrête.\n\nVous rouvrez les yeux : vous êtes posé sur l’astéroïde Brie-sur-Marne, juste derrière le coffre. Les pièges sont tous de l’autre côté. Coco-Tron siffle d’admiration.",
            luck = 2,
            choices = {
                { text = "Ouvrir le coffre", to = 86 },
            },
        },
        [86] = { -- brie
            text = "Le coffre s’ouvre dans un grincement délicieux. Il déborde de doublons stellaires, de perles de comète et, tout au fond, du plus grand trésor de tous : le livre de recettes perdu de la galaxie, écrit à la main par les plus grands chefs de l’univers.\n\nVous tremblez d’émotion. Il ne reste qu’à rentrer, chargé d’or.",
            choices = {
                { text = "Partager le trésor avec l’équipage", to = 88, flag = "capitaine_libre" },
                { text = "Rentrer avec le butin", to = 87, noflag = "capitaine_libre" },
            },
        },
        [87] = { -- fin_good
            text = "Vous rentrez chargé d’or et de recettes. Mais une pensée vous serre le cœur : la capitaine et l’équipage croupissent encore au Château d’If. Avec le trésor, vous achetez un vaisseau tout neuf, embauchez une armée de mercenaires et revenez les libérer une semaine plus tard.\n\nBarbe-Comète vous pardonne le retard, à condition que vous cuisiniez la recette numéro 1 du livre. Fin heureuse… avec un petit goût de réchauffé.",
            ending = "win",
        },
        [88] = { -- fin_best
            text = "La capitaine Barbe-Comète ouvre le livre de recettes et éclate de rire. « Le vrai trésor, c’était l’équipage… et un peu l’or, aussi. » On partage tout, à parts égales, plus une part pour Coco-Tron, qui s’achète des piles neuves.\n\nCe soir-là, sur La Baguette Stellaire, vous préparez le plus grand banquet de l’histoire de la piraterie. La capitaine vous nomme second et chef cuisinier à vie. Victoire totale, et le soufflé ne retombe pas !",
            ending = "win",
        },
    },
}
