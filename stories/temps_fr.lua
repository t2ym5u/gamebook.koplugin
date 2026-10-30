return {
    title       = "Le Stagiaire du Temps",
    author      = "Gamebook",
    lang        = "fr",
    blurb       = "Vous avez cassé la machine à voyager dans le temps du patron. Napoléon roule en trottinette. Réparez tout !",
    sheet       = true,
    start       = 1,
    start_gold  = 5,
    start_items = { "tournevis" },
    items = {
        tournevis = "Tournevis du maître",
        perche    = "Perche à selfie",
        loupe     = "Loupe d'horloger",
        camembert = "Camembert bien fait",
        ressort   = "Ressort temporel",
        cadran    = "Cadran solaire de poche",
        balancier = "Balancier de cristal",
        engrenage = "Engrenage d'or",
        toge      = "Toge de sénateur",
        laissez   = "Laissez-passer royal",
        joconde   = "La Joconde (roulée)",
        croquis   = "Croquis de Léonard",
    },
    sections = {
        [1] = {
            text = "Paris, quai de l'Horloge. Premier jour de stage chez Maître Anatole Trotteuse, horloger de génie et distrait de compétition. Ce matin, il a mis ses lunettes dans le frigo et son camembert dans sa poche.\n\nÀ midi pile, il part déjeuner : « Deux heures, c'est sacré. Surtout, ne touchez pas au Chronoscaphe ! » Le Chronoscaphe, c'est cette grande horloge comtoise qui ronronne au fond de l'atelier. Elle voyage dans le temps. Évidemment.",
            choices = {
                { text = "Épousseter le Chronoscaphe", to = 2 },
                { text = "Fouiller l'établi du maître", to = 3 },
                { text = "Goûter le camembert oublié", to = 4 },
            },
        },
        [2] = {
            text = "Armé d'un plumeau, vous chatouillez le Chronoscaphe. Derrière le balancier, vous trouvez une perche à selfie, sans doute oubliée par un touriste du futur. Vous la glissez dans votre sac, on ne sait jamais.\n\nLa poussière vous monte au nez. Vous éternuez. Votre coude heurte un gros levier rouge marqué « NE PAS TIRER ». Le levier, lui, n'a pas lu l'étiquette : il descend tout seul.",
            gain = "perche",
            choices = {
                { text = "Fermer les yeux très fort", to = 5 },
            },
        },
        [3] = {
            text = "L'établi déborde de rouages, de vis minuscules et de factures impayées. Vous dénichez une belle loupe d'horloger et trois pièces dans une boîte à biscuits marquée « Caisse noire ». Vous les empochez, c'est pour la bonne cause.\n\nEn reculant, vous trébuchez sur un câble. Le câble est relié au Chronoscaphe. Le Chronoscaphe se met à siffler comme une cocotte-minute un dimanche de pot-au-feu.",
            gain = "loupe",
            gold = 3,
            choices = {
                { text = "Débrancher le câble en vitesse", to = 5 },
            },
        },
        [4] = {
            text = "Le camembert du maître est parfait : coulant, crémeux, normand jusqu'au bout de la croûte. Vous en mangez un petit bout, puis vous emballez le reste avec respect. Ça peut servir, un camembert, l'Histoire l'a prouvé.\n\nL'odeur, hélas, atteint le Chronoscaphe. Ses aiguilles s'affolent. Il paraît que les machines délicates ne supportent pas les fromages de caractère.",
            gain = "camembert",
            stamina = 2,
            choices = {
                { text = "Reculer prudemment", to = 5 },
            },
        },
        [5] = {
            text = "BOUM ! Le Chronoscaphe explose dans un nuage d'étincelles. Quatre pièces s'envolent par des trous lumineux : le ressort, le cadran, le balancier et l'engrenage d'or. Seule reste la chronomontre de secours, accrochée à votre poignet.\n\nLa radio grésille : « Napoléon arrive à Waterloo en trottinette ! La Joconde a disparu du Louvre ! » Sur le tableau, un mot du maître : « En cas de pépin, voir Einstein. Berne, 1905. »",
            choices = {
                { text = "Régler la montre sur Berne, 1905", to = 6 },
                { text = "Tourner la molette au hasard", to = 7 },
            },
        },
        [6] = {
            text = "Berne, 1905. Des arcades, des fontaines, des ours et un parfum de fromage fondu. Au bout de la Kramgasse, la tour de l'horloge, la Zytglogge, fait n'importe quoi : ses aiguilles tournent à l'envers et les tramways reculent.\n\nUn passant vous indique l'Office des brevets, où travaille un jeune employé ébouriffé qui « réfléchit beaucoup trop ». Dans une ruelle, une fromagerie propose la fondue du jour.",
            choices = {
                { text = "Aller à l'Office des brevets", to = 11 },
                { text = "Grimper dans la Zytglogge", to = 12 },
                { text = "Manger une fondue (2 pièces)", to = 13, cost = 2 },
            },
        },
        [7] = {
            text = "Vous tournez la molette comme on gratte un ticket de loterie. La chronomontre hoquette, clignote et vous aspire dans un tourbillon qui sent le métro aux heures de pointe. Où allez-vous atterrir ? Même la montre semble l'ignorer, et elle affiche « Bonne chance » en lettres clignotantes.",
            roll = { dice = 1, outcomes = {
                { upto = 2, to = 8 },
                { upto = 4, to = 9 },
                { upto = 6, to = 6 },
            } },
        },
        [8] = {
            text = "Lutèce, cinquante ans avant notre ère. Vous tombez dans une barque de pêcheurs parisii, au beau milieu de la Seine. Pas de tour Eiffel, pas de bouchons, seulement des joncs et des canards.\n\nLes pêcheurs vous prennent pour un devin. Vous leur prédisez « des embouteillages terribles sur le périphérique ». Impressionnés, ils vous offrent une galette et un poisson grillé. Vous réglez la montre, cette fois avec soin.",
            stamina = 1,
            choices = {
                { text = "Sauter vers Berne, 1905", to = 6 },
            },
        },
        [9] = {
            text = "Lascaux, il y a dix-sept mille ans. Dans une grotte éclairée à la torche, des artistes peignent des aurochs. Vous ajoutez discrètement une petite trottinette sur la paroi : les archéologues vont adorer.\n\nOn vous offre un bol de ragoût de mammouth, étonnamment bon. Dehors, un énorme chat à dents de sabre ronronne au soleil. Il a l'air tout doux. Il a aussi l'air d'avoir faim.",
            stamina = 2,
            choices = {
                { text = "Sauter vers Berne, 1905", to = 6 },
                { text = "Caresser le gros minou", to = 10 },
            },
        },
        [10] = {
            text = "Le smilodon adore les caresses. Tellement qu'il vous attrape délicatement entre ses pattes, vous lèche de la tête aux pieds et décide que vous êtes son nouveau coussin préféré.\n\nVous passez le reste de votre vie à servir d'oreiller à un fauve préhistorique. Ce n'est pas désagréable, mais l'Histoire, elle, continue de partir en vrille. Dans dix-sept mille ans, Napoléon roulera toujours en trottinette.",
            ending = "death",
        },
        [11] = {
            text = "À l'Office fédéral des brevets, un jeune homme aux cheveux en pétard griffonne des équations au dos d'une demande de brevet pour un moulin à café. C'est Albert Einstein.\n\n« Ach, un visiteur ! Je cherche une formule qui relierait l'énergie et la masse. J'ai essayé E = mc³, E = mc… rien ne colle. » Il soupire en regardant la tour de l'horloge qui recule par la fenêtre.",
            choices = {
                { text = "Lui souffler « E = mc² »", to = 14 },
                { text = "Lui parler du Chronoscaphe", to = 15 },
            },
        },
        [12] = {
            text = "Vous montez les marches de la Zytglogge. Tout en haut, l'immense mécanisme grince et tourne à l'envers. Les automates s'agitent : le coq chante à rebours, les petits ours défilent en marche arrière, le bouffon sonne des heures qui n'existent pas.\n\nCoincé entre deux roues dentées, vous apercevez un ressort qui brille d'une lumière bleue. Votre ressort temporel !",
            choices = {
                { text = "Grimper dans les rouages", to = 19 },
                { text = "Examiner le mécanisme à la loupe", to = 17, need = "loupe" },
            },
        },
        [13] = {
            text = "La fromagère bernoise vous sert une fondue moitié-moitié, gruyère et vacherin, avec du pain et un petit verre de thé. Vous perdez votre croûton dans le caquelon, ce qui vous vaut, selon la tradition, de chanter une chanson. Vous chantez « Frère Jacques ».\n\nRassasiée, la fromagère vous confie : « La tour recule depuis ce matin. Et le petit Einstein, à l'Office des brevets, n'arrête pas de dire que le temps est relatif. »",
            stamina = 4,
            choices = {
                { text = "Aller voir Einstein", to = 11 },
                { text = "Grimper dans la Zytglogge", to = 12 },
            },
        },
        [14] = {
            text = "« E = mc²… » Einstein écrit, rature, vérifie, puis bondit sur sa chaise. « Mais c'est exactement ce que j'allais trouver ! Dans dix minutes, environ ! »\n\nIl vous serre la main avec un enthousiasme relatif, mais réel. « Vous, vous venez du futur. Cette formule, gardez-la en tête : elle vous servira à calibrer votre machine. Une machine temporelle mal réglée, c'est comme une montre suisse remontée un lundi matin : ça marche, mais de travers. »",
            set = "formule",
            choices = {
                { text = "Écouter ses conseils", to = 16 },
            },
        },
        [15] = {
            text = "Vous racontez tout : le stage, le levier rouge, l'explosion, la radio. Einstein écoute en tirant sur sa moustache.\n\n« Fascinant. Quand une machine temporelle se brise, ses pièces attirent le chaos comme le miel attire les ours de Berne. Suivez les catastrophes historiques et vous trouverez vos pièces. » Il vous tend un mouchoir, car vous transpirez. C'est relatif, mais il fait chaud.",
            choices = {
                { text = "Écouter la suite", to = 16 },
            },
        },
        [16] = {
            text = "« Le ressort est sûrement dans notre horloge, puisqu'elle recule depuis ce matin, explique Einstein. Avec lui, votre montre pourra viser des époques précises. Ensuite, il faudra quelqu'un de génial pour remonter la machine. Pas moi, je suis nul en bricolage. Léonard de Vinci, peut-être ? Il a fini ses jours à Amboise, au Clos Lucé. »\n\nIl retourne à ses brevets en sifflotant.",
            choices = {
                { text = "Foncer à la Zytglogge", to = 12, without = "ressort", hide = true },
                { text = "Activer la chronomontre", to = 20, need = "ressort", hide = true },
            },
        },
        [17] = {
            text = "Vous repérez la petite vis qui retient le ressort, vous la dévissez d'un geste digne de votre maître, et hop : le ressort temporel saute dans votre main, tout chaud.\n\nAussitôt, la Zytglogge repart dans le bon sens. Le coq chante enfin à l'endroit, les ours reprennent leur parade et, en bas, les tramways cessent de reculer sous les applaudissements des Bernois. Vous fixez le ressort à votre chronomontre : elle ronronne de plaisir.",
            gain = "ressort",
            choices = {
                { text = "Passer voir Einstein", to = 11 },
                { text = "Activer la chronomontre", to = 20 },
            },
        },
        [18] = {
            text = "Une roue dentée vous happe par le fond du pantalon. Vous voilà entraîné dans la parade des automates, coincé entre un ours en bois et le bouffon à clochettes. Sur la place, les touristes vous photographient au daguerréotype en applaudissant.\n\nAprès trois tours complets, vous parvenez à vous dégager, un peu étourdi et avec un bleu de la taille d'un écu.",
            stamina = -2,
            choices = {
                { text = "Retenter l'escalade", to = 19 },
                { text = "Dévisser le ressort au tournevis", to = 17, need = "tournevis" },
            },
        },
        [19] = {
            text = "Vous enjambez les roues dentées, vous vous faufilez sous le grand balancier et vous tendez le bras vers le ressort lumineux. Les rouages tournent vite, très vite, et toujours dans le mauvais sens. Il faut de l'adresse, et un peu de sang-froid d'horloger.",
            test = { stat = "skill", win = 17, lose = 18 },
        },
        [20] = {
            text = "Le ressort ronronne dans la chronomontre. Le cadran affiche des époques comme un menu de brasserie. La radio, que vous entendez toujours dans votre tête, continue ses flashs : « Cléopâtre réclame un selfie avec le Sphinx ! Rome revit les Ides de mars en boucle ! Les fontaines de Versailles coulent à l'envers ! »\n\nChaque pièce manquante sème le chaos quelque part. Où voulez-vous sauter ?",
            choices = {
                { text = "Sauter en Égypte, chez Cléopâtre", to = 21, noflag = "fait_egypte", hide = true },
                { text = "Sauter à Rome, aux Ides de mars", to = 40, noflag = "fait_rome", hide = true },
                { text = "Sauter à Versailles, chez Louis XIV", to = 60, noflag = "fait_versailles", hide = true },
                { text = "Rejoindre Léonard à Amboise", to = 80, need = { "cadran", "balancier", "engrenage" }, hide = true },
            },
        },
        [21] = {
            text = "Égypte, an 47 avant notre ère. Vous atterrissez dans le Nil avec un gros plouf. L'eau est tiède, les papyrus chatouillent, et deux yeux jaunes vous observent juste au-dessus de la surface.\n\nÀ quelques brasses, une felouque glisse paisiblement, voile blanche gonflée. Sur la rive, au loin, les pyramides de Gizeh se découpent dans la brume, et le Sphinx semble… bouger la queue.",
            choices = {
                { text = "Nager vers la rive", to = 22 },
                { text = "Faire signe à la felouque", to = 23 },
            },
        },
        [22] = {
            text = "Les deux yeux jaunes appartiennent à un crocodile du Nil, long comme un autobus et visiblement de mauvaise humeur. Il ouvre une gueule où vous pourriez garer une trottinette. Il n'y a plus qu'à lui montrer qui est le stagiaire ici.",
            fight = { name = "Crocodile du Nil", skill = 6, stamina = 6, win = 24, flee = 23 },
        },
        [23] = {
            text = "Le passeur de la felouque vous hisse à bord en riant : « Encore un touriste tombé du ciel ! C'est la troisième fois cette semaine. » Il remonte le fleuve vers Alexandrie, où la reine Cléopâtre tient sa cour, ou vers Gizeh, selon votre bourse.\n\nIl désigne aussi un grand bâtiment au bord de l'eau : la fameuse bibliothèque d'Alexandrie.",
            choices = {
                { text = "Payer le passage (2 pièces)", to = 25, cost = 2 },
                { text = "Ramer vous-même", to = 27 },
                { text = "Débarquer à la bibliothèque", to = 26 },
            },
        },
        [24] = {
            text = "Vaincu, le crocodile recrache un scarabée d'or, une sandale et un parapluie avant de filer bouder dans les roseaux. Vous gagnez la rive, trempé mais fier.\n\nDevant vous se dressent les pyramides de Gizeh. Khéops brille au soleil, si haute qu'on doit voir tout le pays depuis le sommet. Plus loin, le Sphinx, bien vivant à cause du chaos, bâille d'ennui en attendant quelqu'un.",
            choices = {
                { text = "Aller voir le Sphinx", to = 30 },
                { text = "Escalader la pyramide de Khéops", to = 29 },
            },
        },
        [25] = {
            text = "Au palais d'Alexandrie, Cléopâtre se prélasse sur un divan, un chat sur les genoux et le maquillage impeccable. « Un voyageur du futur ! On m'a dit que dans ton époque, on capture son visage avec une boîte magique tendue au bout d'un bâton. Je veux un portrait avec le Sphinx. Tout de suite. »\n\nLes gardes vous observent, la main sur leur lance.",
            choices = {
                { text = "Lui offrir la perche à selfie", to = 31, need = "perche" },
                { text = "Lui offrir le camembert", to = 32, need = "camembert" },
                { text = "Proposer de dessiner son portrait", to = 33 },
            },
        },
        [26] = {
            text = "La bibliothèque d'Alexandrie ! Des milliers de rouleaux de papyrus, des savants en sandales et un silence de cathédrale. Un vieux scribe vous montre un rouleau intitulé « Devinettes pour Sphinx, niveau expert ».\n\n« Le Sphinx est imbattable aux énigmes, mais il ne supporte pas qu'on lui en pose une. Retiens celle-ci. » Il vous la chuchote. Vous gloussez. Puis il vous indique le palais de la reine, juste à côté.",
            set = "enigme",
            choices = {
                { text = "Se rendre au palais royal", to = 25 },
            },
        },
        [27] = {
            text = "Vous empoignez les rames. Le passeur s'allonge à l'ombre de la voile, ravi, et vous encourage avec des « Hop ! Hop ! » très motivants. Le Nil est long, très long. C'est même le plus long fleuve du monde, ou presque, et vous le sentez dans chaque muscle.",
            test = { stat = "stamina", win = 25, lose = 28 },
        },
        [28] = {
            text = "Épuisé, vous lâchez les rames. La felouque dérive, tourne sur elle-même et finit par s'échouer sur la rive de Gizeh, devant le Sphinx. Le passeur vous réveille en vous versant de l'eau du Nil sur la tête.\n\n« Terminus, tout le monde descend ! » Vous avez des ampoules partout, mais au moins vous êtes arrivé quelque part.",
            stamina = -2,
            choices = {
                { text = "S'approcher du Sphinx", to = 30 },
            },
        },
        [29] = {
            text = "La pyramide de Khéops est un escalier de géant : chaque bloc vous arrive à la taille. Le soleil tape, le sable glisse, et un dromadaire vous regarde d'en bas avec un air moqueur. Plus que cent cinquante mètres. Facile.",
            test = { stat = "skill", win = 35, lose = 36 },
        },
        [30] = {
            text = "Le Sphinx est immense, et franchement bavard. Entre ses pattes de lion brille un petit cadran solaire : votre cadran ! « Personne ne passe sans résoudre mon énigme, gronde-t-il. Qu'est-ce qui marche à quatre pattes le matin, à deux pattes à midi et à trois pattes le soir ? »\n\nIl se lèche une patte en attendant, l'air très sûr de lui.",
            choices = {
                { text = "Répondre « L'homme »", to = 37 },
                { text = "Répondre « Un stagiaire »", to = 38 },
                { text = "Faire le selfie avec Cléopâtre", to = 39, flag = "amie_cleo" },
                { text = "Lui poser une énigme à votre tour", to = 34, flag = "enigme" },
            },
        },
        [31] = {
            text = "Cléopâtre saisit la perche à selfie comme un sceptre. Elle tend le bras, prend la pose, essaie son meilleur profil, puis l'autre. « Merveilleux ! Mon nez paraît parfait ! » Elle vous offre une place dans son char.\n\nEn route pour Gizeh, escortée de vingt servantes et d'un chameau qui porte les coussins. La reine veut absolument le Sphinx en arrière-plan.",
            set = "amie_cleo",
            choices = {
                { text = "Accompagner la reine au Sphinx", to = 30 },
            },
        },
        [32] = {
            text = "Cléopâtre renifle le camembert, recule, puis éclate de rire. « Cela sent comme une momie de trois mille ans ! » Elle goûte quand même, par curiosité royale… et en redemande. « Divin. Je le ferai servir à Jules César, il me trouvera encore plus fascinante. »\n\nElle vous fait conduire à Gizeh, où le Sphinx garde, paraît-il, un étrange objet qui fait tic-tac.",
            lose = "camembert",
            choices = {
                { text = "Filer à Gizeh", to = 30 },
            },
        },
        [33] = {
            text = "Vous dessinez la reine avec application. Hélas, vous n'êtes pas Léonard de Vinci. Le résultat ressemble à une patate avec une couronne. Cléopâtre fronce ses sourcils parfaitement tracés.\n\n« Aux crocodiles ! » Deux gardes vous soulèvent par les bras et vous jettent dans le Nil, juste devant un museau plein de dents que vous avez l'impression de connaître.",
            choices = {
                { text = "Se défendre", to = 22 },
            },
        },
        [34] = {
            text = "« Qu'est-ce qui est jaune et qui attend ? » demandez-vous. Le Sphinx réfléchit. Une heure. Deux heures. De la fumée sort de ses oreilles de pierre. « Je… je donne ma langue au chat. » Vous répondez : « Jonathan. » Il ne comprend pas, mais il est trop fier pour l'avouer.\n\nVaincu, il vous tend le cadran solaire, puis se rendort en boudant. L'Égypte retrouve son calme.",
            choices = {
                { text = "Activer la chronomontre", to = 58 },
            },
        },
        [35] = {
            text = "Au sommet de Khéops, le vent vous ébouriffe. Vous voyez le Nil serpenter, les champs verts, le désert doré et, en bas, le Sphinx qui tient un objet scintillant entre ses pattes : sans aucun doute votre cadran.\n\nUn vieux prêtre, monté avant vous pour prier le soleil, vous bénit au passage. Vous vous sentez soudain très chanceux. La descente, par contre, se fait sur les fesses.",
            luck = 1,
            choices = {
                { text = "Descendre vers le Sphinx", to = 30 },
            },
        },
        [36] = {
            text = "Un bloc s'effrite sous votre pied. Vous dévalez la pyramide comme un toboggan géant, bloc après bloc, jusqu'à atterrir dans le sable, aux pieds du dromadaire qui ricane franchement.\n\nVous vous relevez couvert de bleus. Au moins, vous êtes en bas, et le Sphinx n'est plus qu'à quelques pas.",
            stamina = -3,
            choices = {
                { text = "Boitiller jusqu'au Sphinx", to = 30 },
            },
        },
        [37] = {
            text = "« L'homme ! Il marche à quatre pattes bébé, à deux pattes adulte et avec une canne quand il est vieux. » Le Sphinx est vexé, mais beau joueur. Il éternue de dépit… et son nez tombe dans le sable. Voilà au moins un mystère d'élucidé.\n\nIl vous tend le cadran solaire, encore tiède. Aussitôt, le désert se calme et les crocodiles retournent à leur sieste.",
            choices = {
                { text = "Activer la chronomontre", to = 58 },
            },
        },
        [38] = {
            text = "« Un stagiaire ? » Le Sphinx réfléchit, puis rugit : « Mauvaise réponse ! Quoique… à quatre pattes le matin pour chercher le café, à deux pattes à midi, à trois pattes le soir à cause de la fatigue… Non, c'est faux quand même. »\n\nIl vous change en pierre et vous colle au milieu de son visage. Vous êtes désormais le nez du Sphinx. Dans quelques siècles, vous tomberez. Personne ne saura jamais pourquoi.",
            ending = "death",
        },
        [39] = {
            text = "Cléopâtre se place devant le Sphinx, tend la perche et lance : « Souriez ! » Le Sphinx, flatté d'être photographié avec une reine, prend la pose, une patte sous le menton. Clic ! L'image est parfaite.\n\nPour vous remercier, le Sphinx vous remet le cadran solaire, et Cléopâtre vous pince la joue. « Reviens quand tu veux, petit stagiaire. Et rapporte-moi de ton fromage qui pue. »",
            choices = {
                { text = "Activer la chronomontre", to = 58 },
            },
        },
        [40] = {
            text = "Rome, 15 mars 44 avant notre ère. Encore. Depuis que le balancier est tombé ici, la ville revit la même journée en boucle. Les marchands du Forum soupirent, les sénateurs bâillent, et un devin crie « Méfie-toi des Ides de mars ! » pour la trois-centième fois.\n\nAu loin, du côté du théâtre de Pompée, vous entendez un tic-tac cristallin.",
            choices = {
                { text = "Suivre le tic-tac", to = 41 },
                { text = "Aller aux thermes", to = 42 },
                { text = "Acheter une toge (2 pièces)", to = 43, cost = 2 },
                { text = "Écouter le devin", to = 51 },
            },
        },
        [41] = {
            text = "Un légionnaire romain vous barre la route, casque à plumet et bouclier bien astiqué. « Halte, barbare en pantalon ! Personne ne passe sans laissez-passer signé par César. Et César signe ses papiers demain. Mais demain n'arrive jamais. »\n\nIl soupire, puis pointe son glaive vers vous. Visiblement, la boucle temporelle l'a rendu un peu nerveux.",
            choices = {
                { text = "Le combattre", to = 44 },
                { text = "Lui offrir le camembert", to = 45, need = "camembert" },
                { text = "Prétendre être un Gaulois de Lutèce", to = 46 },
            },
        },
        [42] = {
            text = "Aux thermes de Rome, vous barbotez dans un bassin d'eau chaude, entre deux sénateurs qui chuchotent. « Brutus est prêt… Cassius aussi… mais c'est la trois-centième fois qu'on recommence et César ne se doute toujours de rien. »\n\nVous voilà au courant d'un complot célèbre. Un esclave vous masse les épaules et vous repartez requinqué vers le théâtre de Pompée, où le Sénat se réunit.",
            stamina = 4,
            set = "complot",
            choices = {
                { text = "Aller au Sénat", to = 47 },
            },
        },
        [43] = {
            text = "Un marchand du Forum vous vend une toge blanche à bande pourpre, « modèle sénateur, taille unique, lavable à la fontaine ». Vous l'enfilez. Vous ressemblez à un drap de lit qui aurait pris de grands airs, mais personne ne vous arrête plus.\n\nLes gardes vous saluent même en passant. Vous marchez dignement jusqu'au théâtre de Pompée.",
            gain = "toge",
            choices = {
                { text = "Entrer au Sénat", to = 47 },
            },
        },
        [44] = {
            text = "Le légionnaire charge en criant « Pour Rome ! » Vous criez « Pour le stage ! », ce qui est moins impressionnant mais tout aussi sincère. Son bouclier est grand, mais il est fatigué : cela fait trois cents jours qu'il monte la garde au même endroit.",
            fight = { name = "Légionnaire romain", skill = 7, stamina = 7, win = 47, flee = 42 },
        },
        [45] = {
            text = "Le légionnaire renifle le camembert. Ses yeux s'emplissent de larmes. « Ça… ça sent comme chez ma grand-mère, en Gaule ! » Il est en réalité né à Rouen, enrôlé de force, et n'a pas mangé de fromage normand depuis des années.\n\nIl dévore le camembert, vous serre dans ses bras et vous ouvre le passage. « Va, ami. Et méfie-toi des Ides de mars ! » Tout le monde dit ça, ici.",
            lose = "camembert",
            choices = {
                { text = "Passer au Sénat", to = 47 },
            },
        },
        [46] = {
            text = "« Je suis Gaulois ! De Lutèce ! » annoncez-vous en gonflant le torse. Le légionnaire plisse les yeux. Les Gaulois, il en a vu : moustaches, braies, sangliers sous le bras. Vous, vous avez un sac à dos et une montre qui clignote. Il faut avoir de la chance.",
            test = { stat = "luck", win = 47, lose = 44 },
        },
        [47] = {
            text = "Dans la curie du théâtre de Pompée, Jules César trône, couronne de lauriers sur la tête. Autour de son cou pend un balancier de cristal qui oscille et fait tic-tac : votre balancier ! « Cadeau d'un devin, explique-t-il. Grâce à lui, chaque jour est le même. Veni, vidi… vidi encore. »\n\nLes sénateurs, eux, ont l'air très pressés de passer à demain.",
            choices = {
                { text = "Demander poliment le balancier", to = 48 },
                { text = "Prévenir César du complot", to = 49, flag = "complot" },
                { text = "Se faufiler parmi les sénateurs", to = 50, need = "toge" },
            },
        },
        [48] = {
            text = "« Rendre à César ce qui est à César, d'accord. Mais rendre ce qui est à César à un stagiaire ? Jamais ! » César croise les bras. Puis une lueur s'allume dans son regard : il adore les jeux de hasard.\n\n« Je te le joue aux dés. Si tu gagnes, il est à toi. Si tu perds… on verra. » Derrière vous, une bouche d'égout entrouverte promet une fuite discrète.",
            choices = {
                { text = "Accepter le pari aux dés", to = 52 },
                { text = "Fuir par les égouts", to = 53 },
            },
        },
        [49] = {
            text = "Vous chuchotez à César qu'on complote contre lui. Il éclate de rire. « Brutus ? Mon petit Brutus ? Il est bien trop gentil. » Ouf : il ne vous croit pas, l'Histoire est sauve.\n\nAmusé par votre audace, il décroche le balancier. « Tiens, garde ce caillou qui fait tic-tac. À force de revivre la même journée, je commence à m'ennuyer. » Sage décision, et vous préférez ne pas rester pour la suite.",
            choices = {
                { text = "Prendre le balancier", to = 55 },
            },
        },
        [50] = {
            text = "Drapé dans votre toge, vous vous mêlez aux sénateurs qui se pressent autour de César. Tout le monde se bouscule, tout le monde lui tend un papier. Vous avancez la main vers le balancier, l'air de rien. Il faut des doigts de fée.",
            test = { stat = "skill", win = 55, lose = 48 },
        },
        [51] = {
            text = "Le devin Spurinna, barbe blanche et voix enrouée, vous prend à part. « Toi, tu n'es pas d'ici. Tu cherches l'objet qui fait tourner le jour en rond. César le porte au cou. Méfie-toi des Ides de… bon, tu connais la suite. »\n\nIl vous tapote l'épaule, puis recommence à crier sa prophétie aux passants, qui se bouchent les oreilles.",
            choices = {
                { text = "Suivre le tic-tac", to = 41 },
                { text = "Aller aux thermes", to = 42 },
            },
        },
        [52] = {
            text = "César sort des dés en os de son pli de toge, les secoue longuement et vous les tend. « Alea jacta est ! » déclare-t-il, très content de placer sa célèbre phrase. Les sénateurs retiennent leur souffle, Brutus compris. Vous soufflez sur les dés pour la chance, et vous lancez.",
            roll = { dice = 1, outcomes = {
                { upto = 2, to = 54 },
                { upto = 6, to = 55 },
            } },
        },
        [53] = {
            text = "Vous plongez dans la bouche d'égout et vous voilà dans la Cloaca Maxima, le plus vieil égout de Rome. Il fait noir, ça sent la soupe de la veille, et les galeries se ressemblent toutes. Il va falloir de la chance pour retrouver la sortie.",
            test = { stat = "luck", win = 47, lose = 56 },
        },
        [54] = {
            text = "Perdu ! César se frotte les mains. « Qu'on lâche les oies du Capitole ! » Le Colisée n'existe pas encore, alors on fait avec ce qu'on a. Une escouade d'oies sacrées fond sur vous en cacardant, le bec en avant. Elles ont sauvé Rome jadis. Aujourd'hui, elles veulent vos mollets.",
            fight = { name = "Oies du Capitole", skill = 5, stamina = 6, win = 55 },
        },
        [55] = {
            text = "Le balancier de cristal est à vous ! À l'instant où vous le décrochez, un grand frisson parcourt Rome : le soleil se couche enfin, et demain, le 16 mars, va pouvoir arriver. Les marchands applaudissent, les sénateurs se dépêchent de rentrer chez eux.\n\nUn sénateur reconnaissant vous glisse deux pièces. Mieux vaut ne pas traîner : la suite de cette journée n'est pas de votre ressort.",
            gain = "balancier",
            gold = 2,
            set = "fait_rome",
            choices = {
                { text = "Activer la chronomontre", to = 57 },
            },
        },
        [56] = {
            text = "Vous tournez à gauche, puis à droite, puis encore à gauche. Au bout de quelques jours, un rat romain vous adopte. Au bout de quelques années, vous connaissez chaque pierre de la Cloaca Maxima.\n\nOn vous retrouvera en 2026, lors des travaux d'une nouvelle ligne de métro, assis sur une colonne, en train d'expliquer le chemin aux touristes perdus. L'Histoire, elle, ne s'est jamais remise.",
            ending = "death",
        },
        [57] = {
            text = "La chronomontre hoquette et vous dépose par erreur à Mayence, en 1450, dans l'atelier de Gutenberg. Il est furieux : sa presse imprime toute seule des prospectus « Napoléon en trottinette, la nouvelle mode ! » à cause du chaos.\n\nVous l'aidez à remettre ses caractères en ordre. Ravi, il vous offre la première affiche de l'histoire de l'imprimerie, que vous revendez aussitôt deux pièces à un collectionneur.",
            gold = 2,
            choices = {
                { text = "Régler la montre et repartir", to = 20 },
            },
        },
        [58] = {
            text = "Le cadran solaire bien calé dans votre sac, vous activez la montre. Petit raté : vous voici à Orléans, en 1429. Une jeune fille en armure vous regarde fixement. C'est Jeanne d'Arc. « J'entends des voix ! » s'écrie-t-elle. C'est la sonnerie de votre montre, qui chante une comptine.\n\nVous l'éteignez, gêné. Jeanne, compréhensive, partage avec vous son pain, son fromage et trois pièces de sa solde avant de repartir libérer la ville. Vous vous sentez requinqué.",
            stamina = 3,
            gain = "cadran",
            set = "fait_egypte",
            gold = 3,
            choices = {
                { text = "Régler la montre et repartir", to = 20 },
            },
        },
        [59] = {
            text = "La chronomontre fait un détour par Paris, en 1898. Dans un hangar glacial, Marie Curie remue une marmite de minerai. Votre montre se met à briller d'un joli vert. « Tiens, tiens… Votre montre est radioactive, ou c'est moi ? »\n\nElle prend votre pouls, vous conseille de ne pas lécher la montre et vous souhaite bonne chance avec un sourire. Venant d'une double prix Nobel, c'est un porte-bonheur.",
            luck = 2,
            choices = {
                { text = "Régler la montre et repartir", to = 20 },
            },
        },
        [60] = {
            text = "Versailles, au temps de Louis XIV. Vous atterrissez en plein bassin d'Apollon. Le dieu sur son char a l'air consterné : les fontaines aspirent l'eau au lieu de la cracher, et les jardiniers de Le Nôtre courent dans tous les sens avec des seaux.\n\nPlus loin, le château brille de tous ses ors. Vers la Seine, de gros tuyaux mènent à la machine de Marly, qui fait un bruit d'enfer.",
            choices = {
                { text = "Se diriger vers le château", to = 61 },
                { text = "Suivre les tuyaux vers Marly", to = 62 },
            },
        },
        [61] = {
            text = "À la grille d'honneur, un garde suisse gigantesque, hallebarde à la main, vous toise de haut en bas. « Pas de perruque, pas de culotte de soie, pas d'entrée. Ici, c'est Versailles, pas la foire du Trône. »\n\nIl ne semble pas d'humeur à négocier. Quoique… sa main traîne, paume ouverte, près de sa poche.",
            choices = {
                { text = "Forcer le passage", to = 63 },
                { text = "Montrer le laissez-passer royal", to = 65, need = "laissez" },
                { text = "Glisser 3 pièces au garde", to = 65, cost = 3 },
            },
        },
        [62] = {
            text = "La machine de Marly est un monstre de bois et de fer : quatorze roues géantes plantées dans la Seine pour envoyer l'eau jusqu'à Versailles. Son constructeur, maître Rennequin Sualem, s'arrache les cheveux. « Un engrenage d'or est tombé du ciel dans mes roues ! Tout tourne à l'envers ! Seul le roi peut ordonner l'arrêt de la machine. »\n\nNon loin, dans l'orangerie, une troupe de comédiens répète bruyamment.",
            choices = {
                { text = "Grimper dans les roues", to = 66 },
                { text = "Aller voir le roi au château", to = 61 },
                { text = "Rejoindre les comédiens", to = 64 },
            },
        },
        [63] = {
            text = "Le garde suisse baisse sa hallebarde avec un soupir. « Je vous aurai prévenu. » Il est grand, il est fort, il est suisse, donc parfaitement à l'heure : il frappe pile au bon moment. À vous de vous montrer plus rapide.",
            fight = { name = "Garde suisse", skill = 8, stamina = 8, win = 65, flee = 62 },
        },
        [64] = {
            text = "Dans l'orangerie, Molière en personne répète une nouvelle pièce. Le chaos temporel l'a ramené sur scène, et il en est ravi. « Un vrai stagiaire ! Je travaille justement sur Le Stagiaire imaginaire. Quel est votre plus grand malheur ? » « Le café de la photocopieuse », répondez-vous. Il note tout.\n\nPour vous remercier, il vous offre une part de son buffet et un laissez-passer royal de comédien.",
            gain = "laissez",
            stamina = 2,
            choices = {
                { text = "Retourner au château", to = 61 },
            },
        },
        [65] = {
            text = "La galerie des Glaces ! Trois cent cinquante-sept miroirs, des lustres de cristal, et des courtisans qui se recoiffent dans chaque reflet. Au fond, Louis XIV, le Roi-Soleil, admire sa perruque.\n\nSur un chevalet, à côté de lui, sourit une dame aux mains croisées : la Joconde ! Le chaos l'a transportée ici. Dans un coin, des courtisans jouent aux dés pour passer le temps.",
            choices = {
                { text = "Saluer le roi", to = 67 },
                { text = "Décrocher discrètement la Joconde", to = 68, without = "joconde" },
                { text = "Jouer aux dés avec la cour", to = 69 },
            },
        },
        [66] = {
            text = "Vous escaladez une roue géante qui tourne à l'envers dans un vacarme de tonnerre. L'eau vous gifle, le bois grince, les godets vous frôlent la tête. Tout là-haut, coincé dans un pignon, l'engrenage d'or étincelle. Il faut de l'agilité et un peu de folie.",
            test = { stat = "skill", win = 72, lose = 75 },
        },
        [67] = {
            text = "Vous faites une révérence maladroite. Louis XIV vous dévisage. « On me dit qu'un objet doré bloque ma machine de Marly. Qu'on l'arrête et qu'on vous le donne ? Peut-être. Mais l'État, c'est moi. Et un roi ne donne rien sans recevoir quelque chose. Qu'avez-vous à m'offrir ? »\n\nToute la cour se tait et vous observe, éventails suspendus.",
            choices = {
                { text = "Offrir le camembert au roi", to = 70, need = "camembert" },
                { text = "Complimenter sa perruque", to = 74 },
                { text = "Lui parler de l'avenir", to = 71 },
            },
        },
        [68] = {
            text = "Vous profitez d'un instant où tout le monde regarde le roi se moucher. Vous roulez la Joconde, vous la glissez sous votre veste et vous reculez en sifflotant. Elle vous sourit toujours. Vous aussi, mais avec beaucoup moins de mystère.",
            test = { stat = "luck", win = 76, lose = 77 },
        },
        [69] = {
            text = "Les courtisans jouent au hoca, le jeu favori de la cour. On vous tend un gobelet de dés. « Monsieur joue ? Mise libre, mais on n'a jamais vu personne repartir plus riche. » Une duchesse vous fait un clin d'œil. Vous secouez le gobelet.",
            roll = { dice = 1, outcomes = {
                { upto = 3, to = 73 },
                { upto = 6, to = 78 },
            } },
        },
        [70] = {
            text = "Le roi soulève le couvercle. L'odeur se répand dans la galerie, les courtisans s'évanouissent en cascade, les miroirs se voilent. Louis XIV, lui, goûte… et sourit. « Voilà un fromage digne de Versailles ! » Il le fera servir chaque soir.\n\nEnchanté, il signe un ordre : la machine de Marly sera arrêtée et l'engrenage vous sera remis. Un carrosse vous y conduit.",
            lose = "camembert",
            choices = {
                { text = "Monter dans le carrosse", to = 72 },
            },
        },
        [71] = {
            text = "« Dans cent ans, Sire, il y aura une Révolution, et surtout… des impôts sur le revenu ! » Le roi pâlit, puis s'illumine. « Des impôts sur le revenu ? Quelle idée magnifique ! » Il vous nomme sur-le-champ Grand Contrôleur des impôts du royaume.\n\nVous passez le reste de vos jours à remplir des formulaires en trois exemplaires dans un bureau sans fenêtre. Vous êtes riche, mais tout le monde vous déteste. Et l'Histoire reste détraquée.",
            ending = "end",
        },
        [72] = {
            text = "Les quatorze roues de Marly s'immobilisent dans un grand soupir. Vous récupérez l'engrenage d'or, encore tout mouillé. Aussitôt, les fontaines de Versailles repartent dans le bon sens : le bassin d'Apollon jaillit, les jardiniers dansent, Le Nôtre pleure de joie.\n\nMaître Sualem vous embrasse sur les deux joues. Il ne vous reste qu'à filer.",
            gain = "engrenage",
            set = "fait_versailles",
            choices = {
                { text = "Activer la chronomontre", to = 59 },
            },
        },
        [73] = {
            text = "Les dés roulent : un et deux. La duchesse éclate de rire et ramasse votre mise d'un geste élégant. « Je vous l'avais dit, Monsieur. À Versailles, c'est toujours la maison qui gagne, et la maison, c'est le roi. »\n\nHeureusement, vous aviez misé des boutons de culotte. Vous repartez un peu vexé. La galerie est toujours aussi brillante.",
            stamina = -1,
            choices = {
                { text = "Revenir au centre de la galerie", to = 65 },
            },
        },
        [74] = {
            text = "« Sire, votre perruque est la plus majestueuse de l'univers connu, et même de celui qu'on ne connaît pas encore. » Le roi se rengorge et se regarde dans trois cent cinquante-sept miroirs à la fois. « Enfin quelqu'un de lucide ! »\n\nIl signe un ordre : la machine de Marly sera arrêtée et l'engrenage vous sera remis. Un carrosse vous attend.",
            choices = {
                { text = "Monter dans le carrosse", to = 72 },
            },
        },
        [75] = {
            text = "La roue vous emporte, vous plonge dans la Seine, vous remonte, vous replonge. Après trois tours de manège aquatique, elle vous recrache sur la berge comme un noyau de cerise.\n\nVous crachez une carpe, essorez vos chaussettes et constatez que maître Sualem vous applaudit poliment. « Bel essai. Le roi, lui, pourrait faire arrêter la machine, vous savez. »",
            stamina = -3,
            choices = {
                { text = "Retenter l'escalade", to = 66 },
                { text = "Aller voir le roi au château", to = 61 },
            },
        },
        [76] = {
            text = "Personne n'a rien vu ! La Joconde est roulée sous votre veste et vous chatouille le menton. Léonard sera sûrement ravi de la revoir. Il ne reste plus qu'à régler l'affaire de l'engrenage.\n\nVous vous avancez vers le roi avec l'innocence d'un chat qui vient de renverser un vase.",
            gain = "joconde",
            choices = {
                { text = "Saluer le roi", to = 67 },
            },
        },
        [77] = {
            text = "« Au voleur ! » La Joconde vous glisse des mains et retombe sur son chevalet, toujours souriante. Deux gardes suisses accourent, hallebardes pointées. Les courtisans s'écartent avec des petits cris délicieusement scandalisés. Il va falloir se battre, ou détaler.",
            fight = {
                enemies = {
                    { name = "Premier garde suisse", skill = 7, stamina = 5 },
                    { name = "Second garde suisse", skill = 7, stamina = 5 },
                },
                win = 67, flee = 62,
            },
        },
        [78] = {
            text = "Double six ! La duchesse en laisse tomber son éventail. Les courtisans applaudissent, un marquis s'évanouit. Vous aviez misé des boutons de culotte : on vous en rend trente, avec les honneurs.\n\n« Monsieur a la main heureuse, murmure la duchesse. Méfiez-vous, le roi n'aime pas qu'on gagne trop. » Vous rangez vos gains avant qu'il ne remarque quoi que ce soit.",
            luck = 1,
            choices = {
                { text = "Revenir au centre de la galerie", to = 65 },
            },
        },
        [79] = {
            text = "Vous vous réfugiez dans la ferme d'Hougoumont. À l'intérieur, le duc de Wellington prend le thé, très calme, avec des scones. « Une tasse ? La bataille peut attendre, il pleut trop. » Vous buvez votre thé en essorant votre chemise.\n\nRequinqué, vous retournez sous la pluie. Au loin, Napoléon zigzague entre les flaques sur sa trottinette en criant « Vive la vitesse ! ».",
            stamina = 4,
            choices = {
                { text = "Aller parler à Napoléon", to = 87 },
            },
        },
        [80] = {
            text = "Amboise, 1519. Au Clos Lucé, le vieux Léonard de Vinci, barbe immense et yeux pétillants, vous accueille au milieu de ses maquettes de machines volantes. Il est triste : « Ma Joconde a disparu. Je ne l'avais jamais terminée… Je la retouchais encore tous les matins. »\n\nIl remarque vos pièces étincelantes et son regard s'allume. « Oh ! Montrez-moi donc ça ! »",
            choices = {
                { text = "Lui rendre la Joconde", to = 81, need = "joconde" },
                { text = "Lui montrer les pièces de la machine", to = 82 },
            },
        },
        [81] = {
            text = "Vous déroulez la Joconde. Léonard pousse un cri de joie, l'accroche au mur et lui ajoute aussitôt trois coups de pinceau. « Voilà, maintenant elle sourit encore mieux. »\n\nPour vous remercier, il dessine votre portrait en trois minutes, un chef-d'œuvre, signé de sa main. Puis il vous sert une soupe aux légumes du jardin d'Amboise. Vous vous sentez comme neuf.",
            lose = "joconde",
            gain = "croquis",
            stamina = 4,
            choices = {
                { text = "Lui montrer les pièces de la machine", to = 82 },
            },
        },
        [82] = {
            text = "Léonard assemble le ressort, le cadran, le balancier et l'engrenage avec une habileté folle, en écrivant ses notes à l'envers. Le nouveau Chronoscaphe tient dans une caisse en bois, avec des ailes de chauve-souris « pour le style ».\n\n« Il manque le réglage final, dit-il. Il faut viser la plus grosse anomalie, Waterloo, et tout remettre d'aplomb d'un coup. Mais comment calibrer ? »",
            choices = {
                { text = "Calibrer avec « E = mc² »", to = 83, flag = "formule" },
                { text = "Calibrer au pif", to = 84 },
            },
        },
        [83] = {
            text = "« E = mc² ! » Léonard écarquille les yeux, griffonne, compte sur ses doigts, puis éclate de rire. « Génial ! Simple ! Pourquoi n'y ai-je pas pensé ? Ah oui, je suis né quatre siècles trop tôt. »\n\nIl règle les aiguilles avec une précision parfaite. La machine vibre doucement, prête à tout remettre en ordre. Vous embrassez Léonard et vous sautez dans la caisse.",
            set = "calibre",
            choices = {
                { text = "Sauter à Waterloo", to = 85 },
            },
        },
        [84] = {
            text = "Vous tournez trois boutons, vous tapez deux fois sur le côté, comme on fait avec les vieilles télés. Léonard vous regarde, perplexe. « C'est une méthode du futur ? » La machine gronde, crache de la fumée et vous emporte dans un tourbillon très, très instable.",
            test = { stat = "luck", win = 85, lose = 86 },
        },
        [85] = {
            text = "Waterloo, 18 juin 1815. Il pleut des cordes, la boue monte aux genoux. Au milieu des troupes ébahies, Napoléon fonce sur une trottinette électrique en criant « Impossible n'est pas français ! ».\n\nSoudain, un éclair : un robot du futur, gros comme une armoire normande, apparaît. « Bureau de Contrôle Temporel, an 2999. Cette trottinette est à moi. Et vous, stagiaire, vous êtes en infraction. »",
            choices = {
                { text = "Aller parler à Napoléon", to = 87 },
                { text = "Affronter le robot", to = 88 },
                { text = "Se cacher dans une ferme", to = 79 },
            },
        },
        [86] = {
            text = "La machine vous dépose au Jurassique, au pied d'un diplodocus qui mâchonne une fougère. Il vous regarde, vous trouve très appétissant, très vert et très croquant, et vous prend pour une brindille.\n\nVous finissez au menu d'un herbivore myope, ce qui est un exploit. Dans le futur, Napoléon roule toujours en trottinette et la Joconde reste introuvable. Votre maître, lui, cherche encore son stagiaire.",
            ending = "death",
        },
        [87] = {
            text = "Napoléon freine dans une gerbe de boue. « Ah ! Vous venez admirer mon destrier moderne ? Il ne mange pas, il ne hennit pas, il ne rue pas. Et il va plus vite que Marengo ! » Son cheval Marengo, attaché à un arbre, a l'air profondément vexé.\n\nIl faut convaincre l'Empereur de rendre la trottinette, sinon l'Histoire ne s'en remettra jamais.",
            choices = {
                { text = "Échanger la trottinette contre le camembert", to = 89, need = "camembert" },
                { text = "Le défier à la course", to = 90 },
                { text = "Appeler le robot", to = 88 },
            },
        },
        [88] = {
            text = "Le robot du futur s'avance, les yeux rouges. « Infraction temporelle de classe A. Amende : mille ans de stage non rémunéré. » Ses bras se transforment en pinces, en tournevis et en tampon administratif. C'est le combat final, celui de la liberté contre la paperasse.",
            fight = { name = "Robot du futur", skill = 9, stamina = 10, win = 91 },
        },
        [89] = {
            text = "Napoléon renifle le camembert, hésite, puis cède. « Un vrai fromage de chez nous… Marché conclu ! » Il remonte sur Marengo, qui hennit de bonheur, et repart en mâchonnant vers sa destinée historique.\n\nVous récupérez la trottinette, encore toute crottée. Derrière vous, des bips furieux retentissent : le robot du futur vous fonce dessus.",
            lose = "camembert",
            choices = {
                { text = "Faire face au robot", to = 92 },
            },
        },
        [90] = {
            text = "« Une course ? J'adore ! » Napoléon aligne sa trottinette. Vous empruntez Marengo, qui n'attendait que ça. Le parcours : de la ferme de la Haie-Sainte au moulin, sous la pluie, entre les canons. Trois, deux, un, partez ! Il faut tenir en selle.",
            test = { stat = "skill", win = 92, lose = 94 },
        },
        [91] = {
            text = "Plus de robot à l'horizon, plus de trottinette dans la boue. La machine de Léonard s'emballe, la lumière vous enveloppe et, d'un coup, l'Histoire se remet en place : Napoléon à cheval, César à Rome, Cléopâtre sans perche.\n\nVous voilà de retour quai de l'Horloge, à 13 h 59. La porte s'ouvre. Maître Trotteuse rentre de déjeuner.",
            choices = {
                { text = "Lui montrer le croquis de Léonard", to = 95, need = "croquis" },
                { text = "Faire comme si de rien n'était", to = 96 },
            },
        },
        [92] = {
            text = "Le robot vous barre la route, tampon brandi. « Stagiaire non déclaré ! Trottinette non homologuée ! Présentez vos papiers ou subissez la sanction ! » Ses voyants clignotent dangereusement. Dans votre dos, la machine de Léonard vibre doucement, comme si elle avait une idée derrière la tête.",
            choices = {
                { text = "Combattre le robot", to = 88 },
                { text = "Présenter le laissez-passer royal", to = 93, need = "laissez" },
                { text = "Le zapper avec la machine calibrée", to = 97, flag = "calibre" },
            },
        },
        [93] = {
            text = "Vous tendez le laissez-passer de Molière. Le robot le scanne. « Document officiel… tampon royal… signature illisible… Formulaire parfaitement conforme. » Ses yeux passent au vert. Les robots du futur ne savent pas résister à un papier tamponné.\n\nIl vous fait le salut réglementaire, récupère sa trottinette et vous souhaite « une bonne fin de journée temporelle ».",
            choices = {
                { text = "Rentrer à la maison", to = 91 },
            },
        },
        [94] = {
            text = "Marengo pile net devant une flaque, et vous continuez sans lui. Vous atterrissez dans la boue la tête la première. Napoléon passe en trombe en vous éclaboussant. « La victoire est à moi ! »\n\nMais sa trottinette, à bout de batterie, s'arrête net dix mètres plus loin. Furieux, l'Empereur la jette et remonte sur Marengo. Vous ramassez la trottinette, couvert de boue. Le robot arrive.",
            stamina = -3,
            choices = {
                { text = "Faire face au robot", to = 92 },
            },
        },
        [95] = {
            text = "Maître Trotteuse contemple le croquis signé par Léonard de Vinci. Il ôte ses lunettes, les remet, puis les ôte encore. « Un original ! De Léonard ! Avec votre tête dessus ! » Il examine le Chronoscaphe réparé, plus beau qu'avant, avec des ailes de chauve-souris.\n\n« Mon petit, vous êtes une catastrophe, mais une catastrophe de génie. Voici un contrat à durée indéterminée. » Un CDI ! Le vrai Graal. Victoire totale.",
            ending = "win",
        },
        [96] = {
            text = "Vous passez le balai en sifflotant. Maître Trotteuse jette un œil au Chronoscaphe, qui a désormais des ailes de chauve-souris. « Tiens, j'avais oublié que je l'avais repeint. » Il cherche longuement son camembert, puis renonce.\n\nÀ la radio, tout est normal : Napoléon à cheval, la Joconde au Louvre. « Bon travail, stagiaire. Rendez-vous lundi. » L'Histoire est sauvée, et personne ne le saura jamais.",
            ending = "win",
        },
        [97] = {
            text = "Vous pointez la machine de Léonard sur le robot et vous appuyez sur le gros bouton. Grâce au réglage parfait d'Einstein, un rayon doux enveloppe la boîte de conserve, qui se met à rajeunir : robot neuf, puis kit en pièces détachées, puis simple notice de montage en suédois.\n\nLa notice s'envole dans le vent de Waterloo. Napoléon, impressionné, rend la trottinette et retourne sagement sur Marengo.",
            choices = {
                { text = "Rentrer à la maison", to = 91 },
            },
        },
    },
}
