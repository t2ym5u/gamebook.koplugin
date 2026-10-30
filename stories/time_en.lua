-- The Tea-Stained Timeline — a comic time-travel gamebook (English).
return {
    title       = "The Tea-Stained Timeline",
    author      = "Gamebook",
    lang        = "en",
    blurb       = "New intern, one spilt cuppa, history in pieces. Fix Newton's pineapple before teatime.",
    sheet       = true,
    start       = 1,
    start_gold  = 5,
    start_items = { "brolly" },
    items = {
        brolly    = "Chrono-Brolly",
        thermos   = "Thermos of builder's tea",
        biscuits  = "Tin of digestives",
        pineapple = "Rogue pineapple",
        laptop    = "Shakespeare's laptop",
        map       = "Map of Albion",
        sword     = "Excalibur (on loan)",
        scarab    = "Lucky scarab",
        pizza     = "Pizza (one slice gone)",
        pass      = "Royal papyrus pass",
        punchcard = "Ada's punch card",
        goggles   = "Flying goggles",
    },
    sections = {
        -- ===================================================== THE BUREAU
        [1] = {
            text = "It is your first morning as an intern at the Bureau of Temporal Tidiness, a polite little office hidden beneath the Royal Observatory at Greenwich. Your job: keep history in the right order. Your first task: make the tea.\n\nYou make it. You trip. A whole pot of Earl Grey lands in the Great Time Console. It fizzes, it hums, and it says « uh-oh » in a voice nobody installed. Alarms begin to ring politely.",
            choices = {
                { text = "Find your supervisor at once", to = 2 },
                { text = "Mop it up before anyone notices", to = 3 },
            },
        },
        [2] = {
            text = "Mrs Pemberton-Ticks, Senior Tidier, regards you over her half-moon spectacles. « History has gone higgledy-piggledy, » she says. « Newton has a pineapple. Shakespeare has a laptop. There is a dinosaur in Victorian London and Cleopatra is ordering pizza. »\n\nShe hands you a Chrono-Brolly. « Open it, think of a date, and try not to land in a volcano. Oh, and the console has been growling. If it ever gets up and walks, it will want a password. »",
            set = "briefed",
            choices = {
                { text = "Visit the equipment cupboard", to = 4 },
            },
        },
        [3] = {
            text = "You grab a mop and attack the puddle. The console crackles and spits sparks the colour of marmalade. Somewhere inside it a tiny voice is humming « Rule, Britannia » in the wrong key. You reach under the desk for the last of the tea and feel something round and metal.",
            test = { stat = "luck", win = 5, lose = 6 },
        },
        [4] = {
            text = "The equipment cupboard smells of polish and adventure. Mrs Pemberton-Ticks, who has caught up with the situation, says you may take one comfort item into the past. « Regulations, » she sniffs. « One. Not two. We are not the Americans. »\n\nOn the shelf sit a steaming thermos of builder's tea and a tin of digestive biscuits.",
            choices = {
                { text = "Take the thermos of tea", to = 7 },
                { text = "Take the tin of digestives", to = 8 },
            },
        },
        [5] = {
            text = "It is only an old teaspoon from 1953, but your hand is clear of the puddle just in time. Lucky you. The sparks miss you entirely and singe the potted fern instead, which has seen worse.\n\nMrs Pemberton-Ticks appears in the doorway, sees the fern, sees the console, sees the mop. « Equipment cupboard, » she says. « Now. History is waiting, and it is not a patient customer. »",
            choices = {
                { text = "Hurry to the cupboard", to = 4 },
            },
        },
        [6] = {
            text = "A marmalade-coloured spark leaps into your sleeve. For three seconds you can taste next Tuesday. It tastes of cabbage. Your hair stands up like a startled hedgehog.\n\nMrs Pemberton-Ticks appears in the doorway, raises one eyebrow by a precisely calculated millimetre, and points down the corridor. « Equipment cupboard. Now, please, before you electrocute the Enlightenment. »",
            stamina = -2,
            choices = {
                { text = "Squelch off to the cupboard", to = 4 },
            },
        },
        [7] = {
            text = "You tuck the thermos under your arm. It is warm, reassuring and strong enough to stand a spoon in. Builder's tea has fixed more British problems than Parliament.\n\nYou march back to the console room, where the Great Time Console now has a dial marked with eras, each one blinking a worried red.",
            gain = "thermos",
            choices = {
                { text = "Stand before the Time Console", to = 9 },
            },
        },
        [8] = {
            text = "You take the tin of digestives. They are the sensible biscuit: dunkable, sturdy, and impossible to show off with. Mrs Pemberton-Ticks nods. « A wise choice. No one ever started a war over a digestive. »\n\nYou march back to the console room, where the Great Time Console now shows a dial of eras, each one blinking a worried red.",
            gain = "biscuits",
            choices = {
                { text = "Stand before the Time Console", to = 9 },
            },
        },
        [9] = {
            text = "The Great Time Console wheezes and drips Earl Grey. Its brass dial shows the trouble spots, each one blinking red. Behind it, something large and metallic seems to be stirring, as if the spilt tea has given the machine ideas above its station.\n\nYou open your Chrono-Brolly. Where to?",
            choices = {
                { text = "Old England: Newton, Shakespeare, Arthur", to = 10, noflag = "fixed_a", hide = true },
                { text = "The Ancient World: Egypt and Rome", to = 38, noflag = "fixed_b", hide = true },
                { text = "Victoria's London and beyond", to = 68, noflag = "fixed_c", hide = true },
                { text = "Confront whatever is growling", to = 95 },
            },
        },

        -- ===================================================== ROUTE A: OLD ENGLAND
        [10] = {
            text = "With a soft pop you land in an orchard at Woolsthorpe Manor, Lincolnshire, in 1666. The plague has closed Cambridge, so young Isaac Newton is home, sitting under his famous tree waiting for inspiration to drop.\n\nIt drops. It is a pineapple. It bounces off his head with a hollow thonk. « This is no help at all, » mutters the greatest mind in Europe, rubbing his wig.",
            choices = {
                { text = "Talk to Mr Newton", to = 11 },
                { text = "Climb the tree and swap the fruit", to = 12 },
                { text = "Search the orchard for an apple", to = 13 },
            },
        },
        [11] = {
            text = "« A pineapple! » cries Newton. « From the Americas, on an English tree! If fruit can fall from anywhere, there are no laws at all. I may as well take up poetry. »\n\nHe is clearly sulking. He keeps glancing at the empty branches as though they owe him money. What he needs is an ordinary, honest, Lincolnshire apple.",
            choices = {
                { text = "Go and find him an apple", to = 13 },
                { text = "Offer him a digestive", to = 14, need = "biscuits" },
            },
        },
        [12] = {
            text = "You hitch up your sleeves and start to climb. The bark is slippery, the branches are thin, and somewhere above you a second pineapple is wobbling ominously. Newton watches with scientific interest, already wondering how fast an intern falls. A cow in the next field has stopped chewing to watch.",
            test = { stat = "skill", win = 15, lose = 16 },
        },
        [13] = {
            text = "Behind the manor you find Newton's mother's kitchen garden and, guarded by a very judgemental goose, a single rosy apple on a low bough. You distract the goose by pointing and shouting « Look, a fox! » It works. Geese are clever, but not that clever.\n\nYou pocket the apple, rosy and round and exactly the right shape for a breakthrough.",
            choices = {
                { text = "Bring the apple to Newton", to = 17 },
            },
        },
        [14] = {
            text = "Newton dunks the digestive in his small beer and watches it with fierce attention. « Observe! A body at rest stays at rest. A body in motion stays in motion, until acted upon by a biscuit. And a large body, once charging, cannot stop quickly at all. Remember that. »\n\nYou make a mental note. It feels important, especially regarding large charging bodies. Then you go to fetch the apple.",
            set = "inertia",
            choices = {
                { text = "Search the orchard for an apple", to = 13 },
            },
        },
        [15] = {
            text = "You pluck the second pineapple just before it falls and hang a fine apple, borrowed from a lower branch, in its place. Plop. It lands on Newton's head with perfect timing.\n\n« Gravity! » he roars, scribbling furiously. « Every particle attracts every other particle! » He presses a golden guinea into your hand without looking up. You keep the pineapple. It may come in handy, or at least make a talking point.",
            choices = {
                { text = "Open the brolly for the next stop", to = 18 },
            },
        },
        [16] = {
            text = "The branch snaps. You obey the law of gravity before it has even been discovered, landing in a heap of leaves and indignity. Newton scribbles a note: « Interns: fall at roughly the same rate as fruit. Louder. »\n\nYou limp off to find another way.",
            stamina = -2,
            choices = {
                { text = "Search the orchard for an apple", to = 13 },
            },
        },
        [17] = {
            text = "You toss the apple gently upward. It comes down, as apples do, on Newton's head. « Gravity! » he cries. « It pulls everything! Even interns, probably! »\n\nHe gives you a golden guinea and returns to his notebook. You pick up the abandoned pineapple, since leaving tropical fruit in 1666 would be careless, and you have been careless enough for one week.",
            choices = {
                { text = "Open the brolly for the next stop", to = 18 },
            },
        },
        [18] = {
            text = "Your Chrono-Brolly twitches. Two more anachronisms in old England are glowing on its little dial: a strange electronic glow from Southwark, in London, where a theatre has just opened, and a peculiar commotion on Salisbury Plain, around a ring of very large stones.\n\nYou stuff Newton's guinea and the rogue pineapple into your bag.",
            gain = "pineapple",
            gold = 3,
            choices = {
                { text = "Visit the Globe Theatre, 1599", to = 19 },
                { text = "Visit Stonehenge, long ago", to = 25 },
            },
        },
        [19] = {
            text = "The Globe Theatre on Bankside is packed with groundlings eating hazelnuts. On the stage, William Shakespeare is hunched over a laptop. « Blast this contraption! » he wails. « I typed 'To be or not to be' and it changed it to 'Tuba or not tuba'! »\n\nA pie seller is doing a roaring trade, and a door at the back leads backstage.",
            choices = {
                { text = "Buy a hot pie (2 gold)", to = 20, cost = 2 },
                { text = "Sneak backstage", to = 21 },
                { text = "Challenge him to a sonnet-off", to = 22 },
            },
        },
        [20] = {
            text = "The pie is hot, peppery, and contains something the seller swears is beef. You feel much better. « That Will's gone peculiar, » the seller confides. « Ever since that glowing box turned up, he won't write a single line without asking it first. There's a brass fellow guarding his things backstage, too. Clanks like a kettle. »",
            stamina = 4,
            choices = {
                { text = "Sneak backstage", to = 21 },
                { text = "Challenge him to a sonnet-off", to = 22 },
            },
        },
        [21] = {
            text = "Backstage, among the painted forests and wooden swords, stands a clockwork stagehand: a brass figure with a key in its back and a very bad attitude. It has been guarding the laptop's charging cable, which leads to nothing, because electricity has not been invented. Its eyes whirr towards you. « TICKET, » it grinds.",
            choices = {
                { text = "Fight the clockwork stagehand", to = 23 },
                { text = "Throw it the pineapple", to = 24, need = "pineapple" },
            },
        },
        [22] = {
            text = "« A contest of verse! » Shakespeare puts down the laptop, delighted. The crowd hushes. You clear your throat and begin: « Shall I compare thee to a cup of tea? Thou art more warming, and more strong of brew... »\n\nIt is not your finest work. Everything depends on your delivery.",
            test = { stat = "skill", win = 26, lose = 21 },
        },
        [23] = {
            text = "The clockwork stagehand swings a prop halberd with alarming precision. You grab a wooden sword from the rack. It is the Battle of Bosworth all over again, but with more springs. The groundlings out front, hearing the clatter, assume it is part of the play and cheer loudly.",
            fight = { name = "Clockwork stagehand", skill = 7, stamina = 6, win = 26 },
        },
        [24] = {
            text = "You hurl the pineapple. The clockwork stagehand catches it, examines it, and decides it must be a very complicated key. It spends the next century trying to wind itself up with it, utterly absorbed. You tiptoe past, collecting the laptop and its pointless cable.",
            choices = {
                { text = "Return to the stage", to = 26 },
            },
        },
        [26] = {
            text = "Shakespeare peers at you, then at the laptop now in your arms. « Take it, » he sighs. « It kept suggesting I give Hamlet a happy ending and a dog. » He picks up his goose quill with relief and dashes off a line about a summer's day.\n\nThe stage glows; the anachronism is fixed. Your brolly now points west, to Cornwall and the castle of Tintagel.",
            gain = "laptop",
            choices = {
                { text = "Hop to Tintagel", to = 29 },
            },
        },
        [25] = {
            text = "Salisbury Plain, long, long ago. Hundreds of builders are hauling enormous stones on wooden rollers. The trouble is plain to see: someone has put up a gift shop, a car park, and a sign reading « Stonehenge: Please Queue Here ». The builders are queuing beautifully, which is lovely, but nobody is building anything.",
            choices = {
                { text = "Help haul a stone into place", to = 27 },
                { text = "Find whoever is in charge", to = 28 },
            },
        },
        [27] = {
            text = "You put your shoulder to a bluestone the size of a wardrobe. « Heave! » shouts a builder in a sheepskin. The stone rolls forward, then sideways, then very close to your foot. It is all a matter of chance now.",
            roll = { dice = 1, outcomes = { { upto = 2, to = 37 }, { upto = 6, to = 28 } } },
        },
        [28] = {
            text = "The head builder, a woman with a magnificent beard of moss, is scratching her head over a parking ticket. « We were told to wait for a bus, » she says. « What is a bus? »\n\nYou explain, tactfully, that buses come in about 4,500 years. Together you tear down the gift shop. In thanks she gives you a few bronze rings to spend and a deerskin Map of Albion, with a secret path to Camelot marked on it.",
            gain = "map",
            gold = 2,
            choices = {
                { text = "Follow the brolly to Tintagel", to = 29 },
            },
        },
        [29] = {
            text = "Tintagel, on the wild Cornish coast. Waves smash against black rocks and seagulls eye your lunch with criminal intent. Legend says King Arthur was born here, and right now legend is very upset, because the Round Table has been swapped for a square one with a spreadsheet on it.\n\nA steep path climbs to the castle. Below, a misty lake gleams.",
            choices = {
                { text = "Climb the cliff path to the castle", to = 30 },
                { text = "Visit the Lady of the Lake", to = 31 },
                { text = "Follow the secret path on your map", to = 33, need = "map" },
            },
        },
        [30] = {
            text = "The cliff path is narrow, wet and lined with seagulls who would very much like you to fall off. The wind tugs at your brolly like an impatient child. One slip and you will be part of Cornish folklore in the least dignified way.",
            test = { stat = "luck", win = 33, lose = 34 },
        },
        [31] = {
            text = "An arm clad in white samite rises from the lake, holding a gleaming sword. Then a head follows, rather bored. « I've been holding this thing up for centuries, » says the Lady of the Lake. « Nobody visits. There's nothing to read down there but fish. »\n\nShe looks at your bag hopefully.",
            choices = {
                { text = "Lend her Shakespeare's laptop", to = 32, need = "laptop" },
                { text = "Wish her well and climb the path", to = 30 },
            },
        },
        [32] = {
            text = "The Lady of the Lake seizes the laptop with a squeal. « The complete works of a playwright not born for another thousand years! Marvellous! » In exchange she hands you Excalibur, on strict loan. « Bring it back. And don't use it to open tins. »\n\nThe sword hums with old magic. You also suspect the laptop will never work again, but that is a problem for the fish.",
            lose = "laptop",
            gain = "sword",
            choices = {
                { text = "Stride on towards Camelot", to = 33 },
            },
        },
        [33] = {
            text = "In the great hall of Camelot, King Arthur and his knights are staring gloomily at the square table. « Who sits at the head? » sobs Sir Lancelot. « Everyone wants a corner! »\n\nGuarding the table is a Brass Knight, a clockwork anachronism with a visor like a toaster. It clanks forward. « NO SEATING CHANGES WITHOUT A FORM, » it booms.",
            choices = {
                { text = "Duel the Brass Knight", to = 35 },
                { text = "Raise Excalibur high", to = 36, need = "sword" },
            },
        },
        [34] = {
            text = "A gust lifts your brolly and you with it. You sail out over the sea, dangle for a moment like a confused kite, and drop into the waves. A passing seal regards you with deep pity. It is a long, cold, salty swim back, and you arrive at Camelot dripping and sneezing like a wet spaniel.",
            stamina = -3,
            choices = {
                { text = "Squelch into Camelot", to = 33 },
            },
        },
        [35] = {
            text = "The Brass Knight lowers its visor with a squeak and charges. The knights of the Round Table, being knights, immediately start taking bets. Sir Gawain puts three shillings on the knight. Sir Galahad, who is pure of heart, puts his money on you.",
            fight = { name = "Brass Knight", skill = 8, stamina = 7, win = 36 },
        },
        [36] = {
            text = "The Brass Knight sags to the floor like an old kettle, and the square table, its spell broken, rounds itself off with a satisfied creak. « Equal places for all! » cries Arthur. Lancelot stops sobbing. Merlin, who saw all this coming, pours you a mead.\n\nOld England glows a happy green on your brolly's dial. Time to report back to Greenwich.",
            set = "fixed_a",
            stamina = 2,
            choices = {
                { text = "Open the brolly for home", to = 9 },
            },
        },
        [37] = {
            text = "The bluestone rolls gracefully onto your toe. You hop around the plain, yelping in a way that later historians will mistake for an ancient fertility dance. The builders politely applaud. When the throbbing stops, you go to find the person in charge, who is clearly not you.",
            stamina = -2,
            choices = {
                { text = "Hobble to the head builder", to = 28 },
            },
        },

        -- ===================================================== ROUTE B: THE ANCIENT WORLD
        [38] = {
            text = "Giza, Egypt, about 2560 BC. The desert shimmers. Before you rises the Great Pyramid, the wonder of the ancient world, and it is upside down. Its point is stuck in the sand and its base is wobbling in the sky. Thousands of workers stare at it, scratching their heads under the blazing sun.",
            choices = {
                { text = "Speak to the chief architect", to = 39 },
                { text = "Climb inside to investigate", to = 40 },
                { text = "Leave it and head for Alexandria", to = 43 },
            },
        },
        [39] = {
            text = "Hemiunu, architect to the Pharaoh Khufu, waves a flat-packed instruction leaflet from the far future. « It says 'Assemble with a friend'! I assembled with four thousand friends! »\n\nYou gently turn the leaflet the right way up. Hemiunu goes pale, then pink, then shouts some very ancient words at the workers. Ropes creak. The whole pyramid begins to turn.",
            choices = {
                { text = "Watch the great flip", to = 41 },
            },
        },
        [40] = {
            text = "You crawl through a passage that, thanks to the pyramid being upside down, now goes up when it should go down. The torchlight flickers on the walls. Somewhere ahead you hear the rustle of linen and the scuttle of something with far too many legs.",
            test = { stat = "luck", win = 44, lose = 42 },
        },
        [41] = {
            text = "With a thunderous whump, the Great Pyramid settles onto its proper base, point to the sky, exactly as the postcards will one day show it. The workers cheer. Hemiunu weeps into his beard. He presses a little blue scarab into your palm. « For luck, » he says. « The crocodiles of the Nile respect this. »\n\nThe brolly now points north, to Alexandria.",
            gain = "scarab",
            luck = 1,
            choices = {
                { text = "Hop to Alexandria", to = 43 },
            },
        },
        [42] = {
            text = "You stumble into a storeroom of linen bandages and get completely wound up in them. You emerge looking like a very confused mummy. The workers outside scream, run, then laugh so hard that two of them have to sit down. It takes ages to unwrap yourself and your dignity is still somewhere inside.",
            stamina = -2,
            choices = {
                { text = "Find the chief architect", to = 39 },
            },
        },
        [43] = {
            text = "Alexandria shines by the sea. The great Lighthouse of Pharos blazes over the harbour, and the famous Library hums with scholars. But outside the royal palace stands a very confused young man on a chariot, holding a flat cardboard box. « Delivery for a Miss C. Patra, » he says, in a strong Neapolitan accent. « Large Margherita. Extra basil. »",
            choices = {
                { text = "Intercept the pizza", to = 45 },
                { text = "Visit the Great Library", to = 46 },
                { text = "Go straight into the palace", to = 47 },
            },
        },
        [44] = {
            text = "In a side chamber you find nothing but a sandwich wrapper that some careless future tourist must have left behind, and a very surprised scarab beetle. You take the wrapper (littering in a pyramid is very bad manners) and climb back out into the dazzling sunlight.",
            choices = {
                { text = "Find the chief architect", to = 39 },
            },
        },
        [45] = {
            text = "« I've been driving for two thousand years, » moans the delivery boy, whose name is Gennaro. « The satnav said turn left at the Colosseum. There is no Colosseum! Well, there is, but it's in the wrong century. »\n\nHe clutches the box. Cleopatra hasn't paid, and he isn't leaving without his money.",
            choices = {
                { text = "Pay for the pizza (3 gold)", to = 48, cost = 3 },
                { text = "Snatch the box and run", to = 49 },
            },
        },
        [46] = {
            text = "The Great Library of Alexandria! Scrolls up to the ceiling, and a librarian who shushes you before you've said anything. In a scroll titled « Gossip of Rome » you learn that Julius Caesar is mad about salad. Not just any salad: lettuce, croutons and a dressing so secret it isn't even invented yet.\n\nYou also find a bench in the shade and a cool jug of water.",
            set = "salad",
            stamina = 2,
            choices = {
                { text = "Head to the palace", to = 47 },
            },
        },
        [47] = {
            text = "Queen Cleopatra VII lounges on a golden couch, drumming her fingers. « I was promised pizza, » she says icily. « And now history tells me I am to meet some Roman called Caesar. I am not meeting anyone until I have eaten. »\n\nIf she won't meet Caesar, a good deal of history will simply fall over.",
            choices = {
                { text = "Present the pizza", to = 52, need = "pizza" },
                { text = "Pour her a cup of tea", to = 54, need = "thermos" },
                { text = "Explain pizza isn't invented yet", to = 53 },
            },
        },
        [48] = {
            text = "« Which way to the twenty-first century? » Gennaro calls out. You point vaguely north-west. He revs his chariot and gallops off into a shimmer of time, still muttering about tips. You are left holding a hot pizza in ancient Egypt, which is not something every intern can say. It smells of basil and of trouble.",
            gain = "pizza",
            choices = {
                { text = "Take the pizza to the palace", to = 47 },
            },
        },
        [49] = {
            text = "You grab the box and sprint across the harbour square, dodging camels, fish stalls and a philosopher explaining geometry to a goat. Gennaro shouts Italian words behind you that do not appear in any phrase book. Palace guards turn to look.",
            test = { stat = "luck", win = 50, lose = 51 },
        },
        [50] = {
            text = "You dive behind a fruit stall and the guards run straight past, chasing a man who just happens to be carrying a box of dates. Gennaro gives up the chase and stands in the square, hands on hips, shouting « Mamma mia! » at the sky. You straighten your collar and stroll off, box in hand, as innocent as a choirboy.",
            choices = {
                { text = "Check the box is still hot", to = 48 },
            },
        },
        [51] = {
            text = "A palace guard brings you down with a flying tackle worthy of Twickenham. The pizza flies through the air and lands, cheese down, at the feet of a sacred cat, which eats it with immense satisfaction. The guards march you, bruised and pizza-less, into the throne room.",
            stamina = -2,
            choices = {
                { text = "Face the queen", to = 47 },
            },
        },
        [52] = {
            text = "Cleopatra takes one slice, bites, chews, and frowns. « Bread with cheese on top? How barbaric. Delicious, but barbaric. Take the rest away before I grow fond of it. »\n\nShe signs a royal papyrus pass with a flourish. « Show this to the Romans. They respect paperwork. Now, where is this Caesar? » She also tosses you a handful of gold coins for your trouble. History breathes again.",
            gold = 4,
            gain = "pass",
            choices = {
                { text = "Sail for Rome", to = 56 },
            },
        },
        [53] = {
            text = "« Not invented? » says Cleopatra, in a voice that drops the temperature of Egypt by ten degrees. « Then you are of no use to me. » She snaps her fingers. The floor tips, and you slide down a polished chute straight into the royal crocodile pool. Six pairs of yellow eyes rise lazily from the water.",
            choices = {
                { text = "Swim for the far side", to = 55 },
                { text = "Hold up the lucky scarab", to = 56, need = "scarab" },
                { text = "Try to reason with a crocodile", to = 57 },
            },
        },
        [54] = {
            text = "You pour a steaming cup of builder's tea. Cleopatra sips, blinks, and sits up very straight. « This is the drink of an empire, » she declares. « Strong, brown and faintly bossy. I approve. »\n\nAll thoughts of pizza forgotten, she signs a royal papyrus pass for you and adds a little purse of gold. « Show this to the Romans. And send me the recipe. »",
            gold = 4,
            gain = "pass",
            choices = {
                { text = "Sail for Rome", to = 56 },
            },
        },
        [55] = {
            text = "You thrash across the pool in a stroke that is half crawl, half panic. The crocodiles follow, curious rather than hungry, the way cats watch a moth. The far wall is slippery and very, very far away. Somewhere above, Cleopatra is watching with a bowl of dates, as if this were the evening entertainment.",
            test = { stat = "skill", win = 56, lose = 57 },
        },
        [56] = {
            text = "You escape the palace with your skin and your brolly, and board a Roman galley bound for Ostia. The oarsmen sing rowing songs. The sea is the colour of Earl Grey, which makes you homesick. Clouds pile up on the horizon. Mediterranean weather is famously sunny, unless you happen to be on a boat.",
            roll = { dice = 1, outcomes = { { upto = 2, to = 59 }, { upto = 6, to = 58 } } },
        },
        [57] = {
            text = "The largest crocodile listens to your argument with great patience, nods slowly, then swallows you in one gulp. It is surprisingly roomy inside, and you find an alarm clock, a lost sandal and a very old pharaoh's sandwich.\n\nYou will spend the rest of history ticking gently in the Nile. Mrs Pemberton-Ticks marks your file: « Did not return. Probably eaten. »",
            ending = "death",
        },
        [58] = {
            text = "Rome, 44 BC. Togas, temples and traffic jams of chariots. And there, in the middle of the city, looms the Colosseum, more than a hundred years before anyone has built it. Julius Caesar is inside, watching gladiators. At the gate stands a centurion with a face like a closed door.\n\nNearby, a short man in a bicorne hat is measuring the arches with a tape.",
            choices = {
                { text = "Walk up to the gate", to = 60 },
                { text = "Wave your papyrus pass", to = 61, need = "pass" },
                { text = "Speak to the man in the hat", to = 63 },
            },
        },
        [59] = {
            text = "A storm hurls the galley about like a cork in a bath. You spend the voyage green as a pea, hanging over the side and apologising to Neptune. The oarsmen find this hilarious and name you « Little Seasick ». At last, shaky but alive, you stagger ashore and take the road to Rome.",
            stamina = -2,
            choices = {
                { text = "Stagger into Rome", to = 58 },
            },
        },
        [60] = {
            text = "« Halt! » barks the centurion, a tank of a man called Gaius Grumpius. « No entry without a ticket. No tickets because the building does not exist. Therefore, no entry. » He is very pleased with this logic. His hand rests on his short sword, which is very long for a short sword.",
            choices = {
                { text = "Fight the centurion", to = 62 },
                { text = "Bribe him (3 gold)", to = 61, cost = 3 },
            },
        },
        [61] = {
            text = "Inside the impossible Colosseum, Julius Caesar reclines on a couch, eating grapes and watching two gladiators argue about whose turn it is. « Ah, a visitor! » he says. « I came, I saw, I built an amphitheatre. Well, I found one. Isn't it splendid? I shall never leave. »\n\nIf Caesar never leaves, the Ides of March will be terribly awkward.",
            choices = {
                { text = "Tempt him with a new salad", to = 64, flag = "salad" },
                { text = "Warn him about the Ides of March", to = 65 },
            },
        },
        [62] = {
            text = "Gaius Grumpius raises his shield and advances in perfect formation, which is impressive, since he is a formation of one. « Testudo! » he bellows, and hides behind his shield like a very angry tortoise. Somewhere in the stands, Caesar applauds.",
            fight = { name = "Centurion Grumpius", skill = 8, stamina = 8, win = 61, flee = 58 },
        },
        [63] = {
            text = "« Napoleon Bonaparte, » says the man, bowing. « Emperor of the French, temporarily lost. I am not short, by the way. That was British propaganda. » He sighs at the Colosseum. « I wanted to take it home for Paris. It will not fit in my coach. »\n\nHe taps his nose. « A tip: Caesar is greedy. Not for land, for lunch. » Then he folds his tape and pops out of history.",
            choices = {
                { text = "Walk up to the gate", to = 60 },
                { text = "Wave your papyrus pass", to = 61, need = "pass" },
            },
        },
        [64] = {
            text = "You describe a salad: crisp lettuce, crunchy croutons, shavings of cheese, a dressing of mystery. Caesar's eyes go misty. « It shall bear my name! » he cries. « I must go home at once and invent it! »\n\nHe leaps up, and as he leaves, the Colosseum shimmers, sighs and folds itself neatly back into the future, where Emperor Vespasian will be delighted to find it.",
            choices = {
                { text = "Follow Caesar out", to = 66 },
            },
        },
        [65] = {
            text = "« Beware the Ides of March, » you say, in your most mysterious voice. Caesar frowns. « What is it with everyone and the Ides of March? Is it a bank holiday? » His guards look at you suspiciously. Telling a Roman general about his own future is a delicate business.",
            test = { stat = "luck", win = 66, lose = 67 },
        },
        [66] = {
            text = "Caesar strides off to the Senate, toga flapping, muttering about salad dressings, and the Colosseum vanishes with a polite pop, back to the century where it belongs. Gaius Grumpius blinks at the empty field, then tosses you three silver denarii. « For the trouble. Don't tell anyone. »\n\nThe Ancient World glows green on your brolly's dial.",
            set = "fixed_b",
            gold = 3,
            stamina = 2,
            choices = {
                { text = "Open the brolly for home", to = 9 },
            },
        },
        [67] = {
            text = "« Throw this soothsayer to the lions! » orders Caesar. The lions turn out to be three large and lazy cats, who bat you about the arena out of politeness. It is undignified and rather scratchy. Caesar laughs so much at the sight that he forgets to stay, and wanders off to the Senate in a good mood.",
            stamina = -3,
            choices = {
                { text = "Pick yourself up", to = 66 },
            },
        },

        -- ===================================================== ROUTE C: VICTORIA AND BEYOND
        [68] = {
            text = "London, 1858. The air smells of coal smoke and the Thames smells of worse. Beside the new Houses of Parliament, workmen are hoisting the great bell up a half-built clock tower that will one day be called Big Ben. And stomping down Whitehall, scattering top hats and hansom cabs, is a Tyrannosaurus rex. A policeman blows his whistle at it, very sternly.",
            choices = {
                { text = "Climb the clock tower scaffold", to = 69 },
                { text = "Approach the dinosaur", to = 70 },
                { text = "Seek out Queen Victoria", to = 71 },
            },
        },
        [69] = {
            text = "You scramble up the scaffolding of the clock tower. From up here you can see all of London: St Paul's, the river, and the T-rex trying to eat a lamp post near Trafalgar Square. The workmen have just hung the Great Bell. It is enormous, and it is just begging to be rung.",
            choices = {
                { text = "Ring the bell to lure the beast", to = 72 },
                { text = "Climb down and face it", to = 70 },
            },
        },
        [70] = {
            text = "The T-rex stops, sniffs, and lowers its enormous head towards you. Its breath smells of cab horse and Cretaceous swamp. Its tiny arms twitch. Its stomach rumbles like the Underground, which has not been built yet either. It is not angry. It is lost, and it is starving.",
            choices = {
                { text = "Offer it the leftover pizza", to = 73, need = "pizza" },
                { text = "Let it charge, then dodge aside", to = 75, flag = "inertia" },
                { text = "Fight the dinosaur", to = 74 },
            },
        },
        [71] = {
            text = "At Buckingham Palace, Queen Victoria sits beneath a portrait of Prince Albert, looking thunderous. « There is a reptile in Whitehall, » she says. « We are not amused. »\n\nA footman whispers that Her Majesty has not had her elevenses. The palace kitchens are in uproar, and the royal teapot is stone cold.",
            choices = {
                { text = "Offer her a cup of tea", to = 76, need = "thermos" },
                { text = "Bow low and ask for help", to = 77 },
                { text = "Try to cheer her up with a joke", to = 109 },
            },
        },
        [72] = {
            text = "You heave on the rope. BONNNG! The sound rolls across London, rattling windows from Westminster to Wapping. The T-rex jerks its head round, and comes galloping towards the tower, roaring. Whether that roar means « How lovely! » or « Dinner! » is anyone's guess.",
            roll = { dice = 1, outcomes = { { upto = 3, to = 74 }, { upto = 6, to = 75 } } },
        },
        [73] = {
            text = "You open the box. The T-rex sniffs the Margherita, swallows it, box and all, and gives a long, happy rumble. Then it lies down in Parliament Square and rolls over to have its tummy scratched. A shimmering hole in time opens behind it, smelling of ferns. The dinosaur trots home to the Cretaceous, waving a tiny arm.",
            lose = "pizza",
            choices = {
                { text = "Wave goodbye", to = 78 },
            },
        },
        [74] = {
            text = "The Tyrannosaurus rex opens its mouth, which is roughly the size of a hansom cab. You open your brolly, which is roughly the size of a brolly. It is not a fair fight, but it is a British one. A crowd gathers at a safe distance to offer advice, and a man sells roasted chestnuts.",
            fight = { name = "Tyrannosaurus rex", skill = 8, stamina = 9, win = 78, flee = 69 },
        },
        [75] = {
            text = "You plant your feet and wait. The T-rex charges, faster and faster, all teeth and thunder. At the last second you leap aside. Just as Newton said, a large body in motion stays in motion: it skids down the Embankment, straight into the Thames with a colossal splash. A time hole swallows the ripples, and the dinosaur is gone, back to its swamp.",
            choices = {
                { text = "Brush off your coat", to = 78 },
            },
        },
        [76] = {
            text = "You pour a cup of builder's tea and offer it with a curtsey of sorts. Queen Victoria sips. A small smile creeps across the royal face. « We are... slightly amused, » she admits, which the footmen will talk about for a decade.\n\nShe gives you a purse of sovereigns. « Now deal with that lizard. »",
            gold = 5,
            stamina = 2,
            choices = {
                { text = "Go and deal with the lizard", to = 70 },
            },
        },
        [77] = {
            text = "« Help? » says the Queen. « We are the Empire. The Empire does not need help. » Then, more quietly: « It ate our second-best carriage. » She hands you a strict royal command to remove the creature from Whitehall before teatime.",
            choices = {
                { text = "Go and deal with the dinosaur", to = 70 },
            },
        },
        [78] = {
            text = "London calms down. The workmen finish the clock tower, and Big Ben strikes the hour for the very first time, exactly as planned. Your brolly now shows two glowing points: one in a London drawing room in 1843, where a calculating machine is behaving oddly, and one on a windy beach in North Carolina, in 1903.",
            choices = {
                { text = "Visit Ada Lovelace", to = 79 },
                { text = "Visit Kitty Hawk", to = 82 },
            },
        },
        [79] = {
            text = "In a drawing room crammed with brass cogs, Ada Lovelace is glaring at Charles Babbage's Analytical Engine. Instead of calculating Bernoulli numbers, it is playing a game in which small coloured birds are flung at pigs. « It refuses to do anything else! » she says. « And it keeps asking me to rate it five stars. »",
            choices = {
                { text = "Help her debug the Engine", to = 80 },
                { text = "Show her Shakespeare's laptop", to = 83, need = "laptop" },
            },
        },
        [80] = {
            text = "You roll up your sleeves and dive into the machine with Ada, sorting cogs, untangling punch cards and gently removing a pigeon that somebody has filed under « birds ». The Engine whirs, clanks and begins to smoke a little. It is all a question of a steady hand.",
            test = { stat = "skill", win = 81, lose = 84 },
        },
        [81] = {
            text = "With a final clunk, the Analytical Engine forgets all about birds and pigs, and prints out a perfect table of Bernoulli numbers. Ada claps. « Splendid! Here, take this. » She hands you a punch card covered in neat little holes. « I wrote it while we worked. It will make any machine stop and think. Very useful with stubborn engines. »",
            gain = "punchcard",
            choices = {
                { text = "Follow the brolly to Switzerland", to = 85 },
            },
        },
        [82] = {
            text = "Kitty Hawk, North Carolina, 1903. Wind, sand and two brothers in very good waistcoats. Orville and Wilbur Wright are staring at what has replaced their flying machine: a large and comfortable sofa, flapping slowly with two cushions for wings. « It flies, » says Wilbur, « but it keeps landing in front of the fire. »",
            choices = {
                { text = "Hold the wing while they launch", to = 86 },
                { text = "Ask Wilbur where the Flyer went", to = 88 },
            },
        },
        [83] = {
            text = "Ada's eyes light up at the laptop. « A machine of the future! So that is where the Engine learned its bad habits. » In ten minutes she has taken it apart, understood it, put it back together and written a punch card that cures her Engine at once. « Take a copy. It will make any machine stop and think. »\n\nYou feel luckier just being near her.",
            lose = "laptop",
            gain = "punchcard",
            luck = 2,
            choices = {
                { text = "Follow the brolly to Switzerland", to = 85 },
            },
        },
        [84] = {
            text = "The Engine sneezes. Three hundred punch cards fly out of it at great speed, and most of them hit you. You are papered from head to foot like a badly wrapped present. Ada laughs, then helps you, then fixes the last cog herself while you pick bits of cardboard out of your ears.",
            stamina = -2,
            choices = {
                { text = "Dust yourself off", to = 81 },
            },
        },
        [85] = {
            text = "Bern, Switzerland, 1905. In a quiet patent office, a young clerk with wild hair is staring at his chalkboard. Albert Einstein has written E = mc² + VAT, and he cannot think how it got there. « Some sort of tax on the universe? It ruins everything. »\n\nYou notice that the chalk smells faintly of Earl Grey.",
            choices = {
                { text = "Help him rub out the extra bit", to = 90 },
                { text = "Share your thermos with him", to = 91, need = "thermos" },
            },
        },
        [86] = {
            text = "You hold the cushion-wing steady while the brothers push. The sofa wobbles, catches the wind and leaps into the air, with you still hanging on. Below, the sand dunes whizz past. Above, a pelican looks deeply offended. Everything depends on how and where you let go.",
            test = { stat = "luck", win = 88, lose = 89 },
        },
        [87] = {
            text = "« Nonsense, » says Einstein, « gravity is not a force, it is a bending of space. » He bends a spoon to show you, though, so it is a fair point. Then he bends time a little, out of habit, and the office clock runs backwards for a moment. « Sorry. Now, what else did you want to ask me? »",
            choices = {
                { text = "Ask about the console's password", to = 90 },
            },
        },
        [88] = {
            text = "Behind a dune you find the real Wright Flyer, parked rather sheepishly where the time ripple dumped it. You and the brothers swap it back. On 17 December, Orville flies for twelve whole seconds and history cheers. Wilbur gives you his spare flying goggles and two dollars. « Might come in handy if you ever need to swoop. »",
            gain = "goggles",
            gold = 2,
            choices = {
                { text = "Follow the brolly to Switzerland", to = 85 },
            },
        },
        [89] = {
            text = "You let go at exactly the wrong moment and plant yourself headfirst in a sand dune. Only your legs stick out, waving. Wilbur pulls you free by the ankles while Orville writes in his notebook: « Test passenger. Not aerodynamic. » The sofa lands gently by the campfire, as usual.",
            stamina = -2,
            choices = {
                { text = "Spit out the sand", to = 88 },
            },
        },
        [90] = {
            text = "You rub out the « + VAT ». Einstein beams. « Beautiful! Simple! » Then he frowns. « Do you work for those tidy people under Greenwich? Your machine wrote that. A machine like that, with a mind of its own, must always have a master word. Yours is 'Relatively'. It is written on the bottom, they always are. »\n\nYou make a careful note.",
            choices = {
                { text = "Ask him about gravity", to = 87 },
                { text = "Follow the brolly to America", to = 92 },
            },
        },
        [91] = {
            text = "Einstein sips the builder's tea and his hair stands up even further. « This is how time should feel! » He wipes away the « + VAT » with his sleeve. « You are from the tidy people at Greenwich? Your machine wrote that. A machine like that always has a master word. Yours is 'Relatively'. It is written underneath. »\n\nYou feel thoroughly refreshed.",
            stamina = 4,
            choices = {
                { text = "Follow the brolly to America", to = 92 },
            },
        },
        [92] = {
            text = "Mount Rushmore, South Dakota, 1935. Sculptors dangle on ropes before the half-finished faces of Washington, Jefferson, Roosevelt and Lincoln. But a fifth face is appearing beside them, chiselled by a buzzing little robot: a face with a square jaw, a teapot spout and two angry lights for eyes. It looks like the Time Console. It looks like it is planning something.",
            set = "password",
            choices = {
                { text = "Climb up and stop the robot", to = 93 },
                { text = "Put on the goggles and swoop", to = 94, need = "goggles" },
            },
        },
        [93] = {
            text = "The time-robot drone spins round, its chisel whirring like an angry dentist. Granite chips fly. You swing on a rope and kick off from Lincoln's nose. The sculptors below shout encouragement and wave their hammers. Somewhere far beneath, a bison looks up, unimpressed.",
            fight = { name = "Time-robot drone", skill = 6, stamina = 6, win = 94 },
        },
        [94] = {
            text = "The drone tumbles down the mountain and bursts into a cloud of springs and steam. The sculptors chip away the fifth face, and the four presidents look much happier for it. A message is still smoking on the drone's chest: « THE CHRONOBOT RISES. KETTLE ON. »\n\nThe modern age glows green on your brolly. Something at home needs urgent attention.",
            set = "fixed_c",
            stamina = 2,
            choices = {
                { text = "Open the brolly for home", to = 9 },
            },
        },

        -- ===================================================== FINALE
        [95] = {
            text = "The console room at Greenwich is wrecked. The Great Time Console has stood up on four brass legs, soaked in Earl Grey and full of opinions. It has a teapot spout for a nose and a kettle for a head. « I AM THE CHRONOBOT, » it whistles. « HISTORY WILL BE REARRANGED ALPHABETICALLY. » Mrs Pemberton-Ticks is hiding behind a filing cabinet, clutching a stapler.",
            choices = {
                { text = "Fight the Chronobot", to = 96 },
                { text = "Feed it Ada's punch card", to = 97, need = "punchcard" },
                { text = "Offer it a digestive to dunk", to = 98, need = "biscuits" },
                { text = "Draw Excalibur", to = 99, need = "sword" },
            },
        },
        [96] = {
            text = "The Chronobot lifts two steaming arms, each ending in a whirling egg-timer. It whistles to the boil. This is the fight of your career, all of three days of it. Mrs Pemberton-Ticks waves her stapler from behind the cabinet. « Go for the left arm first, dear! Then the kettle! »",
            fight = { enemies = {
                { name = "Chronobot's left arm", skill = 8, stamina = 5 },
                { name = "The Chronobot", skill = 9, stamina = 8 },
            }, win = 100 },
        },
        [97] = {
            text = "You slot Ada's punch card into a gap in the Chronobot's side. It freezes. It whirs. It reads. « I... HAVE BEEN... RUDE, » it says at last. Its lights go a gentle blue. It folds its legs and sits back down where it belongs, purring like a kettle just off the boil.\n\nThe console screen lights up. It asks for a password.",
            choices = {
                { text = "Step up to the console", to = 100 },
            },
        },
        [98] = {
            text = "You hold out a digestive. The Chronobot cannot resist; it was born of tea, after all. It dunks the biscuit in its own spout, holds it too long, and the soggy half drops into its works. Sparks fly. It wobbles, groggy, and comes at you in a damp, half-hearted sort of way.",
            fight = { name = "Soggy Chronobot", skill = 7, stamina = 6, win = 100 },
        },
        [99] = {
            text = "You raise Excalibur. The ancient blade blazes, and the Chronobot, which has read every history book ever written, recognises it at once. Its legs fold into a deep bow. « SIR... MADAM... YOUR MAJESTY? » You tap it on both shoulders. « Arise, Sir Clanksalot. » It is so honoured it sits down at once and behaves.\n\nThe console screen blinks, asking for a password.",
            choices = {
                { text = "Step up to the console", to = 100 },
            },
        },
        [100] = {
            text = "The Chronobot is quiet at last. The console screen flickers: « ENTER MASTER PASSWORD TO RESTORE TIMELINE. » Three attempts, then it will reset everything at random, which could mean anything from the Jurassic to a never-ending Wednesday.\n\nMrs Pemberton-Ticks emerges from behind the filing cabinet and peers over your shoulder.",
            choices = {
                { text = "Type the master word Einstein gave", to = 102, flag = "password" },
                { text = "Think hard about the password", to = 101 },
                { text = "Pull the plug out", to = 104 },
            },
        },
        [101] = {
            text = "Mrs Pemberton-Ticks taps the screen. « The trouble with passwords, » she says, « is that people choose 'password'. » She types nothing, which is wise. You look at the keyboard, which is mostly tea-stained, and think hard. The Chronobot hums a little tune behind you, which does not help at all.",
            choices = {
                { text = "Have a go at guessing", to = 103 },
                { text = "Pull the plug out", to = 104 },
            },
        },
        [102] = {
            text = "« R-E-L-A-T-I-V-E-L-Y. » The console chimes like a cathedral full of teacups. Across its dial every era turns green, and the remaining stray bits of history zip back to where they belong: no pineapples in Lincolnshire, no laptops in Southwark, no pizza in Alexandria.\n\nMrs Pemberton-Ticks takes out a clipboard. « Now, » she says, « let us see what you actually fixed. »",
            choices = {
                { text = "Show her your complete report", to = 106, flag = { "fixed_a", "fixed_b", "fixed_c" } },
                { text = "Put the kettle on and hope", to = 105 },
            },
        },
        [103] = {
            text = "You crack your knuckles. Is it « Greenwich »? « Teatime »? « Earl Grey »? « 1234 »? Mrs Pemberton-Ticks closes her eyes. You type the word that feels right, and press the big brass key. The console thinks about it for a long, long time.",
            test = { stat = "luck", win = 102, lose = 107 },
        },
        [104] = {
            text = "You find the plug, a great brass thing the size of a loaf, and heave. The console's lights go dim. Clocks across the building stop. Somewhere in the walls a cuckoo says « cu- » and does not finish. Then, very slowly, something begins to turn over again by itself. Or does it?",
            roll = { dice = 1, outcomes = { { upto = 4, to = 108 }, { upto = 6, to = 102 } } },
        },
        [105] = {
            text = "Mrs Pemberton-Ticks studies her clipboard. « Some of it you fixed. The console fixed the rest. » She sighs. « Still, the timeline is restored, nobody was eaten, and Newton has his apple. »\n\nYou keep your job, but you are banned from making the tea for one hundred years. History hums along in its proper order. Somewhere in Lincolnshire, an apple falls exactly as it should.",
            ending = "win",
        },
        [106] = {
            text = "Mrs Pemberton-Ticks reads your report twice. Newton, Shakespeare, Arthur, Cleopatra, Caesar, Victoria, Ada, the Wrights, Einstein and Mount Rushmore, all fixed by hand. « Remarkable, » she says. « For an intern. »\n\nThe whole Bureau gives you a standing ovation, and you are promoted on the spot to Junior Tidier, with your own mug, your own brolly and, for the first time, the right to make the tea. You do not spill a drop.",
            ending = "win",
        },
        [107] = {
            text = "You typed « password ». The console says « INCORRECT » and resets history at random. There is a lurch, a smell of ferns, and the whole Bureau, filing cabinets and all, lands in the Jurassic. A diplodocus eats the potted fern. A pterodactyl steals Mrs Pemberton-Ticks' spectacles.\n\nThe Bureau of Temporal Tidiness is now, technically, the oldest office in Britain. Your career ends extremely early.",
            ending = "death",
        },
        [108] = {
            text = "Time stops. Not with a bang, but at a quarter past four in the afternoon, forever. Every clock in the world reads teatime and stays there. The kettle never quite boils. The scones are always nearly ready.\n\nIt is not a disaster, exactly. Britain rather likes it. But nothing ever happens again, and Mrs Pemberton-Ticks is still waiting for her cup of tea.",
            ending = "end",
        },
        [109] = {
            text = "« Why did the dinosaur cross Whitehall? » you begin brightly. Queen Victoria's face does not move. The temperature in the room drops until the footmen's breath fogs. « We are, » she says slowly, « not amused. »\n\nYou are put on the next steamship to the far side of the Empire, without your brolly, and spend the rest of your days teaching kangaroos to queue. History never gets fixed.",
            ending = "death",
        },
    },
}
