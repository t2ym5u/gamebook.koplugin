return {
    title       = "The Dragon Who Can't Sleep",
    author      = "Gamebook",
    lang        = "en",
    blurb       = "A grumpy dragon has nicked the mead cauldron. Only the village poet can sail west and sort it out.",
    sheet       = true,
    start       = 1,
    start_gold  = 5,
    start_items = { "poems" },
    items = {
        poems   = "Book of cloud poems",
        herring = "Pickled herring",
        cloak   = "Granny's knitted cloak",
        shield  = "Round wooden shield",
        feather = "Raven feather",
        harp    = "Gorm's little lyre",
        jumper  = "Faroese woolly jumper",
        hammer  = "Mjolnir (borrowed)",
        whistle = "Thor's goat whistle",
        pillow  = "Eiderdown pillow",
        ember   = "Hekla ember in a pot",
    },
    sections = {
        [1] = {
            text = "Snorravik, a cosy village on the Sognefjord, has not slept for a month. A dragon called Grumblefang swooped down at midsummer, nicked Old Bubbly, the village mead cauldron, and flew off west. Now his snoring rolls across the sea every night like thunder with a head cold.\n\nYou are the least warlike Viking in Norway. You own no axe, only a book of poems about clouds. So naturally, Chieftain Ragnhild Loudmouth is pointing straight at you.",
            choices = {
                { text = "Step forward bravely", to = 2 },
                { text = "Dive into the herring barrel", to = 3 },
            },
        },
        [2] = {
            text = "“Everyone else is too tired to lift an oar,” bellows Ragnhild, “and you’re the only one who sleeps through the snoring. Too busy rhyming.” She hands you the longship Sea Sausage and a crew of two: Bjorn the Broad, who fears nothing except puffins, and Astrid Starsight, who can steer by the stars, the moon, or a nicely shaped cloud.\n\n“Bring back Old Bubbly,” says Ragnhild, “and some peace and quiet.”",
            choices = {
                { text = "Visit Granny Gudrun the seeress", to = 4 },
                { text = "Call at the smithy", to = 5 },
                { text = "Go down to the harbour", to = 7 },
            },
        },
        [3] = {
            text = "It is dark in the herring barrel, and also very herringy. After a minute Ragnhild lifts the lid and peers down at you.\n\n“Nice try, poet.” She fishes you out by your collar, then drops a pickled herring into your hand. “For the journey. Heroes need snacks.”\n\nThe whole village cheers, mostly because you smell funny.",
            gain = "herring",
            choices = {
                { text = "Accept your heroic fate", to = 2 },
            },
        },
        [4] = {
            text = "Granny Gudrun lives in a turf hut that smells of smoke and cinnamon buns. She tosses rune bones on the table and squints.\n\n“The dragon isn’t wicked, dearie. He can’t sleep. Something keeps waking him, and a dragon with no sleep is crosser than Odin on a Monday.” She wraps you in a lumpy cloak she knitted herself. “It’s cold where you’re going. Mind your ears.” She also gives you a warm bun.",
            gain = "cloak", stamina = 2,
            choices = {
                { text = "Call at the smithy", to = 5 },
                { text = "Go down to the harbour", to = 7 },
            },
        },
        [5] = {
            text = "Sven the smith is asleep on his anvil, snoring nearly as loudly as the dragon. When you cough, he jolts awake and waves a hammer around in a welcoming sort of way.\n\n“Shields!” he yawns. “Lovely round shields, painted with a dragon on the front so it feels at home. Three silver coins, best price in the fjord.”",
            choices = {
                { text = "Buy a shield (3 gold)", to = 6, cost = 3 },
                { text = "Go down to the harbour", to = 7 },
            },
        },
        [6] = {
            text = "Sven straps a round wooden shield to your arm. The dragon painted on the front looks less like a dragon and more like a startled sausage, but it is solid oak and very reassuring.\n\n“Hold it up when things go splash or crunch,” Sven advises, and goes straight back to sleep on the anvil before you can ask what goes crunch.",
            gain = "shield",
            choices = {
                { text = "Go down to the harbour", to = 7 },
            },
        },
        [7] = {
            text = "The Sea Sausage bobs at the jetty. As Bjorn heaves the sail up, two enormous black ravens land on the mast and glare at you.\n\n“Huginn,” says the first, “Thought.”\n\n“Muninn,” says the second, “Memory. Odin sent us. He can’t sleep either, and he’s unbearable without his nap. Report, small poet.” They both look pointedly at your pockets.",
            choices = {
                { text = "Offer them the pickled herring", to = 8, need = "herring" },
                { text = "Ask them politely for help", to = 9 },
                { text = "Shoo them off the mast", to = 10 },
            },
        },
        [8] = {
            text = "The ravens squabble over the herring like two old uncles at a wedding feast. Full and cheerful, Huginn leans in.\n\n“Secret, for a fish. That trickster Loki tied a tiny silver bell to the dragon’s tail. Every time the poor beast nods off, jingle! He wakes up furious.”\n\n“I’ll remember you,” croaks Muninn warmly. “It’s my job.” They flap off towards Asgard.",
            lose = "herring", set = "bell_secret",
            choices = {
                { text = "Cast off and set sail", to = 11 },
            },
        },
        [9] = {
            text = "Huginn sighs. “Polite. How novel. Think, poet: the dragon flew west, to a land of ice which some red-bearded fellow named Greenland as a marketing trick.”\n\n“West,” agrees Muninn. “Or was it east? I forget.” He plucks a glossy black feather from his own wing and drops it in your lap. “Tickly. Useful against grumps.” Then they flap off towards Asgard.",
            gain = "feather",
            choices = {
                { text = "Cast off and set sail", to = 11 },
            },
        },
        [10] = {
            text = "You flap your arms and go “Shoo!” in your fiercest voice, which is not very fierce. The ravens peck your knuckles, your ear and, somehow, the back of your knee.\n\n“I’ll remember that,” says Muninn darkly.\n\n“He won’t,” says Huginn. “But I will.” They flap off towards Asgard, cackling, leaving you sore and slightly less dignified.",
            stamina = -1,
            choices = {
                { text = "Cast off and set sail", to = 11 },
            },
        },
        [11] = {
            text = "The fjord opens up into the grey North Sea. Bjorn rows, Astrid steers, and you compose a poem about a cloud shaped like a cod.\n\n“Three ways west,” says Astrid. “South-west to the Orkneys, safe and dull. Straight west into that thundery storm, fast and wet. Or…” She points over the side, where a strange fish glows green and beckons with one fin.",
            choices = {
                { text = "Sail south-west to the Orkneys", to = 12 },
                { text = "Sail straight into the storm", to = 24 },
                { text = "Follow the glowing fish", to = 38 },
            },
        },
        [12] = {
            text = "Three days later the Sea Sausage noses into the Orkneys, green islands so flat that the sheep can see each other from one end to the other. Near the beach the stone houses of Skara Brae huddle in the dunes, older than the pyramids and still draught-proof.\n\nThe Earl’s banner flies over a hall on the hill. Inland, a great ring of standing stones stands about looking mysterious.",
            choices = {
                { text = "Walk to the Ring of Brodgar", to = 13 },
                { text = "Go to the Earl's hall", to = 15 },
                { text = "Explore the tomb of Maeshowe", to = 17 },
            },
        },
        [13] = {
            text = "The Ring of Brodgar is a vast circle of stones, each one tall and lumpy like a giant’s tooth. Behind the biggest sits a huge man in a bearskin, sniffling.\n\nHe sees you, turns purple, chews the rim of his shield and roars: “I AM GORM THE BERSERKER!” Then he charges, arms wide open, like a hairy avalanche.",
            choices = {
                { text = "Fight the berserker", to = 14 },
                { text = "Open your arms wide too", to = 16 },
            },
        },
        [14] = {
            text = "You raise your fists. Gorm lowers his head. It is not a fair fight, but it is a very loud one, and the sheep gather round to watch.",
            fight = { name = "Gorm the Berserker", skill = 7, stamina = 8, win = 16, flee = 15 },
        },
        [15] = {
            text = "Earl Thorfinn the Mighty is holding a poetry contest in his hall, and the prize is a fat purse of silver. Skalds from Shetland and Caithness have already recited long verses about axes, ships and more axes.\n\n“Next!” booms the Earl, pointing his drumstick of roast mutton at you. You clear your throat and open your book of cloud poems.",
            test = { stat = "skill", win = 18, lose = 19 },
        },
        [16] = {
            text = "Gorm skids to a stop and bursts into tears on your shoulder. “Nobody ever hugs a berserker,” he sobs. “They just run away screaming. I was a skald once, you know, before the bearskin.”\n\nHe pats you so hard your teeth rattle, then presses a little wooden lyre into your hands. “Play it for someone who needs a song.” He wanders off, humming, much happier.",
            gain = "harp", stamina = 2,
            choices = {
                { text = "Go to the Earl's hall", to = 15 },
                { text = "Explore the tomb of Maeshowe", to = 17 },
            },
        },
        [17] = {
            text = "Maeshowe is a grassy mound with a low stone tunnel leading inside. Long ago, Vikings sheltered here from a blizzard and got bored, so the walls are covered in runic graffiti: “Ingigerth is the loveliest of women.” “Hermund carved these runes with a hard axe.” “This tomb is damp.”\n\nIn one corner, finer runes glow faintly, as if they want to be read.",
            choices = {
                { text = "Read the glowing runes", to = 20 },
                { text = "Carve your own graffiti", to = 21 },
            },
        },
        [18] = {
            text = "Your poem, “Ode to a Cloud Shaped Like My Aunt”, brings the hall to tears. Grizzled warriors blow their noses into their beards. Earl Thorfinn declares you the winner, hands you a purse of silver and sits you at the high table, where you eat mutton, oatcakes and an alarming amount of cheese.",
            gold = 6, stamina = 3,
            choices = {
                { text = "Explore the tomb of Maeshowe", to = 17 },
                { text = "Sail on towards Iceland", to = 22 },
            },
        },
        [19] = {
            text = "Halfway through your third verse about drizzle, someone throws a turnip. Then everyone throws turnips. You catch most of them, which wins a round of applause, and you eat a few, which is rather nice.\n\nEarl Thorfinn tosses you a coin out of pity. “For the juggling,” he says. “Not the poem.”",
            gold = 1, stamina = 1,
            choices = {
                { text = "Explore the tomb of Maeshowe", to = 17 },
                { text = "Sail on towards Iceland", to = 22 },
            },
        },
        [20] = {
            text = "The runes read: “Bragi, god of poetry, slept here. He left this song for anyone who cannot sleep.” Below them is a lullaby, the Song of the Soft Snow, every note carved with care.\n\nYou hum it once. Bjorn, standing guard at the entrance, yawns so hugely that his helmet falls off. You copy the song into your book. A lullaby that works on Bjorn could work on anything.",
            set = "lullaby",
            choices = {
                { text = "Sail on towards Iceland", to = 22 },
            },
        },
        [21] = {
            text = "You carve “A poet was here, and it was damp” in your neatest runes. The air turns cold. A grey, wispy Viking rises out of the wall, holding a ghostly axe and a ghostly grudge.\n\n“I am Hermund,” he moans, “and your runes are WONKY!” He is a draugr, a grumpy ghost, and worst of all, a grammar pedant.",
            fight = { name = "Hermund the Draugr", skill = 6, stamina = 5, win = 20, flee = 22 },
        },
        [22] = {
            text = "North of the Orkneys you pass the Faroe Islands, where there are more sheep than people and the sheep know it. At a little harbour a sheep farmer called Thrand waves a jumper at you.\n\n“Faroese wool!” he shouts. “Warm as a sauna, itchy as a hedgehog. Where you’re going, you’ll want it. Three silver.” Behind him a sheep nods seriously.",
            choices = {
                { text = "Buy the jumper (3 gold)", to = 23, cost = 3 },
                { text = "Sail on to Iceland", to = 54 },
            },
        },
        [23] = {
            text = "The jumper has a pattern of reindeer, snowflakes and one sheep who appears to be winking. It itches magnificently, but within seconds you are toasty from your ears to your knees.\n\nThrand waves you off. “Mind the dragon! And don’t wash it hot!” The sheep bleats something that sounds very much like good luck.",
            gain = "jumper",
            choices = {
                { text = "Sail on to Iceland", to = 54 },
            },
        },
        [24] = {
            text = "The storm hits like a giant’s sneeze. Waves as tall as church towers lift the Sea Sausage and drop it again. Bjorn screams, then apologises, then screams again. Astrid lashes herself to the steering oar and shouts “Hold on to something!”\n\nYou hold on to Bjorn, who is holding on to the mast, which is holding on to nothing in particular.",
            test = { stat = "luck", win = 25, lose = 26 },
        },
        [25] = {
            text = "The storm blows itself out as suddenly as it arrived. In the calm, an enormous fishing line slices past the hull, as thick as a tree trunk. At the far end, in a tiny rowing boat, sits a huge man with a red beard, muttering at the sea.\n\nAt the other end, something big is nibbling. The water starts to bubble.",
            choices = {
                { text = "Row over to the red-bearded man", to = 27 },
                { text = "Steer well away from the bubbles", to = 29 },
            },
        },
        [26] = {
            text = "A wave scoops you off the deck and dunks you in the icy sea. For a long, wet moment you are a herring. Then Astrid grabs your ankle and hauls you back aboard, upside down and dripping.\n\nWhen the storm finally clears, a tree-thick fishing line slides past the hull. A red-bearded giant sits in a rowing boat at one end, and the far end is bubbling.",
            stamina = -3,
            choices = {
                { text = "Row over to the red-bearded man", to = 27 },
                { text = "Steer well away from the bubbles", to = 29 },
            },
        },
        [27] = {
            text = "It is Thor, god of thunder, and he is having a bad week. “Lost my hammer,” he grumbles. “Again. Third time since Yule. Mother says I’d lose my beard if it wasn’t stuck on.” He is fishing for the Midgard Serpent, who sees everything at the bottom of the sea, to ask if she has found it.\n\n“Bait’s an ox head,” he adds. “She loves an ox head.”",
            choices = {
                { text = "Offer to help hold the line", to = 28 },
                { text = "Praise his beard in verse", to = 30 },
            },
        },
        [28] = {
            text = "You grab the line beside Thor. It is like holding a wet tree in a gale. “Pull!” roars the god. You pull. Thor pulls. Bjorn pulls you, Astrid pulls Bjorn.\n\nSuddenly the line goes slack, and something huge and scaly rises out of the waves, higher and higher, until it blocks out the sun and blinks down at you shyly.",
            choices = {
                { text = "Wave hello nervously", to = 31 },
            },
        },
        [29] = {
            text = "You steer away from Thor and his bubbles, which is very sensible, right up until the sea in front of you bubbles too. Eight long arms rise around the Sea Sausage, each with suckers like dinner plates. A huge yellow eye looks at you hungrily.\n\nIt is the kraken, and it seems to think your ship is a sausage. Which, to be fair, it is.",
            choices = {
                { text = "Fight the kraken", to = 32 },
                { text = "Hide behind your shield", to = 33, need = "shield" },
            },
        },
        [30] = {
            text = "“O beard of flame, O fuzzy cloud of red, the sunset weeps to see it on your head!” you declaim.\n\nThor blushes to the roots of his beard. “No one ever writes poems about the beard,” he sniffs, and hands you a fistful of silver and a slab of smoked goat. Then the line goes taut. Something huge rises from the sea and blinks down at you all, very shyly.",
            gold = 4, stamina = 2,
            choices = {
                { text = "Wave hello nervously", to = 31 },
            },
        },
        [31] = {
            text = "Jormungandr, the Midgard Serpent, is so long that she circles the whole world and bites her own tail. Right now she is blushing a deep green.\n\n“Sorry,” she whispers, in a voice like a foghorn trying to be quiet. “I don’t get many visitors. Ox head? Thank you. Lovely.” Something glints between her teeth: a short, chunky hammer, used as a toothpick.",
            choices = {
                { text = "Ask her kindly for the hammer", to = 34 },
                { text = "Ask her about the dragon", to = 35 },
            },
        },
        [32] = {
            text = "Bjorn grabs an oar, Astrid grabs a boathook, and you grab the nearest thing, which is a cooking pot. The kraken wraps an arm round the mast, and the battle begins.",
            fight = { name = "The Kraken", skill = 8, stamina = 9, win = 33 },
        },
        [33] = {
            text = "The kraken gives up with a great sulky gurgle and sinks away, leaving an ink cloud shaped exactly like a rude word. Nobody knows how it managed that.\n\nFloating where it vanished is a battered sea chest, full of silver coins and one very surprised crab. Bjorn hauls it aboard. Ahead, beyond the mist, smoke rises from the mountains of Iceland.",
            gold = 5,
            choices = {
                { text = "Sail on towards Iceland", to = 36 },
            },
        },
        [34] = {
            text = "“This?” says the Serpent, taking the hammer out of her mouth. “Oh, is it his? It just fell into the sea. It’s perfect for the bits of ox stuck between my teeth.” She drops it into your arms, and you nearly go through the deck.\n\nThor, meanwhile, has rowed off to fish for something else. He has already forgotten what he lost.",
            gain = "hammer",
            choices = {
                { text = "Ask her about the dragon", to = 35 },
                { text = "Wave goodbye and sail on", to = 36 },
            },
        },
        [35] = {
            text = "“Grumblefang? My cousin,” sighs the Serpent. “Loki tied a little bell to his tail for a joke. Ding, ding, every time he dozes off. Poor dear.”\n\nThen, softly, she sings the lullaby her mother Angrboda sang to her, a slow and swaying song that makes the whole ocean go flat and glassy. You write it down quickly in your book. Bjorn has already fallen asleep on an oar.",
            set = { "bell_secret", "lullaby" },
            choices = {
                { text = "Wave goodbye and sail on", to = 36 },
            },
        },
        [36] = {
            text = "Iceland looms out of the mist, all black rock, white ice and puffs of steam. Bjorn spots a puffin and hides under a blanket.\n\nA tiny rowing boat bobs across your bow. It is Thor again, patting his pockets, looking under his seat and asking a seagull whether it has seen a hammer anywhere. The seagull has not.",
            choices = {
                { text = "Give Thor his hammer back", to = 37, need = "hammer" },
                { text = "Wave and sail into harbour", to = 54 },
            },
        },
        [37] = {
            text = "Thor hugs the hammer, then hugs you, then hugs Bjorn, who squeaks. “Mjolnir! My little sweetie!” He hands you a small bone whistle. “For my goats, Toothgnasher and Toothgrinder. That dragon borrowed them as guards and never asked. One toot and they come trotting.”\n\nHe thunders off across the sky. It starts to rain, but only a little, and in a cheerful way.",
            lose = "hammer", gain = "whistle", stamina = 3,
            choices = {
                { text = "Sail into harbour", to = 54 },
            },
        },
        [38] = {
            text = "The glowing fish leads you through a fog so thick you could spread it on bread. At last the Sea Sausage bumps onto the beach of a little island that is not on any map.\n\nA fisherman sits on a rock. He has foxy red hair, a foxy smile and two very foxy eyebrows. “Fancy a game of dice, traveller?” he purrs. “Winner learns a secret.”",
            choices = {
                { text = "Play his game of dice", to = 39 },
                { text = "Refuse politely", to = 40 },
            },
        },
        [39] = {
            text = "The fisherman shakes the dice in a shell. “Simple game. High is good, low is bad, and I am definitely not Loki.” His eyebrows wiggle. Bjorn whispers that this is exactly what Loki would say.\n\nThe dice tumble across the rock.",
            roll = { dice = 1, outcomes = {
                { upto = 2, to = 41 },
                { upto = 5, to = 42 },
                { upto = 6, to = 43 },
            } },
        },
        [40] = {
            text = "“Suit yourself,” says the fisherman, who is very obviously Loki, god of mischief. His face falls, and so does a fake moustache you had not noticed.\n\n“If you’re looking for that grumpy dragon,” he says, waving at a cave in the cliff, “there’s a shortcut through there. Perfectly safe. Lovely people.” He snickers into his sleeve and turns into a seal.",
            choices = {
                { text = "Enter the cave", to = 44 },
            },
        },
        [41] = {
            text = "Snake eyes, or near enough. Loki cackles, snaps his fingers, and your oars turn into eels. Rowing with eels is slow, slippery and extremely embarrassing. They also keep trying to swim off.\n\n“A shortcut is through that cave,” Loki giggles, pointing to the cliff. “Lovely people.” He turns into a seal and flops into the sea.",
            stamina = -2,
            choices = {
                { text = "Enter the cave", to = 44 },
            },
        },
        [42] = {
            text = "A middling roll. Loki can’t resist showing off anyway. “Want to know my best prank? I tied a tiny silver bell to that dragon’s tail. Every time he dozes off, jingle! Wakes himself up, furious. Brilliant, eh?” He wipes away a tear of laughter.\n\n“The shortcut is through that cave. Lovely people.” He turns into a seal and slips away.",
            set = "bell_secret",
            choices = {
                { text = "Enter the cave", to = 44 },
            },
        },
        [43] = {
            text = "A six! Loki stares at the dice as if they had betrayed him personally. “Fine. FINE. The dragon can’t sleep because I tied a tiny bell to his tail. It jingles every time he dozes off. Funniest thing I ever did.”\n\nHe pays up in silver, sulking. “The shortcut is through that cave. Lovely people.” He becomes a seal and flops off in a huff.",
            set = "bell_secret", gold = 5,
            choices = {
                { text = "Enter the cave", to = 44 },
            },
        },
        [44] = {
            text = "The cave is not full of lovely people. It is full of garden gnomes: little stone travellers with surprised faces, lined up along the walls. Two trolls, Grok and Snorbert, are dusting them.\n\n“Ooh, another one for the collection,” says Grok. “It’ll look nice by the toadstool.” Trolls turn people to stone for decoration. Behind them a tunnel leads on, smelling of sulphur.",
            choices = {
                { text = "Fight the trolls", to = 45 },
                { text = "Sneak past along the wall", to = 46 },
                { text = "Tickle them with the feather", to = 47, need = "feather" },
            },
        },
        [45] = {
            text = "“It wants to play!” says Snorbert delightedly, picking up a club made of a whole birch tree. Grok cracks his knuckles, which sounds like a rockslide.",
            fight = { enemies = {
                { name = "Grok the Troll", skill = 7, stamina = 7 },
                { name = "Snorbert the Troll", skill = 6, stamina = 7 },
            }, win = 48, flee = 46 },
        },
        [46] = {
            text = "You flatten yourself against the cave wall and freeze, trying your best to look like a garden gnome. You even put on a surprised face. Grok’s nose sniffs the air, inches from your ear.",
            test = { stat = "skill", win = 48, lose = 49 },
        },
        [47] = {
            text = "You creep up and tickle Grok under the chin with Muninn’s feather. He giggles. You tickle Snorbert behind the knee. He shrieks with laughter. Soon both trolls are rolling on the floor, helpless, until a ray of sunrise slides through a crack in the roof.\n\nThey freeze mid-giggle and turn to stone, grinning. They make rather charming garden gnomes themselves.",
            choices = {
                { text = "Search the back of the cave", to = 48 },
            },
        },
        [48] = {
            text = "Behind the trolls’ beds you find a pile of silver, and a battered songbook titled Troll Granny’s Bedtime Songs. Inside is a lullaby, the Hum of the Mountain, that put whole families of trolls to sleep for a hundred years at a time.\n\nYou copy it into your book. The tunnel slopes on, warm and steamy, and comes out right under Iceland. Astrid and Bjorn bring the ship round.",
            gold = 6, set = "lullaby",
            choices = {
                { text = "Follow the tunnel to Iceland", to = 54 },
            },
        },
        [49] = {
            text = "A huge hand plucks you off the wall. It belongs to Granny Hildigunn, the oldest troll of all, who has a nose like a potato and a cardigan like a haystack.\n\n“Lovely,” she croaks. “You’ll go by the pond, with a little fishing rod.” She raises a stony finger to turn you into a garden gnome.",
            choices = {
                { text = "Recite your finest poem", to = 50 },
                { text = "Offer her the pickled herring", to = 52, need = "herring" },
                { text = "Make a run for it", to = 53 },
            },
        },
        [50] = {
            text = "You open your book and read “The Cloud That Wanted a Hug” in your most heartfelt voice. Granny Hildigunn’s potato nose twitches. A tear the size of a pebble trembles in her eye. Will she sob or will she zap?",
            test = { stat = "luck", win = 52, lose = 53 },
        },
        [51] = {
            text = "Granny Hildigunn sighs. “That reminds me of my old lullaby.” She croons it softly, the Hum of the Mountain, and the whole cave trembles pleasantly. You scribble it into your book.\n\n“Off you go, dearie, before I change my mind,” she says, pointing you to a warm, steamy tunnel. It comes out under Iceland, where Astrid and Bjorn have just landed the ship.",
            set = "lullaby", stamina = 2,
            choices = {
                { text = "Climb out into Iceland", to = 54 },
            },
        },
        [52] = {
            text = "Granny Hildigunn lowers her finger and dabs her eyes with her cardigan. “Oh, you sweet thing. Nobody brings me anything but screaming.” She pats your head, gently for a troll, which means you only sink a little into the ground.\n\nShe sits you by her fire, gives you a mug of moss tea, and starts to hum something old and soothing.",
            stamina = 2,
            choices = {
                { text = "Listen to her song", to = 51 },
            },
        },
        [53] = {
            text = "Zap! Your feet go heavy, then your knees, then your eyebrows. You are now a small stone figure with a pointy hat, a tiny fishing rod and a look of mild surprise.\n\nGranny Hildigunn places you lovingly beside the pond, next to a toadstool. Visitors say you are the nicest gnome in the collection. Your saga is short: “Stood by a pond. Very ornamental.”",
            ending = "death",
        },
        [54] = {
            text = "Iceland! Steam puffs from the ground as if the island were boiling a kettle. Astrid ties up the ship at a little harbour, where you can see lava fields, mossy hills, and a volcano scowling in the distance.\n\nThe locals report that the dragon’s snoring has been drifting over from the west, from Greenland. But Iceland has plenty to offer a poet in need first.",
            choices = {
                { text = "Ride to Thingvellir and the Althing", to = 55 },
                { text = "Visit the Great Geysir", to = 60 },
                { text = "Climb Mount Hekla", to = 65 },
                { text = "Sail west for Greenland", to = 68 },
            },
        },
        [55] = {
            text = "At Thingvellir, where the earth is splitting slowly in two, all of Iceland has gathered for the Althing. The Lawspeaker stands on the Law Rock, reciting every law from memory. He is on day two of three.\n\nA scowling, bald, enormous skald blocks your path. It is Egil Skallagrimsson, the greatest and grumpiest poet in the north. “You! Poet! I challenge you to a verse duel!”",
            choices = {
                { text = "Accept the duel", to = 56 },
                { text = "Play Gorm's lyre as you recite", to = 57, need = "harp" },
                { text = "Sit and listen to the Lawspeaker", to = 59 },
            },
        },
        [56] = {
            text = "Egil starts with a thundering verse about a battle, a feud and a particularly rude king. The crowd roars. Your turn. You take a deep breath, think of the gentlest cloud you have ever seen, and begin.",
            test = { stat = "skill", win = 57, lose = 58 },
        },
        [57] = {
            text = "Your verses float over the crowd like dandelion fluff. Egil Skallagrimsson’s lower lip wobbles. “That,” he growls, wiping his eye, “was not terrible.” He pays you a purse of silver and grudgingly teaches you the lullaby he once sang to his favourite horse, the Song of the Sleepy Mare. It never failed.\n\nThe crowd cheers. The Lawspeaker loses his place and has to start again.",
            gold = 5, set = "lullaby",
            choices = {
                { text = "Ride on to the Great Geysir", to = 60 },
                { text = "Climb Mount Hekla", to = 65 },
                { text = "Sail west for Greenland", to = 68 },
            },
        },
        [58] = {
            text = "Egil wins, of course. He has had a lot of practice, and he shouts. But he slaps your back so hard you sit down, then buys you a steaming bowl of lamb soup, kjotsupa, with carrots and swede. “You’ll do,” he grunts. “Rhyme ‘cloud’ with something better than ‘loud’ next time.”",
            stamina = 3,
            choices = {
                { text = "Ride on to the Great Geysir", to = 60 },
                { text = "Climb Mount Hekla", to = 65 },
                { text = "Sail west for Greenland", to = 68 },
            },
        },
        [59] = {
            text = "You sit on the mossy grass and listen to the Lawspeaker. He is reciting the law about who owns a whale that washes up on a shared beach. It has fourteen clauses. Within minutes you are deeply, gloriously asleep.\n\nYou wake an hour later, refreshed, with a sheep using your foot as a pillow and a much better idea of maritime law.",
            stamina = 4, luck = 1,
            choices = {
                { text = "Ride on to the Great Geysir", to = 60 },
                { text = "Climb Mount Hekla", to = 65 },
                { text = "Sail west for Greenland", to = 68 },
            },
        },
        [60] = {
            text = "The Great Geysir gurgles, burps and, every few minutes, shoots a column of boiling water high into the sky. Everyone cheers, every single time.\n\nBy the hot pools an old woman sells pillows stuffed with eiderdown, gathered from the nests of eider ducks in the Westfjords. “Softest thing in the world,” she says. “Four silver. Even a dragon would sleep on it.”",
            choices = {
                { text = "Buy a pillow (4 gold)", to = 61, cost = 4 },
                { text = "Cross the bubbling hot field", to = 62 },
                { text = "Climb Mount Hekla", to = 65 },
                { text = "Sail west for Greenland", to = 68 },
            },
        },
        [61] = {
            text = "The pillow is as light as a cloud and as soft as a sigh. You squeeze it once and nearly fall asleep standing up. Bjorn asks if he can hold it. You say no.\n\nThe old woman winks. “Pop it under the head of whoever’s cross. Works on husbands too.”",
            gain = "pillow",
            choices = {
                { text = "Cross the bubbling hot field", to = 62 },
                { text = "Climb Mount Hekla", to = 65 },
                { text = "Sail west for Greenland", to = 68 },
            },
        },
        [62] = {
            text = "Beyond Geysir lies a field of bubbling mud pots and steaming cracks. On the far side, you have heard, is a perfect hot spring. You hop from stone to stone, arms out, as the ground gurgles beneath you like an enormous hungry tummy.",
            test = { stat = "skill", win = 63, lose = 64 },
        },
        [63] = {
            text = "You reach the hot spring without a single splash. It is perfect: warm, blue and steamy, with a view of the glaciers. You soak until you are as pink as a prawn and as relaxed as a seal on a sunny rock.\n\nEvery ache from the journey melts away.",
            stamina = 5, luck = 1,
            choices = {
                { text = "Climb Mount Hekla", to = 65 },
                { text = "Sail west for Greenland", to = 68 },
            },
        },
        [64] = {
            text = "You step on exactly the wrong stone. Geysir’s little cousin erupts right underneath you. Whoosh! You fly into the sky, wave to a passing puffin, and land in a muddy puddle with a squelch heard as far as Reykjavik.\n\nBruised, steaming and splattered, you squelch back to the ship. Bjorn laughs so hard he has to lie down.",
            stamina = -3,
            choices = {
                { text = "Climb Mount Hekla", to = 65 },
                { text = "Sail west for Greenland", to = 68 },
            },
        },
        [65] = {
            text = "Mount Hekla, which some say is the gate to Hel itself, rumbles moodily as you climb. Near the top, glowing embers lie in the black rock like jewels.\n\nA small fiery imp guards them, hopping from foot to foot. “I am Surtling, nephew of Surtr the fire giant!” it squeaks. “These are MY embers! Touch them and I’ll singe your eyebrows!”",
            choices = {
                { text = "Fight the fire imp", to = 66 },
                { text = "Climb down and sail for Greenland", to = 68 },
            },
        },
        [66] = {
            text = "Surtling leaps at you, crackling and fizzing like a firework that has lost its temper.",
            fight = { name = "Surtling the Fire Imp", skill = 6, stamina = 6, win = 67, flee = 68 },
        },
        [67] = {
            text = "Surtling fizzles out into a sulky little puff of smoke. “Fine,” it grumbles. “Take one. They stay hot for a year, so don’t put it in your pocket.”\n\nYou scoop a glowing ember into a clay pot with a lid. It warms your hands wonderfully. On a glacier, it might be worth more than gold.",
            gain = "ember",
            choices = {
                { text = "Sail west for Greenland", to = 68 },
            },
        },
        [68] = {
            text = "Past icebergs as big as cathedrals, the Sea Sausage reaches Greenland. It is very white. Not green at all.\n\nAt Brattahlid a man with a flaming red beard strides out. “Erik the Red! Welcome! Lovely name, Greenland, isn’t it? I picked it myself.” Before you can blink he has sold you a plot of prime ice for every coin you own. His daughter Freydis watches, axe on her shoulder, and rolls her eyes.",
            gold = -99,
            choices = {
                { text = "Join Erik's welcome feast", to = 69 },
                { text = "Talk to Freydis", to = 70 },
                { text = "Head straight for the ice cap", to = 72 },
            },
        },
        [69] = {
            text = "Erik’s feast is seal stew, dried cod and a cake that is mostly butter. Between mouthfuls he tells you the dragon lives in an ice mountain inland, guarded by two big goats.\n\n“My son Leif’s off to the west,” he adds proudly, “in a place he calls Vinland. Full of berries and trees, apparently. He gets the naming talent from me.”",
            stamina = 4,
            choices = {
                { text = "Talk to Freydis", to = 70 },
                { text = "Sail west to visit Leif", to = 71 },
                { text = "Head for the ice cap", to = 72 },
            },
        },
        [70] = {
            text = "Freydis Eiriksdottir is the fiercest person you have ever met, including Ragnhild Loudmouth. “A dragon? Ha. I’m coming,” she says. “There are wolves on the ice. Wolves fear me. Everyone fears me.”\n\nBjorn nods. He definitely fears her. She tucks her axe into her belt and jumps aboard before anyone can argue.",
            set = "freydis",
            choices = {
                { text = "Sail west to visit Leif", to = 71 },
                { text = "Head for the ice cap", to = 72 },
            },
        },
        [71] = {
            text = "Several days west you reach Vinland, a green shore with real trees and bushes heavy with berries. Leif Erikson waves from his turf houses at Leifsbudir. He is homesick, sunburnt and delighted to see you.\n\nOver berry pancakes he draws a map. “Grumblefang’s mountain has a secret back path. I found it when I was a boy, chasing a seagull.” He sends you back to Greenland stuffed and grateful.",
            stamina = 5, set = "back_path",
            choices = {
                { text = "Sail back and head for the ice", to = 72 },
            },
        },
        [72] = {
            text = "The ice cap is so white it makes your eyes water, and so cold that your words freeze in the air and tinkle onto the snow. Far ahead, a jagged mountain of ice rises against the sky. From inside comes a sound like a giant sawing wood: zzzzzz, jingle, ROAR, zzzz.\n\nYour nose has gone numb, and your ears are thinking about it.",
            choices = {
                { text = "Wrap up in Granny's cloak", to = 74, need = "cloak" },
                { text = "Pull on the woolly jumper", to = 74, need = "jumper" },
                { text = "Warm your hands on the ember", to = 74, need = "ember" },
                { text = "Trudge on regardless", to = 73 },
            },
        },
        [73] = {
            text = "You stamp your feet, blow on your fingers and march on, singing to keep warm. The wind howls through every gap in your clothes, and there are a lot of gaps.",
            test = { stat = "stamina", win = 74, lose = 75 },
        },
        [74] = {
            text = "Warm enough to keep going, you crunch across the snow towards the ice mountain. Then grey shapes appear on a ridge. Wolves, a whole pack, padding closer with their noses twitching and their tummies rumbling.\n\nThe biggest one licks his lips. Bjorn hides behind you. You are not entirely sure why.",
            choices = {
                { text = "Fight the wolves", to = 76 },
                { text = "Let Freydis deal with them", to = 77, flag = "freydis" },
                { text = "Throw them the pickled herring", to = 77, need = "herring" },
            },
        },
        [75] = {
            text = "Your toes freeze. Then your knees. Then your eyebrows, which crackle when you frown. Halfway up a slope you stop for a little rest and simply do not start again.\n\nBy morning you are sealed inside a glacier like a raisin in a bun. Scholars will dig you out in a thousand years and argue about your book of cloud poems. They will give it four stars.",
            ending = "death",
        },
        [76] = {
            text = "The wolves circle and lunge. You swing your book of poems, Bjorn swings a cooking pot, Astrid swings an oar, and the snow flies.",
            fight = { enemies = {
                { name = "Grey Wolf", skill = 6, stamina = 5 },
                { name = "Big Grey Wolf", skill = 7, stamina = 6 },
            }, win = 78 },
        },
        [77] = {
            text = "Freydis steps forward, or a pickled herring sails through the air, and either way the wolves change their minds at once. They yelp and gallop off over the ridge, tails between their legs.\n\nBjorn comes out from behind you and announces that he was never scared. Nobody believes him, not even Bjorn.",
            choices = {
                { text = "March on to the ice mountain", to = 78 },
            },
        },
        [78] = {
            text = "At the foot of the ice mountain, a great cave mouth breathes out warm, snory air. Two enormous goats guard it, chewing loudly. Their horns curl like cinnamon buns, and their eyes are full of mischief.\n\n“Halt,” bleats the first goat. “We are Toothgnasher and Toothgrinder, and we bite.”\n\n“Mostly tents,” admits the second. “But also people.”",
            choices = {
                { text = "Charge the goats", to = 79 },
                { text = "Blow Thor's goat whistle", to = 80, need = "whistle" },
                { text = "Take Leif's secret back path", to = 81, flag = "back_path" },
            },
        },
        [79] = {
            text = "You charge. The goats lower their heads. This is going to be the hardest fight of your life, and it smells strongly of goat.",
            fight = { enemies = {
                { name = "Toothgnasher", skill = 8, stamina = 7 },
                { name = "Toothgrinder", skill = 9, stamina = 8 },
            }, win = 83 },
        },
        [80] = {
            text = "You toot the little bone whistle. The goats freeze mid-chew. Their ears go up. Then they gallop over, bleating joyfully, and lick your face until it is shiny.\n\n“Thor’s whistle!” they cry. “Are we going home? Is there cabbage?” They escort you proudly into the cave, nibbling your cloak as they go.",
            choices = {
                { text = "Enter the dragon's lair", to = 83 },
            },
        },
        [81] = {
            text = "Following Leif’s map, you creep round the back of the mountain to a narrow crack in the ice. Inside, a steep, slippery chute leads down towards the warm glow of the lair. There are handholds, sort of. There is a long drop, definitely.",
            test = { stat = "skill", win = 83, lose = 82 },
        },
        [82] = {
            text = "Your boot slips. You slide down the ice chute on your bottom, faster and faster, bounce off three icicles and shoot out at the bottom like a cork from a bottle. You land in a heap of the dragon’s treasure, with a gold cup on your head.\n\nOuch. But at least you are inside.",
            stamina = -2,
            choices = {
                { text = "Creep towards the snoring", to = 83 },
            },
        },
        [83] = {
            text = "The lair is warm and full of treasure, but Grumblefang is not enjoying any of it. He is huge, green and very, very tired. His eyes are red, his scales droop, and he is cuddling Old Bubbly, the village mead cauldron, like a teddy bear.\n\nHe dozes. Zzzzz. Jingle! “ROAR!” He wakes, furious, and stares straight at you. “WHO,” he growls, “IS IN MY CAVE?”",
            choices = {
                { text = "Sing him a lullaby", to = 84, flag = "lullaby" },
                { text = "Snip the bell off his tail", to = 85, flag = "bell_secret" },
                { text = "Recite your cloud poem", to = 86 },
                { text = "Bonk him with Thor's hammer", to = 87, need = "hammer", hide = true },
            },
        },
        [84] = {
            text = "You take a deep breath and sing, softly, slowly, the lullaby you learned on your travels. Grumblefang’s eyelids droop. His head sinks onto the cauldron. His tail curls round. Zzzzz…\n\nJingle! A tiny silver bell on the tip of his tail tinkles, and his eyes snap open again. He looks so miserable it nearly breaks your heart.",
            choices = {
                { text = "Snip off the little bell", to = 88, flag = "bell_secret" },
                { text = "Slip the pillow under his head", to = 89, need = "pillow" },
                { text = "Keep singing, louder", to = 90 },
            },
        },
        [85] = {
            text = "You tiptoe round, find the tiny silver bell knotted to the tip of his tail, and snip it off with your knife. Jingle, says the bell, for the last time.\n\nGrumblefang blinks. “That noise,” he whispers. “It’s gone.” But a dragon who has not slept for months has forgotten how. He tosses, turns and grumbles. “I can’t remember how to do it,” he sobs.",
            choices = {
                { text = "Sing him the lullaby", to = 88, flag = "lullaby" },
                { text = "Slip the pillow under his head", to = 89, need = "pillow" },
                { text = "Recite your cloud poem", to = 86 },
            },
        },
        [86] = {
            text = "You open your book and begin: “Ode to a Grey Cloud, in Forty-Seven Verses.” It is slow. It is gentle. It is, if you are honest, quite boring, especially the bit about drizzle. Grumblefang’s eyes start to glaze. Either he will drift off, or he will lose patience completely.",
            test = { stat = "luck", win = 91, lose = 92 },
        },
        [87] = {
            text = "You heave Mjolnir up and swing. But Thor’s hammer always returns to its master, wherever he is. It whooshes off into the sky, with you still clinging to the handle, all the way to Asgard.\n\nThor is delighted to have it back. Odin, who still can’t sleep, makes you his official bedtime poet. It is a good job, with free mead, but Snorravik never hears from you again.",
            ending = "end",
        },
        [88] = {
            text = "No bell. Soft song. Grumblefang sighs the longest sigh in history, curls round Old Bubbly and sleeps for three whole days. When he wakes, he is a new dragon: polite, cheerful and deeply grateful.\n\nHe flies you all home to Snorravik, cauldron in his claws. He warms the sauna, lights the fires in winter and joins the choir. The skalds make your adventure into a saga, and they are singing it to this very day.",
            ending = "win",
        },
        [89] = {
            text = "You slide the eiderdown pillow under Grumblefang’s great head and hum softly. He snuggles in, murmurs “sooo soft”, and falls into a deep, happy sleep. He will probably sleep for a hundred years, which is fine by everyone.\n\nYou tiptoe out with Old Bubbly. Back in Snorravik, the mead flows, the nights are silent, and the whole village sleeps for a week.",
            ending = "win",
        },
        [90] = {
            text = "You sing louder, and louder, until the icicles quiver and Bjorn covers his ears. Grumblefang’s eyes flutter. The bell jingles again. You sing louder still, practically bellowing a lullaby, which is not how lullabies are supposed to work.",
            test = { stat = "luck", win = 89, lose = 92 },
        },
        [91] = {
            text = "By verse thirty-one, Grumblefang is snoring gently. Even the bell can’t wake him now: your poem is far more boring than any bell could be exciting. You have bored a dragon to sleep.\n\nYou tiptoe home with Old Bubbly. Snorravik throws a feast, the mead flows, and from now on, whenever a baby won’t sleep, they send for you and your cloud poems.",
            ending = "win",
        },
        [92] = {
            text = "Grumblefang loses his patience completely. “ENOUGH!” he roars, and then, being far too tired to think of anything cleverer, he simply sits on you.\n\nYou are not hurt, exactly. Just very flat, and very stuck, under a very heavy dragon who has finally fallen asleep. Bjorn and Astrid sail home with the news. The saga of your adventure is short, and ends with the word “squish”.",
            ending = "death",
        },
    },
}
