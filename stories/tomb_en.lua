return {
    title       = "Cleopatra’s Cat",
    author      = "Gamebook",
    lang        = "en",
    blurb       = "Egypt, 40 BC: the queen’s cat has strolled into a cursed tomb. Fetch it back before the royal banquet.",
    sheet       = true,
    start       = 1,
    start_gold  = 5,
    start_items = { "royal_seal", "reed_pen", "lamp" },
    items = {
        royal_seal = "Cleopatra’s royal seal",
        reed_pen   = "Scribe’s reed pen",
        lamp       = "Oil lamp",
        fish       = "Dried Nile perch",
        mirror     = "Polished bronze mirror",
        catnip     = "Sacred catnip",
        linen      = "Roll of fine linen",
        ankh       = "Golden ankh",
        collar     = "Collar of Bastet",
    },
    sections = {
        [1] = {
            text = "Alexandria, 40 BC. You are an apprentice scribe with inky fingers and big dreams, and you have just been summoned to the palace. Queen Cleopatra VII looks down from her throne, which is never a good sign.\n\n“My cat, Ptolemeow the Thirteenth, has stowed away in a crate bound for a newly opened tomb in the Valley of the Kings,” she says. “My banquet is in three days. He sits at my right hand. Bring him back, little scribe.”",
            choices = {
                { text = "Bow deeply and set off at once", to = 2 },
                { text = "Ask what the cat is like", to = 3 },
            },
        },
        [2] = {
            text = "You step out into the bright streets of Alexandria, the cleverest city in the world. Gulls wheel over the harbour, the smell of grilled fish drifts from the Canopic Way, and the great Lighthouse winks on its island.\n\nThe Valley of the Kings is a long way up the Nile, and the tide will not wait. You have time for one errand on the way to the harbour. Choose it wisely.",
            choices = {
                { text = "Visit the Great Library", to = 4 },
                { text = "Cross to the Lighthouse of Pharos", to = 7 },
                { text = "Stroll down to the market", to = 9 },
                { text = "Head straight for the harbour", to = 13 },
            },
        },
        [3] = {
            text = "The queen sighs fondly. “Ptolemeow is a pure-bred Egyptian Mau, descended from the sacred cats of Bubastis. He is proud, clever and spoiled rotten. He adores catnip and loathes Mark Antony, who once sat on him.”\n\nShe leans closer. “And he speaks. Not aloud, of course. Inside your head. If he deigns to talk to you, call him Ptolemeow, never ‘puss’. The last servant who said ‘puss’ still has scratches.”",
            set = "cat_lore",
            choices = {
                { text = "Promise to be polite and set off", to = 2 },
            },
        },
        [4] = {
            text = "The Great Library swallows you in a hush of half a million scrolls. Didymus the librarian, nicknamed Bronze-Guts because he has written three thousand five hundred books and still never finishes lunch, peers at you over a pile of papyrus.\n\n“Cats? Tombs? Riddles? Third shelf from the left, beside the scroll a lady called Hypatia will re-catalogue in about four hundred years. Don’t ask me how I know. Librarians just know.”",
            choices = {
                { text = "Read the Scroll of Sphinx Riddles", to = 5 },
                { text = "Earn a few coins copying scrolls", to = 6 },
            },
        },
        [5] = {
            text = "The scroll is titled ‘Everything the Sphinx Has Ever Asked, With Answers, Do Not Tell the Sphinx’. You read it twice and memorise the best riddle:\n\n“I have cities but no houses, rivers but no water, and roads but no carts. What am I?” The answer, scribbled in the margin by some cheeky scholar, is ‘a map’. Underneath, someone has added: ‘He also likes jokes about cheese.’ You file that away too.",
            set = "riddle_lore",
            choices = {
                { text = "Hurry down to the harbour", to = 13 },
                { text = "Cut through the market on the way", to = 9 },
            },
        },
        [6] = {
            text = "Didymus sets you to copying a very long treatise on the correct way to boil lentils. Your hand cramps, your eyes cross, and by the end you know more about lentils than any human ought to.\n\n“Splendid penmanship,” says Didymus, dropping four bronze coins into your palm. “If you ever tire of chasing cats, there is always a desk for you here.”",
            gold = 4, stamina = -1,
            choices = {
                { text = "Hurry down to the harbour", to = 13 },
                { text = "Cut through the market on the way", to = 9 },
            },
        },
        [7] = {
            text = "You take the causeway to Pharos island and gape up at the Lighthouse, one of the Seven Wonders of the World. A tired old keeper is polishing the giant bronze mirror at the very top, which reflects the sun by day and the fire by night.\n\n“Three hundred steps,” he wheezes, “and my knees hate every one. Lend us a hand, youngster, and I’ll make it worth your while.”",
            choices = {
                { text = "Help polish the great mirror", to = 8 },
                { text = "Wave politely and head for the harbour", to = 13 },
            },
        },
        [8] = {
            text = "You scrub and buff until you can see your own nose shining in the great mirror, along with three seagulls and most of the Mediterranean.\n\nThe keeper beams and shares his lunch with you. Then he hands you a small polished bronze mirror and a strip of dried Nile perch. “Mirrors put light where it’s needed. And fish puts a crocodile in a good mood. Trust an old sailor on both.”",
            gain = { "mirror", "fish" }, stamina = 2,
            choices = {
                { text = "Thank him and head for the harbour", to = 13 },
                { text = "Cut through the market on the way", to = 9 },
            },
        },
        [9] = {
            text = "The market on the Canopic Way is a glorious muddle of dates, figs, spices, honey cakes and shouting. A perfume seller swears her catnip was grown in Bastet’s own temple garden. A weaver offers linen so fine you could read through it.\n\nAt the end of the street, the marble statue of Julius Caesar stands looking noble, despite the pigeon on his head.",
            choices = {
                { text = "Buy sacred catnip (2 gold)", to = 10, cost = 2 },
                { text = "Buy a roll of fine linen (2 gold)", to = 11, cost = 2 },
                { text = "Walk over to Caesar’s statue", to = 12 },
                { text = "Go on to the harbour", to = 13 },
            },
        },
        [10] = {
            text = "The perfume seller wraps a pinch of grey-green leaves in a scrap of papyrus. “One sniff and any cat will forgive you anything,” she promises. “Even Mark Antony.”\n\nYou tuck the packet into your belt. It smells faintly of mint and mischief.",
            gain = "catnip",
            choices = {
                { text = "Walk over to Caesar’s statue", to = 12 },
                { text = "Go on to the harbour", to = 13 },
            },
        },
        [11] = {
            text = "The weaver measures out a long roll of shimmering linen and winds it neatly round a stick. “Best in Egypt,” he says. “The pharaohs used to be wrapped in this. Well, the dead ones.”\n\nYou thank him, trying not to think too hard about it.",
            gain = "linen",
            choices = {
                { text = "Walk over to Caesar’s statue", to = 12 },
                { text = "Go on to the harbour", to = 13 },
            },
        },
        [12] = {
            text = "Beside Caesar’s statue, a handsome Roman in a crumpled toga is rehearsing a speech. “Friends, Alexandrians, countrymen, lend me your... ow!” He steps backwards straight into the fountain.\n\nIt is Mark Antony himself. He climbs out, dripping, and grins. “Cleopatra’s cat? That monster bit my toe. Still, she’ll be thrilled if I help. My royal barge sails up the Nile tonight. Hop aboard, scribe!”",
            set = "met_antony",
            choices = {
                { text = "Promise to meet him at the harbour", to = 13 },
            },
        },
        [13] = {
            text = "The Great Harbour bustles with ships from Rome, Rhodes and Carthage. Three ways south present themselves.\n\nMark Antony’s gilded barge bobs at the quay, flags flapping. A dusty caravan of camels is setting off overland past Giza, free to anyone who will hold a camel. And a fat grain boat is heading upriver to Thebes, its captain asking three coins a head.",
            choices = {
                { text = "Board Mark Antony’s royal barge", to = 14, flag = "met_antony" },
                { text = "Join the camel caravan", to = 28 },
                { text = "Pay for the grain boat (3 gold)", to = 45, cost = 3 },
            },
        },
        [14] = {
            text = "The royal barge is a floating party: purple sails, silver oars, a harpist and a stack of figs taller than you. Mark Antony insists on steering it himself.\n\n“How hard can it be?” he cries, as you narrowly miss a fishing boat, a hippo and the city of Memphis. The captain covers his eyes. Ahead, the Nile bends sharply around a sandbank.",
            choices = {
                { text = "Offer to take the tiller", to = 15 },
                { text = "Lounge back and eat figs", to = 16 },
            },
        },
        [15] = {
            text = "“Allow me, General,” you say, and grab the tiller just as the sandbank looms. The barge groans. The harpist hits a very wrong note. Everything depends on your steady scribe’s hands. Mark Antony shouts helpful advice such as “Left! No, the other left!” and the captain begins to pray loudly to Hapi, god of the Nile flood.",
            test = { stat = "skill", win = 17, lose = 18 },
        },
        [16] = {
            text = "You decide that steering is Mark Antony’s business and figs are yours. They are sweet, sticky and wonderful, and you eat eleven. You feel marvellous.\n\nThen you hear a crunch, a splash and a Roman swear word. The barge lurches, you roll across the deck and the figs go everywhere.",
            stamina = 3,
            choices = {
                { text = "Scramble to your feet", to = 18 },
            },
        },
        [17] = {
            text = "With a deft twist you guide the barge around the sandbank, past a sleepy crocodile and on up the river. Mark Antony claps you so hard on the back that you nearly fall overboard.\n\n“Brilliant! You must teach me sometime. Here, have some pocket money.” He drops three coins into your hand. Days slide by in a blur of palms and temples, until the great pylons of Thebes appear on the east bank.",
            gold = 3,
            choices = {
                { text = "Stop at the temple of Karnak", to = 46 },
                { text = "Hurry on to the Valley of the Kings", to = 57 },
            },
        },
        [18] = {
            text = "The barge is stuck fast on the sandbank. Your reed pen has rolled overboard and floats away towards the Mediterranean. Worse, a huge crocodile is gliding towards you, grinning with far too many teeth.\n\n“That’s Sobek’s nephew,” whispers the captain. “He eats anything that falls off a boat. Mostly Romans.” Mark Antony hides behind the harpist.",
            lose = "reed_pen",
            choices = {
                { text = "Fight the crocodile with an oar", to = 19 },
                { text = "Toss him your dried fish", to = 20, need = "fish" },
                { text = "Hop across the crocodiles to shore", to = 21 },
            },
        },
        [19] = {
            text = "You grab a silver oar and swing it like a club. The crocodile snaps, you bonk, he snaps again, you bonk harder. The harpist plays a stirring battle tune. Mark Antony cheers you on from a safe distance, which is to say from inside a basket of figs.",
            fight = { name = "Nile Crocodile", skill = 7, stamina = 8, win = 22, flee = 23 },
        },
        [20] = {
            text = "You fling the dried perch as far as you can. The crocodile catches it in mid-air, chews thoughtfully and gives you a long, toothy look that might be gratitude.\n\nThen he puts his shoulder to the barge and shoves it off the sandbank, as if to say ‘and don’t come back’. The keeper of the Lighthouse was right. Fish works wonders.",
            choices = {
                { text = "Wave goodbye and sail on", to = 22 },
            },
        },
        [21] = {
            text = "Several more crocodiles have joined the first, lying side by side like a scaly bridge. You take a deep breath, gather your skirts and leap from back to back. Hop. Hop. Wobble. Hop. Below you, the Nile churns and bubbles. Behind you, Mark Antony shouts “Bravo!” and then, less helpfully, “Mind the big one!”",
            test = { stat = "luck", win = 22, lose = 24 },
        },
        [22] = {
            text = "Peace returns to the Nile. Mark Antony emerges from behind the harpist, announces that he had the situation under control all along, and orders a celebration lunch of roast duck and bread.\n\nYou eat well. Days later the great pylons of Thebes rise on the east bank, and across the river, the cliffs that hide the Valley of the Kings glow pink in the evening sun.",
            stamina = 2,
            choices = {
                { text = "Stop at the temple of Karnak", to = 46 },
                { text = "Hurry on to the Valley of the Kings", to = 57 },
            },
        },
        [23] = {
            text = "You drop the oar and dive into the papyrus reeds, splashing like a startled duck. The crocodile, insulted at being abandoned mid-fight, snaps once at your sandal and gives up.\n\nYou are muddy, bruised and alone. The barge has gone on without you, Mark Antony’s singing fading into the distance.",
            stamina = -2,
            choices = {
                { text = "Wade through the reeds", to = 25 },
            },
        },
        [24] = {
            text = "Hop. Hop. Wob... The last crocodile is not a crocodile at all but a very large crocodile’s mouth. It closes gently around you, like a scaly tent.\n\nFrom somewhere very far away, a haughty voice sounds inside your head: “Honestly. Eaten by a crocodile on day one. I would have hired a better servant.” The crocodile burps out your sandal, which is all that ever reaches Thebes.",
            ending = "death",
        },
        [25] = {
            text = "Among the reeds you find a little papyrus skiff, abandoned by some fisherman. You climb aboard and push off with a stick, hoping the current will be kind. The river is wide and lazy and full of very large shapes that might be logs.",
            roll = { dice = 1, outcomes = { { upto = 2, to = 26 }, { upto = 6, to = 27 } } },
        },
        [26] = {
            text = "One of the logs yawns. It is a hippopotamus, and you have just paddled into its mouth. It sneezes you out, skiff and all, high into the air.\n\nYou land with a splash on the riverbank. Your oil lamp has gone, presumably to light the inside of a hippo.",
            stamina = -2, lose = "lamp",
            choices = {
                { text = "Squelch onwards", to = 27 },
            },
        },
        [27] = {
            text = "Days of drifting, nibbling wild dates and waving at farmers bring you at last to Thebes. On the east bank rise the colossal temples of Karnak. On the west bank, beyond the fields, the dry cliffs hide the Valley of the Kings.\n\nA kind fisherman’s wife feeds you bread and onions and points the way.",
            stamina = 2,
            choices = {
                { text = "Visit the temple of Karnak", to = 46 },
                { text = "Hurry on to the Valley of the Kings", to = 57 },
            },
        },
        [28] = {
            text = "The caravan master hands you the reins of a camel named Hump-tah-hotep, who spits, grumbles and steps on your foot all the way to Giza.\n\nAt dawn the three great pyramids appear, enormous and golden against the sky. Beside them, the Great Sphinx crouches in the sand. The caravan stops to rest the camels until noon.",
            choices = {
                { text = "Go and greet the Sphinx", to = 29 },
                { text = "Climb the Great Pyramid", to = 33 },
            },
        },
        [29] = {
            text = "As you approach, the Sphinx opens one stone eye. “A visitor! At last! Do you know how dull it is out here? Nothing but sand and tourists from Greece.”\n\nIt stretches, scattering pigeons. “Answer my riddle and I shall reward you. Fail, and you stay and keep me company. Forever. Now: what has cities but no houses, rivers but no water, and roads but no carts?”",
            choices = {
                { text = "Give the answer from the Library scroll", to = 31, flag = "riddle_lore" },
                { text = "Take a wild guess", to = 30 },
                { text = "Run back to the camels", to = 32 },
            },
        },
        [30] = {
            text = "You scratch your head, look at the pyramids for inspiration, and open your mouth, hoping something clever will fall out of it. The Sphinx drums its enormous stone claws on the sand. Somewhere nearby, a pigeon holds its breath, and so does a camel.",
            test = { stat = "luck", win = 31, lose = 34 },
        },
        [31] = {
            text = "“A map!” you cry. The Sphinx purrs so loudly that a pyramid shakes.\n\n“Correct! Here is your reward.” It nudges four ancient coins out of the sand with its paw. “And a secret. The stone guardians in royal tombs were all carved by my cousins. Tell one the password ‘Cheese-on-toast’ and it will let you pass. We sphinxes have a sense of humour.”",
            gold = 4, set = "sphinx_password",
            choices = {
                { text = "Bow and return to the caravan", to = 36 },
            },
        },
        [32] = {
            text = "You turn and run. The Sphinx sighs a sigh like a sandstorm, which knocks you flat on your face.\n\n“Nobody ever stays for the second riddle,” it grumbles, closing its eye again. You pick sand out of your ears, your nose and several places you did not know you had, then stumble back to Hump-tah-hotep.",
            stamina = -2,
            choices = {
                { text = "Ride on with the caravan", to = 36 },
            },
        },
        [33] = {
            text = "The Great Pyramid of Khufu is the tallest building in the world, and it was not designed for climbing. Each block is the size of a cow. You start hauling yourself up, cow after cow, while the camels watch with interest.",
            test = { stat = "skill", win = 37, lose = 38 },
        },
        [34] = {
            text = "“A... a big lizard?” you say. The Sphinx winces. “Wrong. But I am generous. One last riddle.\n\n“The more you take, the more you leave behind. What am I?”\n\nThe sun beats down. A vulture lands nearby, hopefully. The Sphinx smiles a very old, very patient smile and waits.",
            choices = {
                { text = "Answer: footsteps", to = 31 },
                { text = "Answer: a crocodile", to = 35 },
                { text = "Answer: Mark Antony’s money", to = 35 },
            },
        },
        [35] = {
            text = "“Wrong again!” booms the Sphinx happily. “Wonderful! Now you must stay and keep me company.”\n\nAnd so you do. You spend the rest of your life sitting between its paws, swapping riddles and terrible jokes about cheese. It is not a bad life, as lives go. Tourists carve your name in Greek on its toes. Ptolemeow, sadly, finds his own way home, and complains about you for years.",
            ending = "end",
        },
        [36] = {
            text = "Upriver at Saqqara, the caravan camps beside the Step Pyramid, the oldest of them all. That night a shimmering figure in a linen kilt sits down by your fire.\n\n“Imhotep,” he says, “architect, doctor, genius. I built this one. These modern pyramids, all smooth sides! Show-offs.” He is a ghost, but a very friendly one, and he seems delighted to have someone to talk to.",
            choices = {
                { text = "Ask him about the new tomb", to = 39 },
                { text = "Ask him for directions to Thebes", to = 40 },
            },
        },
        [37] = {
            text = "Puffing like a bellows, you reach the summit. All Egypt lies below: the green ribbon of the Nile, the endless gold of the desert, and a tiny Hump-tah-hotep spitting at someone.\n\nWedged between the top stones you find a golden ankh, dropped long ago by some careless priest. It is warm from the sun and hums faintly when you hold it.",
            gain = "ankh",
            choices = {
                { text = "Climb down and ride on", to = 36 },
            },
        },
        [38] = {
            text = "Halfway up, a block shifts. You slide all the way down the side of the Great Pyramid on your bottom, bump, bump, bump, a hundred and forty bumps in all, and land at the feet of Hump-tah-hotep.\n\nThe camel spits on you. It is the closest he has come to affection.",
            stamina = -2,
            choices = {
                { text = "Ride on with the caravan", to = 36 },
            },
        },
        [39] = {
            text = "Imhotep’s eyes twinkle. “The new tomb in the Valley? I advised the builder, centuries ago. Dreadful traps at the front door. But there is a workmen’s shaft behind the third rock shaped like a sleeping hippo. Nobody remembers it but me.”\n\nHe also gives you a draught of his famous medicine, which tastes of honey and old socks. You feel wonderful.",
            set = "imhotep_map", stamina = 3,
            choices = {
                { text = "Thank him and ride on", to = 40 },
            },
        },
        [40] = {
            text = "Days later, deep in the desert near Thebes, three masked figures leap from behind a dune. “Tomb robbers!” wails the caravan master, and dives under a camel.\n\n“Your money or your... um... money,” says the biggest robber, who clearly has not practised.",
            choices = {
                { text = "Fight the robbers", to = 41 },
                { text = "Pay them off (3 gold)", to = 43, cost = 3 },
                { text = "Sneak away behind a camel", to = 42 },
            },
        },
        [41] = {
            text = "The caravan master is no help, so it is you against the robbers. The first one wields a frying pan. The second wields a slightly bigger frying pan. Behind them, the third robber, who is very small, holds the coat of each in turn and shouts encouragement. Hump-tah-hotep watches the whole thing, chewing thoughtfully.",
            fight = { enemies = {
                { name = "Sneaky Sennefer", skill = 6, stamina = 5 },
                { name = "Big Bakenkhonsu", skill = 7, stamina = 6 },
            }, win = 43, flee = 44 },
        },
        [42] = {
            text = "You crouch low and tiptoe behind Hump-tah-hotep. Unfortunately, Hump-tah-hotep has opinions about being used as a hiding place. He grumbles, shuffles, and turns his head to see what you are doing back there. The robbers follow his gaze with great interest. This could go either way.",
            test = { stat = "luck", win = 43, lose = 41 },
        },
        [43] = {
            text = "The robbers vanish into the dunes. The caravan master crawls out from under his camel and declares you a hero, then charges you for the camel anyway.\n\nBy sunset you reach Thebes. Across the Nile, the mighty temples of Karnak glitter. On the far bank, the cliffs that hide the Valley of the Kings turn rose-pink.",
            stamina = 2,
            choices = {
                { text = "Visit the temple of Karnak", to = 46 },
                { text = "Hurry on to the Valley of the Kings", to = 57 },
            },
        },
        [44] = {
            text = "You flee into the desert and keep running until the robbers, the caravan and your sense of direction are all far behind. The sun hammers on your head.\n\nTo your left, far away, a thin silver line might be the Nile. To your right, much closer, shimmers an enormous fig tree with a fountain and a buffet. It looks almost too good to be true.",
            stamina = -3,
            choices = {
                { text = "Trudge towards the silver line", to = 57 },
                { text = "Run to the lovely fig tree", to = 99 },
            },
        },
        [45] = {
            text = "The grain boat is broad, slow and creaky, and it smells deliciously of bread. Captain Nakht keeps one eye on the sails and the other on his cargo, because the grain mice are bold this year.\n\nThe Nile slides past: palm groves, mud-brick villages, children waving, buffaloes wallowing.",
            choices = {
                { text = "Nap on the warm grain sacks", to = 47 },
                { text = "Help the crew row", to = 48 },
            },
        },
        [46] = {
            text = "The temple of Karnak is so big it has its own weather. You wander through the great hypostyle hall, a forest of a hundred and thirty-four stone columns, each painted with gods and kings.\n\nIn a quiet corner, an ibis is reading a scroll. Then it looks up, and you realise it has a man’s body and a very knowing expression. It is Thoth, god of writing and wisdom.",
            choices = {
                { text = "Bow and ask Thoth for help", to = 49 },
                { text = "Try to count the columns", to = 50 },
                { text = "Hurry on to the Valley of the Kings", to = 57 },
            },
        },
        [47] = {
            text = "You curl up on the grain sacks and drift off. In your dream, a lady with a cat’s head and golden earrings sits beside you. It is Bastet, goddess of cats.\n\n“My little Ptolemeow is a naughty boy,” she purrs, “but he is mine. If you are ever in trouble, call my name, and I shall see what can be done.” You wake refreshed, with a whisker on your pillow.",
            set = "bastet_dream", stamina = 2,
            choices = {
                { text = "Stretch and watch for Thebes", to = 51 },
            },
        },
        [48] = {
            text = "You grab an oar and join the rowers, who sing a rowing song about a farmer, a goose and a misunderstanding. Keeping time is harder than it looks. Captain Nakht beats a drum, the rowers heave, and you try very hard to remember which end of the oar goes in the water. It is the flat end. Probably.",
            test = { stat = "skill", win = 52, lose = 53 },
        },
        [49] = {
            text = "Thoth peers at you with one bright bird eye. “A scribe! My favourite sort of human. Ptolemeow, is it? He came by Karnak once and knocked over my ink.”\n\nHe hands you a fresh sheet of papyrus. “Show me you can write the sign for ‘cat’ properly, and I shall teach you a secret.”",
            choices = {
                { text = "Write it with your reed pen", to = 54, need = "reed_pen" },
                { text = "Admit you have lost your pen", to = 55 },
            },
        },
        [50] = {
            text = "One, two, three... fifty-seven... eighty... Was that one already counted? The columns all look the same, and they cast shadows that move when you are not looking. You keep counting, deeper and deeper into the stone forest. Somewhere behind a column, someone chuckles in a voice like rustling papyrus.",
            roll = { dice = 1, outcomes = { { upto = 2, to = 56 }, { upto = 6, to = 49 } } },
        },
        [51] = {
            text = "After many lazy days, Captain Nakht ties up at Thebes. On the east bank tower the temples of Karnak, their flags fluttering. On the west bank, past the green fields, the dry cliffs hide the Valley of the Kings.\n\n“Mind the curses,” says the captain cheerfully, waving you off.",
            choices = {
                { text = "Visit the temple of Karnak", to = 46 },
                { text = "Hurry on to the Valley of the Kings", to = 57 },
            },
        },
        [52] = {
            text = "Stroke, stroke, stroke! You row so well that the boat gains half a day. The rowers carry you round the deck on their shoulders and Captain Nakht pays you three coins in wages.\n\n“If the scribing doesn’t work out,” he says, “there’s always a bench for you here.”",
            gold = 3,
            choices = {
                { text = "Rest your arms", to = 51 },
            },
        },
        [53] = {
            text = "You row backwards while everyone else rows forwards. Your oar tangles with the next one, which smacks you smartly on the head. The crew laughs so much they have to stop rowing.\n\nYou spend the rest of the trip with a damp cloth on your forehead, guarding the grain from the mice.",
            stamina = -2,
            choices = {
                { text = "Wait for Thebes", to = 51 },
            },
        },
        [54] = {
            text = "Your tongue poking out in concentration, you draw a perfect little seated cat. Thoth nods. “Beautiful. Now, the secret. Every sacred cat has a true name, and Ptolemeow’s is ‘Miu-Neb-Ankh-Meow-Meow’. Say it, and he must listen to you.”\n\nHe taps his beak. “Also, in the tomb, press the cat sign, never the ankh. The ankh trap is very old-fashioned and very permanent.”",
            set = { "true_name", "glyph_warning" },
            choices = {
                { text = "Thank Thoth and head for the Valley", to = 57 },
            },
        },
        [55] = {
            text = "Thoth clicks his beak sadly. “A scribe without a pen is like an ibis without a beak. Still, you are honest.”\n\nHe leans in and whispers. “In the tomb you seek, there is a wall of signs. Press the cat sign, never the ankh. The ankh trap is very old-fashioned and very permanent.” Then he goes back to his scroll, muttering about the youth of today.",
            set = "glyph_warning",
            choices = {
                { text = "Head for the Valley of the Kings", to = 57 },
            },
        },
        [56] = {
            text = "Two hundred and twelve... or was it twelve? You are hopelessly lost among the columns until a pair of shaven-headed priests of Amun find you sitting on a lotus carving, muttering numbers.\n\n“It’s a hundred and thirty-four,” they say kindly. “Everybody gets lost.” They give you bread and a jug of barley beer for the road and point you west.",
            stamina = 2,
            choices = {
                { text = "Set off for the Valley of the Kings", to = 57 },
            },
        },
        [57] = {
            text = "The Valley of the Kings is silent and baking hot. At the end of a dusty track, a fresh doorway gapes in the cliff. The workmen’s tools lie scattered as if their owners left in a hurry.\n\nThen a voice purrs inside your head: “Ah. The help has arrived. Do come in, servant. I am somewhere deep inside, and I am bored.” It must be Ptolemeow.",
            choices = {
                { text = "Enter by the main doorway", to = 58 },
                { text = "Find the rock shaped like a hippo", to = 70, flag = "imhotep_map" },
                { text = "Search the workmen’s camp", to = 59 },
                { text = "Call out politely to Ptolemeow", to = 64, flag = "cat_lore" },
            },
        },
        [58] = {
            text = "Beyond the doorway a long corridor slopes down into the dark. The walls are covered with painted hieroglyphs: owls, feet, snakes, eyes and a great many birds. At the far end, a stone door is carved with three large signs.",
            choices = {
                { text = "Light your lamp and read the walls", to = 60, need = "lamp" },
                { text = "Just walk straight in", to = 61 },
            },
        },
        [59] = {
            text = "In the abandoned camp you find the foreman, Paneb, hiding inside a water jar. “The tomb’s cursed!” he whispers. “A mummy’s walking about in his underwear, and something cut the lights.”\n\nOnce he stops shaking he shares his bread and onions with you. “If you go in, press the cat sign on the door. My cousin pressed the ankh and now he’s a picture on the wall.”",
            set = "glyph_warning", stamina = 3,
            choices = {
                { text = "Thank him and enter the tomb", to = 58 },
            },
        },
        [60] = {
            text = "Lamp held high, you read the walls. ‘Welcome, traveller. Cursed be the one who disturbs this tomb, except Thursdays.’ Lovely.\n\nThe stone door has three buttons carved into it: an Eye of Horus, an ankh, and a little seated cat. A note underneath reads: ‘Choose wisely. Then choose again if you are still alive.’",
            choices = {
                { text = "Press the Eye of Horus", to = 62 },
                { text = "Press the ankh", to = 63 },
                { text = "Press the cat", to = 64 },
                { text = "Remember the warning and press the cat", to = 64, flag = "glyph_warning", hide = true },
            },
        },
        [61] = {
            text = "You march boldly down the dark corridor. Click. A floor tile sinks under your foot. From every crack in the walls pour thousands of shiny black scarab beetles, clicking and buzzing and rolling tiny dung balls at your ankles. They swarm up your legs like a tiny, crunchy army, and their leader, a beetle the size of a sandal, seems to be shouting orders.",
            fight = { name = "Scarab Swarm", skill = 6, stamina = 6, win = 65, flee = 58 },
        },
        [62] = {
            text = "You press the Eye of Horus. It blinks. Then a tiny hole opens in the wall opposite and a sleepy dart whistles out towards your neck. You fling yourself sideways, hoping your reflexes are better than your judgement in buttons.",
            test = { stat = "luck", win = 64, lose = 66 },
        },
        [63] = {
            text = "You press the ankh. There is a flash of light, a smell of fresh paint, and suddenly you feel very flat.\n\nYou are now a hieroglyph, painted neatly on the wall between an owl and a reed. Scholars will argue for centuries about what you mean. Most decide you are the sign for ‘oops’. Ptolemeow strolls past one day, looks at you, and sniffs: “Typical.”",
            ending = "death",
        },
        [64] = {
            text = "The stone door rumbles open onto the Hall of Pillars, painted with starry ceilings and marching gods.\n\n“Left, right or down,” says Ptolemeow’s voice, sounding pleased with itself. “Guess which way I went. Hint: I am not telling you.” Three ways lead on: a passage to the left that smells of old bandages, one to the right glowing faintly gold, and a staircase down.",
            choices = {
                { text = "Take the bandage-smelling passage", to = 67 },
                { text = "Take the golden passage", to = 68 },
                { text = "Go down the staircase", to = 69 },
            },
        },
        [65] = {
            text = "The last scarabs flee, clicking indignantly. One of them, a big golden fellow, leaves behind a lovely little dung ball, which you decide not to keep.\n\nIn the corner, though, you find a forgotten honey cake from some workman’s lunch. It is only slightly stale. You eat it with gusto and push open the door at the end of the corridor.",
            stamina = 3,
            choices = {
                { text = "Step through the door", to = 64 },
            },
        },
        [66] = {
            text = "The dart gets you on the earlobe. You are suddenly extremely sleepy. You have a lovely nap on the cold floor, dreaming of fried fish, and wake with a stiff neck and a crick in your back.\n\nWhile you slept, the stone door has opened by itself, apparently out of boredom.",
            stamina = -3,
            choices = {
                { text = "Stagger through the door", to = 64 },
            },
        },
        [67] = {
            text = "In a side chamber stands a mummy. Or rather half a mummy: his bandages have come unwound and lie in a heap round his ankles, and he is clutching the rest to himself in embarrassment.\n\n“A cat pulled my bandages loose,” he moans. “Three thousand years of dignity, gone. Give me linen, mortal, or I shall be very cross indeed.”",
            choices = {
                { text = "Hand him your roll of fine linen", to = 71, need = "linen" },
                { text = "Fight the grumpy mummy", to = 72 },
                { text = "Back away towards the golden glow", to = 68 },
            },
        },
        [68] = {
            text = "The golden passage ends in a round room painted with the great temple of Abu Simbel and its four giant statues of Ramesses. A carving shows how, twice a year, the sun shines all the way into the sanctuary.\n\nOpposite, a sealed door bears a golden sun disc, set in shadow. A stray sunbeam slants in from a crack high above, landing uselessly on the floor.",
            choices = {
                { text = "Bounce the sunbeam with your mirror", to = 74, need = "mirror" },
                { text = "Shove the door open by force", to = 75 },
                { text = "Go back to the Hall of Pillars", to = 64 },
            },
        },
        [69] = {
            text = "At the bottom of the stairs waits a tall figure with a jackal’s head and a pair of golden scales. It is Anubis, guardian of the dead. On one pan of the scales lies a single white feather.\n\n“Next,” he says, like a tired customs officer. “Heart on the scales, please. If it is heavier than the feather, my friend Ammit will have you. If not, you may pass.”",
            choices = {
                { text = "Place your heart on the scales", to = 77 },
                { text = "Show the queen’s royal seal", to = 78, need = "royal_seal" },
                { text = "Slip him a few coins (4 gold)", to = 80, cost = 4 },
            },
        },
        [70] = {
            text = "Behind the third rock shaped like a sleeping hippo, just as Imhotep promised, you find a narrow shaft. His ghost shimmers beside you. “Workmen’s entrance. No traps. Well, hardly any.”\n\nThe shaft forks. One branch drops into a hall where you hear a jackal yawning. The other is a tight crawl that heads straight down, towards the heart of the tomb.",
            choices = {
                { text = "Drop into the jackal’s hall", to = 69 },
                { text = "Crawl down the narrow shaft", to = 82 },
            },
        },
        [71] = {
            text = "The mummy wraps himself up in your linen with a happy sigh. “Ah, the good stuff. Alexandrian, isn’t it?” He is Prince Nebkheperu, and he turns out to be charming.\n\n“The cat? Went downstairs. Its true name, by the way, is Miu-Neb-Ankh-Meow-Meow. All the old cats in here know it. Say it, and it will listen.” He gives you a pot of three-thousand-year-old honey, still delicious, and five gold rings.",
            set = "true_name", stamina = 3, gold = 5,
            choices = {
                { text = "Wave goodbye and go downstairs", to = 69 },
            },
        },
        [72] = {
            text = "The mummy lurches towards you, arms outstretched, bandages trailing. It is hard to be scared of someone who keeps tripping over his own wrappings, but he does have a strong grip. Somewhere behind you, Ptolemeow’s voice remarks: “Do try not to lose. I should hate to be rescued by someone else.”",
            fight = { name = "Grumpy Mummy", skill = 8, stamina = 8, win = 73, flee = 68 },
        },
        [73] = {
            text = "The mummy trips one last time and ends up wound round a pillar like a parcel. “Fine,” he huffs. “Go downstairs. See if I care. And leave my honey alone.”\n\nYou immediately find his honey. A whole pot of it, three thousand years old and still perfectly delicious. Ancient Egyptian honey never goes off. You eat several fingerfuls and feel much better.",
            stamina = 4,
            choices = {
                { text = "Go down the staircase", to = 69 },
            },
        },
        [74] = {
            text = "You tilt the little bronze mirror until the sunbeam leaps onto the golden disc. The door glows, groans and slides open, exactly as at Abu Simbel.\n\nInside, on a velvet cushion, lies a jewelled golden collar sized for a cat. An inscription reads ‘Collar of Bastet, for the finest cat in Egypt’. So that is what Ptolemeow came for. Beside it sits a heap of gold coins.",
            gain = "collar", gold = 5,
            choices = {
                { text = "Take the collar and look for a way on", to = 76 },
            },
        },
        [75] = {
            text = "You set your shoulder to the door and push with all your might. Somewhere, a very old mechanism wakes up and takes an interest. Gears grind deep inside the wall. Dust pours from the ceiling. The door shivers, then begins, very slowly, to move.",
            test = { stat = "skill", win = 74, lose = 76 },
        },
        [76] = {
            text = "Clunk. The floor tilts under your feet, and before you can say ‘Imhotep’ you are whizzing down a long, polished stone chute, round three bends, through a cobweb and out into a torchlit hall.\n\nYou land on your bottom, a little bruised, at the feet of a very tall figure holding a pair of golden scales.",
            stamina = -1,
            choices = {
                { text = "Stand up and dust yourself off", to = 69 },
            },
        },
        [77] = {
            text = "Anubis gently lifts your heart out of your chest, which tickles, and places it on the scales opposite the feather. Ammit, a monster who is part crocodile, part lion and part hippo, licks her lips and leans in to watch.\n\nThe scales wobble. Did you really eat all those honey cakes?",
            roll = { dice = 2, outcomes = { { upto = 3, to = 79 }, { upto = 12, to = 78 } } },
        },
        [78] = {
            text = "Anubis stamps something on a scroll and waves a paw. “Pass, friend. Light as a feather, near enough.” Ammit sulks back into her corner.\n\n“The cat is in the burial chamber,” adds Anubis. “He has been shedding hair on the pharaoh’s sarcophagus for two days. Please take him away. I am allergic.” He points to a long passage lit by flickering torches.",
            choices = {
                { text = "Follow the torchlit passage", to = 81 },
            },
        },
        [79] = {
            text = "The scales clang down on your side. Too many honey cakes, too many figs, too many little lies about who ate them.\n\nAmmit swallows you in one polite gulp. It is surprisingly roomy in there, and quite warm. Far above, a voice drifts into your head: “Well, that was disappointing. Next servant, please.” You spend eternity as Ammit’s lunch, and she says you were delicious.",
            ending = "death",
        },
        [80] = {
            text = "You slide four coins across the table. Anubis looks at them, then at you, then at the feather. “Bribing the judge of the dead,” he says. “Interesting. That will make your heart considerably heavier, you know.”\n\nHe pockets the coins anyway. “Heart on the scales, please.”",
            choices = {
                { text = "Gulp and step up to the scales", to = 77 },
            },
        },
        [81] = {
            text = "At the end of the passage, the doorway to the burial chamber is blocked by a granite guardian: a giant stone ram with arms like pillars. Its eyes light up red.\n\n“NONE SHALL PASS,” it booms. “UNLESS THEY KNOW THE PASSWORD. OR BRING THE SACRED SIGN. OR, YOU KNOW, BEAT ME UP. WHICH NOBODY HAS.”",
            choices = {
                { text = "Say “Cheese-on-toast”", to = 84, flag = "sphinx_password" },
                { text = "Hold up the golden ankh", to = 84, need = "ankh" },
                { text = "Fight the stone guardian", to = 83 },
                { text = "Try to slip between its legs", to = 85 },
            },
        },
        [82] = {
            text = "You wriggle down the tight shaft on your elbows, Imhotep’s ghost humming encouragingly behind you. Dust gets in your nose. Your hips get stuck twice. Ahead, the stone creaks in a way architects do not like. Imhotep taps the wall and mutters: “Hmm. I did say this bit was temporary, back in 2650 BC.”",
            roll = { dice = 1, outcomes = { { upto = 2, to = 76 }, { upto = 6, to = 81 } } },
        },
        [83] = {
            text = "The stone guardian swings its huge fists. Every blow it lands feels like being hit by a small building, which, technically, it is. But stone is slow, and you are quick. Ptolemeow watches from the doorway, offering advice like “Hit it harder” and “No, harder than that.”",
            fight = { name = "Stone Guardian", skill = 9, stamina = 10, win = 84, flee = 86 },
        },
        [84] = {
            text = "The guardian rumbles aside, and you step into the burial chamber. Gold glitters everywhere: chariots, thrones, jars and a great painted sarcophagus. On top of it, curled on a cushion, sits a sleek spotted cat with emerald eyes.\n\n“At last,” says Ptolemeow inside your head, without moving. “You may now carry me. Gently. And I expect a reason to want to.”",
            choices = {
                { text = "Offer him the sacred catnip", to = 87, need = "catnip" },
                { text = "Call him by his true name", to = 87, flag = "true_name" },
                { text = "Grab him before he can run", to = 88 },
                { text = "Ask him very nicely", to = 89 },
            },
        },
        [85] = {
            text = "You take a run-up and dive between the guardian’s mighty stone legs, hoping it is as slow as it looks. The guardian looks down. You look up. For a moment, neither of you is quite sure what is going on. Then a huge stone hand comes swooping down towards you.",
            test = { stat = "luck", win = 84, lose = 83 },
        },
        [86] = {
            text = "You run, and keep running, and dart into a side room just as a slab of granite thunders down across the door. You are sealed in. For three thousand years.\n\nIn 1922, a man called Howard Carter peers through a hole with a candle. “Can you see anything?” asks someone behind him. “Yes,” he whispers. “Wonderful things. And a very cross scribe asking what time the banquet starts.”",
            ending = "end",
        },
        [87] = {
            text = "Ptolemeow’s eyes go wide and round. He purrs like a chariot wheel, rolls over and lets you scratch his tummy, which he will deny ever happened.\n\nA warm golden light fills the chamber, and a lady with a cat’s head smiles down at you. It is Bastet herself. “You have treated my little one with respect,” she says. “He will remember. So will I.” You feel strong and lucky.",
            set = "cat_happy", stamina = 4, luck = 2,
            choices = {
                { text = "Gather up the cat and leave", to = 90 },
            },
        },
        [88] = {
            text = "You lunge for the cat. Ptolemeow, who has been avoiding being picked up for six years, sees you coming from a mile away. His ears flatten. His tail bristles. He gathers himself to spring off the sarcophagus and into the darkness, where a cat can hide for days and enjoy every minute of it.",
            test = { stat = "skill", win = 90, lose = 91 },
        },
        [89] = {
            text = "“Most noble Ptolemeow,” you say, bowing low, “the queen misses you terribly, and there will be roast goose at the banquet.”\n\nThe cat considers this. His tail twitches. It is impossible to tell what he is thinking, which is the whole point of being a cat.",
            roll = { dice = 1, outcomes = { { upto = 2, to = 91 }, { upto = 6, to = 90 } } },
        },
        [90] = {
            text = "Ptolemeow settles into your arms like a fur stole. “Home,” he commands. Then the whole tomb begins to rumble. Dust trickles from the ceiling. Somewhere, a very old curse has noticed the cat leaving.\n\n“Oh yes,” says Ptolemeow. “I may have sat on a lever. Do hurry.”",
            choices = {
                { text = "Run for the main entrance", to = 93 },
                { text = "Follow the cat’s directions", to = 94 },
                { text = "Call on Bastet for help", to = 95, flag = "bastet_dream" },
            },
        },
        [91] = {
            text = "Ptolemeow slips through your fingers like warm butter and shoots off into a side passage. You chase him round a pillar, under a chariot and through a low doorway. Behind you, a stone slab begins to slide shut with a deep grinding noise.",
            test = { stat = "luck", win = 90, lose = 86 },
        },
        [92] = {
            text = "The robbers flee, abandoning their loot and their camel. Among the loot you spot a few things that belong in the tomb, and you politely put them back.\n\nThe camel, a cheerful beast with long eyelashes, kneels for you at once. Ptolemeow sits on its head like a crown, and you ride hard for the Nile. A fast boat, a fair wind and the queen’s seal carry you north to Alexandria in record time.",
            choices = {
                { text = "Hurry to the banquet", to = 95 },
            },
        },
        [93] = {
            text = "You burst out of the tomb into the evening light, just as the doorway collapses behind you in a cloud of dust. Waiting outside, sacks at the ready, are two tomb robbers who have been hoping someone would carry the treasure out for them.\n\n“Lovely cat,” says one. “Lovely collar too, I expect. Hand it over.” Ptolemeow hisses at them in a way that makes it clear you are to deal with this.",
            fight = { enemies = {
                { name = "Grave-robber Ineni", skill = 6, stamina = 6 },
                { name = "Grave-robber Djehuty", skill = 7, stamina = 5 },
            }, win = 92, flee = 94 },
        },
        [94] = {
            text = "“Left. Left again. Up that shaft. No, the other left,” orders Ptolemeow, steering you by sinking his claws into your left or right shoulder. It works rather well, apart from the claws.\n\nYou pop out of a crack in the cliff, far from the collapsing doorway. A ferryman takes you north for the price of a stroke of the cat, and days later Alexandria glitters ahead, just as the banquet lamps are lit.",
            choices = {
                { text = "Run to the palace", to = 95 },
            },
        },
        [95] = {
            text = "Whether by cat chariot, camel or ferry, you make it. The palace hall glows with lamps, roast goose and a hundred guests. Cleopatra rises from her couch as you enter, dusty and breathless, with a cat in your arms.\n\nMark Antony leaps up too. “Allow me to present the cat, my dear!” he cries, already reaching for it.",
            choices = {
                { text = "Hand Ptolemeow straight to the queen", to = 96 },
                { text = "Present the cat in the Collar of Bastet", to = 97, need = "collar" },
                { text = "Present the cat and write up the tale", to = 97, need = "reed_pen", flag = "cat_happy" },
                { text = "Let Mark Antony present the cat", to = 98 },
            },
        },
        [96] = {
            text = "Cleopatra gathers Ptolemeow into her arms and the cat, for once, purrs out loud for all to hear. The whole hall applauds.\n\n“Well done, little scribe,” says the queen, and gives you a seat at the end of the banquet table, beside a very nice dish of stuffed dates. Inside your head, a voice yawns: “Adequate. You may serve me again some time.” Coming from Ptolemeow, it is practically a medal.",
            ending = "win",
        },
        [97] = {
            text = "The hall falls silent as Ptolemeow sits up proudly in your arms, looking every inch a sacred cat. You bow and present him, along with a fine account of the whole adventure. Cleopatra’s eyes shine.\n\n“A scribe who can travel the Nile, outwit gods and keep my cat happy? You shall be Royal Scribe of Alexandria.” You get a seat beside the queen, a desk at the Great Library and a cat who visits you daily. Ptolemeow insists it was all his idea.",
            ending = "win",
        },
        [98] = {
            text = "Mark Antony takes the cat, turns to the crowd, bows magnificently, and trips over his own toga. Ptolemeow flies through the air and lands, with a splash, in a huge bowl of fish soup.\n\nThere is a terrible silence. Then Cleopatra laughs until she cries, and the whole hall laughs with her. The cat does not laugh. The cat looks at you, dripping, with a face that demands rescue.",
            choices = {
                { text = "Fish the cat out of the soup", to = 96 },
            },
        },
        [99] = {
            text = "You run to the fig tree. It shimmers, ripples and disappears. It was a mirage, and so was the fountain, and sadly so was the buffet.\n\nYou sit down for a little rest and the wind does the rest, covering you in sand until you become a small, tidy dune, very popular with lizards. Far away, a voice says inside your head: “A mirage? Really? Even Mark Antony knows that one.”",
            ending = "death",
        },
    },
}
