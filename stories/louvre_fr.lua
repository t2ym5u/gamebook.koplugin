return {
    title       = "Le Sourire volé du Louvre",
    author      = "Gamebook",
    lang        = "fr",
    blurb       = "La Joconde fait la tête : on lui a volé son sourire. Vous avez une nuit au Louvre pour le lui rendre.",
    sheet       = true,
    start       = 1,
    start_gold  = 2,
    start_items = { "lampe", "badge" },
    items = {
        lampe     = "Lampe torche",
        badge     = "Badge de stagiaire",
        croissant = "Croissant au beurre",
        pinceau   = "Pinceau de Léonard",
        bandelette = "Bandelette de momie",
        cle       = "Clé des vitrines",
        bras      = "Bras de la Vénus",
        sourire   = "Sourire de la Joconde",
    },
    sections = {
        [1] = {
            text = "Minuit, salle des États. Pour votre première nuit de gardien stagiaire au Louvre, c'est la catastrophe : la Joconde fait la tête. Plus de sourire. Juste une moue boudeuse, bras croisés, derrière sa vitre blindée.\n\nM. Carreau, votre chef, lisse sa grosse moustache en battant nerveusement un jeu de cartes. « Le musée ouvre à neuf heures. D'ici là, retrouvez-moi ce sourire ! » Sur le mur, un vieux portrait barbu toussote poliment.",
            choices = {
                { text = "Écouter le portrait barbu", to = 2 },
                { text = "Interroger M. Carreau", to = 3 },
                { text = "Filer enquêter tout de suite", to = 4 },
            },
        },
        [2] = {
            text = "« Leonardo da Vinci, pour vous servir », dit le portrait avec un accent toscan à couper au couteau. « Mona Lisa, c'est mon chef-d'œuvre. Ce sourire, j'ai mis quatre ans à le peindre, et un voyou l'a décroché en quatre secondes ! »\n\nIl vous tend un fin pinceau à travers le cadre. « Quand vous le retrouverez, il faudra le repeindre bien en place. Et méfiez-vous des gens qui ont toujours un as dans la manche. »",
            gain = "pinceau",
            set = "vinci",
            choices = {
                { text = "Interroger M. Carreau", to = 3, noflag = "vu_carreau", hide = true },
                { text = "Partir enquêter", to = 4 },
            },
        },
        [3] = {
            text = "M. Carreau mélange ses cartes si vite qu'elles sifflent. « Le coupable ? Arsène Lupin, évidemment ! Il rôde toujours sur les toits. » Il vous glisse trois pièces « pour le café » et un croissant au beurre encore tiède, puis jette un drôle de regard vers le tableau.\n\nSa moustache, remarquez-vous, penche légèrement à gauche. Sans doute la fatigue.",
            set = "vu_carreau",
            gold = 3,
            gain = "croissant",
            choices = {
                { text = "Écouter le portrait barbu", to = 2, noflag = "vinci", hide = true },
                { text = "Partir enquêter", to = 4 },
            },
        },
        [4] = {
            text = "Dans le couloir, un ronronnement monte du parquet. Un robot aspirateur de surveillance, l'Aspiro 3000, fonce sur vous en clignotant rouge. Sa mission : tout aspirer après la fermeture. Poussière, miettes, et stagiaires égarés.\n\nIl vous a repéré. Sa brosse tourne de plus en plus vite.",
            choices = {
                { text = "Affronter le robot", to = 5 },
                { text = "Sauter par-dessus", to = 6 },
                { text = "Lui montrer votre badge", to = 7, need = "badge" },
            },
        },
        [5] = {
            text = "L'Aspiro 3000 vous fonce dans les chevilles en vrombissant. Vous attrapez une banquette en velours pour vous défendre. Que le meilleur gagne !",
            fight = { name = "Aspiro 3000", skill = 6, stamina = 5, win = 9 },
        },
        [6] = {
            text = "Vous prenez votre élan, comme un athlète des Jeux de Paris, et vous sautez par-dessus la machine. Le parquet de Versailles du couloir est fraîchement ciré. Très ciré. Beaucoup trop ciré.",
            test = { stat = "luck", win = 7, lose = 8 },
        },
        [7] = {
            text = "Vous voici dans le hall Napoléon, sous la grande Pyramide de verre. Au-dessus de vous, la lune brille à travers les losanges. Trois ailes du musée s'ouvrent autour de vous : Sully et ses antiquités égyptiennes, Denon et ses chefs-d'œuvre, et la sortie vers les jardins.\n\nLe silence est total. Quelque part, une momie ronfle. Où chercher le sourire perdu ?",
            choices = {
                { text = "Aller vers l'Égypte, aile Sully", to = 10, noflag = "fait_egypte", hide = true },
                { text = "Monter dans l'aile Denon", to = 32, noflag = "fait_denon", hide = true },
                { text = "Sortir par le haut de la Pyramide", to = 52, noflag = "fait_dehors", hide = true },
                { text = "Foncer à la galerie d'Apollon", to = 70, flag = "piste", hide = true },
            },
        },
        [8] = {
            text = "Vous glissez sur le parquet comme une crêpe sur la poêle et vous atterrissez pile devant le robot. Fsssshhh ! L'Aspiro 3000 vous aspire un lacet, une chaussette et votre dignité, puis repart, satisfait, vers d'autres miettes.\n\nVous boitillez jusqu'au hall, une chaussure à la main.",
            stamina = -2,
            choices = {
                { text = "Gagner le hall", to = 7 },
            },
        },
        [9] = {
            text = "Le robot hoquette, tourne trois fois sur lui-même et s'éteint en chantant une vieille mélodie électronique. Vous ouvrez son bac à poussière : au milieu des moutons, deux pièces oubliées par des touristes.\n\nVous les empochez. Après tout, c'est presque du bénévolat, un stage au Louvre.",
            gold = 2,
            choices = {
                { text = "Gagner le hall", to = 7 },
            },
        },
        [10] = {
            text = "Vous descendez dans la crypte où trône le Grand Sphinx de Tanis, un lion de granit à tête de pharaon long comme une camionnette. Il ouvre un œil.\n\n« Halte, petit humain. Nul ne passe sans répondre à mon énigme. Enfin... si, tout le monde passe, il y a un couloir à côté. Mais ce serait très impoli. »",
            set = "fait_egypte",
            choices = {
                { text = "Écouter l'énigme", to = 11 },
                { text = "Passer par le couloir", to = 14 },
            },
        },
        [11] = {
            text = "Le Sphinx s'éclaircit la gorge, ce qui fait trembler les vitrines.\n\n« Qui, dans ce palais, a perdu ses bras mais jamais sa beauté, et attend depuis deux mille ans qu'on lui rende un petit service ? »",
            choices = {
                { text = "Répondre : la Vénus de Milo", to = 12 },
                { text = "Répondre : un poulpe en vacances", to = 13 },
                { text = "Répondre : M. Carreau", to = 13 },
            },
        },
        [12] = {
            text = "« Exact ! » rugit le Sphinx, ravi. « Personne ne trouve jamais. Le dernier a répondu Napoléon. » Pour vous récompenser, il vous souffle un conseil vieux de quatre mille ans : « Méfiez-vous des sourires trop roses. » Puis il referme l'œil.\n\nVous repartez, le cœur léger et la tête pleine d'énigmes.",
            luck = 1,
            choices = {
                { text = "Continuer vers les sarcophages", to = 14 },
            },
        },
        [13] = {
            text = "Le Sphinx éclate d'un rire si énorme qu'il éternue. Un nuage de sable du désert vous enveloppe de la tête aux pieds. « Ah, les jeunes d'aujourd'hui ! Ils ne connaissent plus leurs classiques. »\n\nVous toussez, vous crachez, vous secouez vos cheveux, et vous repartez, un peu ensablé.",
            stamina = -1,
            choices = {
                { text = "Continuer vers les sarcophages", to = 14 },
            },
        },
        [14] = {
            text = "Salle des sarcophages. Une momie sort lentement du sien, bras tendus en avant, les yeux fermés. Elle est somnambule. Elle marmonne « maman, encore cinq minutes » et avance droit sur vous en traînant ses bandelettes.\n\nLa réveiller brutalement serait dangereux. Pour vous, surtout.",
            choices = {
                { text = "Passer sur la pointe des pieds", to = 15 },
                { text = "Combattre la momie", to = 16 },
                { text = "L'éveiller doucement à la lampe", to = 17, need = "lampe" },
            },
        },
        [15] = {
            text = "Vous retenez votre souffle et glissez le long du mur, un pas, puis un autre. La momie renifle. Elle tourne la tête vers vous.",
            test = { stat = "skill", win = 18, lose = 16 },
        },
        [16] = {
            text = "La momie se réveille en sursaut, très mal lunée, et vous fouette à grands coups de bandelettes en hurlant des malédictions en égyptien ancien. Vous parez avec votre lampe.",
            fight = { name = "Momie somnambule", skill = 7, stamina = 8, win = 19 },
        },
        [17] = {
            text = "Vous allumez votre lampe en douceur. La momie cligne des yeux et rougit sous ses bandelettes. « Oh, pardon ! Je m'appelle Padiamon, je somnambule depuis Ramsès II. C'est gênant. »\n\nPour se faire pardonner, elle déroule une longue bandelette solide comme une corde et vous la tend. « Ça peut toujours servir. Ne me demandez pas d'où elle vient. »",
            gain = "bandelette",
            choices = {
                { text = "Remercier et continuer", to = 18 },
            },
        },
        [18] = {
            text = "Au bout de la galerie, deux chemins. Tout droit, la salle du Scribe accroupi, ce célèbre fonctionnaire de pierre qui voit tout avec ses yeux de cristal. À gauche, un petit escalier mène aux peintures françaises du deuxième étage.\n\nUne odeur de vernis frais descend de l'escalier. C'est curieux, la nuit.",
            choices = {
                { text = "Aller voir le Scribe accroupi", to = 20 },
                { text = "Monter aux peintures françaises", to = 21 },
            },
        },
        [19] = {
            text = "La momie s'écroule sur un banc et se rendort aussitôt en ronflant comme un chameau. Dans la bagarre, elle a perdu une longue bandelette, solide comme une corde. Vous l'enroulez autour de votre bras.\n\nUn gardien d'il y a trois mille ans a oublié une datte sur un socle. Vous la croquez : elle est encore délicieuse.",
            gain = "bandelette",
            stamina = 2,
            choices = {
                { text = "Continuer", to = 18 },
            },
        },
        [20] = {
            text = "Le Scribe accroupi lève vers vous ses yeux incrustés de cristal. Il a un papyrus sur les genoux et un calame à la main. « J'ai tout vu, tout noté. C'est mon métier depuis quatre mille cinq cents ans. »\n\nIl tapote son papyrus. « Mais je suis fonctionnaire. Pas de formulaire, pas de témoignage. Ou alors, une petite participation aux frais. »",
            choices = {
                { text = "Payer les frais (2 pièces)", to = 22, cost = 2 },
                { text = "Le flatter sur sa belle posture", to = 23 },
                { text = "Laisser tomber et continuer", to = 24 },
            },
        },
        [21] = {
            text = "Salle des peintures françaises. Devant « Le Tricheur à l'as de carreau » de Georges de La Tour, vous restez bouche bée : le tricheur a disparu ! Il ne reste que la dame au turban, la servante et le jeune naïf, assis autour d'une table vide.\n\n« Il est parti avec un sourire qui n'était pas le sien », soupire la dame. Sur la table d'une nature morte voisine, vous chipez un raisin peint. Délicieux.",
            set = "cadre_vide",
            stamina = 2,
            choices = {
                { text = "Redescendre voir le Scribe", to = 20 },
            },
        },
        [22] = {
            text = "Le Scribe trempe son calame et dessine à toute vitesse. Vous déchiffrez les hiéroglyphes : un homme moustachu, une carte en forme de losange à la ceinture, et un sourire qui s'envole vers une galerie toute dorée, celle d'Apollon.\n\nIl tamponne le papyrus et le range dans ses archives. « Signé, daté, certifié conforme. Je témoignerai. »",
            set = { "temoin", "piste" },
            choices = {
                { text = "Remercier le Scribe et continuer", to = 24 },
            },
        },
        [23] = {
            text = "« Quel dos droit ! Quelle tenue ! Vous êtes la fierté de l'administration ! » Le Scribe se rengorge. Ses yeux de cristal brillent. Va-t-il craquer ?",
            test = { stat = "luck", win = 22, lose = 25 },
        },
        [24] = {
            text = "Le couloir égyptien devient glacial. Les vitrines se couvrent de buée. Une silhouette noire, masquée, flotte entre les statues de chats sacrés : Belphégor, le fantôme du Louvre !\n\nIl lève un bras immense. « Qui ose troubler mon éternité ? » Puis, plus bas : « Au fait, si vous cherchez le sourire, j'ai vu une lueur filer vers la galerie d'Apollon. »",
            set = "piste",
            choices = {
                { text = "Parler au fantôme", to = 26 },
                { text = "Prendre ses jambes à son cou", to = 27 },
                { text = "Se cacher dans un sarcophage", to = 28 },
            },
        },
        [25] = {
            text = "« La flatterie n'est pas un formulaire réglementaire », grince le Scribe. Vexé, il secoue son calame et vous asperge d'encre noire. Vous voilà moucheté comme un dalmatien.\n\nMais en vous tournant le dos, il marmonne malgré lui : « Apollon... la galerie d'Apollon... » Les fonctionnaires ne peuvent pas s'empêcher de renseigner.",
            stamina = -1,
            set = "piste",
            choices = {
                { text = "Continuer", to = 24 },
            },
        },
        [26] = {
            text = "Belphégor soupire comme un courant d'air. « Personne ne me parle depuis le feuilleton de 1965. Tout le monde a peur. C'est d'un triste, l'éternité. »\n\nIl s'assoit sur un sarcophage, le menton dans la main. « Faites-moi rire, et je vous aiderai. Ou bien... ça sent le beurre, là, dans votre poche ? »",
            choices = {
                { text = "Lui raconter une blague", to = 29 },
                { text = "Lui faire renifler le croissant", to = 30, need = "croissant" },
            },
        },
        [27] = {
            text = "Vous courez si vite que vous dépassez trois siècles d'histoire en dix secondes. Vous percutez une statue de babouin, vous vous excusez, et vous déboulez hors d'haleine dans le grand hall.\n\nDerrière vous, la voix du fantôme résonne : « Apollon ! J'ai dit Apollon ! Personne n'écoute jamais les fantômes ! »",
            stamina = -1,
            choices = {
                { text = "Retourner au hall", to = 7 },
                { text = "Aller à la galerie d'Apollon", to = 70 },
            },
        },
        [28] = {
            text = "Vous sautez dans un sarcophage vide et refermez le couvercle. Bien caché ! Si bien caché que, le lendemain matin, des déménageurs emportent le sarcophage pour une grande exposition au Caire.\n\nVous passez la semaine sous une pyramide, la vraie, à expliquer en mimant que vous n'êtes pas une momie. Le sourire de la Joconde, lui, attendra.",
            ending = "death",
        },
        [29] = {
            text = "Vous prenez votre plus belle voix. « Pourquoi les momies ne partent jamais en vacances ? Parce qu'elles ont peur de se relâcher et de se détendre ! »\n\nLe fantôme reste immobile. Long silence. Le suspense est insoutenable.",
            roll = { dice = 1, outcomes = { { upto = 2, to = 31 }, { upto = 6, to = 30 } } },
        },
        [30] = {
            text = "Belphégor éclate d'un rire caverneux qui fait trembler les momies. « Ah, ça faisait des lunes ! » Il essuie une larme d'ectoplasme. « Vous êtes mon ami, désormais. Je traverse les murs : si une porte vous résiste, appelez-moi. »\n\nIl ajoute : « Le voleur ? Un moustachu qui sentait la vieille peinture et le vernis. Il avait l'air de tricher même en marchant. »",
            set = { "belphegor_ami", "temoin" },
            choices = {
                { text = "Retourner au hall", to = 7 },
                { text = "Aller à la galerie d'Apollon", to = 70 },
            },
        },
        [31] = {
            text = "Le fantôme gémit. « C'est la pire blague depuis Louis XIV. » Un frisson glacé vous traverse : une bise de cave qui vous laisse claquant des dents.\n\nMais il est bon prince. « Allez, filez. Votre sourire est quelque part du côté de la galerie d'Apollon. Et travaillez vos blagues. »",
            stamina = -2,
            choices = {
                { text = "Retourner au hall", to = 7 },
                { text = "Aller à la galerie d'Apollon", to = 70 },
            },
        },
        [32] = {
            text = "Vous montez l'escalier Daru. Tout en haut, sur la proue de son navire de marbre, la Victoire de Samothrace bat des ailes pour se dégourdir. Elle n'a pas de tête, ce qui ne l'empêche pas de parler.\n\n« Un sourire volé ? Ne me regardez pas, je n'ai même pas de bouche ! » Plus loin, quelqu'un sanglote doucement : la Vénus de Milo. Et la Grande Galerie s'étire dans le noir.",
            set = "fait_denon",
            choices = {
                { text = "Parler à la Victoire", to = 33 },
                { text = "Consoler la Vénus de Milo", to = 34 },
                { text = "Entrer dans la Grande Galerie", to = 37 },
            },
        },
        [33] = {
            text = "« J'ai vu une ombre passer avec un petit croissant de lumière rose », dit la Victoire. « Un sourire, sans doute. Elle est entrée dans la galerie d'Apollon, juste là, derrière moi. »\n\nElle replie ses ailes. « Mais la grille est fermée la nuit. La clé des vitrines, c'est la Vénus qui l'a trouvée. Le problème, c'est qu'elle est assise dessus. »",
            set = "piste",
            choices = {
                { text = "Aller voir la Vénus", to = 34 },
                { text = "Entrer dans la Grande Galerie", to = 37 },
                { text = "Essayer la galerie d'Apollon", to = 70 },
            },
        },
        [34] = {
            text = "La Vénus de Milo vous regarde, l'œil humide. « Mes bras ! On me les a perdus en 1820 sur l'île de Milo, et chaque nuit je les cherche. Vous ne les auriez pas vus ? »\n\nSous elle, vous apercevez une petite clé dorée qui dépasse de son drapé de marbre. Elle ne peut évidemment pas la ramasser.",
            choices = {
                { text = "Promettre de retrouver ses bras", to = 35, without = "bras", hide = true },
                { text = "Lui rendre ses bras", to = 39, need = "bras", without = "cle", hide = true },
                { text = "Lui demander la clé", to = 36 },
                { text = "Partir vers la Grande Galerie", to = 37 },
            },
        },
        [35] = {
            text = "La Vénus sourit, elle, au moins. « Vous êtes un ange. Écoutez : l'autre nuit, j'ai entendu des marins crier dans la salle Mollien. Ils ramaient avec quelque chose de blanc, de lisse... de très élégant. »\n\nDes marins qui rament dans un musée ? Il n'y a qu'un tableau assez mouillé pour ça.",
            choices = {
                { text = "Partir vers la Grande Galerie", to = 37 },
            },
        },
        [36] = {
            text = "« La clé ? Prenez-la, je ne peux pas me lever. » La Vénus pèse environ neuf cents kilos de marbre de Paros. Elle a l'air très bien installée.\n\n« Évidemment, si j'avais mes bras, je me pousserais toute seule », ajoute-t-elle avec un soupir lourd de sous-entendus.",
            choices = {
                { text = "Lui rendre ses bras", to = 39, need = "bras", without = "cle", hide = true },
                { text = "Soulever la déesse", to = 38, without = "cle" },
                { text = "Partir vers la Grande Galerie", to = 37 },
            },
        },
        [37] = {
            text = "La Grande Galerie s'étire à perte de vue, bordée de Raphaël, de Titien et de Véronèse qui dorment sous leurs vernis. Au milieu, le Gladiateur Borghèse a quitté son socle pour faire des pompes.\n\n« Enfin quelqu'un ! Deux mille ans que je m'ennuie en position de combat ! » Au fond, la salle Mollien et ses grands tableaux.",
            choices = {
                { text = "Accepter le combat", to = 42, noflag = "gladiateur_ko", hide = true },
                { text = "Proposer un bras de fer", to = 43, noflag = "gladiateur_ko", hide = true },
                { text = "Aller à la salle Mollien", to = 46, flag = "gladiateur_ko", hide = true },
                { text = "Retourner voir la Vénus", to = 34 },
            },
        },
        [38] = {
            text = "Vous crachez dans vos mains, vous pliez les genoux comme on vous l'a appris au stage de sécurité, et vous poussez la déesse de toutes vos forces. Elle vacille un tout petit peu.",
            test = { stat = "skill", win = 40, lose = 41 },
        },
        [39] = {
            text = "Vous lui tendez ses bras. Clic, clac : ils se remettent en place comme des pièces de puzzle. La Vénus pousse un cri de joie, vous serre si fort que vos côtes chantent, puis se lève et vous donne la clé dorée.\n\n« Allez à la galerie d'Apollon ! Moi, je vais enfin me gratter le nez. Depuis deux mille ans que ça me démange ! »",
            gain = "cle",
            set = "piste",
            luck = 2,
            choices = {
                { text = "Courir à la galerie d'Apollon", to = 70 },
                { text = "Retourner au hall", to = 7 },
            },
        },
        [40] = {
            text = "Dans un dernier effort, vous faites pivoter la déesse d'un centimètre et vous attrapez la clé du bout des doigts. Victoire ! La Vénus est vexée : « On ne déplace pas une dame sans lui demander. »\n\nPeu importe. Vous avez la clé des vitrines. Et un lumbago naissant.",
            gain = "cle",
            set = "piste",
            choices = {
                { text = "Courir à la galerie d'Apollon", to = 70 },
                { text = "Entrer dans la Grande Galerie", to = 37 },
            },
        },
        [41] = {
            text = "Crac. Ce n'est pas la Vénus qui a bougé, c'est votre dos. Vous restez plié en deux pendant cinq bonnes minutes, à gémir comme un parquet ancien.\n\nLa Vénus compatit : « Je vous comprendrais bien, mais je ne peux même pas vous masser. »",
            stamina = -2,
            choices = {
                { text = "Entrer dans la Grande Galerie", to = 37 },
            },
        },
        [42] = {
            text = "Le Gladiateur Borghèse bondit dans sa pose la plus célèbre, le bras levé, le pied en avant. Il est rapide pour un bonhomme en marbre. Vous attrapez un cadre vide pour vous protéger.",
            fight = { name = "Gladiateur Borghèse", skill = 8, stamina = 7, win = 45 },
        },
        [43] = {
            text = "Le Gladiateur s'accoude sur une banquette. « Un bras de fer ? J'adore ! » Sa main est froide, dure, et grosse comme un rôti. Un, deux, trois... poussez !",
            test = { stat = "skill", win = 45, lose = 44 },
        },
        [44] = {
            text = "Votre bras se plie comme un spaghetti trop cuit. Le Gladiateur hurle de bonheur, fait trois tours d'honneur dans la galerie et vous tape dans le dos à vous décrocher les poumons.\n\n« Merci, ami ! Meilleure nuit depuis l'Empire romain. Passe donc, je retourne sur mon socle. »",
            stamina = -2,
            set = "gladiateur_ko",
            choices = {
                { text = "Aller à la salle Mollien", to = 46 },
            },
        },
        [45] = {
            text = "Le Gladiateur pose un genou à terre, essoufflé mais ravi. « Bien joué ! » Il vous serre la main à vous broyer les phalanges, puis remonte sur son socle et reprend la pose.\n\nVous soufflez un grand coup, et vous trouvez un bonbon à la menthe dans votre poche. Ça requinque.",
            set = "gladiateur_ko",
            stamina = 2,
            choices = {
                { text = "Aller à la salle Mollien", to = 46 },
            },
        },
        [46] = {
            text = "Salle Mollien. Sur l'immense Radeau de la Méduse de Géricault, les naufragés ont un regain d'énergie : ils rament ! Avec deux bras de marbre blanc. Les bras de la Vénus !\n\n« Ohé ! » crie un naufragé. « On a vu une lueur rose passer vers la galerie d'Apollon. Mais on meurt de faim, ici, depuis 1819. »",
            set = "piste",
            choices = {
                { text = "Échanger le croissant contre les bras", to = 47, need = "croissant", noflag = "bras_ok", hide = true },
                { text = "Racheter les bras (3 pièces)", to = 48, cost = 3, noflag = "bras_ok", hide = true },
                { text = "Plonger dans le tableau", to = 49, noflag = "bras_ok", hide = true },
                { text = "Retourner au hall", to = 7 },
            },
        },
        [47] = {
            text = "Vous tendez le croissant au beurre. Les naufragés s'arrachent les miettes en pleurant de joie. « Du beurre ! Du vrai beurre de Normandie ! » En échange, ils vous lancent les deux bras de marbre.\n\nLe plus vieux ajoute : « Le voleur avait une moustache, une carte en losange à la ceinture. Il trichait même à la courte paille, je l'ai vu ! »",
            lose = "croissant",
            gain = "bras",
            set = { "bras_ok", "temoin" },
            choices = {
                { text = "Rapporter les bras à la Vénus", to = 34 },
                { text = "Retourner au hall", to = 7 },
            },
        },
        [48] = {
            text = "Vous lancez trois pièces sur le radeau. Les naufragés les mordent pour vérifier qu'elles ne sont pas en chocolat, puis vous renvoient les bras de la Vénus. « Bon, on ramera avec nos mains. »\n\nLe plus vieux ajoute : « Le voleur avait une moustache et une carte en losange à la ceinture. Un tricheur, je vous dis ! »",
            gain = "bras",
            set = { "bras_ok", "temoin" },
            choices = {
                { text = "Rapporter les bras à la Vénus", to = 34 },
                { text = "Retourner au hall", to = 7 },
            },
        },
        [49] = {
            text = "Vous prenez votre élan et vous plongez dans le tableau. Splash ! L'eau peinte est glacée, les vagues sont énormes, et l'odeur de vieux marin vous saute au nez. Les bras de la Vénus flottent à deux mètres. Il faut nager vite.",
            test = { stat = "luck", win = 50, lose = 51 },
        },
        [50] = {
            text = "Vous attrapez les deux bras et vous ressortez du cadre d'un saut de dauphin, trempé de peinture à l'huile. Les naufragés applaudissent. « Bravo ! Le voleur, c'était un moustachu avec un as de carreau à la ceinture. Il trichait même à la courte paille ! »\n\nVous gouttez sur le parquet. Le gardien du matin va adorer.",
            gain = "bras",
            set = { "bras_ok", "temoin" },
            choices = {
                { text = "Rapporter les bras à la Vénus", to = 34 },
                { text = "Retourner au hall", to = 7 },
            },
        },
        [51] = {
            text = "Une vague peinte vous happe et vous dépose sur le radeau, entre deux naufragés qui vous tendent une rame. Le cadre se referme derrière vous.\n\nDepuis ce jour, les visiteurs remarquent sur le Radeau de la Méduse un petit personnage en gilet de stagiaire qui fait de grands signes. Les guides disent que c'est un repentir de Géricault.",
            ending = "death",
        },
        [52] = {
            text = "Vous grimpez par une trappe de service jusqu'au sommet de la Pyramide. Paris s'étale sous la lune : la tour Eiffel qui scintille, Notre-Dame, la butte Montmartre. Assis sur la pointe de verre, un monsieur en haut-de-forme et monocle vous salue de sa canne.\n\n« Arsène Lupin, gentleman cambrioleur. Belle nuit pour un vol, n'est-ce pas ? »",
            set = "fait_dehors",
            choices = {
                { text = "Discuter avec Lupin", to = 53 },
                { text = "L'accuser du vol", to = 54 },
                { text = "Glisser vers les Tuileries", to = 58 },
            },
        },
        [53] = {
            text = "« Voler un sourire ? Moi ? » Lupin rit. « Je vole les diamants, mon ami, pas les émotions. Et je ne laisse jamais de désordre derrière moi. Or, votre voleur a laissé un cadre vide aux peintures françaises. Le Tricheur de La Tour s'est fait la malle. »\n\nIl ajuste son monocle. « Je connais un chemin par les toits jusqu'à la galerie d'Apollon. Vous suivez ? »",
            set = { "cadre_vide", "lupin_ami" },
            choices = {
                { text = "Suivre Lupin sur les toits", to = 55 },
                { text = "Descendre aux Tuileries", to = 58 },
            },
        },
        [54] = {
            text = "« Moi ? Un vulgaire voleur de sourire ? » Lupin est profondément vexé. Il vous fait un croche-pied du bout de sa canne, s'incline très poliment et disparaît dans un nuage de fumée.\n\nVous glissez sur le verre de la Pyramide comme sur un toboggan géant, et vous atterrissez sur les fesses dans l'herbe des Tuileries.",
            stamina = -1,
            choices = {
                { text = "Se relever", to = 58 },
            },
        },
        [55] = {
            text = "Lupin court sur les toits du Louvre comme sur un trottoir. Vous le suivez, sautant d'une cheminée à une gouttière, au-dessus des cours et des statues. Un chat de gouttière vous regarde passer, très sceptique. Le dernier saut est large comme la Seine, ou presque.",
            test = { stat = "skill", win = 56, lose = 57 },
        },
        [56] = {
            text = "Vous atterrissez à côté de Lupin, devant une verrière. En dessous, la galerie d'Apollon brille comme une boîte à bijoux. Tout au fond, dans une vitrine, une petite lueur rose se tortille.\n\n« Le sourire », murmure Lupin. « Je vous laisse l'honneur. Moi, je ne touche jamais à ce qui n'a pas de carats. » Il déroule une corde de soie.",
            set = "piste",
            choices = {
                { text = "Descendre par la verrière", to = 74 },
                { text = "Redescendre au hall", to = 7 },
            },
        },
        [57] = {
            text = "Votre pied rate la gouttière. Vous dégringolez le long d'un toit d'ardoises, puis d'un autre, et vous atterrissez dans un massif de buis des Tuileries. Là-haut, Lupin soupire : « Le métier se perd ! »\n\nVous recrachez une feuille et vous vous relevez, un peu cabossé.",
            stamina = -2,
            choices = {
                { text = "Se relever", to = 58 },
            },
        },
        [58] = {
            text = "Le jardin des Tuileries, en pleine nuit. Les statues de Maillol dorment, le grand bassin reflète la lune. Soudain, un battement d'ailes : la bande des pigeons des Tuileries vous encercle. Leur chef, un gros gris nommé Gaston, roucoule d'un air menaçant.\n\n« Rrrou. Pas de miettes, pas de passage. »",
            choices = {
                { text = "Leur offrir le croissant", to = 59, need = "croissant" },
                { text = "Chasser les pigeons", to = 60 },
                { text = "Faire la statue sur un socle", to = 62 },
                { text = "Fuir vers la Seine", to = 65 },
            },
        },
        [59] = {
            text = "Le croissant disparaît dans un tourbillon de plumes. Gaston roucoule de bonheur. « Rrrou ! Du beurre ! Tu es des nôtres. »\n\nIl vous confie un secret : « On a vu un moustachu en pourpoint, avec une carte à la ceinture, voler par la fenêtre de la galerie d'Apollon. Il portait un sourire tout rose. Pas un pigeon, ça : un tricheur. »",
            lose = "croissant",
            set = { "temoin", "piste" },
            choices = {
                { text = "Longer la Seine", to = 65 },
                { text = "Retourner au hall", to = 7 },
                { text = "Foncer à la galerie d'Apollon", to = 70 },
            },
        },
        [60] = {
            text = "Les pigeons attaquent en formation, comme une escadrille. Ça roucoule, ça picore, ça vise votre tête. Vous faites des moulinets avec les bras.",
            fight = { enemies = {
                { name = "Pigeon maigrichon", skill = 5, stamina = 4 },
                { name = "Gaston, chef pigeon", skill = 6, stamina = 5 },
            }, win = 61 },
        },
        [61] = {
            text = "Gaston se pose sur un banc, les plumes en bataille. « Rrrou, ça va, ça va, on se rend. » En gage de paix, les pigeons vous font une haie d'honneur sur la rambarde.\n\n« On a vu un moustachu avec une carte à la ceinture entrer par la fenêtre de la galerie d'Apollon. Il portait un sourire tout rose. »",
            set = { "temoin", "piste" },
            choices = {
                { text = "Longer la Seine", to = 65 },
                { text = "Retourner au hall", to = 7 },
                { text = "Foncer à la galerie d'Apollon", to = 70 },
            },
        },
        [62] = {
            text = "Vous grimpez sur un socle vide et prenez une pose artistique, un bras en l'air, l'air inspiré. Les pigeons hésitent. Une statue, ça ne se picore pas. Ça se décore, par contre.\n\nVous ne bougez plus d'un cil. Combien de temps tiendrez-vous ?",
            roll = { dice = 1, outcomes = { { upto = 3, to = 63 }, { upto = 6, to = 64 } } },
        },
        [63] = {
            text = "Vous tenez si bien la pose que vous vous endormez debout. À l'aube, une critique d'art passe, s'arrête, s'extasie : « Quelle audace ! Quelle fragilité ! » Le lendemain, vous êtes exposé dans une galerie d'art contemporain sous le titre « Stagiaire immobile, technique mixte, pigeons ».\n\nVous valez désormais très cher. Mais vous n'avez plus le droit de vous gratter.",
            ending = "death",
        },
        [64] = {
            text = "Au bout de vingt minutes, les pigeons s'ennuient. Gaston bâille, grommelle « rrrou, c'est de l'art moderne, on n'y comprend rien » et emmène sa bande dormir sur le toit de l'Orangerie.\n\nVous descendez de votre socle, les jambes en coton, et filez vers la Seine.",
            choices = {
                { text = "Gagner la Seine", to = 65 },
            },
        },
        [65] = {
            text = "Sur le quai, la Seine glisse sous la passerelle Léopold-Sédar-Senghor. En face, la grande horloge du musée d'Orsay brille comme une lune ronde. Une péniche est amarrée en contrebas, une bonne odeur d'oignon s'en échappe.\n\nVous vous retournez : une fenêtre de la galerie d'Apollon jette une petite lueur rose. Le sourire est là-bas !",
            set = "piste",
            choices = {
                { text = "Traverser vers Orsay", to = 67 },
                { text = "Frapper à la péniche", to = 66 },
                { text = "Retourner au hall", to = 7 },
                { text = "Foncer à la galerie d'Apollon", to = 70 },
            },
        },
        [66] = {
            text = "Le marinier, un colosse à béret nommé Marcel, vous fait entrer. « Une nuit au Louvre ? Faut des forces ! » Il vous sert un grand bol de soupe à l'oignon gratinée, avec un fromage qui file jusqu'à Rouen.\n\nVous repartez réchauffé jusqu'aux orteils, une moustache de gruyère sous le nez.",
            stamina = 4,
            choices = {
                { text = "Traverser vers Orsay", to = 67 },
                { text = "Retourner au hall", to = 7 },
                { text = "Foncer à la galerie d'Apollon", to = 70 },
            },
        },
        [67] = {
            text = "Le musée d'Orsay était une gare, autrefois. Ce soir, il s'en souvient : un train fantôme de 1900 fume sous la grande horloge. Dans une salle voisine, un monsieur roux à la barbe en bataille sort de son autoportrait : Vincent van Gogh, un pinceau jaune à la main.\n\n« Vous cherchez à peindre un sourire ? J'en ai, des pinceaux. »",
            choices = {
                { text = "Demander un pinceau à Van Gogh", to = 68, without = "pinceau", hide = true },
                { text = "Monter dans le train fantôme", to = 69 },
                { text = "Retourner au Louvre", to = 7 },
                { text = "Foncer à la galerie d'Apollon", to = 70 },
            },
        },
        [68] = {
            text = "Vincent vous tend un pinceau encore taché de jaune tournesol. « Il a peint mes champs de blé. Il saura peindre un sourire. » Vous lui faites remarquer que c'est un pinceau de Léonard, d'après l'étiquette. Il hausse les épaules : « On se les prête, entre peintres. »\n\nVous rangez le précieux outil dans votre poche.",
            gain = "pinceau",
            choices = {
                { text = "Retourner au Louvre", to = 7 },
                { text = "Foncer à la galerie d'Apollon", to = 70 },
            },
        },
        [69] = {
            text = "Vous montez dans le train fantôme pour voir. Tchou ! Les portes claquent, la vapeur siffle, et le train file dans la nuit à toute vapeur. Vous vous réveillez à l'aube en gare d'Orléans, face à la statue de Jeanne d'Arc.\n\nElle a délivré la ville en 1429. Vous, vous avez raté le dernier retour pour Paris. La Joconde boudera encore une journée.",
            ending = "end",
        },
        [70] = {
            text = "Vous voici devant la galerie d'Apollon, juste à côté de la Victoire de Samothrace. Une lourde grille dorée la ferme, avec un cadenas gros comme un melon de Cavaillon. Derrière, dans la pénombre, scintillent les joyaux de la Couronne de France.\n\nEt tout au fond, une petite lueur rose qui rigole toute seule.",
            choices = {
                { text = "Ouvrir avec la clé des vitrines", to = 74, need = "cle" },
                { text = "Chercher un autre passage", to = 71 },
                { text = "Forcer la grille", to = 72 },
                { text = "Retourner au hall", to = 7 },
            },
        },
        [71] = {
            text = "Vous faites le tour de la grille en réfléchissant. Une fenêtre, en hauteur, est entrouverte. Le mur est épais, mais un fantôme passerait au travers sans problème. Et un gentleman cambrioleur saurait sûrement passer par les toits.\n\nQui pourrait vous aider ?",
            choices = {
                { text = "Appeler Belphégor", to = 74, flag = "belphegor_ami", hide = true },
                { text = "Siffler pour appeler Lupin", to = 74, flag = "lupin_ami", hide = true },
                { text = "Grimper avec la bandelette", to = 74, need = "bandelette", hide = true },
                { text = "Revenir à la grille", to = 70 },
            },
        },
        [72] = {
            text = "Vous attrapez les barreaux et secouez la grille de toutes vos forces, en visant le vieux cadenas. Il grince, il couine. Pourvu que l'alarme ne se déclenche pas.",
            test = { stat = "skill", win = 74, lose = 73 },
        },
        [73] = {
            text = "DRIIING ! L'alarme hurle. Un rideau de fer tombe à un cheveu de votre nez, et une escouade de robots aspirateurs vous poursuit dans trois salles avant de se cogner contre un sarcophage.\n\nQuand le calme revient, vous êtes essoufflé, couvert de poussière, et la grille est toujours fermée. Mais le rideau de fer est déjà remonté. Ces alarmes sont bien capricieuses.",
            stamina = -2,
            choices = {
                { text = "Retourner à la grille", to = 70 },
                { text = "Retourner au hall", to = 7 },
            },
        },
        [74] = {
            text = "La galerie d'Apollon ! Au plafond, Delacroix a peint Apollon terrassant le serpent Python. Dans les vitrines dorment la couronne de Louis XV, celle de l'impératrice Eugénie et le Régent, un diamant gros comme un œuf de caille.\n\nÀ côté du Régent, dans une vitrine, le sourire de la Joconde se tortille comme un poisson rouge, ravi de ses vacances.",
            choices = {
                { text = "Ouvrir la vitrine avec la clé", to = 79, need = "cle" },
                { text = "Soulever le couvercle à la main", to = 75 },
                { text = "Parler au diamant Régent", to = 78 },
            },
        },
        [75] = {
            text = "Le couvercle de la vitrine est lourd et plein de petits capteurs. Vous glissez vos doigts dessous, vous soulevez millimètre par millimètre, sans trembler. Surtout, ne pas trembler.",
            test = { stat = "skill", win = 79, lose = 76 },
        },
        [76] = {
            text = "Vos doigts glissent ! Vous basculez tête la première dans la vitrine, et le couvercle se referme sur vous avec un clic définitif. Vous voilà allongé entre deux broches et un collier, le sourire chatouillant votre nez.\n\nIl reste une petite chance : tâter le fond pour trouver le loquet.",
            test = { stat = "luck", win = 79, lose = 77 },
        },
        [77] = {
            text = "Pas de loquet. À neuf heures, les premiers visiteurs entrent et se pressent devant la vitrine. « Oh ! Un stagiaire du XXIe siècle, en parfait état de conservation ! » Un conservateur colle une étiquette sur le verre.\n\nVous passez la saison dans la galerie d'Apollon, entre la couronne de Louis XV et une broche de l'impératrice. Au moins, vous avez une belle vue sur le plafond.",
            ending = "death",
        },
        [78] = {
            text = "Le Régent, cent quarante carats, toise tout le monde du haut de sa vitrine. « Vous voulez le petit sourire ? Il est très drôle, il me fait rire toute la nuit. » Il scintille. « Je veux bien ouvrir la vitrine de l'intérieur. Mais il me faut un petit polissage, ou un vrai compliment d'artiste. »",
            choices = {
                { text = "Payer un polissage (2 pièces)", to = 79, cost = 2 },
                { text = "Lui citer un compliment de Léonard", to = 79, flag = "vinci" },
                { text = "Revenir à la vitrine", to = 74 },
            },
        },
        [79] = {
            text = "La vitrine s'ouvre. Le sourire de la Joconde saute dans vos mains, chaud et doux comme un petit pain. Il gigote, il glousse, puis il se calme et attend sagement.\n\nVous le glissez délicatement dans la poche de votre gilet. Au passage, une odeur de vernis vous chatouille le nez, et vous vous sentez requinqué par la réussite.",
            gain = "sourire",
            stamina = 2,
            choices = {
                { text = "Retourner voir la Joconde", to = 80 },
            },
        },
        [80] = {
            text = "Sur le chemin de la salle des États, une silhouette vous barre la route. M. Carreau, votre chef, lisse sa moustache qui penche de plus en plus. Une carte dépasse de sa ceinture : un as de carreau.\n\n« Bravo, stagiaire ! Donnez-moi le sourire, je vais le remettre moi-même. C'est une affaire de chef, ça. » Derrière lui, l'Aspiro Turbo ronronne d'un air mauvais.",
            choices = {
                { text = "Lui confier le sourire", to = 81 },
                { text = "Refuser poliment", to = 82 },
                { text = "Démasquer le tricheur", to = 84, flag = { "cadre_vide", "temoin" }, hide = true },
            },
        },
        [81] = {
            text = "Vous lui tendez le sourire. M. Carreau ricane, arrache sa moustache, et vous reconnaissez le Tricheur à l'as de carreau ! D'un bond, il replonge dans son tableau, salle des peintures françaises, le sourire collé sous le nez.\n\nDepuis, c'est lui qui sourit au Louvre, et la Joconde boude. Les touristes trouvent qu'elle a l'air plus mystérieuse que jamais. Vous, vous êtes renvoyé au service vestiaire.",
            ending = "end",
        },
        [82] = {
            text = "« Comme vous voudrez », grince M. Carreau. Il claque des doigts : l'Aspiro Turbo fonce sur vous, et le chef lui-même retrousse ses manches en battant les cartes comme des couteaux de cuisine. Il faudra vous battre pour garder ce sourire.",
            fight = { enemies = {
                { name = "Aspiro Turbo", skill = 7, stamina = 6 },
                { name = "M. Carreau", skill = 8, stamina = 7 },
            }, win = 83 },
        },
        [83] = {
            text = "L'Aspiro Turbo s'aspire lui-même et M. Carreau s'enfuit dans la nuit en semant ses cartes partout, poursuivi par les jurons des momies. Vous ne saurez jamais vraiment qui il était.\n\nVous ramassez une barre de céréales tombée de sa poche. Bonne prise. Il reste à rendre le sourire à sa propriétaire.",
            stamina = 3,
            choices = {
                { text = "Courir à la salle des États", to = 86 },
            },
        },
        [84] = {
            text = "« Le cadre vide aux peintures françaises, les témoins, la carte à la ceinture... Vous n'êtes pas M. Carreau. Vous êtes le Tricheur à l'as de carreau ! »\n\nLe faux chef blêmit, sa moustache tombe sur le parquet. Il sort de sa manche une pluie d'as de carreau, tranchants comme des rasoirs de papier. « Personne ne démasque Georges de La Tour ! Enfin, son tricheur ! »",
            fight = { name = "Le Tricheur", skill = 9, stamina = 6, win = 85 },
        },
        [85] = {
            text = "Le Tricheur s'écroule, ses cartes en vrac. Vous le raccompagnez par l'oreille jusqu'à son tableau, où la dame au turban et la servante le grondent comme un garnement. « Encore toi ! » Il reprend la pose, l'air penaud, un as caché dans le dos comme toujours.\n\nLe vrai M. Carreau, lui, est retrouvé ligoté dans un placard à balais, ravi d'être libéré.",
            set = "demasque",
            stamina = 3,
            choices = {
                { text = "Courir à la salle des États", to = 87 },
            },
        },
        [86] = {
            text = "Salle des États. La Joconde vous regarde arriver, toujours boudeuse. Vous sortez le sourire de votre poche. Il se met à frétiller en reconnaissant son visage. Le portrait de Léonard se penche hors de son cadre : « Délicatement, surtout ! »\n\nIl faut le remettre bien en place, au millimètre près.",
            choices = {
                { text = "Le peindre en place au pinceau", to = 88, need = "pinceau" },
                { text = "Le recoller à la va-vite", to = 89, without = "pinceau" },
            },
        },
        [87] = {
            text = "Salle des États. Toute la nuit du Louvre est venue voir : la Vénus et ses bras, la Victoire et ses ailes, le Scribe avec son papyrus, Belphégor qui flotte, et même Lupin sur une corniche. La Joconde attend, boudeuse.\n\nLe sourire frétille dans votre main. Léonard chuchote : « À vous, maestro ! »",
            choices = {
                { text = "Le peindre en place au pinceau", to = 90, need = "pinceau" },
                { text = "Le recoller à la va-vite", to = 89, without = "pinceau" },
            },
        },
        [88] = {
            text = "D'un coup de pinceau léger, vous remettez le sourire au coin des lèvres de Mona Lisa. Elle s'illumine. Le sourire le plus célèbre du monde est de retour, un tout petit peu plus malicieux qu'avant.\n\nÀ neuf heures, les touristes se pressent comme si de rien n'était. M. Carreau, introuvable, vous a laissé un mot : « Bien joué. » Vous êtes engagé. Le sourire, c'est vous qui l'avez.",
            ending = "win",
        },
        [89] = {
            text = "Faute de pinceau, vous recollez le sourire avec un vieux chewing-gum trouvé sous une banquette. Il tient. Enfin, presque. La Joconde sourit, mais de travers, un coin vers le haut et l'autre vers le bas.\n\nLes experts du monde entier débattent depuis : est-elle ironique ? Moqueuse ? Elle a juste mal au chewing-gum. Le Louvre vous garde, mais à la cafétéria.",
            ending = "end",
        },
        [90] = {
            text = "D'un coup de pinceau parfait, vous rendez son sourire à Mona Lisa. Elle rayonne, et toute la salle applaudit. Lupin vous lance une rose depuis sa corniche, Belphégor pleure de joie, la Vénus vous fait un câlin avec ses bras tout neufs.\n\nÀ neuf heures, le vrai M. Carreau vous décore de la médaille du meilleur stagiaire de l'histoire du Louvre. Et la Joconde, pour la première fois depuis 1503, vous fait un clin d'œil.",
            ending = "win",
        },
    },
}
