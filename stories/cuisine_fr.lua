return {
    title       = "Le Soufflé du Roi-Soleil",
    author      = "Gamebook",
    lang        = "fr",
    blurb       = "Versailles, 1680. Un concours de cuisine pour Louis XIV : petits pois, chocolat, sabotages... À vos fourneaux !",
    sheet       = true,
    start       = 1,
    start_gold  = 3,
    start_items = {},
    items = {
        laissez    = "Laissez-passer de Vatel",
        petitspois = "Panier de petits pois",
        chocolat   = "Chocolat de la Reine",
        glace      = "Seau de glace",
        jus        = "Jus de pomme",
        fromage    = "Brie de Meaux",
        cle        = "Clé de la glacière",
    },
    sections = {
        [1] = {
            text = "Cinq heures du matin, cuisines du Grand Commun. Mille casseroles de cuivre brillent, les broches tournent, et vous, la plus jeune recrue des fourneaux, épluchez votre centième oignon.\n\nGrande nouvelle : ce soir, le Roi-Soleil goûtera les plats d'un concours ouvert à tous. Le gagnant deviendra « cuisinier du Roi » ! Maître Gaspard Brûlemiche, le chef le plus prétentieux de France, ricane déjà : « Toi ? Ton plat finira chez les cochons. » Au fond, monsieur Vatel s'arrache les cheveux.",
            choices = {
                { text = "Aller voir ce qui tourmente Vatel", to = 2 },
                { text = "Espionner le poste de Gaspard", to = 3 },
                { text = "Partir chercher des ingrédients", to = 10 },
            },
        },
        [2] = {
            text = "Vatel, le célèbre maître d'hôtel, tourne en rond comme une crêpe dans sa poêle. « La marée ! Le poisson devait arriver de Dieppe à l'aube ! Turbots, soles, barbues... Rien ! Douze tables à servir, et pas une arête ! » Il vous saisit par les épaules, les yeux exorbités. « Si le poisson n'arrive pas, je... je... je ne sais pas ce que je fais, mais je le fais très fort ! »",
            choices = {
                { text = "Courir guetter le poisson à la grille", to = 4 },
                { text = "Lui préparer une tisane", to = 5 },
            },
        },
        [3] = {
            text = "Vous vous glissez entre deux pyramides de choux jusqu'au poste de Gaspard Brûlemiche. Son garde-manger est fermé par un simple loquet... mais devant, roulé en boule sur un sac de farine, veille Mistigri, le chat des cuisines. Un monstre de neuf kilos qui a déjà volé trois gigots, un faisan et la perruque d'un sommelier.\n\nIl ouvre un oeil jaune et vous fixe. Sa queue fouette l'air.",
            choices = {
                { text = "Forcer le passage", to = 11 },
                { text = "Repartir sur la pointe des pieds", to = 10 },
            },
        },
        [4] = {
            text = "À la grille d'honneur, une charrette à poissons vient enfin d'arriver, couverte de glace et d'algues. Hélas, un mousquetaire du Roi, moustache en croc et ventre en tonneau, soulève déjà la bâche. On l'appelle La Fringale. « Halte ! Ce turbot est suspect. Je dois le goûter. Entièrement. »\n\nLe cocher lève les yeux au ciel. Vatel compte sur vous, même s'il ne le sait pas encore.",
            choices = {
                { text = "Défendre le poisson à la louche", to = 6 },
                { text = "Lui faire croire que le turbot est empoisonné", to = 7 },
            },
        },
        [5] = {
            text = "Vous servez à Vatel une tisane de tilleul avec une goutte de fleur d'oranger. Il la boit d'un trait, se calme un peu et vous confie, comme un secret d'État : « Écoute bien, petit génie. Le Roi est fou de petits pois. Fou ! Toute la cour en mange, avant le souper, après le souper, et même la nuit en cachette. »\n\nPuis il replonge dans l'angoisse : « Mais mon poisson... »",
            stamina = 2,
            set = "gout_roi",
            choices = {
                { text = "Courir guetter le poisson à la grille", to = 4 },
                { text = "Partir chercher des ingrédients", to = 10 },
            },
        },
        [6] = {
            text = "Vous brandissez votre louche comme une rapière. La Fringale éclate de rire, retrousse sa moustache et dégaine... une baguette de pain. « En garde, petit marmiton ! Le premier qui touche l'autre gagne le turbot ! »\n\nLes palefreniers font cercle autour de vous. Les paris sont ouverts.",
            fight = { name = "La Fringale, mousquetaire", skill = 8, stamina = 7, win = 8, flee = 10 },
        },
        [7] = {
            text = "Vous prenez un air horrifié. « Monsieur ! Ne touchez pas ce turbot ! Il a été pêché par un espion hollandais, il est plein de... de hareng maudit ! » La Fringale hésite, la main au-dessus du poisson. Il renifle, plisse les yeux, vous dévisage. Tout dépend maintenant de votre chance et de votre talent de comédien.",
            test = { stat = "luck", win = 8, lose = 9 },
        },
        [8] = {
            text = "Vous ramenez la charrette au Grand Commun en triomphe. Vatel pleure de joie sur un turbot, embrasse une barbue et vous serre dans ses bras. « Tu m'as sauvé ! Tiens, voici six écus, et mon laissez-passer : il t'ouvrira toutes les portes du château. »\n\nIl redevient aussitôt nerveux : « Maintenant, il manque le persil. Où est le persil ? QUI A PRIS LE PERSIL ? »",
            gold = 6,
            gain = "laissez",
            set = "vatel_ami",
            choices = {
                { text = "Partir chercher des ingrédients", to = 10 },
            },
        },
        [9] = {
            text = "La Fringale n'y croit pas une seconde. « Hareng maudit ? Ha ! Je mange du danger au petit-déjeuner ! » Pour vous punir, il engloutit une sole crue devant vous et vous pince l'oreille au passage. Aïe !\n\nPuis, repu, il s'éloigne en sifflotant. Il reste tout le reste de la marée : la charrette est sauvée, à une sole près.",
            stamina = -2,
            choices = {
                { text = "Ramener la charrette à Vatel", to = 8 },
            },
        },
        [10] = {
            text = "Vous voici dans la grande cour du Grand Commun, un panier sous le bras. Autour de vous, Versailles s'éveille : les jardiniers de Le Nôtre ratissent les allées, les carrosses roulent vers le château, et des odeurs de pain chaud flottent dans l'air.\n\nPour un plat digne du Roi, il faut les meilleurs ingrédients du royaume. Et ils sont tous ici, quelque part. Le concours commence ce soir, au souper du Roi.",
            choices = {
                { text = "Visiter le Potager du Roi", to = 13, noflag = "vu_potager", hide = true },
                { text = "Entrer au château", to = 24, noflag = "vu_chateau", hide = true },
                { text = "Descendre dans les jardins", to = 45, noflag = "vu_jardins", hide = true },
                { text = "Retourner en cuisine préparer le plat", to = 58 },
            },
        },
        [11] = {
            text = "Vous tendez la main vers le loquet. Mistigri se dresse, gonfle sa queue comme un plumeau et pousse un feulement qui fait trembler les casseroles. Puis il bondit, toutes griffes dehors, en visant votre bonnet. Vous attrapez un couvercle en guise de bouclier. Ce chat-là a fait reculer des ducs !",
            fight = { name = "Mistigri, chat des cuisines", skill = 6, stamina = 5, win = 12, flee = 10 },
        },
        [12] = {
            text = "Mistigri, vexé, part bouder sous l'évier avec une saucisse. Dans le garde-manger de Gaspard, vous trouvez un papier griffonné : « Plan pour ce soir. Remplacer le sucre du petit marmiton par du sel. Rire très fort. Devenir cuisinier du Roi. »\n\nLe misérable ! Vous remettez le papier en place. Au moins, maintenant, vous savez à quoi vous attendre.",
            set = "complot",
            choices = {
                { text = "Partir chercher des ingrédients", to = 10 },
            },
        },
        [13] = {
            text = "Le Potager du Roi s'étend comme un damier vert, avec ses murs couverts de poiriers en espaliers et ses carrés de salades alignés au cordeau. Au milieu, un monsieur en perruque inspecte une poire à la loupe : c'est Jean-Baptiste de La Quintinie, le jardinier du Roi, capable de faire pousser des asperges en décembre.\n\nPrès du mur, des rangées de petits pois se balancent au vent. Personne ne les garde.",
            set = "vu_potager",
            choices = {
                { text = "Saluer La Quintinie", to = 14 },
                { text = "Cueillir des petits pois en douce", to = 15 },
            },
        },
        [14] = {
            text = "La Quintinie se redresse. « Ah, la jeunesse des cuisines ! Savez-vous que cette poire est une bon-chrétien d'hiver ? Le Roi la croque comme un enfant. » Il vous fait visiter ses melons, ses figuiers, ses fraisiers, et parle sans s'arrêter pendant un bon quart d'heure.\n\nEnfin, il soupire : « Mes garçons sont partis à la messe, et mes melons ont soif. »",
            choices = {
                { text = "Proposer d'arroser les melons", to = 16 },
                { text = "Demander des petits pois", to = 17 },
            },
        },
        [15] = {
            text = "Accroupi entre deux rangs, vous remplissez votre panier aussi vite que possible. Écosser en silence est un art : une cosse qui craque, et toute l'allée vous entend. À vingt pas, La Quintinie tourne lentement la tête vers vous, sa loupe à la main.",
            test = { stat = "skill", win = 18, lose = 19 },
        },
        [16] = {
            text = "Vous charriez des arrosoirs pendant une heure, entre les melons, les artichauts et les choux-fleurs. Le dos en compote, mais le coeur content. La Quintinie, ravi, vous offre une poire juteuse et remplit lui-même votre panier de petits pois tout frais.\n\n« Écossez-les au dernier moment, avec du beurre, une laitue et une pincée de sucre. Le Roi en raffole. »",
            stamina = 3,
            gain = "petitspois",
            choices = {
                { text = "Quitter le potager", to = 22 },
            },
        },
        [17] = {
            text = "La Quintinie croise les bras. « Des petits pois ? Ce sont les perles de mon potager. Je n'en donne qu'aux gens qui savent ce qu'ils font. Dites-moi donc : quel est le légume préféré de Sa Majesté ? »\n\nIl vous fixe par-dessus sa loupe. Un mauvais choix, et vous repartez avec une botte de radis.",
            choices = {
                { text = "Répondre : les petits pois", to = 20, flag = "gout_roi" },
                { text = "Répondre : le navet", to = 21 },
                { text = "Proposer plutôt d'arroser", to = 16 },
            },
        },
        [18] = {
            text = "Pas une cosse n'a craqué. La Quintinie retourne à sa poire, et vous filez, le panier rempli de petits pois verts comme des émeraudes. Vous vous sentez un peu coupable... mais c'est pour le Roi, après tout. Les petits pois du Roi pour le Roi : ce n'est presque pas du vol.",
            gain = "petitspois",
            choices = {
                { text = "Quitter le potager", to = 22 },
            },
        },
        [19] = {
            text = "Crac ! Une cosse explose comme un pétard. La Quintinie accourt, rouge comme une tomate de son propre potager. « Un voleur de petits pois ! Dans MON potager ! » Il vous tire par l'oreille jusqu'au milieu de l'allée et vous gronde pendant dix bonnes minutes.\n\nEnfin, il se calme un peu. « Bon. Vous avez du goût, au moins. Voyons si vous avez aussi de la culture. »",
            stamina = -1,
            choices = {
                { text = "Écouter sa question", to = 17 },
            },
        },
        [20] = {
            text = "« Les petits pois ! Exactement ! » La Quintinie vous serre la main avec émotion. « Voilà une jeunesse qui comprend les choses. » Il remplit votre panier de petits pois fins, de ceux qu'on réserve à la table royale, et y ajoute une laitue pour la cuisson.\n\n« Allez, et faites honneur à mon potager ! »",
            gain = "petitspois",
            choices = {
                { text = "Quitter le potager", to = 22 },
            },
        },
        [21] = {
            text = "« Le NAVET ? » La Quintinie devient pâle. « Le navet est un légume de soldat, de prison, de théâtre raté ! Monsieur Molière lui-même a peur des navets ! » Il vous tourne le dos et se met à parler à ses poiriers, beaucoup plus intelligents que vous, semble-t-il.\n\nVous pourriez encore vous racheter.",
            choices = {
                { text = "Proposer d'arroser les melons", to = 16 },
                { text = "Partir les mains vides", to = 22 },
            },
        },
        [22] = {
            text = "À la sortie du potager, près de la pièce d'eau des Suisses, un marchand venu de Meaux a posé sa carriole. Une odeur puissante vous chatouille le nez : des meules de brie, crémeuses, coulantes, magnifiques. « Le roi des fromages, pour la table du Roi des rois ! » crie-t-il. « Trois écus la part, et c'est donné ! »",
            choices = {
                { text = "Acheter une part de brie", to = 23, cost = 3 },
                { text = "Rentrer au Grand Commun", to = 10 },
            },
        },
        [23] = {
            text = "Le marchand vous emballe une belle part de brie dans une feuille de châtaignier. Il vous en fait goûter un morceau sur une tranche de pain. C'est si bon que vous en oubliez votre nom pendant quelques secondes.\n\n« Avec ça, mon enfant, même un duc vous ouvrira sa porte. » Vous repartez, le panier parfumé à vingt pas à la ronde.",
            gain = "fromage",
            stamina = 2,
            choices = {
                { text = "Rentrer au Grand Commun", to = 10 },
            },
        },
        [24] = {
            text = "La cour de Marbre resplendit au soleil, avec ses dorures, ses bustes et ses balcons. Un garde suisse, hallebarde en main et mollets d'acier, vous barre l'entrée du château. « On n'entre pas avec un panier à légumes. C'est Versailles ici, pas le marché des Halles ! »\n\nSur le côté, une petite porte mène à un escalier de service, d'où montent des éclats de voix et des rires.",
            set = "vu_chateau",
            choices = {
                { text = "Montrer le laissez-passer de Vatel", to = 26, need = "laissez" },
                { text = "Glisser deux écus au garde", to = 26, cost = 2 },
                { text = "Prendre l'escalier de service", to = 25 },
            },
        },
        [25] = {
            text = "L'escalier tourne, tourne, et vous débouchez dans une salle pleine de costumes, de turbans et de faux nez. Un homme vif, en habit vert, déclame devant ses comédiens : c'est Molière en personne ! Il répète une pièce pour le Roi.\n\n« Un marmiton ! Parfait ! Il me manque justement un cuisinier turc pour la scène du Mamamouchi. Vous savez crier en faux turc ? »",
            choices = {
                { text = "Jouer la scène avec Molière", to = 27 },
                { text = "Décliner et filer vers la Galerie", to = 26 },
            },
        },
        [26] = {
            text = "Vous entrez dans la Galerie des Glaces, et vous en restez bouche bée. Trois cent cinquante-sept miroirs, des lustres de cristal, des plafonds peints où Louis XIV gagne toutes les batailles. Les courtisans glissent sur le parquet en chuchotant.\n\nPrès d'une fenêtre, une dame écrit à toute vitesse sur un petit pupitre : c'est Madame de Sévigné, la plus grande bavarde épistolaire du royaume.",
            choices = {
                { text = "Parler à Madame de Sévigné", to = 28 },
                { text = "Admirer les miroirs", to = 29 },
                { text = "Gagner l'appartement de la Reine", to = 32 },
            },
        },
        [27] = {
            text = "Molière vous coiffe d'un turban et vous pousse sur la scène. « Quand je lève la main, vous criez : Hou la ba ba la chou ! Et vous tournez trois fois sur vous-même ! » Les comédiens vous regardent, curieux. Il faut du rythme, de l'aplomb et ne pas se prendre les pieds dans sa babouche.",
            test = { stat = "skill", win = 30, lose = 31 },
        },
        [28] = {
            text = "Madame de Sévigné lève sa plume. « Ma petite ! Venez donc, j'écris à ma fille, à Grignan. Je lui raconte tout : qui a bâillé à la messe, qui a perdu sa perruque au jeu. » Ses yeux pétillent. « Et vous, que faites-vous ? Racontez-moi tout, absolument tout. » Elle trempe déjà sa plume dans l'encre.",
            choices = {
                { text = "Lui confier votre recette secrète", to = 33 },
                { text = "Lui demander les derniers potins", to = 34 },
            },
        },
        [29] = {
            text = "Vous vous approchez d'un miroir. Puis d'un autre. Cent petits marmitons vous saluent, cent paniers se balancent. Vous tournez sur vous-même, une fois, deux fois... Où est la sortie ? Où est la fenêtre ? Où êtes-vous, d'ailleurs ? Vous avancez à tâtons parmi les reflets en espérant tomber sur la bonne porte.",
            test = { stat = "luck", win = 32, lose = 35 },
        },
        [30] = {
            text = "« Hou la ba ba la chou ! » Vous tournez trois fois, parfaitement. Les comédiens applaudissent, et Molière essuie une larme. « Magnifique ! Vous avez le sens du ridicule, c'est rare. » Il vous offre une part de sa tourte pour la peine.\n\n« Méfiez-vous de Brûlemiche, ajoute-t-il. Je l'ai entendu se vanter de saler le sucre d'un rival. Ce bonhomme ferait un excellent Tartuffe. »",
            stamina = 2,
            set = "complot",
            choices = {
                { text = "Filer vers la Galerie des Glaces", to = 26 },
            },
        },
        [31] = {
            text = "Votre babouche s'envole, votre turban tombe, et vous criez « Hou la chou la ba ba ! » en atterrissant dans un panier de faux nez. Silence. Puis Molière s'écroule de rire.\n\n« Génial ! Personne ne m'a jamais fait rire comme ça ! Restez avec nous. Nous partons en tournée, Lyon, Pézenas, toute la France ! La cuisine peut attendre, non ? »",
            choices = {
                { text = "Rejoindre la troupe de Molière", to = 36 },
                { text = "Refuser : votre vie, ce sont les fourneaux", to = 26 },
            },
        },
        [32] = {
            text = "Vous arrivez dans l'antichambre de la reine Marie-Thérèse. Une odeur délicieuse flotte ici : cannelle, vanille, et ce parfum nouveau venu d'Espagne... le chocolat ! Une servante espagnole remue une chocolatière fumante : c'est La Molina, la gardienne du chocolat de la Reine.\n\nUne porte entrouverte donne sur l'office, où s'empilent les tablettes.",
            choices = {
                { text = "Demander poliment du chocolat", to = 37 },
                { text = "Proposer le brie en échange", to = 42, need = "fromage" },
                { text = "Se glisser dans l'office", to = 39 },
            },
        },
        [33] = {
            text = "Vous lui racontez tout : vos ingrédients, vos rêves, votre rival. Elle écrit, écrit, écrit, et lit à voix haute : « Ma fille, j'ai rencontré une jeune personne des cuisines qui veut faire manger au Roi le plus beau plat du siècle. Je parie sur elle. »\n\nVous voilà dans une lettre de Madame de Sévigné. Vous voilà soudain en veine.",
            luck = 1,
            choices = {
                { text = "Gagner l'appartement de la Reine", to = 32 },
            },
        },
        [34] = {
            text = "Madame de Sévigné baisse la voix. « Deux potins, ma chère. Le premier : la Reine adore le chocolat, elle en boit en cachette, et se languit de l'Espagne quand on n'en parle pas. Le second : Maître Brûlemiche a acheté un plein sac de sel fin ce matin, pour un dessert. Pour un dessert ! J'en ai déjà écrit trois pages. »",
            set = { "potins", "complot" },
            choices = {
                { text = "Gagner l'appartement de la Reine", to = 32 },
            },
        },
        [35] = {
            text = "Vous sortez des miroirs par la mauvaise porte et percutez un homme en grande perruque qui dirige vingt-quatre violons à grands coups de bâton sur le parquet. Boum ! Boum ! C'est Jean-Baptiste Lully, surintendant de la musique du Roi. Il pointe son bâton vers vous.\n\n« Vous ! Vous avez cassé ma mesure ! Savez-vous seulement battre la mesure ? »",
            choices = {
                { text = "Battre la mesure au fouet à oeufs", to = 40 },
                { text = "Vous enfuir avant le coup de bâton", to = 32 },
            },
        },
        [36] = {
            text = "Vous troquez votre tablier contre un turban et partez sur les routes avec la troupe de Molière. Vous jouez le Turc, le notaire, la servante et même un fauteuil, une fois. Vous ne cuisinez plus que des omelettes entre deux représentations.\n\nLe concours du Roi ? Gaspard l'a gagné, paraît-il. Mais à Pézenas, on vous jette des fleurs. Et pas une seule fois de navets.",
            ending = "end",
        },
        [37] = {
            text = "La Molina vous toise. « ¿Chocolate? Le chocolat de Sa Majesté la Reine n'est pas pour les marmitons. » Elle remue sa chocolatière avec un moulinet en bois, d'un air farouche. On dirait un dragon gardant son trésor, version tablier et castagnettes. Il faudra la convaincre.",
            choices = {
                { text = "Évoquer la passion secrète de la Reine", to = 38, flag = "potins" },
                { text = "Lui acheter une tablette (3 écus)", to = 38, cost = 3 },
                { text = "Renoncer et quitter le château", to = 41 },
            },
        },
        [38] = {
            text = "La Molina s'adoucit. « Ah... vous savez donc. Notre pauvre Reine, si loin de Madrid... » Elle vous glisse une tablette de chocolat, noire et parfumée à la cannelle, enveloppée dans un mouchoir de dentelle. « Pour un dessert digne d'elle. Et si la Reine sourit ce soir, je vous embrasse. »",
            gain = "chocolat",
            choices = {
                { text = "Quitter le château", to = 41 },
            },
        },
        [39] = {
            text = "Vous vous faufilez dans l'office, entre les chocolatières d'argent et les pots de cannelle. Les tablettes sont là, sur une étagère haute. Il faut monter sur un tabouret bancal, attraper une tablette et redescendre sans renverser la pile de tasses en porcelaine. La Molina chante dans la pièce d'à côté. Doucement...",
            test = { stat = "skill", win = 43, lose = 44 },
        },
        [40] = {
            text = "Vous sortez votre fouet et battez la mesure sur votre panier : un, deux, trois, un, deux, trois. Lully hausse un sourcil, puis sourit. « Pas mal. Pas mal du tout ! Vous battez les oeufs comme on bat un menuet. »\n\nIl range son bâton. « Ce soir, au souper, je jouerai pour votre plat. Faites-moi signe. » Et il retourne à ses violons.",
            set = "lully",
            choices = {
                { text = "Gagner l'appartement de la Reine", to = 32 },
            },
        },
        [41] = {
            text = "Vous redescendez par le grand escalier des Ambassadeurs, ses marbres de toutes les couleurs et ses tapisseries. Des ambassadeurs persans vous saluent avec cérémonie, croyant sans doute que vous êtes un prince déguisé. Vous leur rendez leur salut avec votre panier.\n\nDehors, le soleil grimpe dans le ciel. Le temps file.",
            choices = {
                { text = "Retourner au Grand Commun", to = 10 },
            },
        },
        [42] = {
            text = "Vous déballez le brie. La Molina hume, ferme les yeux, et soupire. « Ay, Dios mío... » Elle l'échange aussitôt contre une belle tablette de chocolat à la cannelle et, pour faire bonne mesure, vous verse une tasse de chocolat chaud.\n\n« Le fromage, c'est pour moi. La Reine n'a pas besoin de savoir. »",
            lose = "fromage",
            stamina = 2,
            choices = {
                { text = "Prendre la tablette", to = 38 },
            },
        },
        [43] = {
            text = "Le tabouret tangue mais tient bon. Vous attrapez une tablette, redescendez en souplesse, et pas une tasse n'a tinté. Au passage, vous goûtez une cuillerée de chocolat chaud qui traînait. Une merveille : épais, sucré, avec un soupçon de piment.\n\nVous filez avant que La Molina ne finisse son couplet.",
            stamina = 2,
            choices = {
                { text = "Filer avec la tablette", to = 38 },
            },
        },
        [44] = {
            text = "Le tabouret bascule. Vous tombez dans un fracas de porcelaine et de petites cuillères. La Molina surgit, armée de son moulinet à chocolat, et vous assène trois coups sur les doigts en criant des mots espagnols que vous préférez ne pas comprendre.\n\nPuis elle vous tire par le col jusqu'à l'antichambre. « Bon. Qu'est-ce que tu veux, petit voleur ? »",
            stamina = -2,
            choices = {
                { text = "Avouer que vous voulez du chocolat", to = 37 },
            },
        },
        [45] = {
            text = "Les jardins de Versailles se déroulent jusqu'à l'horizon : parterres en broderie, bosquets secrets, fontaines qui crachent des gerbes d'eau. Sur le Parterre d'eau, un vieil homme mesure une allée avec une corde : André Le Nôtre, le jardinier des jardins du Roi.\n\nPlus loin brille le Grand Canal, où glissent des gondoles. Et quelque part par ici, il y a une glacière, pleine de glace de l'hiver dernier.",
            set = "vu_jardins",
            choices = {
                { text = "Aller saluer Le Nôtre", to = 46 },
                { text = "Chercher la glacière", to = 47 },
                { text = "Descendre au Grand Canal", to = 48 },
            },
        },
        [46] = {
            text = "Le Nôtre vous regarde de la tête aux pieds. « Toi ! Tu tombes bien. Le Roi fait sa promenade dans dix minutes, et la statue de ce socle est partie chez le doreur. Grimpe là-dessus, tiens-toi droit comme un faune et ne bouge plus. Le Roi déteste les socles vides. » Il vous tend une grappe de raisin en plâtre.",
            choices = {
                { text = "Accepter de poser en statue", to = 49 },
                { text = "Refuser et filer vers la glacière", to = 47 },
            },
        },
        [47] = {
            text = "Au fond d'un bosquet, vous trouvez la glacière : une butte couverte d'herbe avec une lourde porte de chêne. Dedans, sous la paille, on garde la glace des étangs, découpée en hiver, pour les sorbets du Roi. La porte est fermée à clé. Un garde-glacière somnole à côté, emmitouflé dans trois manteaux en plein été.",
            choices = {
                { text = "Ouvrir avec la clé de Le Nôtre", to = 50, need = "cle" },
                { text = "Payer le garde-glacière (2 écus)", to = 50, cost = 2 },
                { text = "Renoncer et filer au Grand Canal", to = 48 },
            },
        },
        [48] = {
            text = "Le Grand Canal s'étire comme un miroir d'un kilomètre et demi. Des gondoles offertes par la république de Venise y glissent, et un gondolier chante à tue-tête. Sur la berge, une famille de cygnes vous observe d'un oeil mauvais. Au bout du canal, on aperçoit le Trianon de porcelaine, blanc et bleu.",
            choices = {
                { text = "Prendre une gondole (2 écus)", to = 51, cost = 2 },
                { text = "Longer la berge à pied", to = 52 },
                { text = "Retourner au Grand Commun", to = 10 },
            },
        },
        [49] = {
            text = "Vous grimpez sur le socle, une jambe en avant, la grappe de raisin levée vers le ciel. Le Nôtre vous ajuste un pli de chemise. Au loin, les trompettes : le Roi arrive, entouré de vingt courtisans. Une mouche se pose sur votre nez. Une autre sur votre oreille. Ça gratte terriblement.",
            choices = {
                { text = "Rester immobile coûte que coûte", to = 53 },
                { text = "Éternuer et s'enfuir", to = 47 },
            },
        },
        [50] = {
            text = "Dans la glacière, il fait un froid de loup. Vous remplissez un seau de glace pilée, serrée dans la paille, de quoi faire un sorbet pour toute la cour. Vos doigts deviennent bleus, votre nez rouge, et vos dents jouent des castagnettes.\n\nVous ressortez au soleil en grelottant. Il faudra faire vite avant que tout ne fonde.",
            gain = "glace",
            choices = {
                { text = "Filer vers le Grand Canal", to = 48 },
            },
        },
        [51] = {
            text = "Le gondolier, un Vénitien nommé Tonino, vous fait asseoir sur un coussin de velours. Il chante une barcarolle en ramant, puis une autre, puis la même plus fort. Les cygnes vous suivent en sifflant mais n'osent pas attaquer la gondole.\n\nVous glissez sur l'eau jusqu'au bout du canal, comme un ambassadeur.",
            choices = {
                { text = "Débarquer au Trianon", to = 55 },
            },
        },
        [52] = {
            text = "Vous longez la berge en sifflotant. Grave erreur. Le jars, un cygne énorme au cou en point d'interrogation, se dresse en sifflant comme une bouilloire. Sa compagne arrive derrière lui en battant des ailes. Ils ont décidé que cette berge leur appartenait, ainsi que votre panier.",
            fight = {
                enemies = {
                    { name = "Cygne du Grand Canal", skill = 6, stamina = 4 },
                    { name = "Le jars furieux", skill = 7, stamina = 6 },
                },
                win = 54,
                flee = 10,
            },
        },
        [53] = {
            text = "Le Roi s'arrête juste devant vous. Il vous observe longuement. « Monsieur Le Nôtre, voici un faune bien expressif. » Vous ne bougez pas un cil, même quand une mouche entre dans votre narine. Tout votre corps tremble pour ne pas trembler.",
            test = { stat = "skill", win = 56, lose = 57 },
        },
        [54] = {
            text = "Les cygnes battent en retraite dans un grand fracas de plumes et vont bouder au milieu du canal. Dans leur nid, sur la berge, vous ramassez une belle plume blanche, que vous piquez fièrement à votre bonnet. Vous voilà décoré de l'ordre du Cygne vaincu.\n\nLe chemin longe le canal jusqu'au Trianon.",
            stamina = 1,
            choices = {
                { text = "Marcher jusqu'au Trianon", to = 55 },
            },
        },
        [55] = {
            text = "Au Trianon de porcelaine, tout est bleu et blanc, jusqu'aux pots de fleurs. Un sommelier vous tend une coupe de champagne, ce vin pétillant venu d'Épernay. « Pour le courage ! » Puis il vous regarde mieux. « Mais... quel âge avez-vous ? Non, non, non. » Il vous donne à la place un pichet de jus de pomme de Normandie, doux et frais.\n\n« Ça fera une sauce, au moins. »",
            gain = "jus",
            stamina = 3,
            choices = {
                { text = "Retourner au Grand Commun", to = 10 },
            },
        },
        [56] = {
            text = "Le Roi hoche la tête et passe son chemin. Ouf ! Vous sautez du socle, les jambes en coton. Le Nôtre vous tape sur l'épaule. « Bravo ! Tu as l'âme d'un marbre. » Il vous donne une grosse clé rouillée. « C'est la clé de la glacière. Pour tes sorbets. Tu l'as bien méritée, petit faune. »",
            gain = "cle",
            choices = {
                { text = "Courir à la glacière", to = 47 },
            },
        },
        [57] = {
            text = "Vous tenez la pose si bien que le Roi s'exclame : « Superbe ! Qu'on la dore à la feuille d'or ! » Le Nôtre n'ose pas le contredire. Une heure plus tard, vous voilà doré de la tête aux pieds, sur votre socle, pour l'éternité.\n\nDepuis, vous ornez le bosquet de la Colonnade. Les touristes vous prennent en photo, les pigeons vous prennent pour un perchoir. Fin dorée, mais fin quand même.",
            ending = "death",
        },
        [58] = {
            text = "Le soleil se couche sur Versailles. Dans les cuisines du Grand Commun, c'est la folie : cinquante cuisiniers préparent leur plat pour le concours. Vatel court partout. Gaspard Brûlemiche fouette une crème en vous regardant de travers, un sourire mauvais sous sa moustache.\n\nVotre poste vous attend, avec votre sucrier, vos casseroles et votre panier d'ingrédients.",
            choices = {
                { text = "Vérifier le sucrier", to = 59, flag = "complot" },
                { text = "Affronter Gaspard Brûlemiche", to = 60 },
                { text = "Se mettre aux fourneaux", to = 61 },
            },
        },
        [59] = {
            text = "Vous goûtez une pincée de votre « sucre »... Pouah ! Du sel ! Le traître est passé par là. Sans un bruit, vous échangez votre sucrier contre celui de Gaspard, qui ne remarque rien, trop occupé à se regarder dans une casserole.\n\nCe soir, c'est lui qui aura des surprises dans sa crème.",
            set = "sucre_ok",
            choices = {
                { text = "Affronter Gaspard Brûlemiche", to = 60 },
                { text = "Se mettre aux fourneaux", to = 61 },
            },
        },
        [60] = {
            text = "Vous marchez droit sur Gaspard. « Monsieur, vous êtes un tricheur ! » Il éclate d'un rire gras. « Fifi ! Occupe-toi de ce petit ! » Son commis, un grand dadais armé d'un rouleau à pâtisserie, s'avance. Derrière lui, Gaspard brandit deux poêles à frire. Les autres cuisiniers reculent et forment un cercle.",
            fight = {
                enemies = {
                    { name = "Fifi, le commis", skill = 6, stamina = 5 },
                    { name = "Gaspard Brûlemiche", skill = 9, stamina = 8 },
                },
                win = 62,
                flee = 61,
            },
        },
        [61] = {
            text = "Vous nouez votre tablier, retroussez vos manches et allumez le feu. Les braises rougeoient, la casserole chauffe. C'est le moment de décider : quel plat présenterez-vous au Roi-Soleil ?\n\nAutour de vous, les plats des autres défilent déjà : un paon rôti avec ses plumes, une pyramide de choux à la crème, et une tête de sanglier qui vous fait un clin d'oeil.",
            choices = {
                { text = "Préparer un soufflé au chocolat", to = 63, need = "chocolat" },
                { text = "Cuisiner des petits pois à la française", to = 64, need = "petitspois" },
                { text = "Improviser avec ce qui traîne", to = 65 },
            },
        },
        [62] = {
            text = "Gaspard glisse sur une épluchure de banane... non, de navet, et s'étale dans un baquet de crème. Fifi s'enfuit en pleurant. Vatel, ravi, ficelle Gaspard comme un rôti avec de la ficelle de cuisine. « Toi, tu restes là jusqu'à demain ! » Gaspard avoue tout, y compris le sel dans votre sucrier.\n\nVatel vous offre un bol de bouillon pour vous remettre.",
            set = { "rival_vaincu", "sucre_ok" },
            stamina = 2,
            choices = {
                { text = "Se mettre aux fourneaux", to = 61 },
            },
        },
        [63] = {
            text = "Vous faites fondre le chocolat de la Reine au bain-marie. Une odeur divine envahit la cuisine, et même Mistigri vient renifler. Vous séparez les blancs des jaunes, mélangez les jaunes au chocolat, puis attrapez le fouet. Vient le moment de battre les blancs en neige, avec une bonne cuillerée de sucre.",
            choices = {
                { text = "Battre les blancs avec le sucre", to = 66, noflag = "sucre_ok", hide = true },
                { text = "Battre les blancs avec le sucre", to = 67, flag = "sucre_ok", hide = true },
            },
        },
        [64] = {
            text = "Vous écossez les petits pois au dernier moment, comme l'a conseillé La Quintinie. Une noix de beurre, une laitue, quelques oignons grelots, une pincée de sucre... Les pois frémissent dans la casserole, verts et brillants comme des perles de jade.\n\nIl ne manque qu'une petite touche finale, pour la gourmandise.",
            choices = {
                { text = "Ajouter un filet de jus de pomme", to = 68, need = "jus" },
                { text = "Servir tel quel", to = 69 },
            },
        },
        [65] = {
            text = "Il ne vous reste qu'un navet. Vous le faites bouillir, le décorez d'une feuille de persil et le présentez au Roi avec un grand sourire. Le Roi le regarde, puis vous regarde. Molière, assis à côté, souffle : « Sire, c'est un navet. » Toute la cour éclate de rire.\n\nOn vous envoie éplucher les navets des écuries pour le restant de vos jours. Il y a beaucoup de chevaux à Versailles.",
            ending = "death",
        },
        [66] = {
            text = "Les blancs montent, fermes et brillants. Vous versez le tout dans un moule beurré, et hop, au four. Vingt minutes plus tard, votre soufflé s'élève, doré, majestueux, presque aussi haut que la perruque du Roi.\n\nPourtant, une petite voix au fond de vous murmure qu'il faudrait goûter avant de servir. Vatel crie : « On sert ! On sert ! »",
            choices = {
                { text = "Goûter une cuillerée", to = 70 },
                { text = "Servir sans attendre", to = 71 },
            },
        },
        [67] = {
            text = "Vos blancs montent, fermes et brillants comme de la neige sur le mont Blanc. Vous incorporez le chocolat avec délicatesse, versez dans un moule beurré et enfournez. Puis vous attendez, le nez collé à la porte du four, en priant sainte Marthe, patronne des cuisiniers.\n\nUn soufflé, c'est capricieux comme un courtisan.",
            roll = { dice = 1, outcomes = {
                { upto = 2, to = 72 },
                { upto = 6, to = 73 },
            } },
        },
        [68] = {
            text = "Un filet de jus de pomme, une pincée de menthe du potager, et les petits pois prennent une saveur sucrée et fraîche, comme un matin de printemps en Normandie. Vous goûtez : c'est sublime. Vatel passe, goûte à son tour, et manque de s'évanouir de bonheur.\n\n« Ça, c'est royal. Vite, en salle ! »",
            choices = {
                { text = "Porter le plat au Roi", to = 74 },
            },
        },
        [69] = {
            text = "Les petits pois sont tendres, beurrés, parfaits. Pas révolutionnaires, mais bons comme un dimanche à la campagne. Vous les dressez dans un plat d'argent, avec la laitue en couronne, et vous les couvrez d'une cloche.\n\nVatel passe en courant. « C'est prêt ? Alors vite, vite, le Roi attend ! »",
            choices = {
                { text = "Porter le plat au Roi", to = 74 },
            },
        },
        [70] = {
            text = "Vous goûtez. Pouah ! Salé comme l'océan ! Gaspard a remplacé votre sucre par du sel ! Vous jetez le soufflé dans le seau de Mistigri, qui le refuse lui aussi, et recommencez tout en catastrophe avec le sucre de Gaspard, qu'il a laissé sans surveillance.\n\nVos mains tremblent, mais vos blancs, cette fois, sont sucrés.",
            set = "sucre_ok",
            choices = {
                { text = "Battre les blancs à nouveau", to = 67 },
            },
        },
        [71] = {
            text = "Le Roi plonge sa cuillère d'or dans votre soufflé. Il porte la bouchée à ses lèvres... et devient tout rouge. « DU SEL ! » Il tousse, crache, et toute la cour tousse avec lui par politesse. Dans un coin, Gaspard pouffe de rire.\n\n« Qu'on l'emmène à la Bastille ! » Vous y passerez dix ans à cuisiner pour les prisonniers. Ils trouvent, eux, que vos plats manquent de sel.",
            ending = "death",
        },
        [72] = {
            text = "Horreur ! En sortant du four, votre soufflé s'effondre comme une tente sous la pluie. Il ne ressemble plus qu'à une galette brune et triste. Vatel vous regarde, livide. « Le Roi attend. Le Roi n'attend jamais. »\n\nIl faut sauver ce soufflé, et vite.",
            choices = {
                { text = "En faire un soufflé glacé", to = 73, need = "glace" },
                { text = "Le regonfler en soufflant dedans", to = 75 },
            },
        },
        [73] = {
            text = "Votre soufflé est une merveille : haut, doré, fondant à coeur, avec un parfum de cannelle qui ferait chanter les anges. Vous le saupoudrez de sucre glace. Même Mistigri s'assoit poliment pour le regarder passer.\n\nVatel s'essuie les yeux. « Mon enfant, si le Roi n'aime pas ça, c'est qu'il est malade. Allez, en salle ! »",
            choices = {
                { text = "Porter le plat au Roi", to = 74 },
            },
        },
        [74] = {
            text = "Votre plat sur un plateau d'argent, vous remontez les escaliers vers les appartements du Roi, à travers des salons pleins de courtisans. Les lustres scintillent, les violons jouent au loin.\n\nAu détour d'un couloir, quelque chose bouge derrière une tenture. Une moustache. Une odeur de crème brûlée.",
            choices = {
                { text = "Avancer fièrement", to = 78, flag = "rival_vaincu", hide = true },
                { text = "Surveiller la tenture du coin de l'oeil", to = 77, noflag = "rival_vaincu", hide = true },
            },
        },
        [75] = {
            text = "Vous prenez une grande inspiration, collez vos lèvres au soufflé et soufflez de toutes vos forces. C'est une technique inconnue de tous les grands chefs, et pour cause. Il faut un souffle d'acier et beaucoup de doigté pour ne pas finir le nez dans le chocolat.",
            test = { stat = "skill", win = 73, lose = 76 },
        },
        [76] = {
            text = "Pfffft. Le soufflé gonfle... puis éclate, et vous recouvre de chocolat de la tête aux pieds. Vous le présentez quand même au Roi, plat et fumant. Louis XIV le regarde longuement. « Ceci, monsieur, n'est pas un soufflé. C'est une insulte. »\n\nDirection la Bastille, pour soufflé raté. Dans votre cachot, vous avez tout le temps de réussir vos meringues. Sans four.",
            ending = "death",
        },
        [77] = {
            text = "Gaspard Brûlemiche jaillit de derrière la tenture et vous tend un croche-pied de toute la longueur de sa jambe. Votre plateau vacille dangereusement. Vous sautez, vous pivotez, vous tentez de garder l'équilibre en bon danseur de menuet.",
            test = { stat = "luck", win = 78, lose = 79 },
        },
        [78] = {
            text = "Vous entrez dans la Galerie des Glaces, illuminée de milliers de bougies que les miroirs multiplient à l'infini. Toute la cour est là. Madame de Sévigné écrit déjà. Molière vous fait un clin d'oeil. Au fond, Lully lève son bâton devant ses violons.\n\nEt là-bas, sur son fauteuil, entouré de plats fumants, le Roi-Soleil en personne attend le prochain candidat.",
            choices = {
                { text = "Faire signe à Lully", to = 82, flag = "lully" },
                { text = "S'avancer vers la table du Roi", to = 81 },
            },
        },
        [79] = {
            text = "Vous trébuchez, et votre plat s'envole... pour atterrir dans les mains de La Fringale, le mousquetaire gourmand, de garde dans ce couloir. Il renifle le plat avec gourmandise, une cuillère déjà sortie de sa botte. « Tiens, tiens ! Un plat suspect ! Je dois le goûter. Entièrement. »\n\nGaspard s'éclipse en ricanant.",
            choices = {
                { text = "Reprendre votre plat, louche au poing", to = 80 },
                { text = "Lui laisser une bouchée", to = 78 },
            },
        },
        [80] = {
            text = "« Rendez-moi mon plat ! » La Fringale pose délicatement l'assiette sur une console, retrousse sa moustache et sort sa baguette de pain. « Un duel, encore ? Avec joie ! Mais cette fois, je n'ai pas mangé, je suis d'une humeur de dogue ! »",
            fight = { name = "La Fringale affamé", skill = 7, stamina = 6, win = 78 },
        },
        [81] = {
            text = "Vous vous inclinez devant Louis XIV. Il porte une perruque immense et un habit brodé d'or, et il mange avec ses doigts, car le Roi trouve les fourchettes ridicules. Il vous fait signe d'approcher. « Alors, jeune personne, que nous apportez-vous ? »\n\nToute la Galerie retient son souffle. Vatel se mord les poings derrière une colonne.",
            choices = {
                { text = "Servir le grand menu complet du Roi", to = 83, need = { "petitspois", "chocolat", "glace" } },
                { text = "Ajouter le brie, roi des fromages", to = 85, need = "fromage" },
                { text = "Présenter votre plat", to = 84 },
            },
        },
        [82] = {
            text = "Lully vous reconnaît et frappe le parquet de son bâton. Boum ! Les violons entament une marche triomphale, et vous avancez au rythme de la musique, comme dans un ballet. Les courtisans s'écartent sur votre passage. Le Roi lui-même bat la mesure du bout du pied.\n\nVous vous sentez pousser des ailes.",
            luck = 2,
            stamina = 2,
            choices = {
                { text = "S'avancer vers la table du Roi", to = 81 },
            },
        },
        [83] = {
            text = "Vous servez d'abord les petits pois du Potager, puis le soufflé au chocolat de la Reine, et enfin un sorbet de glace pilée. Le Roi goûte, ferme les yeux, et soupire de bonheur. La Reine sourit. Toute la Galerie applaudit.\n\n« Vous serez désormais cuisinier du Roi ! » Vatel pleure, Lully joue, et Madame de Sévigné écrit : « Ma fille, le Roi a trouvé son cuisinier. » La plus belle des fins.",
            ending = "win",
        },
        [84] = {
            text = "Le Roi goûte votre plat. Il mâche lentement. Un silence terrible tombe sur la Galerie. Puis il hoche la tête. « C'est bon. C'est même très bon. Qu'on mette ce plat au menu de demain. »\n\nVous avez gagné votre place à la table des meilleurs ! Vatel vous embrasse, Gaspard s'étouffe de rage dans sa crème salée, et Madame de Sévigné écrit déjà votre nom dans une lettre.",
            ending = "win",
        },
        [85] = {
            text = "Vous posez le brie de Meaux à côté de votre plat. « Le roi des fromages, Sire, pour le Roi des rois. » Louis XIV éclate de rire, ce qui n'arrive pas tous les jours. Il en coupe un morceau avec ses doigts, le goûte et lève les sourcils. Toute la cour se précipite pour goûter aussi.\n\nLe Roi vous fait signe : à votre plat maintenant.",
            choices = {
                { text = "Présenter votre plat", to = 84 },
            },
        },
    },
}
