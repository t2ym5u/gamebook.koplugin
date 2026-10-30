return {
    title       = "Le Fantôme du Mont",
    author      = "Gamebook",
    lang        = "fr",
    blurb       = "Un fantôme hante le Mont-Saint-Michel. La piste file aux catacombes de Paris... et sent le fromage.",
    sheet       = true,
    start       = 1,
    start_gold  = 4,
    start_items = { "lampe" },
    items = {
        lampe    = "Lampe de poche",
        cle      = "Clé du scriptorium",
        drap     = "Drap de faux fantôme",
        coquille = "Coquille de pèlerin",
        ticket   = "Billet de train",
        carte    = "Plan des carrières",
        fromage  = "Morceau de roquefort",
        plume    = "Plume de l'archange",
        livre    = "Livre de frère Anselme",
    },
    sections = {
        [1] = {
            text = "Le soleil se couche sur la baie quand vous arrivez au pied du Mont-Saint-Michel, votre carnet de chasseur de fantômes sous le bras. Depuis un mois, un spectre en robe de moine hante l'abbaye : il gémit, déplace les chaises et fait fuir les touristes.\n\nTout là-haut, l'archange saint Michel brille sur sa flèche. En bas, la mer commence à remonter. Ici, on dit qu'elle arrive « à la vitesse d'un cheval au galop ». Mieux vaut ne pas traîner.",
            choices = {
                { text = "Monter par la Grande Rue", to = 2 },
                { text = "Interroger l'aubergiste", to = 3 },
                { text = "Faire le tour des remparts", to = 4 },
            },
        },
        [2] = {
            text = "La Grande Rue grimpe entre les maisons à colombages, les boutiques de cartes postales et les marchands de crêpes. Ça sent le beurre salé et le caramel. Une odeur de crêpe complète vous chatouille les narines.\n\nPrès d'une fontaine, une touriste en anorak tourne sur elle-même, plan à l'envers, au bord des larmes.",
            choices = {
                { text = "Acheter une crêpe (2 pièces)", to = 5, cost = 2 },
                { text = "Aider la touriste égarée", to = 7 },
                { text = "Continuer vers l'abbaye", to = 6 },
            },
        },
        [3] = {
            text = "Madame Yvonne, l'aubergiste, bat des oeufs pour une omelette géante, haute comme un oreiller. Elle vous en sert une part.\n\n« Le fantôme ? C'est frère Anselme, le bibliothécaire de l'abbaye. Il a tenu bon pendant la guerre de Cent Ans, quand les Anglais assiégeaient le Mont. Il dort tranquille depuis six siècles. S'il se réveille, c'est qu'on lui a fait une misère. » Elle baisse la voix : « Dites au gardien que vous connaissez l'histoire. Il est sensible à ces choses-là. »",
            stamina = 2,
            set = "legende",
            choices = {
                { text = "Monter jusqu'à l'abbaye", to = 6 },
                { text = "Faire le tour des remparts", to = 4 },
            },
        },
        [4] = {
            text = "Sur les remparts, le vent sale vous ébouriffe. Les canons anglais abandonnés en 1434, les Michelettes, dorment près de la porte. Soudain, une silhouette blanche flotte au loin vers la tour Gabriel... et trébuche sur une marche en jurant : « Aïe, mon orteil ! »\n\nUn fantôme qui se cogne l'orteil, voilà qui est louche. Au large, sur les sables, une lumière clignote.",
            choices = {
                { text = "Poursuivre la silhouette blanche", to = 8 },
                { text = "Observer la lumière dans la baie", to = 9 },
                { text = "Remonter vers l'abbaye", to = 6 },
            },
        },
        [5] = {
            text = "La crêpière vous tend une crêpe au beurre salé, pliée en quatre, brûlante. Vous la dévorez sur les marches en regardant la baie virer au rose. Les mouettes vous observent avec un intérêt gourmand, mais vous ne cédez pas une miette.\n\nRequinqué, vous reprenez la grimpette vers les murailles de l'abbaye.",
            stamina = 4,
            choices = {
                { text = "Monter jusqu'à l'abbaye", to = 6 },
            },
        },
        [6] = {
            text = "Vous arrivez devant la porte de l'abbaye, essoufflé : le Grand Degré, ce gigantesque escalier, a eu raison de vos mollets. La porte est fermée. Sur un tabouret, Monsieur Lebrun, le gardien de nuit, épluche une pomme avec une lenteur infinie.\n\nÀ gauche, la Merveille dresse ses murs vertigineux. Plus bas, une petite porte de service garde ses secrets derrière une serrure rouillée.",
            choices = {
                { text = "Parler au gardien", to = 10 },
                { text = "Escalader le mur de la Merveille", to = 11 },
                { text = "Ouvrir la petite porte avec la clé", to = 12, need = "cle" },
            },
        },
        [7] = {
            text = "La touriste s'appelle Odile, elle vient de Lyon, et elle cherche son car depuis deux heures. Vous la raccompagnez jusqu'au parking en lui racontant la légende de saint Aubert, l'évêque d'Avranches à qui l'archange ordonna de bâtir ici un sanctuaire.\n\nRavie, elle vous donne trois pièces et une coquille Saint-Jacques de pèlerin : « Ça porte bonheur, paraît-il. » Vous remontez en courant. Mais la mer, elle, n'a pas attendu.",
            gold = 3,
            gain = "coquille",
            set = "retard",
            choices = {
                { text = "Monter jusqu'à l'abbaye", to = 6 },
            },
        },
        [8] = {
            text = "Vous coincez la silhouette au pied de la tour Gabriel. C'est un drap troué, deux trous pour les yeux, avec des baskets qui dépassent. Le « fantôme » lève les bras et pousse un « Hououou » peu convaincant, puis, voyant que vous ne fuyez pas, attrape un balai pour se défendre.",
            fight = { name = "Faux fantôme en drap", skill = 6, stamina = 5, win = 13, flee = 4 },
        },
        [9] = {
            text = "Vous plissez les yeux. Sur les sables, à marée basse, un vieux bateau à fond plat est échoué, et des hommes y chargent des caisses à la lueur d'une lanterne. Le vent vous apporte une odeur qui ne trompe pas : du fromage. Beaucoup de fromage. Assez pour nourrir la Normandie entière.\n\nDes contrebandiers de fromage ? Au pied d'une abbaye hantée ? Il y a peut-être un lien.",
            choices = {
                { text = "Descendre sur les sables", to = 14 },
                { text = "Remonter vers l'abbaye", to = 6 },
            },
        },
        [10] = {
            text = "Monsieur Lebrun lève un sourcil sans lâcher sa pomme. « L'abbaye est fermée, jeune homme. Le fantôme fait des heures supplémentaires, et moi je ne suis pas payé pour avoir peur. »\n\nIl ne bougera pas sans une bonne raison. Ou une petite pièce pour la « visite nocturne exceptionnelle ».",
            choices = {
                { text = "Raconter la légende de frère Anselme", to = 23, flag = "legende" },
                { text = "Dénoncer les contrebandiers", to = 23, flag = "contrebande" },
                { text = "Payer la visite nocturne (3 pièces)", to = 23, cost = 3 },
                { text = "Tenter plutôt l'escalade", to = 11 },
            },
        },
        [11] = {
            text = "Vous attaquez le mur de la Merveille, ce chef-d'oeuvre gothique que les moines ont bâti sur trois étages, accroché au rocher. Les pierres sont froides, les prises rares, et un goéland vous regarde comme si vous étiez complètement fou. Il n'a peut-être pas tort.",
            test = { stat = "skill", win = 23, lose = 24 },
        },
        [12] = {
            text = "La clé grince, la petite porte cède. Vous voici dans le chemin du Poulain, la rampe par laquelle on hissait autrefois les vivres jusqu'à l'abbaye. Personne en vue, pas même Monsieur Lebrun. Vous montez dans le noir, une main sur le mur glacé.\n\nUn escalier mène vers la salle des Chevaliers, où les moines copiaient leurs manuscrits. Un autre plonge vers la crypte.",
            choices = {
                { text = "Monter vers la salle des Chevaliers", to = 25 },
                { text = "Descendre à la crypte", to = 27 },
            },
        },
        [13] = {
            text = "Le drap s'effondre et révèle Gaston, un apprenti contrebandier de seize ans, tout penaud. « C'est le Baron de Brie qui me paie pour faire peur aux touristes ! Moins il y a de monde, plus ses bateaux de fromage passent tranquilles. »\n\nEn fuyant, il laisse tomber son drap et une grosse clé marquée « scriptorium ». Il crie encore, de loin : « Et le vrai fantôme, c'est pas moi, hein ! »",
            gain = { "drap", "cle" },
            set = "contrebande",
            choices = {
                { text = "Monter jusqu'à l'abbaye", to = 6 },
                { text = "Descendre sur les sables", to = 14 },
            },
        },
        [14] = {
            text = "Vous descendez sur les grèves. Le sable est ferme ici, mou là-bas, et brillant partout. Les guides de la baie vous l'auraient dit : on ne se promène jamais seul dans ces sables, surtout la nuit, surtout à l'heure de la marée. Mais vous êtes chasseur de fantômes, pas chasseur de prudence.\n\nVous avancez vers la lanterne en choisissant vos pas au hasard.",
            roll = { dice = 1, outcomes = {
                { upto = 2, to = 15 },
                { upto = 6, to = 16 },
            } },
        },
        [15] = {
            text = "Gloup. Votre pied droit s'enfonce, puis le gauche, puis vos genoux. Des sables mouvants ! Vous vous rappelez le conseil des anciens : ne pas paniquer, s'allonger, ramper doucement comme une crêpe qu'on retourne. Facile à dire quand on est en train de devenir un piquet.",
            test = { stat = "skill", win = 16, lose = 17 },
        },
        [16] = {
            text = "Caché derrière une caisse, vous espionnez les contrebandiers. Ils chargent des meules de camembert, de pont-l'évêque et de livarot. « Le Baron veut tout à Paris pour la semaine prochaine, dit l'un. Rendez-vous sous Denfert, dans la cave. Et il a le bouquin du moine, il dit que c'est la clé du trésor. »\n\nLa mer gronde au loin. Le bateau va bientôt flotter.",
            choices = {
                { text = "Vous cacher dans une caisse", to = 18 },
                { text = "Courir vers le Mont avant la marée", to = 19 },
                { text = "Attaquer le contrebandier isolé", to = 20 },
            },
        },
        [17] = {
            text = "Malgré vos efforts, vous vous enfoncez tranquillement jusqu'au menton, puis la marée arrive au galop, comme promis. Le lendemain, les guides de la baie racontent aux touristes l'histoire du jeune enquêteur qui voulait attraper un fantôme et qui en est devenu un.\n\nFrère Anselme, paraît-il, vous a gardé une place à la bibliothèque. FIN.",
            ending = "death",
        },
        [18] = {
            text = "Vous vous glissez dans une caisse entre deux meules de livarot. L'odeur est si puissante que vos yeux pleurent et que votre nez demande l'asile politique. Le couvercle se referme. Le bateau flotte, puis on vous charge dans un camion. Des heures de route, de virages et de fromage plus tard, le camion s'arrête enfin.",
            stamina = -2,
            choices = {
                { text = "Soulever doucement le couvercle", to = 39 },
            },
        },
        [19] = {
            text = "Vous courez vers le Mont. Derrière vous, la mer remonte la baie avec un grondement de troupeau. Les flaques deviennent des ruisseaux, les ruisseaux des rivières. Le cheval au galop, c'était une image, mais celui-ci a l'air d'avoir bu trois cafés. Vous sautez, glissez, sautez encore vers les remparts.",
            test = { stat = "skill", win = 6, lose = 21 },
        },
        [20] = {
            text = "Un contrebandier s'éloigne pour vérifier une amarre. Vous lui sautez dessus. Il est costaud, sent le pont-l'évêque et se défend à grands coups de baguette de pain rassis, aussi dure qu'un gourdin. « Personne ne touche au fromage du Baron ! » grogne-t-il en moulinant.",
            fight = { name = "Contrebandier", skill = 7, stamina = 6, win = 22, flee = 19 },
        },
        [21] = {
            text = "La marée vous rattrape à dix mètres des remparts. Vous flottez, vous barbotez, et un courant facétieux vous emporte en faisant le tour complet du Mont, comme une visite guidée aquatique. Vous échouez au petit matin sur la plage de Granville, couvert d'algues, avec un crabe dans la poche.\n\nLe fantôme, lui, continue de hanter l'abbaye. FIN.",
            ending = "death",
        },
        [22] = {
            text = "Le contrebandier s'effondre dans une flaque en gémissant « pas le visage, j'ai un rendez-vous ». Dans sa poche, vous trouvez un plan griffonné : « Carrières de Paris, réseau sous Denfert-Rochereau. Cave du Baron : suivre l'odeur. » Voilà une carte précieuse.\n\nLes vagues lèchent déjà la coque du bateau.",
            gain = "carte",
            choices = {
                { text = "Vous cacher dans une caisse", to = 18 },
                { text = "Courir vers le Mont avant la marée", to = 19 },
            },
        },
        [23] = {
            text = "Vous voici dans l'abbaye. L'église abbatiale, perchée tout en haut du rocher, résonne de vos pas. La lune passe par les vitraux. Victor Hugo disait que le Mont était pour la mer ce que la pyramide de Khéops est pour le désert. Il n'avait pas précisé que c'était aussi courant d'air.\n\nTrois chemins s'ouvrent devant vous.",
            choices = {
                { text = "Gagner la salle des Chevaliers", to = 25 },
                { text = "Visiter le cloître", to = 26 },
                { text = "Descendre à la crypte", to = 27 },
            },
        },
        [24] = {
            text = "Une prise se détache et vous dégringolez dans un buisson d'hortensias. Rien de cassé, sauf votre fierté et une branche. Le goéland éclate d'un rire qui ressemble beaucoup à un rire. Vous voilà couvert de pétales, mais heureusement, l'hortensia a amorti la chute.",
            stamina = -3,
            choices = {
                { text = "Retenter l'escalade", to = 11 },
                { text = "Faire le tour par les remparts", to = 4 },
            },
        },
        [25] = {
            text = "La salle des Chevaliers est immense, avec ses colonnes comme des troncs de pierre. Ici, les moines copiaient les manuscrits à la lueur des chandelles. Soudain, la température chute. Une silhouette transparente traverse une colonne, un livre fantôme sous le bras... sauf qu'il n'y a pas de livre.\n\n« Rendez-le-moi ! gémit-elle. Rendez-moi mon livre ! » Celui-là, il ne porte pas de baskets.",
            choices = {
                { text = "Lui parler poliment", to = 28 },
                { text = "Prendre vos jambes à votre cou", to = 29 },
                { text = "Lui jeter le drap sur la tête", to = 30, need = "drap" },
            },
        },
        [26] = {
            text = "Le cloître de la Merveille est suspendu entre ciel et mer, avec son jardin carré et ses fines colonnettes. Un vrai coin de paradis. Sur une colonne, quelqu'un a gratté à la craie : « Livre expédié. Paris, Denfert. Le B. » Une signature qui pue le fromage.\n\nVous respirez l'air du large, qui vous rend courage.",
            luck = 1,
            choices = {
                { text = "Gagner la salle des Chevaliers", to = 25 },
                { text = "Quitter le Mont pour Paris", to = 33 },
            },
        },
        [27] = {
            text = "Vous descendez dans la crypte des Gros Piliers, dont les colonnes énormes portent tout le choeur de l'église. Il fait noir comme dans un four à pain. Au fond, quelque chose de gigantesque se découpe dans l'ombre, rond comme une roue de charrette géante.",
            choices = {
                { text = "Allumer votre lampe de poche", to = 31, need = "lampe" },
                { text = "Avancer à tâtons", to = 32 },
            },
        },
        [28] = {
            text = "« Je suis frère Anselme, bibliothécaire de cette abbaye depuis 1423. Un vilain baron m'a volé mon livre, le Traité des fromages célestes. Il y a dedans la recette des moines et le chemin vers notre trésor, caché à Paris il y a bien longtemps. Sans ce livre, ma bibliothèque est incomplète, et je ne peux pas dormir. »\n\nIl vous tend une plume lumineuse. « Elle vous guidera dans le noir. Le Baron est parti sous Denfert. »",
            set = "parle_fantome",
            gain = "plume",
            choices = {
                { text = "Partir sur-le-champ pour Paris", to = 33 },
                { text = "Jeter d'abord un oeil au cloître", to = 26 },
            },
        },
        [29] = {
            text = "Vous dévalez le Grand Degré quatre à quatre, en ratant une marche sur deux, et vous vous arrêtez tout en bas, à bout de souffle. Le fantôme ne vous a pas suivi. Il est sans doute vexé. Vous aussi, un peu. Et pendant ce temps-là, la mer a bien avancé.",
            stamina = -1,
            set = "retard",
            choices = {
                { text = "Quitter le Mont pour Paris", to = 33 },
                { text = "Remonter discrètement au cloître", to = 26 },
            },
        },
        [30] = {
            text = "Vous lancez le drap. Il passe à travers le fantôme et retombe par terre, mais l'effet est irrésistible : frère Anselme se voit dans un miroir, avec ce drap qui pend sur une épaule, et il éclate de rire. « Un drap ! Comme dans les mauvaises farces ! Cela fait six siècles que je n'ai pas ri. » La glace est rompue.",
            luck = 1,
            choices = {
                { text = "Écouter son histoire", to = 28 },
            },
        },
        [31] = {
            text = "Le faisceau de votre lampe révèle la grande roue, ce cylindre de bois où des hommes marchaient comme des hamsters pour hisser les charges. Au pied de la roue, un sac oublié par les contrebandiers : un billet de train Pontorson-Paris tout neuf. Vous êtes un enquêteur, pas un voleur... mais c'est une pièce à conviction.",
            gain = "ticket",
            choices = {
                { text = "Ressortir vers le cloître", to = 26 },
                { text = "Gagner la salle des Chevaliers", to = 25 },
            },
        },
        [32] = {
            text = "Bong ! Votre front rencontre un pilier, qui ne bouge pas d'un millimètre. Vous continuez à tâtons, et votre pied heurte un vieux seau qui roule avec fracas. Puis vous entrez dans la grande roue sans le savoir et vous courez sur place pendant cinq bonnes minutes. Épuisant.",
            stamina = -2,
            choices = {
                { text = "Ressortir vers le cloître", to = 26 },
                { text = "Gagner la salle des Chevaliers", to = 25 },
            },
        },
        [33] = {
            text = "Vous redescendez la Grande Rue au pas de course. Pour quitter le Mont, il faut emprunter la passerelle jusqu'au continent. Les soirs de grande marée, son extrémité disparaît sous l'eau, et cette nuit, c'est la grande marée. Tout dépend du temps que vous avez perdu là-haut.",
            choices = {
                { text = "Traverser tranquillement la passerelle", to = 34, noflag = "retard" },
                { text = "Foncer sur la passerelle inondée", to = 35, flag = "retard" },
            },
        },
        [34] = {
            text = "Vous voici à la gare de Pontorson, petite et ensommeillée. Un train de nuit part pour Paris dans dix minutes. Sur le parking, un camion frigorifique tourne au ralenti. Son chauffeur fume en regardant le Mont, et il s'en dégage une odeur de fromage qui pourrait faire fondre la neige.",
            choices = {
                { text = "Acheter un billet (5 pièces)", to = 36, cost = 5 },
                { text = "Monter avec votre billet de train", to = 36, need = "ticket" },
                { text = "Grimper en douce dans le camion", to = 37 },
            },
        },
        [35] = {
            text = "Le bout de la passerelle est sous l'eau. Les vagues clapotent sur vos chevilles, puis vos genoux, puis votre ceinture. Vous avancez en tenant la rambarde, votre carnet entre les dents. Il va falloir un peu de chance pour atteindre la terre ferme avant que le cheval au galop ne vous piétine.",
            test = { stat = "luck", win = 34, lose = 21 },
        },
        [36] = {
            text = "Le train file dans la nuit, par Rennes, vers Paris. Le wagon est presque vide. Deux hommes louches, avec des chapeaux trop grands, se dirigent vers la voiture-bar en chuchotant. L'un d'eux sent le camembert à trois wagons. Vos paupières, elles, pèsent une tonne chacune, et la couchette a l'air terriblement confortable.",
            choices = {
                { text = "Dormir un peu", to = 51 },
                { text = "Suivre les deux hommes au bar", to = 64 },
            },
        },
        [37] = {
            text = "Vous vous glissez à l'arrière du camion, entre des centaines de meules. Le chauffeur, un certain Raymond, chante du Brassens à tue-tête en conduisant. Au téléphone, il dit : « Oui, Baron, la marchandise arrive à l'entrepôt de Montrouge. » Bingo. Au petit matin, le camion s'arrête à un feu rouge, en plein Paris.",
            stamina = -1,
            choices = {
                { text = "Rester caché jusqu'à l'entrepôt", to = 39 },
                { text = "Sauter du camion au feu rouge", to = 38 },
            },
        },
        [38] = {
            text = "Paris ! La tour Eiffel au loin, les cafés qui ouvrent, les pigeons qui se disputent un croissant. Vous dépliez votre carnet. La piste mène sous Denfert-Rochereau, là où dorment les catacombes. Mais il y a plusieurs façons d'y descendre, et quelques renseignements ne seraient pas de trop.",
            choices = {
                { text = "Aller à Notre-Dame demander conseil", to = 42 },
                { text = "Descendre dans les égouts", to = 45 },
                { text = "Filer à Denfert-Rochereau", to = 48 },
                { text = "Prendre un café en terrasse (2 pièces)", to = 50, cost = 2 },
            },
        },
        [39] = {
            text = "Vous êtes dans un grand entrepôt de Montrouge, aux portes de Paris. Des dockers déchargent les meules en les faisant rouler comme des roues de vélo. Au fond, une trappe ouverte descend dans le sol : on entend l'écho des galeries. Deux gros bras montent la garde devant, en grignotant du gruyère.",
            choices = {
                { text = "Vous faufiler entre les caisses", to = 81 },
                { text = "Charger les deux gardes", to = 41 },
            },
        },
        [40] = {
            text = "Vous atteignez la trappe. Sur une table, un plan des anciennes carrières est punaisé, avec une croix rouge marquée « Cave du Baron ». Vous l'empochez, ainsi qu'un morceau de roquefort qui traînait là. On ne sait jamais, en sous-sol, il peut y avoir des amateurs.\n\nLa trappe descend dans le noir. La porte de l'entrepôt donne sur la rue.",
            gain = { "carte", "fromage" },
            choices = {
                { text = "Descendre par la trappe", to = 55 },
                { text = "Sortir et filer à Denfert-Rochereau", to = 48 },
            },
        },
        [41] = {
            text = "« Un intrus ! » Les deux gardes lâchent leur gruyère et retroussent leurs manches. Le premier s'appelle Gros Lulu, le second Petit Lulu, et Petit Lulu est plus grand que Gros Lulu. Ils arrivent l'un après l'autre en brandissant des râpes à fromage.",
            fight = { enemies = {
                { name = "Gros Lulu", skill = 6, stamina = 5 },
                { name = "Petit Lulu", skill = 7, stamina = 5 },
            }, win = 40 },
        },
        [42] = {
            text = "Notre-Dame de Paris, toute pimpante depuis sa restauration, se dresse sur l'île de la Cité. Vous montez dans les tours, là où Victor Hugo faisait vivre Quasimodo. Une chimère de pierre, menton dans les mains, tourne lentement la tête vers vous. « Qui ose déranger ma contemplation ? » gronde-t-elle en déployant ses ailes.",
            choices = {
                { text = "Affronter la chimère", to = 80 },
                { text = "Lui montrer la coquille de pèlerin", to = 44, need = "coquille" },
                { text = "Redescendre et filer à Denfert", to = 48 },
            },
        },
        [43] = {
            text = "La chimère s'immobilise, vexée mais respectueuse. « Tu as du cran, petit. Le Baron de Brie ? Il passe sous mes pieds tous les mardis, je l'entends râler dans les tunnels. Les cataphiles te laisseront passer si tu dis : Gargantua a soif. C'est de Rabelais, ils adorent. »\n\nSous le parvis, la crypte archéologique communique avec les égouts.",
            set = "mot_de_passe",
            choices = {
                { text = "Filer à Denfert-Rochereau", to = 48 },
                { text = "Passer par la crypte vers les égouts", to = 45 },
            },
        },
        [44] = {
            text = "En voyant la coquille, la chimère s'incline. « Un pèlerin du Mont ! J'en ai vu passer des milliers, sur le chemin de Saint-Jacques. » Elle vous bénit d'un battement d'ailes et vous confie le mot de passe des cataphiles : « Gargantua a soif. C'est de Rabelais, ils adorent. »\n\nSous le parvis, la crypte archéologique communique avec les égouts.",
            set = "mot_de_passe",
            luck = 2,
            choices = {
                { text = "Filer à Denfert-Rochereau", to = 48 },
                { text = "Passer par la crypte vers les égouts", to = 45 },
            },
        },
        [45] = {
            text = "Les égouts de Paris : deux mille kilomètres de galeries, avec des plaques de rue au-dessus des canaux. Jean Valjean y a porté Marius sur son dos, dans Les Misérables. Un petit homme à casquette surgit de l'ombre : « Fifi la Combine, passeur. Je vous mène aux catacombes pour trois pièces. Prix d'ami. » Il a un sourire auquel il manque des dents et beaucoup d'honnêteté.",
            choices = {
                { text = "Payer le passeur (3 pièces)", to = 46, cost = 3 },
                { text = "Le bousculer pour qu'il vous guide", to = 47 },
                { text = "Partir seul dans les galeries", to = 49 },
            },
        },
        [46] = {
            text = "Fifi empoche vos pièces et trottine devant vous. Il bavarde, il montre les rats du doigt, il raconte des histoires. Puis, à un croisement, il marmonne « je reviens tout de suite » et disparaît dans un tunnel. Vous avez lu assez de romans pour connaître ce coup-là. Reste à savoir si vous le remarquerez à temps.",
            test = { stat = "luck", win = 52, lose = 47 },
        },
        [47] = {
            text = "Fifi la Combine se retourne, un manche de ventouse à la main. « Puisque c'est comme ça, je garde l'argent ET je vous laisse ici ! » Il se met en garde, comme un mousquetaire de caniveau. Autour de vous, les rats s'installent pour regarder le spectacle, comme au théâtre.",
            fight = { name = "Fifi la Combine", skill = 7, stamina = 7, win = 52, flee = 49 },
        },
        [48] = {
            text = "Place Denfert-Rochereau, le lion de Bartholdi monte la garde. À côté, le petit pavillon de l'entrée de l'ossuaire et sa file de touristes. Au coin d'une rue, une plaque d'égout entrouverte. Et devant une porte discrète, un jeune homme en bottes et lampe frontale scrute les passants : un cataphile, sans aucun doute.",
            choices = {
                { text = "Payer l'entrée de l'ossuaire (2 pièces)", to = 54, cost = 2 },
                { text = "Donner le mot de passe au cataphile", to = 56, flag = "mot_de_passe" },
                { text = "Soulever la plaque d'égout", to = 45 },
            },
        },
        [49] = {
            text = "Vous avancez seul, de canal en canal. Les plaques indiquent les rues au-dessus de vous : boulevard Saint-Michel, rue de Vaugirard... puis plus rien. L'eau clapote, les rats ricanent. Vous tournez à droite, puis à gauche, puis vous ne savez plus du tout. Il faut s'en remettre au hasard.",
            roll = { dice = 1, outcomes = {
                { upto = 2, to = 53 },
                { upto = 6, to = 52 },
            } },
        },
        [50] = {
            text = "En terrasse, vous commandez un grand crème et un croissant. Le garçon vous les jette presque sur la table, avec la grâce parisienne. Votre voisin, en bottes boueuses et lampe frontale, mange un sandwich au roquefort. Il vous en tend un morceau : « Pour les rats, en bas. Ils adorent. Moi, je suis cataphile. »",
            stamina = 4,
            gain = "fromage",
            choices = {
                { text = "Lui offrir un verre (2 pièces)", to = 82, cost = 2 },
                { text = "Le remercier et filer à Denfert", to = 48 },
            },
        },
        [51] = {
            text = "Vous dormez comme une marmotte, bercé par le roulis du train. Vous rêvez de l'archange saint Michel qui terrasse un dragon... qui ressemble étrangement à une meule de camembert. Au réveil, le train entre en gare Montparnasse, et vous êtes en pleine forme.",
            stamina = 4,
            choices = {
                { text = "Sortir de la gare", to = 38 },
            },
        },
        [52] = {
            text = "Le tunnel des égouts débouche sur un vieux mur de calcaire percé d'un trou. Derrière, l'air change : plus sec, plus frais, avec une odeur de pierre et de vieux os. Vous êtes à la frontière des catacombes, ces anciennes carrières d'où l'on a tiré les pierres de Paris. Il n'y a plus qu'à entrer.",
            choices = {
                { text = "Passer par le trou", to = 55 },
            },
        },
        [53] = {
            text = "Vous montez à une échelle, poussez une plaque... et débouchez au beau milieu d'une baignoire, dans un appartement cossu du sixième arrondissement. Sa propriétaire, en bigoudis, hurle si fort que tout l'immeuble accourt. Vous passez la journée au commissariat à expliquer que vous chassiez un fantôme.\n\nPersonne ne vous croit. Le Baron, lui, file avec le livre. FIN.",
            ending = "end",
        },
        [54] = {
            text = "Vous descendez cent trente marches. Au-dessus de la porte, une inscription : « Arrête ! C'est ici l'empire de la Mort. » Derrière, six millions de Parisiens reposent, os rangés avec soin, crânes disposés en coeurs et en frises. C'est impressionnant et un peu gênant, comme entrer chez quelqu'un sans frapper. Au détour d'une galerie, une barrière ferme un couloir interdit.",
            choices = {
                { text = "Enjamber la barrière", to = 55 },
                { text = "Suivre les flèches à la craie", to = 57 },
            },
        },
        [55] = {
            text = "Vous voici dans les galeries interdites. Les plaques gravées indiquent les rues de la surface, comme un plan de Paris à l'envers. L'écho de vos pas vous suit. Quelque part, très loin, il y a une odeur. Une odeur ronde, puissante, crémeuse : celle du fromage du Baron.",
            choices = {
                { text = "Suivre le plan des carrières", to = 60, need = "carte" },
                { text = "Suivre les flèches à la craie", to = 57 },
                { text = "Suivre l'odeur de fromage", to = 58 },
            },
        },
        [56] = {
            text = "« Gargantua a soif », murmurez-vous. Le cataphile sourit et vous fait entrer. En bas, dans une salle taillée dans la roche, une vingtaine de cataphiles pique-niquent à la bougie : saucisson, baguette, chansons. On vous offre à manger et un plan des carrières annoté à la main. « Le Baron ? Il a installé sa cave près de la fontaine de la Samaritaine. Il nous pique nos coins ! »",
            stamina = 3,
            gain = "carte",
            choices = {
                { text = "Partir dans les galeries", to = 55 },
            },
        },
        [57] = {
            text = "Des flèches à la craie courent sur les murs. Certaines sont sérieuses. D'autres ont été tracées par des cataphiles farceurs, qui adorent envoyer les touristes égarés tourner en rond pendant des heures. Impossible de faire la différence. Vous choisissez une flèche et vous croisez les doigts.",
            roll = { dice = 1, outcomes = {
                { upto = 2, to = 59 },
                { upto = 6, to = 58 },
            } },
        },
        [58] = {
            text = "Un couinement. Puis dix. Puis cent. Dans le faisceau de votre lampe surgissent des rats énormes, gros comme des teckels, attirés par l'odeur du fromage du Baron. Le plus gros porte une cicatrice sur l'oreille et vous regarde comme un plateau de fromages ambulant.",
            choices = {
                { text = "Combattre les rats", to = 78 },
                { text = "Leur lancer le roquefort", to = 62, need = "fromage" },
            },
        },
        [59] = {
            text = "Vous êtes perdu. Complètement. Tous les couloirs se ressemblent, tous les crânes ont le même air goguenard. Vous pensez à Philibert Aspairt, ce portier qui s'est perdu ici en 1793 et qu'on n'a retrouvé que onze ans plus tard. Vous n'avez pas onze ans devant vous. Le Baron non plus, d'ailleurs.",
            choices = {
                { text = "Chercher votre chemin au flair", to = 84 },
                { text = "Laisser la plume vous guider", to = 61, need = "plume" },
            },
        },
        [60] = {
            text = "La cave du Baron ! Des centaines de meules s'affinent sur des étagères taillées dans la roche : treize degrés, humidité parfaite, la plus grande cave d'affinage clandestine de France. Au centre, assis sur un trône de tommes, le Baron de Brie feuillette un vieux livre relié de cuir. Son garde du corps, Grosse Tomme, fait craquer ses doigts.",
            choices = {
                { text = "Le défier en duel", to = 65 },
                { text = "L'espionner depuis l'ombre", to = 66 },
                { text = "Appeler frère Anselme à l'aide", to = 67, flag = "parle_fantome" },
            },
        },
        [61] = {
            text = "Vous arrivez à la fontaine de la Samaritaine, un puits creusé jadis par les carriers. Son eau est claire et glacée. Vous buvez à longs traits et vous sentez revivre. De l'autre côté de la paroi, vous entendez des voix et un bruit très reconnaissable : quelqu'un qui découpe du comté.",
            stamina = 3,
            choices = {
                { text = "Écouter à travers la paroi", to = 66 },
                { text = "Foncer vers les voix", to = 60 },
            },
        },
        [62] = {
            text = "Vous lancez le roquefort au loin. Les rats se ruent dessus dans une bousculade de moustaches. Seul le gros rat à l'oreille balafrée reste en arrière, il vous regarde, puis vous fait signe de la queue : suis-moi. Un rat reconnaissant, c'est rare, et ça porte bonheur, assurent les cataphiles.",
            luck = 1,
            lose = "fromage",
            choices = {
                { text = "Suivre le rat balafré", to = 61 },
            },
        },
        [63] = {
            text = "Vous errez pendant des jours. Pour passer le temps, vous rangez les os qui dépassent et redressez les crânes de travers. Un employé de l'ossuaire finit par vous trouver et, voyant la qualité de votre travail, vous embauche sur-le-champ. Vous ne remontez plus jamais à la surface : vous êtes devenu le meilleur rangeur de tibias de Paris.\n\nLe mystère, lui, reste entier. FIN.",
            ending = "death",
        },
        [64] = {
            text = "Au bar, les deux hommes boivent du cidre en chuchotant fort, comme tous les mauvais comploteurs. « Le Baron dit que le trésor des moines est caché derrière la fontaine de la Samaritaine. Troisième crâne en partant de la gauche. Mais il faut le livre pour être sûr. » Vous notez tout dans votre carnet, caché derrière un menu.\n\nLe train entre en gare Montparnasse.",
            set = "code_tresor",
            choices = {
                { text = "Descendre du train", to = 38 },
            },
        },
        [65] = {
            text = "« Baron de Brie ! Rendez ce livre à son propriétaire ! » Votre voix résonne sous les voûtes. Le Baron se lève en lissant sa moustache. « Un gamin ? Grosse Tomme, occupe-toi de lui. Puis je finirai le travail moi-même. » Il tire une épée à fromage longue comme un bras.",
            fight = { enemies = {
                { name = "Grosse Tomme", skill = 7, stamina = 6 },
                { name = "Le Baron de Brie", skill = 9, stamina = 8 },
            }, win = 68, flee = 59 },
        },
        [66] = {
            text = "Caché derrière une étagère de reblochons, vous écoutez le Baron lire à voix haute : « Le trésor des moines repose derrière la fontaine de la Samaritaine. Tirer le troisième crâne en partant de la gauche. » Il ricane : « Demain, ce sera à moi ! » Le livre est posé sur une meule, à deux pas de vous.",
            set = "code_tresor",
            choices = {
                { text = "Subtiliser le livre en douce", to = 83 },
                { text = "Le défier en duel", to = 65 },
                { text = "Appeler frère Anselme à l'aide", to = 67, flag = "parle_fantome" },
            },
        },
        [67] = {
            text = "« Frère Anselme ! » La température chute, les bougies vacillent, et le moine surgit à travers une meule de brie en hurlant : « MON LIVRE ! » Grosse Tomme et les contrebandiers détalent en piaillant. Il ne reste que le Baron, blême, qui serre le livre contre lui et brandit son épée à fromage. « Un fantôme ne peut rien toucher ! C'est toi que je vais découper ! »",
            choices = {
                { text = "Affronter le Baron", to = 69 },
            },
        },
        [68] = {
            text = "Le livre est à vous ! Le Baron de Brie veut vous rattraper, glisse et s'écroule sur un tas de mimolettes. Vous serrez votre trophée : le Traité des fromages célestes, avec ses enluminures de vaches et d'anges. Les cataphiles, alertés par le bruit, arrivent et ligotent le Baron avec des cordes d'escalade. Le livre est chaud dans vos mains, comme s'il était content.",
            gain = "livre",
            choices = {
                { text = "Rapporter le livre au Mont", to = 70 },
                { text = "Chercher le trésor des moines", to = 71, flag = "code_tresor" },
                { text = "Tout remettre à la police", to = 73 },
            },
        },
        [69] = {
            text = "Le Baron fond sur vous, l'épée à fromage en avant. Frère Anselme flotte au-dessus de vous et vous encourage comme à un match : « Allez ! Feinte ! Esquive ! Par saint Michel, frappe ! » C'est très encourageant, mais un peu bruyant pour se concentrer.",
            fight = { name = "Le Baron de Brie", skill = 8, stamina = 7, win = 68 },
        },
        [70] = {
            text = "Le lendemain, vous reprenez le train vers la baie, le livre serré contre vous. À marée basse, cette fois, vous traversez sans encombre. Dans la salle des Chevaliers, frère Anselme vous attend. Il pose délicatement le livre sur son étagère, entre un psautier et un traité d'astronomie. Pour la première fois depuis six cents ans, sa bibliothèque est complète.",
            choices = {
                { text = "Dire au revoir à frère Anselme", to = 72 },
            },
        },
        [71] = {
            text = "Vous retournez à la fontaine de la Samaritaine, le livre ouvert à la bonne page. Une rangée de crânes vous regarde avec ses orbites vides. Troisième en partant de la gauche... ou était-ce de la droite ? Le livre est un peu effacé à cet endroit, à cause d'une tache de fromage de 1450. Vous tendez la main.",
            test = { stat = "luck", win = 74, lose = 76 },
        },
        [72] = {
            text = "Frère Anselme vous bénit, bâille comme un chat et s'endort enfin, pour de bon, dans un coin de la bibliothèque. L'abbaye retrouve son calme et ses touristes. Monsieur Lebrun finit sa pomme. Madame Yvonne vous offre une omelette géante, et le journal de la Manche titre : « Un jeune enquêteur résout le mystère du fantôme du Mont ! »\n\nVous avez gagné.",
            ending = "win",
        },
        [73] = {
            text = "Vous remettez le Baron et le livre aux policiers, qui vous félicitent chaleureusement. Le Baron est mis en prison, ses fromages saisis. Le livre est mis sous scellés comme pièce à conviction, jusqu'à la fin du procès, prévue dans une dizaine d'années.\n\nAu Mont-Saint-Michel, frère Anselme continue de gémir chaque nuit. Il a demandé un délai à la bibliothèque. FIN.",
            ending = "end",
        },
        [74] = {
            text = "Le crâne pivote avec un clic. La paroi coulisse et révèle un coffre de chêne. Dedans : des écus d'or frappés de l'archange, la recette originale du fromage des moines, et un mot : « Pour le jour où l'abbaye aura besoin d'un toit neuf. » Vous refermez le coffre, le coeur battant. Le trésor du Mont est retrouvé.",
            gold = 20,
            choices = {
                { text = "Rapporter livre et trésor au Mont", to = 75 },
            },
        },
        [75] = {
            text = "De retour au Mont, vous rendez le livre à frère Anselme et le trésor à l'abbaye. Le toit est refait, la grande roue restaurée, et le fromage des moines renaît : on le vend dans la Grande Rue, à côté des crêpes. Frère Anselme s'endort enfin, souriant. L'archange, sur sa flèche, semble vous faire un clin d'oeil.\n\nOn vous nomme gardien d'honneur de la bibliothèque. Victoire totale !",
            ending = "win",
        },
        [76] = {
            text = "Mauvais crâne ! Une avalanche d'os dégringole sur vous dans un grand bruit de xylophone. Vous émergez du tas, un fémur sur l'épaule et un crâne sur la tête comme un casque, sonné mais vivant. La rangée de crânes vous nargue toujours. Il en reste un autre à tenter... si vous osez.",
            stamina = -3,
            choices = {
                { text = "Tirer un autre crâne", to = 77 },
                { text = "Renoncer et rapporter le livre", to = 70 },
            },
        },
        [77] = {
            text = "Vous respirez un grand coup, vous comptez de nouveau, cette fois depuis la droite, et vous posez la main sur un crâne qui semble sourire un peu plus que les autres. Il faut tirer d'un geste précis, sans faire bouger tout le reste du mur. Une vraie partie de mikado funéraire.",
            test = { stat = "skill", win = 74, lose = 79 },
        },
        [78] = {
            text = "Les rats attaquent en ordre de bataille. D'abord un éclaireur aux dents jaunes, puis le gros chef balafré, qui couine des ordres comme un général d'Empire. Vous faites des moulinets avec votre lampe en regrettant de ne pas avoir pris de chat.",
            fight = { enemies = {
                { name = "Rat géant", skill = 6, stamina = 4 },
                { name = "Rat chef balafré", skill = 7, stamina = 5 },
            }, win = 61, flee = 59 },
        },
        [79] = {
            text = "Cette fois, c'est tout le mur qui s'effondre. Des milliers d'os vous recouvrent dans un vacarme de castagnettes géantes. Quand les employés de l'ossuaire vous retrouvent, ils mettent trois semaines à vous trier du reste. Vous figurez désormais dans les guides : « Le chasseur de fantômes, dernier arrivé, rangé avec soin. »\n\nFrère Anselme vous rendra visite. FIN.",
            ending = "death",
        },
        [80] = {
            text = "La chimère bondit de sa corniche dans un grand froissement de pierre. Ses griffes raclent le plomb du toit, sa queue fouette l'air. Les pigeons s'enfuient, scandalisés. Vous esquivez entre les gargouilles, au-dessus de tout Paris. En bas, des touristes applaudissent, persuadés d'assister à un spectacle.",
            fight = { name = "Chimère de Notre-Dame", skill = 8, stamina = 8, win = 43, flee = 48 },
        },
        [81] = {
            text = "Vous rampez derrière une pyramide de meules, retenant votre souffle (ce qui, dans cette odeur, est presque un soulagement). Il faut passer derrière les gardes sans faire tomber la moindre caisse. Un seul faux pas, et c'est l'avalanche de camemberts.",
            test = { stat = "skill", win = 40, lose = 41 },
        },
        [82] = {
            text = "Le cataphile trinque avec vous. Ravi, il se penche : « Le mot de passe, en bas, c'est : Gargantua a soif. Un hommage à Rabelais, le plus grand buveur de la littérature. Dis-le à l'entrée de Denfert, on te laissera passer. » Il vous fait un clin d'oeil et repart en sifflotant, sa lampe frontale à la main.",
            set = "mot_de_passe",
            choices = {
                { text = "Filer à Denfert-Rochereau", to = 48 },
            },
        },
        [83] = {
            text = "Vous tendez la main vers le livre, doucement, très doucement. Le Baron vous tourne le dos, occupé à renifler un brie. Grosse Tomme fait la sieste. Il suffit qu'aucune meule ne grince, qu'aucun rat ne couine... et que votre estomac, qui n'a rien mangé depuis Paris, ne se mette pas à gargouiller.",
            test = { stat = "luck", win = 68, lose = 65 },
        },
        [84] = {
            text = "Vous mouillez votre doigt, vous le levez pour sentir le courant d'air, vous reniflez dans toutes les directions comme un chien truffier. Quelque part, peut-être, une odeur de fromage. Ou peut-être est-ce votre imagination. Vous partez à l'aveuglette, en espérant que votre nez soit meilleur que votre sens de l'orientation.",
            test = { stat = "luck", win = 58, lose = 63 },
        },
    },
}
