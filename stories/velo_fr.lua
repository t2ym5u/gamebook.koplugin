return {
    title       = "Le Vélo maudit du Tour",
    author      = "Gamebook",
    lang        = "fr",
    blurb       = "Juillet 1903, premier Tour de France. Votre vélo parle, rêve de la mer et ne freine qu'aux boulangeries.",
    sheet       = true,
    start       = 1,
    start_gold  = 5,
    start_items = {},
    items = {
        lanterne  = "Lanterne à acétylène",
        trousse   = "Trousse de réparation",
        saucisson = "Rosette de Lyon",
        sifflet   = "Sifflet de facteur",
        huile     = "Burette d'huile d'olive",
        clou      = "Sac de clous du tricheur",
    },
    sections = {
        [1] = {
            text = "1er juillet 1903, Montgeron. Devant le café Au Réveil-Matin, une soixantaine de coureurs moustachus attendent le départ du tout premier Tour de France. Vous êtes parmi eux, sur un vélo acheté cinq francs aux puces de Saint-Ouen.\n\nSoudain, une petite voix grinçante sort du guidon : « Bonjour. Je m'appelle Hortense. Je veux voir la mer. » Vous regardez autour de vous. Personne. Le vélo fait tinter sa sonnette d'un air entendu.\n\nDépart à 15 h 16. Il est 15 h 02.",
            choices = {
                { text = "Interroger ce vélo bavard", to = 3 },
                { text = "Saluer les organisateurs", to = 4 },
                { text = "Se placer sur la ligne de départ", to = 2 },
            },
        },
        [2] = {
            text = "Le coup de pistolet claque. Les coureurs s'élancent dans un nuage de poussière, sous les vivats des Montgeronnais. Devant, un petit homme moustachu file comme un lièvre : Maurice Garin, le « petit ramoneur », grand favori.\n\nHortense grince : « Paris–Lyon, quatre cent soixante-sept kilomètres ? Et la mer, elle est où ? » Vous serrez les dents. La route de Fontainebleau s'étire devant vous, blanche et cahoteuse.",
            choices = {
                { text = "Prendre la roue de Garin", to = 5 },
                { text = "Rouler à votre rythme", to = 6 },
            },
        },
        [3] = {
            text = "« J'étais le vélo de livraison d'une boulangère de Montmartre, chuchote Hortense. Un jour, mon brocanteur a roulé une cartomancienne de Pigalle. Elle s'est vengée sur moi ! »\n\nDepuis, Hortense parle, ne freine que devant les boulangeries et rêve de la mer. « La malédiction cessera quand j'aurai vu deux mers et bouclé un grand tour. » Un grand tour ? Ça tombe plutôt bien.",
            set = "secret",
            choices = {
                { text = "Promettre de lui montrer la mer", to = 2 },
                { text = "Aller saluer les organisateurs", to = 4 },
            },
        },
        [4] = {
            text = "Sous son canotier, Henri Desgrange, directeur du journal L'Auto, compte ses coureurs en lissant sa moustache. À côté, le jeune Géo Lefèvre, celui qui a eu l'idée folle de ce Tour, griffonne dans un carnet.\n\n« Vous partez sans lanterne ? s'étonne Lefèvre. On roule toute la nuit jusqu'à Lyon ! Tenez, j'en ai une de rechange. » Desgrange grogne : « Et pas de tricherie, hein. J'ai des yeux partout. »",
            gain = "lanterne",
            choices = {
                { text = "Rejoindre la ligne de départ", to = 2 },
                { text = "Faire connaissance avec votre vélo", to = 3 },
            },
        },
        [5] = {
            text = "Vous collez à la roue de Garin. Le petit homme pédale avec une régularité de métronome. « Gamin, je ramonais les cheminées. Ça forme les mollets et les poumons ! »\n\nPrès de Melun, il vous glisse : « Méfie-toi d'Anatole Clouzot, celui à la casquette à carreaux. On dit qu'il sème des clous. Et les oies du Lauragais, un coup de sifflet les fait fuir. » Puis il accélère et disparaît. Vous voilà seul, essoufflé, mais bien renseigné.",
            set = "garin",
            stamina = -1,
            choices = {
                { text = "Continuer vers Montargis", to = 7 },
            },
        },
        [6] = {
            text = "Vous roulez tranquillement quand, à Corbeil, Hortense pile net devant une boulangerie. Vous passez par-dessus le guidon et atterrissez dans un sac de farine. « Pardon, dit Hortense. C'est plus fort que moi. »\n\nLe boulanger, hilare, vous aide à vous relever. Ça sent la baguette chaude et, sur le comptoir, trône une belle rosette de Lyon. « Pour la route ? Un franc, c'est cadeau. »",
            choices = {
                { text = "Acheter le saucisson (1 franc)", to = 8, cost = 1 },
                { text = "Repartir tout enfariné", to = 7 },
            },
        },
        [7] = {
            text = "La nuit tombe sur le Gâtinais. Après Montargis, la route se perd dans une obscurité d'encre. Pas de lune, pas de réverbère, seulement le crissement de vos pneus sur les cailloux et les hiboux qui ricanent dans les peupliers.\n\n« Je n'y vois rien, gémit Hortense. Et je te rappelle que je ne freine pas. Sauf devant une boulangerie, et elles sont toutes fermées. »",
            choices = {
                { text = "Allumer la lanterne", to = 9, need = "lanterne" },
                { text = "Rouler à l'aveugle", to = 10 },
            },
        },
        [8] = {
            text = "Le boulanger emballe la rosette dans du papier journal (un exemplaire de L'Auto, évidemment) et vous offre en prime un quignon de pain. Vous le dévorez en pédalant.\n\nHortense quitte la boutique en soupirant de bonheur : « Quelle odeur ! Presque aussi belle que l'odeur de la mer, j'imagine. » Vous fourrez le saucisson dans votre musette.",
            gain = "saucisson",
            stamina = 2,
            choices = {
                { text = "Reprendre la route", to = 7 },
            },
        },
        [9] = {
            text = "La lanterne siffle et projette un joli cercle jaune devant vous. Vous évitez une ornière, un hérisson, puis un curé à bicyclette qui vous bénit au passage : « Allez, mon fils, et que saint Christophe vous pousse ! »\n\nPassé Nevers, l'aube se lève. La lumière révèle une cour de ferme que la route traverse en plein milieu.",
            luck = 1,
            choices = {
                { text = "Traverser la cour de ferme", to = 12 },
            },
        },
        [10] = {
            text = "Vous pédalez au jugé, guidé par les étoiles et par les ronflements d'Hortense, qui prétend dormir en roulant. Une forme sombre se dresse devant vous : un virage ! La route tourne. Vous, pas encore.\n\nIl va falloir réagir vite, et dans le noir complet.",
            test = { stat = "skill", win = 12, lose = 11 },
        },
        [11] = {
            text = "Plouf ! Vous finissez dans un fossé plein d'eau, en compagnie d'une grenouille indignée. « C'est ça, la mer ? demande Hortense, pleine d'espoir. — Non, c'est la Nièvre », répondez-vous en recrachant un têtard.\n\nVous remontez sur la route, trempé, couvert de lentilles d'eau. À l'aube, la route traverse une cour de ferme.",
            stamina = -2,
            choices = {
                { text = "Traverser la cour de ferme", to = 12 },
            },
        },
        [12] = {
            text = "Dans la cour, trois énormes chiens de ferme se dressent en aboyant. Le plus gros a une tête de tonneau et des dents de fourche. Les poules s'enfuient, le coq fait semblant de ne rien voir.\n\n« Fais quelque chose ! hurle Hortense. Moi, je suis en acier, mais toi, tu es en mollet ! »",
            choices = {
                { text = "Lancer le saucisson aux chiens", to = 13, need = "saucisson" },
                { text = "Affronter les molosses", to = 14 },
                { text = "Pédaler comme un dératé", to = 15 },
            },
        },
        [13] = {
            text = "La rosette décrit une courbe parfaite dans le ciel du Nivernais. Les trois chiens oublient aussitôt votre existence et se disputent le saucisson en remuant la queue.\n\nLe plus gros vous lance même un regard plein de gratitude. Vous sortez de la cour sous les applaudissements d'une fermière qui étendait son linge.",
            lose = "saucisson",
            choices = {
                { text = "Saluer la fermière", to = 16 },
            },
        },
        [14] = {
            text = "Les chiens foncent sur vous. Vous dégainez votre pompe à vélo comme une rapière de mousquetaire. « En garde, toutous ! » Hortense fait sonner sa sonnette pour vous encourager, ce qui énerve encore plus les chiens.\n\nLe combat est inévitable. Visez les truffes, épargnez les mollets.",
            fight = { name = "Chiens de ferme", skill = 6, stamina = 6, win = 16 },
        },
        [15] = {
            text = "Vous appuyez sur les pédales de toutes vos forces. Hortense couine, les chiens galopent, les poules volent, le linge s'envole. Le portail de la ferme est là-bas, grand ouvert.\n\nIl faudra un peu de chance pour l'atteindre avant les crocs.",
            test = { stat = "luck", win = 16, lose = 14 },
        },
        [16] = {
            text = "La fermière, Madame Bidault, rappelle ses chiens d'un coup de tablier. « Excusez-les, ils n'avaient jamais vu de coureur. Enfin, à part le petit moustachu, il est passé comme une flèche. »\n\nElle vous offre un bol de lait tiède et une part de galette. À la sortie du village, la route se divise : la grande route, ou un chemin de terre qui longe la Loire.",
            stamina = 3,
            choices = {
                { text = "Prendre la grande route", to = 17 },
                { text = "Suivre le chemin de la Loire", to = 18 },
            },
        },
        [17] = {
            text = "Sur la grande route, un jeune facteur fouille désespérément un fossé plein d'orties. « Ma sacoche ! Elle est tombée, avec tout le courrier de Moulins ! Si je la perds, le receveur me pend par les bretelles ! »\n\nHortense ralentit d'elle-même : « Aide-le. Je connais ça, moi, les tournées de livraison. »",
            choices = {
                { text = "Aider le facteur", to = 19 },
                { text = "Filer vers Lyon", to = 20 },
            },
        },
        [18] = {
            text = "Le chemin longe la Loire, large et paresseuse. « C'est la mer ? s'écrie Hortense. — C'est un fleuve. — Un fleuve, c'est une mer qui a oublié de grandir ? »\n\nLe chemin devient boue, la boue devient marécage. Vous arrivez à Roanne crotté jusqu'aux oreilles, puis vous avalez les monts du Lyonnais à la nuit tombante.",
            stamina = -1,
            choices = {
                { text = "Descendre sur Lyon", to = 20 },
            },
        },
        [19] = {
            text = "Vous plongez dans les orties et ressortez avec la sacoche. Le facteur, Jules, vous embrasse sur les deux joues. « Tenez, mon sifflet de rechange. Les bêtes en ont une peur bleue, ça m'a sauvé des oies plus d'une fois. Et deux francs pour le dérangement ! »\n\nIl repart en sifflotant. Vous aussi, les mollets piqués, mais le cœur léger.",
            gain = "sifflet",
            gold = 2,
            choices = {
                { text = "Filer vers Lyon", to = 20 },
            },
        },
        [20] = {
            text = "Lyon, enfin ! Garin a gagné l'étape après dix-sept heures de selle. Vous arrivez bien plus tard, mais la foule vous acclame quand même. Le contrôle se tient près des quais.\n\nHortense aperçoit le Rhône, immense et rapide. « LA MER ! » hurle-t-elle, et elle tire vers l'eau. Autour de vous, ça sent les quenelles, la cervelle de canut et la bonne fatigue.",
            choices = {
                { text = "Suivre Hortense vers le Rhône", to = 21 },
                { text = "Dîner dans un bouchon (2 francs)", to = 23, cost = 2 },
                { text = "Aller dormir au contrôle", to = 22 },
            },
        },
        [21] = {
            text = "Hortense dévale le quai, roue avant pointée vers le fleuve. « J'arrive, la mer ! » Le Rhône gronde, couleur café au lait, et charrie des branches grosses comme des barques.\n\nSi vous ne faites rien, vous allez prendre un bain très lyonnais.",
            choices = {
                { text = "Lui expliquer sa malédiction", to = 22, flag = "secret" },
                { text = "La retenir par la selle", to = 25 },
            },
        },
        [22] = {
            text = "Vous dormez comme une souche entre deux coureurs qui ronflent en italien et en flamand. Au matin, un bol de café et des tartines vous remettent d'aplomb.\n\nSur le chemin du départ, une boutique de cycles ouvre ses volets. En vitrine : chambres à air, colle, caoutchouc, ficelle. Garin passe en sifflant. L'étape vers Marseille commence.",
            stamina = 4,
            choices = {
                { text = "Acheter une trousse (2 francs)", to = 26, cost = 2, without = "trousse" },
                { text = "Partir pour Marseille", to = 27 },
            },
        },
        [23] = {
            text = "Dans un bouchon de la rue Mercière, une mère lyonnaise au tablier immaculé vous sert quenelle de brochet, tablier de sapeur et un pot de côtes-du-rhône coupé d'eau. « Mangez, mon petit, vous êtes maigre comme un rayon de roue. »\n\nHortense, garée contre la vitrine, renifle l'odeur de la boulangerie voisine et oublie le fleuve.",
            stamina = 5,
            choices = {
                { text = "Aller dormir au contrôle", to = 22 },
            },
        },
        [24] = {
            text = "Splash ! Hortense et vous plongez dans le Rhône. Le courant vous emporte joyeusement vers le sud, Vienne, Valence, Montélimar, où un confiseur vous lance un nougat au passage.\n\nTrois jours plus tard, vous échouez sous le pont d'Avignon, où l'on danse, paraît-il, tout en rond. Hortense est ravie : elle a presque vu la mer. Vous, vous avez surtout vu des poissons. Votre Tour de France s'arrête là, à la nage.",
            ending = "death",
        },
        [25] = {
            text = "Vous agrippez la selle à deux mains et plantez vos talons dans les pavés du quai. Hortense rue comme une mule. Les badauds parient sur l'issue du duel. Un marinier crie : « Tiens bon, le cycliste ! » Une marchande de quenelles, elle, mise sur le vélo. Le quai est glissant, et le fleuve tout proche.",
            test = { stat = "skill", win = 22, lose = 24 },
        },
        [26] = {
            text = "Le marchand de cycles, un ancien coureur à la jambe de bois, vous prépare une trousse : colle, morceaux de caoutchouc, démonte-pneus et une bobine de fil. « Avec ça, vous réparez un pneu en dix minutes. Ou en une heure, si vous êtes comme moi. »\n\nVous rangez le précieux trésor sous la selle.",
            gain = "trousse",
            choices = {
                { text = "Partir pour Marseille", to = 27 },
            },
        },
        [27] = {
            text = "Après Saint-Étienne et ses cheminées d'usines, la route grimpe vers le col de la République, à plus de mille mètres. Les pentes sont raides, la terre colle aux pneus et le soleil cogne fort.\n\n« Une montagne ? s'indigne Hortense. Personne ne m'avait parlé de montagne ! » Un peu plus haut, un curé de village pousse une brouette de choux en chantant des cantiques.",
            choices = {
                { text = "Attaquer le col en danseuse", to = 28 },
                { text = "Demander de l'aide au curé", to = 29 },
            },
        },
        [28] = {
            text = "Vous vous levez sur les pédales et attaquez la pente comme un chamois. Les virages se suivent, la sueur vous pique les yeux, les mouches vous trouvent délicieux.\n\nHortense halète : « Plus vite, plus vite, je déteste la montée ! » Tiendrez-vous jusqu'au sommet sans mettre pied à terre, sous les yeux moqueurs des vaches ?",
            test = { stat = "stamina", win = 30, lose = 29 },
        },
        [29] = {
            text = "Le curé de Planfoy pose sa brouette. « Un forçat de la route ! Asseyez-vous, mon fils. » Il vous tend sa gourde de vin de messe, une pomme, et vous bénit, vous et votre vélo.\n\nHortense, qui n'a jamais été bénie, rosit jusqu'aux garde-boue. Puis le brave homme vous pousse dans la pente en soufflant comme une locomotive. Le sommet arrive enfin.",
            stamina = 2,
            luck = 2,
            choices = {
                { text = "Basculer dans la descente", to = 30 },
            },
        },
        [30] = {
            text = "Au sommet du col, la vue sur les monts du Pilat est magnifique. Mais sur la route de la descente, quelque chose scintille au soleil : des clous ! Des centaines de clous, semés comme des graines de malheur.\n\n« Je ne freine pas, je te rappelle, dit Hortense d'une petite voix. Il n'y a pas de boulangerie ici. »",
            choices = {
                { text = "Slalomer entre les clous", to = 31 },
                { text = "Sauter par-dessus d'un coup de reins", to = 32 },
            },
        },
        [31] = {
            text = "Vous zigzaguez comme un lièvre poursuivi par un chasseur. À gauche, à droite, encore à gauche. Les clous défilent sous vos roues en clignant de l'œil. Hortense retient son souffle, si tant est qu'un vélo respire. La chance sera-t-elle de votre côté ?",
            test = { stat = "luck", win = 34, lose = 33 },
        },
        [32] = {
            text = "Vous prenez de l'élan, tirez sur le guidon et tentez de faire décoller Hortense au-dessus du tapis de clous. « Je vole ! crie-t-elle. Je suis une mouette ! » Les clous brillent dessous comme les dents d'un crocodile. Il faudra de l'adresse pour atterrir proprement.",
            test = { stat = "skill", win = 34, lose = 33 },
        },
        [33] = {
            text = "Pssschhh... Le pneu arrière se dégonfle avec un long soupir de tristesse. Hortense gémit : « Je me sens toute molle. » Vous voilà assis au bord de la route, le vélo sur les genoux, pendant que les cigales commencent à se moquer de vous.",
            choices = {
                { text = "Réparer avec la trousse", to = 34, need = "trousse" },
                { text = "Bourrer le pneu d'herbe sèche", to = 35 },
            },
        },
        [34] = {
            text = "Vous dévalez la descente à toute allure. Dans un virage, vous surprenez un coureur à casquette à carreaux, accroupi, qui vide un sac de clous sur la route en ricanant. Anatole Clouzot, le tricheur !\n\nIl vous voit, pâlit, et serre son sac contre lui. « C'est... des graines. Je jardine. »",
            choices = {
                { text = "Arrêter le tricheur", to = 36 },
                { text = "Le laisser à sa honte", to = 37 },
            },
        },
        [35] = {
            text = "Vous arrachez des touffes d'herbe et de thym, et vous en bourrez le pneu. Ça tient, à peu près. Vous roulez sur un pneu parfumé à la garrigue, qui fait boum-boum à chaque tour de roue.\n\n« C'est très inconfortable, mais je sens bon », constate Hortense. Vos fesses, elles, ne sont pas de cet avis.",
            stamina = -2,
            choices = {
                { text = "Reprendre la descente", to = 34 },
            },
        },
        [36] = {
            text = "« Rends-moi ce sac, Clouzot ! » Le tricheur relève ses manches et prend une pose de boxeur anglais. « Tu ne me prendras pas mon gagne-pain ! » Hortense fait sonner sa sonnette comme une cloche de ring. Ding !",
            fight = { name = "Anatole Clouzot", skill = 7, stamina = 7, win = 38 },
        },
        [37] = {
            text = "Vous haussez les épaules et filez. Le tricheur vous regarde partir, l'air mauvais. La vallée du Rhône vous accueille avec un mistral à décorner les bœufs, qui vous pousse dans le dos comme un ami un peu brutal.\n\nValence, Montélimar, Orange : les villes défilent, les platanes aussi.",
            choices = {
                { text = "Foncer vers la Provence", to = 39 },
            },
        },
        [38] = {
            text = "Clouzot s'enfuit à travers champs en abandonnant son vélo et son sac de clous. Vous ramassez la preuve de sa forfaiture. « Monsieur Desgrange sera ravi de voir ça », dites-vous.\n\nLe mistral se lève et vous pousse dans la vallée du Rhône. Valence, Montélimar, Orange : les villes défilent, les platanes aussi.",
            gain = "clou",
            choices = {
                { text = "Foncer vers la Provence", to = 39 },
            },
        },
        [39] = {
            text = "La Provence ! Les cigales chantent à tue-tête, la lavande borde la route et les oliviers saluent votre passage. Après Aix, Hortense se met à trembler de tout son cadre.\n\n« Tu sens ? Ce sel, cet iode... C'est elle, n'est-ce pas ? C'est la mer ! » Pour une fois, elle a raison. Au loin, Notre-Dame-de-la-Garde brille au-dessus de Marseille.",
            choices = {
                { text = "Descendre vers le Vieux-Port", to = 40 },
            },
        },
        [40] = {
            text = "Marseille ! Le Vieux-Port grouille de pêcheurs, de marchandes de poissons et de gamins qui plongent des quais. Devant vous, la Méditerranée, bleue à en pleurer.\n\nHortense pousse un cri de joie si strident qu'un goéland en lâche sa sardine. « La mer ! La vraie ! Ça fait une ! » Hugues, un chef de restaurant au tablier taché de safran, vous fait signe depuis sa terrasse.",
            set = "mer1",
            choices = {
                { text = "Manger une bouillabaisse (3 francs)", to = 41, cost = 3 },
                { text = "Laisser Hortense tremper ses roues", to = 42 },
                { text = "Pointer au contrôle", to = 43 },
            },
        },
        [41] = {
            text = "La bouillabaisse arrive en deux temps, comme le veut la tradition : d'abord le bouillon couleur soleil, avec croûtons et rouille, puis les poissons, rascasse, vive, grondin, congre. Vous mangez comme quatre.\n\n« Pour votre chaîne, dit Hugues en vous tendant une burette. De l'huile d'olive de Salon. Rien ne glisse mieux, à part un Marseillais qui raconte une histoire de pêche. »",
            stamina = 6,
            gain = "huile",
            choices = {
                { text = "Pointer au contrôle", to = 43 },
                { text = "Emmener Hortense au bord de l'eau", to = 42 },
            },
        },
        [42] = {
            text = "Hortense trempe sa roue avant dans l'eau du port en gloussant. Puis elle aperçoit une barque qui part vers le château d'If. « On embarque ! Je veux voir la mer de près, de très près ! » Elle tire déjà vers la passerelle.\n\nLe batelier hausse les épaules : « Deux places pour le château, ça vous fait rien du tout, c'est la maison qui offre. »",
            choices = {
                { text = "Lui rappeler qu'il faut deux mers", to = 43, flag = "secret" },
                { text = "La tirer en arrière par le guidon", to = 45 },
            },
        },
        [43] = {
            text = "Au contrôle, un commissaire de L'Auto tamponne votre carnet. Hippolyte Aucouturier a gagné l'étape, Garin est toujours en tête. Mais il y a une bonne nouvelle : les coureurs isolés arrivés avant la nuit touchent une petite prime.\n\nVous empochez trois francs et dormez au son des vagues. Hortense ronronne contre un réverbère, heureuse comme un poisson dans l'eau.",
            gold = 3,
            stamina = 4,
            choices = {
                { text = "Prendre le départ pour Toulouse", to = 46 },
            },
        },
        [44] = {
            text = "La barque file vers le château d'If, Hortense à la proue comme une figure de navire. Mais là-bas, un gardien moustachu vous prend pour des évadés. « Encore un comte de Monte-Cristo ! Au cachot ! »\n\nVous passez l'été à creuser un tunnel avec une petite cuillère, comme Edmond Dantès. Hortense, elle, regarde la mer par la lucarne et n'a jamais été aussi heureuse. Le Tour de France se termine sans vous.",
            ending = "death",
        },
        [45] = {
            text = "Vous empoignez le guidon et tirez de toutes vos forces. Hortense résiste, glisse sur les pavés mouillés, et le batelier compte les points en mâchonnant sa pipe. Une petite foule s'est formée sur le quai. Qui l'emportera, le cycliste ou la mer ?",
            roll = { dice = 1, outcomes = {
                { upto = 2, to = 44 },
                { upto = 6, to = 43 },
            } },
        },
        [46] = {
            text = "Départ de Marseille au petit matin. La route de Toulouse traverse la Camargue, le Languedoc et ses vignes à perte de vue. Un petit groupe se forme devant vous ; une odeur de fougasse chaude flotte aussi dans l'air.\n\nHortense, apaisée depuis qu'elle a vu la mer, roule presque sagement. Presque.",
            choices = {
                { text = "Rejoindre Garin et ses compagnons", to = 48, flag = "garin" },
                { text = "Prendre la route de Nîmes", to = 47 },
                { text = "Suivre l'odeur de fougasse", to = 49 },
            },
        },
        [47] = {
            text = "Nîmes cuit sous le soleil. Vous passez devant les Arènes, où les Romains organisaient des combats de gladiateurs. Aujourd'hui, le combat, c'est vous contre la chaleur.\n\nVous remplissez votre bidon à la fontaine de la Maison carrée, mais le goudron n'existe pas encore et la poussière vous colle partout. Montpellier, Béziers, le canal du Midi : vous arrivez à Carcassonne en pruneau séché.",
            stamina = -2,
            choices = {
                { text = "Continuer vers Castelnaudary", to = 50 },
            },
        },
        [48] = {
            text = "Garin vous accueille d'un clin d'œil. « Tiens, le gamin au vélo qui parle ! » À ses côtés, Hippolyte Aucouturier, surnommé le Terrible, fait des blagues à chaque kilomètre.\n\nÀ trois, on se relaie, on partage le pain et les olives. Hortense est aux anges : « Ce sont de vrais champions. Ils pédalent presque aussi bien que je roule. » Le soir, la cité de Carcassonne dresse ses tours sur l'horizon.",
            stamina = 2,
            choices = {
                { text = "Continuer vers Castelnaudary", to = 50 },
            },
        },
        [49] = {
            text = "À Lunel, Hortense pile devant une boulangerie (évidemment), et cette fois vous ne lui en voulez pas. La boulangère vous offre une fougasse aux olives encore fumante et un verre de muscat sans alcool, enfin, presque sans.\n\nVous repartez gonflé à bloc. Montpellier, Béziers, le canal du Midi : le soir, la cité de Carcassonne dresse ses tours sur l'horizon.",
            stamina = 3,
            choices = {
                { text = "Continuer vers Castelnaudary", to = 50 },
            },
        },
        [50] = {
            text = "Castelnaudary, capitale mondiale du cassoulet ! Une odeur de haricots, de saucisse et de confit de canard s'échappe de chaque fenêtre. Sur la place, une auberge affiche : « Cassoulet du coureur, deux francs, à volonté ».\n\n« À volonté, c'est dangereux », prévient Hortense, qui a déjà vu des livreurs s'endormir sur leur guidon après un repas trop copieux.",
            choices = {
                { text = "Goûter le cassoulet (2 francs)", to = 51, cost = 2 },
                { text = "Continuer sans s'arrêter", to = 52 },
            },
        },
        [51] = {
            text = "L'aubergiste pose devant vous une cassole en terre cuite, dorée, croustillante, qui fume comme un volcan. C'est divin. Vous en reprenez une deuxième assiette, et vous sentez la force revenir dans vos jambes.\n\nL'aubergiste approche avec la louche, l'œil gourmand : « Une troisième, pour la route ? »",
            stamina = 6,
            choices = {
                { text = "Reprendre une troisième assiette", to = 53 },
                { text = "Repartir le ventre plein", to = 52 },
            },
        },
        [52] = {
            text = "Dans les collines du Lauragais, une troupe d'oies blanches barre la route. Elles sont une vingtaine, le cou tendu, et elles sifflent comme des théières en colère. La plus grosse, une matrone au bec orange, avance sur vous d'un pas décidé.\n\n« Je n'aime pas les oies, chuchote Hortense. Elles mordent les pneus. »",
            choices = {
                { text = "Siffler comme un facteur", to = 54, need = "sifflet" },
                { text = "Affronter les oies", to = 55 },
            },
        },
        [53] = {
            text = "Troisième assiette. Puis quatrième, parce que c'est à volonté. Puis une cinquième, par politesse. Vous vous endormez dans la cassole, une saucisse à la main, un sourire béat aux lèvres.\n\nVous vous réveillez en juillet 1904, juste à temps pour voir passer le deuxième Tour de France. Hortense, garée près de la boulangerie, ne vous a pas attendu pour prendre du poids. Fin de l'aventure, mais quelle digestion !",
            ending = "death",
        },
        [54] = {
            text = "Vous sortez le sifflet de Jules et soufflez dedans de toutes vos forces. Tuuuuut ! Les oies se figent, se regardent, et détalent vers leur mare en se bousculant comme des écolières à la récréation.\n\nVous passez sous les regards furieux de la matrone. Vous saluez poliment. Le soir, les tuiles roses de Toulouse rougissent au soleil couchant.",
            choices = {
                { text = "Entrer dans Toulouse", to = 56 },
            },
        },
        [55] = {
            text = "Les oies attaquent en formation serrée, comme une escadrille. Coups de bec, coups d'ailes, sifflements furieux : c'est la bataille du Lauragais. Vous vous défendez avec votre casquette roulée en boule, pendant qu'Hortense rue pour protéger ses pneus. Les plumes volent comme de la neige en juillet.",
            fight = { name = "Escadrille d'oies", skill = 7, stamina = 6, win = 56 },
        },
        [56] = {
            text = "Toulouse, la Ville rose ! Sur la place du Capitole, les marchandes vendent des bouquets de violettes et la foule acclame les coureurs. Vous êtes couvert de poussière, de plumes et de gloire.\n\nUn jeune homme pressé fend la foule, son carnet à la main : Géo Lefèvre, de L'Auto. « On m'a parlé d'un coureur dont le vélo bavarde. C'est vous ? »",
            stamina = 4,
            choices = {
                { text = "Répondre à Géo Lefèvre", to = 57 },
                { text = "Aller dormir", to = 58 },
            },
        },
        [57] = {
            text = "Vous racontez tout à Lefèvre : la cartomancienne, les boulangeries, la mer. Hortense ajoute des détails, et le journaliste en laisse tomber son crayon. « Formidable ! Les lecteurs vont adorer. Desgrange aussi, il raffole des histoires de courage. »\n\nIl vous glisse deux francs pour l'anecdote. « Et si vous avez des preuves contre un tricheur, montrez-les au patron à l'arrivée. »",
            gold = 2,
            choices = {
                { text = "Aller dormir", to = 58 },
            },
        },
        [58] = {
            text = "Départ de Toulouse vers Bordeaux, la plus courte étape du Tour. Deux chemins s'offrent à vous : longer le canal latéral à la Garonne, plat comme une crêpe, ou passer par les coteaux d'Agen, plus durs, mais réputés pour leurs pruneaux.\n\n« Le canal va à la mer ? demande Hortense. — Pas directement. — Alors je m'en fiche. »",
            choices = {
                { text = "Longer le canal", to = 59 },
                { text = "Passer par Agen", to = 60 },
            },
        },
        [59] = {
            text = "Sur le chemin de halage, une péniche chargée de barriques glisse sur l'eau. Le marinier, un grand gaillard rigolard, vous lance : « Hé, le coureur ! Monte donc, je t'emmène jusqu'à Bordeaux. Tu feras la sieste et personne n'en saura rien ! »\n\nHortense trépigne : « Un bateau ! Presque la mer ! »",
            choices = {
                { text = "Monter sur la péniche", to = 62 },
                { text = "Rester en selle, honnêtement", to = 61 },
            },
        },
        [60] = {
            text = "À Agen, une vieille dame vend des pruneaux sur le bord de la route. « Mangez-en, mon petit, ça donne des jambes. Et ça facilite... enfin, vous verrez bien. » Vous en croquez une poignée, moelleux et sucrés.\n\nLes coteaux sont durs, mais vos jambes ont retrouvé une étrange vigueur.",
            stamina = 3,
            choices = {
                { text = "Redescendre vers la Garonne", to = 61 },
            },
        },
        [61] = {
            text = "Près de Langon, trois silhouettes surgissent d'un vignoble : Anatole Clouzot, casquette à carreaux, et deux gros bras de sa bande de saboteurs. « Cette fois, tu n'arriveras pas à Bordeaux ! » ricane-t-il en brandissant une pompe à vélo comme un gourdin.\n\nHortense tremble sur ses rayons. Les vignes de Sauternes s'étendent tout autour.",
            choices = {
                { text = "Huiler la chaîne et filer", to = 64, need = "huile" },
                { text = "Affronter les saboteurs", to = 63 },
                { text = "Fuir à travers les vignes", to = 65 },
            },
        },
        [62] = {
            text = "Vous montez à bord et ronflez entre deux barriques. À l'arrivée à Bordeaux, vous sautez sur le quai, frais comme un gardon. Malheureusement, Henri Desgrange est là, sur le pont de pierre, avec ses jumelles.\n\n« À la péniche ! Disqualifié ! » tonne-t-il. Vous finissez le Tour comme mousse sur la péniche, et Hortense devient figure de proue. Elle est ravie. Vous, un peu moins.",
            ending = "death",
        },
        [63] = {
            text = "Les saboteurs vous encerclent. Clouzot attaque le premier, puis le Grand Bastien, un colosse qui sent le vin et l'oignon. Vous retroussez vos manches. Hortense fait sonner sa sonnette comme le tocsin. Les vignes retiennent leur souffle. Pour la gloire du Tour !",
            fight = {
                enemies = {
                    { name = "Anatole Clouzot", skill = 8, stamina = 6 },
                    { name = "Le Grand Bastien", skill = 7, stamina = 7 },
                },
                win = 66,
            },
        },
        [64] = {
            text = "Quelques gouttes d'huile d'olive sur la chaîne, et Hortense se met à ronronner comme jamais. Vous démarrez en trombe, laissant les saboteurs dans un nuage de poussière. Clouzot court derrière vous, glisse sur une grappe de raisin et s'étale dans un cep.\n\n« Merci, l'huile de Marseille ! » crie Hortense.",
            choices = {
                { text = "Rouler vers Bordeaux", to = 66 },
            },
        },
        [65] = {
            text = "Vous plongez entre les rangs de vigne, Hortense sur l'épaule. Les grappes vous fouettent le visage, les saboteurs vous poursuivent en jurant. Un vigneron, sa hotte sur le dos, vous regarde passer sans comprendre. Il vous faudra de la chance pour trouver la sortie avant eux.",
            test = { stat = "luck", win = 64, lose = 63 },
        },
        [66] = {
            text = "Débarrassé des saboteurs, vous traversez les vignes jusqu'aux faubourgs de Bordeaux. La Garonne s'élargit, couverte de voiliers et de bateaux à vapeur, et le port de la Lune déroule ses façades blondes.\n\nHortense renifle : « Ça sent la vanille et le rhum... Il doit y avoir une boulangerie par ici. Ou dix. »",
            choices = {
                { text = "Entrer dans Bordeaux", to = 67 },
            },
        },
        [67] = {
            text = "Sur la place des Quinconces, la foule acclame les coureurs. Le Suisse Charles Laeser a gagné l'étape, une première pour un coureur étranger ! Près du contrôle, une pâtisserie expose des canelés, petits, bruns et caramélisés.\n\nHortense freine pile devant la vitrine, bien sûr. « Je n'y peux rien. Et puis regarde-les, ils sont si mignons. »",
            choices = {
                { text = "Acheter des canelés (2 francs)", to = 68, cost = 2 },
                { text = "Pointer au contrôle", to = 69 },
            },
        },
        [68] = {
            text = "Vous croquez dans un canelé : croûte caramélisée, cœur fondant parfumé au rhum et à la vanille. Vous en mangez six. La pâtissière vous explique que les religieuses d'un ancien couvent les fabriquaient avec les jaunes d'œufs donnés par les marchands de vin.\n\nVous repartez requinqué, avec du sucre jusqu'aux sourcils.",
            stamina = 4,
            choices = {
                { text = "Pointer au contrôle", to = 69 },
            },
        },
        [69] = {
            text = "Au contrôle, on tamponne votre carnet. Vous dormez dans une auberge des Chartrons, bercé par les cris des débardeurs. Le lendemain matin, une longue étape vous attend : Bordeaux–Nantes, plus de quatre cents kilomètres.\n\nHortense se réveille de mauvaise humeur. « J'ai vu une mer. Il m'en faut une autre. L'océan est tout près, je le sens. »",
            stamina = 3,
            choices = {
                { text = "Prendre la route de Nantes", to = 70 },
            },
        },
        [70] = {
            text = "Au nord de Bordeaux, la route file vers Saintes. Un panneau indique aussi, à l'ouest, la route de Rochefort et de La Rochelle, au bord de l'océan Atlantique. Le détour vous coûtera des forces.\n\n« S'il te plaît, supplie Hortense. Une deuxième mer, et je redeviens un vélo normal. Je te le promets sur ma sonnette. »",
            choices = {
                { text = "Faire le détour par La Rochelle", to = 71 },
                { text = "Filer droit par Saintes", to = 72 },
            },
        },
        [71] = {
            text = "La Rochelle ! Les tours du Vieux-Port montent la garde face à l'océan. Les vagues grises roulent jusqu'à vos pieds, et Hortense pleure de joie, ce qui fait rouiller un peu ses rayons.\n\n« L'Atlantique ! Ça fait deux ! Deux mers ! » Elle chante une chanson de marins que lui apprenait sa boulangère. Vos jambes, elles, trouvent le détour bien long.",
            set = "mer2",
            stamina = -2,
            choices = {
                { text = "Remonter vers la Vendée", to = 73 },
            },
        },
        [72] = {
            text = "Vous traversez Saintes, passez sous l'arc romain de Germanicus et filez vers le nord. Hortense boude. Elle ne dit plus rien, mais elle louche sur chaque enseigne de boulangerie.\n\nLa prochaine ville approche. Au carrefour, une odeur de brioche chaude vient vous chatouiller les narines. Hortense va-t-elle tenir ?",
            roll = { dice = 1, outcomes = {
                { upto = 3, to = 74 },
                { upto = 6, to = 73 },
            } },
        },
        [73] = {
            text = "La Vendée, avec son bocage, ses haies et ses chemins creux. La nuit tombe sur La Roche-sur-Yon, et vous roulez au clair de lune en écoutant les grenouilles.\n\nÀ l'aube, les clochers de Nantes apparaissent au bout de la route, et la Loire scintille sous un drôle de grand pont en fer qui ressemble à une balançoire de géant.",
            choices = {
                { text = "Entrer dans Nantes", to = 75 },
            },
        },
        [74] = {
            text = "Hortense pile devant une boulangerie de Saint-Jean-d'Angély. Vous embrassez la vitrine. Le boulanger vous ramasse, vous époussette et vous offre une part de brioche vendéenne, dorée et parfumée à la fleur d'oranger.\n\n« Ma femme dit que je fais la meilleure du pays. Elle a raison, c'est elle qui me l'a appris. »",
            stamina = 3,
            choices = {
                { text = "Repartir vers la Vendée", to = 73 },
            },
        },
        [75] = {
            text = "Nantes ! Le château des ducs de Bretagne veille sur la ville. Au bord de la Loire se dresse le tout nouveau pont transbordeur, si neuf que la peinture sèche encore. Des ouvriers vous font signe de venir l'essayer.\n\nSur le quai, une crêpière installe ses billigs et l'odeur de beurre salé vous fait tourner la tête. Hortense aussi.",
            choices = {
                { text = "Essayer le pont transbordeur", to = 76 },
                { text = "Goûter une crêpe", to = 77 },
                { text = "Pointer au contrôle", to = 78 },
            },
        },
        [76] = {
            text = "Vous montez avec Hortense dans la nacelle suspendue, qui glisse au-dessus de la Loire, accrochée à un chariot tout là-haut. Vous êtes les premiers passagers du jour ! « On vole ! crie Hortense. Je suis un ballon dirigeable ! »\n\nLes ouvriers applaudissent. Le chef d'équipe vous serre la main : « Ça porte bonheur, d'inaugurer un pont. »",
            luck = 2,
            choices = {
                { text = "Pointer au contrôle", to = 78 },
            },
        },
        [77] = {
            text = "La crêpière, Madame Le Goff, vous sert une crêpe au beurre salé, puis une galette de sarrasin à l'œuf. Divin ! Elle vous observe, pensive. « Vous avez de bons poignets. Mon fils est parti marin, j'ai besoin de quelqu'un pour tourner les crêpes. Logé, nourri, et tout le beurre que vous voulez. »\n\nHortense, garée devant la billig, semble déjà conquise.",
            stamina = 4,
            choices = {
                { text = "Accepter de devenir crêpier", to = 79 },
                { text = "Refuser et pointer au contrôle", to = 78 },
            },
        },
        [78] = {
            text = "Au contrôle de Nantes, Garin a encore gagné. Il passe près de vous et vous tapote l'épaule : « Plus qu'une étape, gamin. Nantes–Paris. Après, tu pourras dormir une semaine. »\n\nVous vous endormez sur un banc. Hortense veille sur vous en murmurant des chansons de boulangerie. Demain, la dernière étape : la Loire, ses châteaux, et Paris.",
            stamina = 3,
            choices = {
                { text = "Prendre le départ pour Paris", to = 80 },
            },
        },
        [79] = {
            text = "Vous troquez votre maillot contre un tablier. Bientôt, toute la ville vient goûter les crêpes du « coureur crêpier », et Hortense, transformée en triporteur, livre les commandes jusqu'à Saint-Nazaire, face à l'océan.\n\nVous ne finirez jamais le Tour, mais vous devenez le roi de la crêpe au beurre salé. Chaque été, quand passent les coureurs, vous leur offrez une galette.",
            ending = "end",
        },
        [80] = {
            text = "Dernière étape : Nantes–Paris. La route suit la Loire, passe devant les châteaux d'Angers, de Saumur, et file vers Tours. La nuit tombe sur la Touraine, douce comme un velours.\n\nLes coureurs les plus courageux continuent dans le noir. Les autres s'arrêtent dormir à Tours, réputée pour ses rillettes.",
            choices = {
                { text = "Rouler de nuit à la lanterne", to = 81, need = "lanterne" },
                { text = "Dormir à Tours", to = 82 },
            },
        },
        [81] = {
            text = "Votre lanterne trace un chemin de lumière dans la nuit de Touraine. Les châteaux de Blois et d'Amboise défilent comme des fantômes de pierre. Des lucioles dansent autour de vous.\n\nÀ l'aube, Orléans et sa cathédrale. Hortense chantonne : « Bientôt Paris ! Bientôt la fin de la malédiction... j'espère. » Puis Versailles, et enfin Ville-d'Avray.",
            choices = {
                { text = "Entrer dans Ville-d'Avray", to = 83 },
            },
        },
        [82] = {
            text = "À Tours, l'aubergiste vous sert des rillettes sur du pain de campagne et une omelette aux champignons. Vous dormez quatre heures d'un sommeil de plomb. Au petit matin, vous repartez frais comme un gardon.\n\nOrléans, Chartres, Versailles : les clochers défilent. Puis enfin Ville-d'Avray, aux portes de Paris, là où les coureurs pointent une dernière fois.",
            stamina = 4,
            choices = {
                { text = "Entrer dans Ville-d'Avray", to = 83 },
            },
        },
        [83] = {
            text = "À Ville-d'Avray, à trois kilomètres de l'arrivée, Hortense pile devant une boulangerie. Et cette fois, elle refuse de repartir. « Non. Je reste ici. Si je franchis la ligne et que la malédiction ne s'en va pas, j'aurai le cœur brisé. »\n\nLa foule s'impatiente. Au loin, on entend la fanfare du Parc des Princes.",
            choices = {
                { text = "Lui dire qu'elle a vu deux mers", to = 85, flag = { "mer1", "mer2" } },
                { text = "Lui parler de sa malédiction", to = 84, flag = "secret" },
                { text = "La pousser de force", to = 86 },
            },
        },
        [84] = {
            text = "« Tu n'as vu qu'une mer, c'est vrai, dites-vous doucement. Mais regarde tout ce qu'on a vu ensemble : le Rhône, les cols, les oies, les canelés... Et tu sais quoi ? L'année prochaine, il y aura un autre Tour. »\n\nHortense renifle. « Tu me promets la mer ? » Vous promettez. Elle sonne trois fois et repart, toujours bavarde, toujours maudite, mais d'attaque.",
            choices = {
                { text = "Foncer vers le Parc des Princes", to = 87 },
            },
        },
        [85] = {
            text = "« Hortense, tu as vu la Méditerranée à Marseille, et l'Atlantique à La Rochelle. Deux mers. Il ne te reste que la ligne d'arrivée. »\n\nLe vélo se tait. Puis toute sa chaîne frissonne, ses rayons scintillent, et une petite étincelle bleue s'échappe de sa sonnette. « Je sens quelque chose... Je crois que la cartomancienne a tenu parole. Allons-y, et vite ! »",
            set = "libre",
            choices = {
                { text = "Foncer vers le Parc des Princes", to = 87 },
            },
        },
        [86] = {
            text = "Vous poussez. Hortense se cabre comme un cheval sauvage, guidon en avant, pédales en moulinets. « Tu ne me feras pas avancer ! » Le pédalier vous tape les tibias, la sonnette vous sonne les oreilles. Le vélo maudit veut se battre !",
            fight = { name = "Hortense la rebelle", skill = 9, stamina = 7, win = 87 },
        },
        [87] = {
            text = "19 juillet 1903. Vous entrez au Parc des Princes sous les vivats de vingt mille Parisiens. Garin a gagné le Tour, mais la foule acclame tous ceux qui ont bouclé ces deux mille quatre cents kilomètres.\n\nHenri Desgrange vous attend près de la ligne, son chronomètre à la main. Géo Lefèvre lui chuchote quelque chose à l'oreille en vous désignant du menton.",
            choices = {
                { text = "Montrer les clous à Desgrange", to = 88, need = "clou" },
                { text = "Franchir la ligne avec Hortense libre", to = 90, flag = "libre" },
                { text = "Franchir la ligne", to = 89, noflag = "libre" },
            },
        },
        [88] = {
            text = "Desgrange examine le sac de clous de Clouzot et rougit de colère. « Le gredin ! Il est exclu à vie ! » Puis il vous serre la main : « Vous avez sauvé l'honneur de mon Tour. Voici une prime de dix francs, de la part de L'Auto. »\n\nVous rangez les pièces, ému. La foule scande votre nom. Il ne reste qu'à franchir la ligne.",
            gold = 10,
            lose = "clou",
            choices = {
                { text = "Faire le tour d'honneur avec Hortense", to = 90, flag = "libre" },
                { text = "Faire votre tour d'honneur", to = 89, noflag = "libre" },
            },
        },
        [89] = {
            text = "Vous franchissez la ligne sous les acclamations ! Vous avez bouclé le premier Tour de France, sur un vélo à cinq francs. Desgrange vous félicite, Garin vous offre un verre de limonade.\n\nHortense, elle, bavarde toujours et pile devant chaque boulangerie de Paris. « L'année prochaine, la mer, hein ? » Vous promettez. Après tout, une malédiction qui vous fait manger autant de croissants, ce n'est pas si terrible.",
            ending = "win",
        },
        [90] = {
            text = "Vous franchissez la ligne, et Hortense pousse un dernier cri de joie. Pouf ! Une étincelle bleue, et la voilà muette, brillante comme neuve, avec des freins qui marchent partout. La malédiction est levée !\n\nDesgrange, ému, vous tend un maillot jaune : « Comme le papier de L'Auto ! » Lefèvre s'esclaffe : « Un maillot pour le meilleur ? Quelle idée saugrenue ! Ça ne prendra jamais. » Desgrange le range... jusqu'en 1919. Vous, vous partez en vacances. À la mer.",
            ending = "win",
        },
    },
}
