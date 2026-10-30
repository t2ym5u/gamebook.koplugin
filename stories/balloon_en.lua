return {
    title       = "Around the World by Balloon",
    author      = "Gamebook",
    lang        = "en",
    blurb       = "London, 1872. You bet your savings you can fly round the world in 80 days. Your navigator is a rude pigeon.",
    sheet       = true,
    start       = 1,
    start_gold  = 10,
    start_items = { "umbrella", "tea" },
    items = {
        umbrella   = "Stout black umbrella",
        tea        = "Tin of Earl Grey",
        spyglass   = "Brass spyglass",
        wind_chart = "Eiffel’s wind chart",
        cheese     = "Wheel of Gruyère",
        glass      = "Murano glass globe",
        bananas    = "Bunch of bananas",
        ruby       = "Maharaja’s ruby",
        silk       = "Silk patch",
        telegram   = "Telegram from London",
        nugget     = "Gold nugget",
    },
    sections = {
        [1] = {
            text = "The Reform Club, Pall Mall, October 1872. Over the port, Lord Stuffington-Smythe sneers that nobody could go round the world in eighty days. “Least of all by balloon, ha!”\n\nBefore you can stop your mouth, it says: “I bet my entire savings I can.” Gasps. Monocles drop into soup.\n\nOn your shoulder, Archibald, your homing pigeon, groans. “Marvellous. I have never homed further than Croydon.” You have ten sovereigns, a tin of tea, an umbrella and a balloon called the Plucky Pudding.",
            choices = {
                { text = "Go shopping at Covent Garden", to = 2 },
                { text = "March straight to Hyde Park", to = 4 },
            },
        },
        [2] = {
            text = "Covent Garden market is a riot of cabbages, flower girls and porters balancing towers of baskets on their heads. A one-eyed sea captain is selling a brass spyglass, “seen every ocean, guv, and two of ’em twice.”\n\nArchibald pecks at a cabbage leaf. “Buy the telescope. Then at least one of us will see where we’re going. I certainly don’t intend to.”",
            choices = {
                { text = "Buy the spyglass (3 sovereigns)", to = 3, cost = 3 },
                { text = "Hurry to Hyde Park", to = 4 },
            },
        },
        [3] = {
            text = "The captain pockets your coins and salutes. “She’ll show you pirates before pirates show you their cutlasses.” You extend the spyglass and admire, in great detail, the nostril of a passing cab horse.\n\n“Very nautical,” says Archibald. “Now can we go? Your bet runs from the moment the clock strikes, and the clock, I’m told, does not wait for pigeons.”",
            gain = "spyglass",
            choices = {
                { text = "Hurry to Hyde Park", to = 4 },
            },
        },
        [4] = {
            text = "In Hyde Park, the Plucky Pudding swells over the Serpentine like an enormous striped plum pudding. A crowd cheers. Then a large man in a bowler hat pushes through it, waving a notebook.\n\n“Inspector Nab, Scotland Yard! The Bank of England was robbed this morning by a gentleman with a nervous moustache who left in a hurry. You have a moustache. You are leaving in a hurry. I put it to you!”",
            choices = {
                { text = "Explain politely that you are innocent", to = 5 },
                { text = "Cut the mooring ropes at once", to = 6 },
            },
        },
        [5] = {
            text = "“A likely story!” bellows Inspector Nab, who has never heard a story he found likely. He draws his umbrella like a rapier. Being British, you draw yours.\n\nThe crowd forms a polite circle. A nanny holds up her baby to get a better view. Archibald takes a seat on a park bench. “Ten pence on the bowler hat,” he mutters to a duck.",
            fight = { name = "Inspector Nab", skill = 6, stamina = 5, win = 7 },
        },
        [6] = {
            text = "You slash the ropes and drop a sandbag. The Pudding lurches upward, but Inspector Nab leaps and grabs the edge of the basket, dangling over the Serpentine and shouting about warrants.\n\nYou could drop another sandbag right where his bowler hat is. Aiming, however, has never been your strong point.",
            test = { stat = "luck", win = 7, lose = 5 },
        },
        [7] = {
            text = "Inspector Nab lands in the Serpentine with a magnificent splash and shakes his fist from among the swans. “I shall follow you to the ends of the earth!” he cries. “It’s round,” Archibald calls back. “You’ll end up here anyway.”\n\nLondon shrinks below you. Soon the white cliffs of Dover slide past and the grey Channel glitters. The wind offers two roads: a lazy breeze towards Paris, or a cold, fast current towards the mountains.",
            choices = {
                { text = "Drift down to Paris", to = 8 },
                { text = "Ride the fast wind to the Alps", to = 12 },
            },
        },
        [8] = {
            text = "You land on the Champ de Mars. A bearded engineer with a pencil behind his ear is sketching a tower made entirely of iron lace, three hundred metres tall.\n\n“Gustave Eiffel,” he says. “One day this will stand right here.” Archibald laughs so hard he falls off the basket. “A giant knitting needle in the middle of Paris? Nobody will ever build that, monsieur. And if they do, nobody will visit it.”",
            choices = {
                { text = "Ask Monsieur Eiffel about the winds", to = 9 },
                { text = "Lunch at a café (2 sovereigns)", to = 10, cost = 2 },
                { text = "Fly on at once", to = 11 },
            },
        },
        [9] = {
            text = "Eiffel’s eyes light up. Winds are his passion; a tower must stand against them. He unrolls a chart covered in arrows. “Over the Pacific, very high, there is a river of air that runs east like an express train. Find it, and you will gain a week.”\n\nHe rolls it up and gives it to you. “Bring it back when my tower is built. You will see, your pigeon will eat his words.” “Pigeons eat anything,” says Archibald.",
            gain = "wind_chart", set = "eiffel",
            choices = {
                { text = "Lunch at a café (2 sovereigns)", to = 10, cost = 2, noflag = "cafe", hide = true },
                { text = "Fly on", to = 11 },
            },
        },
        [10] = {
            text = "Onion soup with a lid of molten cheese. Coq au vin. A croissant for Archibald, who claims it is purely for scientific purposes. Then cheese, then a tart, then a little coffee, then a little brandy, then a little more cheese.\n\nYou feel wonderful. You also notice, with horror, that the sun is setting. A French lunch, it turns out, lasts roughly a day and a half.",
            stamina = 4, set = { "cafe", "late" },
            choices = {
                { text = "Visit Monsieur Eiffel", to = 9, noflag = "eiffel", hide = true },
                { text = "Fly on", to = 11 },
            },
        },
        [11] = {
            text = "Paris drops away, Notre-Dame and all. The Seine winds below like a dropped ribbon. Archibald perches on the rim of the basket and studies the clouds with a frown.\n\n“Two choices,” he says. “South-east over the Alps, cold but scenic. Or straight for Venice, warm but full of pigeons who think they’re better than me. They are, of course. They’re Italian.”",
            unset = { "eiffel", "cafe" },
            choices = {
                { text = "Head south-east to the Alps", to = 12 },
                { text = "Make straight for Venice", to = 15 },
            },
        },
        [12] = {
            text = "The Alps rise ahead, white and enormous, like a row of meringues somebody has left out for the gods. Mont Blanc glitters in the sun. The air is so cold that your moustache freezes into a stiff little brush.\n\nBelow, a wooden chalet puffs cheerful smoke. Above, the summit and the shortest way across. Something with very large wings is circling up there.",
            choices = {
                { text = "Land beside the Swiss chalet", to = 13 },
                { text = "Soar over Mont Blanc", to = 14 },
            },
        },
        [13] = {
            text = "An old cheesemaker with a beard down to his belt welcomes you in with a yodel. Inside, a pot of fondue bubbles. You dip bread until you can dip no more, while a cuckoo clock interrupts every fifteen minutes.\n\nWhen you leave, he rolls a whole wheel of Gruyère into your basket. “Grumpy animals love it,” he says mysteriously. “Yaks especially.” “What’s a yak?” asks Archibald. “You will see.”",
            stamina = 4, gain = "cheese",
            choices = {
                { text = "Float down towards Venice", to = 15 },
            },
        },
        [14] = {
            text = "As you skim the summit of Mont Blanc, a golden eagle the size of a hansom cab dives out of the sun. It has clearly mistaken the Plucky Pudding for an enormous striped egg, and it would like breakfast.\n\nArchibald hides in your hat. “Do something! Hit it with the umbrella! Hit it with the tea! Hit it with a sternly worded letter!”",
            fight = { name = "Golden Eagle", skill = 7, stamina = 6, win = 15, flee = 13 },
        },
        [15] = {
            text = "Venice! The Plucky Pudding drifts over the domes of St Mark’s Basilica and settles gently in the square, scattering a thousand pigeons. Archibald is instantly surrounded by Venetian cousins who coo at him in Italian.\n\nGondolas glide along the Grand Canal. Tourists point at your balloon with open mouths. Somewhere, a man is singing about the sun with tremendous conviction.",
            choices = {
                { text = "Sell balloon rides to the tourists", to = 16, noflag = "rides", hide = true },
                { text = "Take a gondola tour", to = 17, noflag = "gondola", hide = true },
                { text = "Fly on towards Egypt", to = 19 },
            },
        },
        [16] = {
            text = "You tie the Pudding to the Campanile and sell rides at a sovereign a time. A countess faints with joy. A doge’s great-grandnephew pays double.\n\nBy sunset your purse is heavy and a gondolier named Beppe has an idea. “Signore! A gondola, under a balloon! The Grand Canal from above! We make a fortune, you and me, for ever and ever!” Archibald’s cousins nod eagerly.",
            gold = 8, set = "rides",
            choices = {
                { text = "Open a gondola-balloon shop with Beppe", to = 18 },
                { text = "Take a gondola tour", to = 17, noflag = "gondola", hide = true },
                { text = "Fly on towards Egypt", to = 19 },
            },
        },
        [17] = {
            text = "Your gondolier sings under the Rialto Bridge, past palaces with their feet in the water, and buys you a cone of pistachio gelato. On the island of Murano, a glassblower blows you a little globe with the whole world inside it, in swirls of blue and gold.\n\n“For your journey,” he says. “Give it to someone who loves beautiful things.” Archibald looks at his reflection in it and sighs happily.",
            stamina = 3, gain = "glass", set = "gondola",
            choices = {
                { text = "Return to St Mark’s Square", to = 15 },
                { text = "Fly on towards Egypt", to = 19 },
            },
        },
        [18] = {
            text = "You shake Beppe’s hand. Within a month, Venice is full of flying gondolas. Tourists queue round the Doge’s Palace. You grow rich, plump and very good at singing about the sun.\n\nBack in London, Lord Stuffington-Smythe collects your savings with a smirk. You do not care: you are eating gelato at forty feet above the Grand Canal. Archibald has married a Venetian pigeon called Giulietta. Around the world can wait.",
            ending = "end",
        },
        [19] = {
            text = "The Mediterranean passes below, blue as a willow-pattern plate. Sicily, Crete, a few surprised dolphins. At last the yellow coast of Egypt appears, flat and hot.\n\nTo the east lies the brand-new Suez Canal, the shortcut to India. To the south, three triangles shimmer in the haze. “The Pyramids,” breathes Archibald. “Built by people who obviously had a lot of time. Unlike us.”",
            unset = { "rides", "gondola" },
            choices = {
                { text = "Follow the Suez Canal", to = 20 },
                { text = "Visit the Pyramids of Giza", to = 24 },
            },
        },
        [20] = {
            text = "Monsieur Ferdinand de Lesseps himself waves at you from the bank of his canal, and points at a sign. Even balloons must pay the toll.\n\nThen you notice a steamer chugging beside you. On its deck, in a bowler hat soaked with seawater and pride, stands Inspector Nab. “Halt in the name of the Queen!” He is trying to lasso your basket with a washing line.",
            choices = {
                { text = "Pay the canal toll (3 sovereigns)", to = 21, cost = 3 },
                { text = "Squeeze between the masts and go", to = 22 },
            },
        },
        [21] = {
            text = "De Lesseps pockets your sovereigns and, delighted to have a customer who flies, orders the canal cleared. Bells ring. Steamers move aside. Inspector Nab’s steamer is told to wait its turn, and it is a very long queue.\n\n“Bon voyage!” calls de Lesseps. A boy in a fez throws you a bag of dates. They are sticky and delicious, and you feel much better.",
            stamina = 2,
            choices = {
                { text = "Sail on to the Red Sea", to = 23 },
            },
        },
        [22] = {
            text = "You drop low over the canal, where the masts of a hundred ships stick up like a forest of very angry toothpicks. One wrong gust and the Plucky Pudding becomes a striped kebab.\n\nArchibald covers his eyes with a wing. “Tell me when we’re dead. Or in India. Either way, I’d like a warning.”",
            test = { stat = "skill", win = 23, lose = 27 },
        },
        [23] = {
            text = "The Red Sea, then the Gulf of Aden, then the wide warm Arabian Sea. Flying fish leap below. You make tea on a little spirit stove, and Archibald dunks his biscuit with great dignity.\n\nAfter many days the coast of India rises from the sea, green and steaming. The great port of Bombay is ahead. Inland, Archibald insists, lies the most beautiful building in the world.",
            choices = {
                { text = "Land at Bombay harbour", to = 30 },
                { text = "Fly inland towards Agra", to = 34 },
            },
        },
        [24] = {
            text = "The Pyramids of Giza are even larger than in the engravings. The Sphinx watches you land with the patient face of a cat who knows exactly where you hid the fish.\n\nA camel spits at Archibald, who is deeply offended. A guide in a white robe offers to take you to the top, or, for the very brave, inside, “where the Pharaoh keeps his secrets and also his spiders.”",
            choices = {
                { text = "Climb the Great Pyramid", to = 25 },
                { text = "Explore inside the Pyramid", to = 26 },
            },
        },
        [25] = {
            text = "You climb the giant steps of the Great Pyramid, one huffing block at a time. From the top you see the Nile, the desert, and Cairo’s minarets glittering. The guide shares a picnic of dates, flatbread and mint tea.\n\nAt the summit you release the Pudding again, and a warm desert wind carries you east across the canal, high above any bowler hat.",
            stamina = 3,
            choices = {
                { text = "Ride the wind to the Red Sea", to = 23 },
            },
        },
        [26] = {
            text = "Inside, the passage is narrow, hot and smells of four thousand years of dust. Your candle flickers. Corridors split and split again. Somewhere ahead, something is rustling. Possibly spiders. Possibly a Pharaoh. Probably spiders.\n\n“Left,” says Archibald. “No, right. No, I said left in Egyptian, which means right.”",
            test = { stat = "luck", win = 28, lose = 29 },
        },
        [27] = {
            text = "Your basket hooks the topmast of a coal barge, which drags you to Port Said and back while its captain shouts in four languages. It takes a whole day to untangle the ropes.\n\nLuckily, Inspector Nab is stuck in the same traffic jam, eating a sandwich furiously. At last you break free and float away down the canal.",
            set = "late",
            choices = {
                { text = "Sail on to the Red Sea", to = 23 },
            },
        },
        [28] = {
            text = "Your candle finds a chamber with a man in a pith helmet sitting on a stone sarcophagus. He is Professor Pettigrew of the British Museum, and he has been lost for three weeks, living on peppermints.\n\nYou lead him out by following Archibald, who can smell fresh air. The grateful Professor presses five sovereigns into your hand and lets you take off from the top of the Pyramid.",
            gold = 5,
            choices = {
                { text = "Ride the wind to the Red Sea", to = 23 },
            },
        },
        [29] = {
            text = "You trip over a sleeping cat, roll down a ramp, and land in a heap of linen bandages. By the time you wriggle free you are wrapped from head to toe.\n\nA team of archaeologists finds you, cries “Eureka!”, and ships you to London in a crate. You spend the rest of your days in a glass case at the British Museum, labelled “Mummy of a Confused Englishman, very rare”. Archibald visits on Sundays.",
            ending = "death",
        },
        [30] = {
            text = "Bombay harbour bustles with ships from every corner of the world. The bazaar smells of cardamom, jasmine and hot oil. A man sells golden bananas from a cart, and a troupe of monkeys watches the Plucky Pudding with intense professional interest.\n\n“Those monkeys,” whispers Archibald, “have the faces of criminals. I would know. I grew up in Croydon.”",
            choices = {
                { text = "Buy bananas at the bazaar (1 sovereign)", to = 31, cost = 1 },
                { text = "Moor the balloon and have a rest", to = 32 },
            },
        },
        [31] = {
            text = "You buy a fine bunch of bananas, ripe and golden, and a samosa so hot that steam comes out of your ears. Archibald pecks at the crumbs and declares Indian cooking his new religion.\n\nWhen you look back at the balloon, the monkeys have already climbed into the rigging. They are untying your sandbags one by one and passing them along like firemen with buckets.",
            gain = "bananas",
            choices = {
                { text = "Run back to the balloon", to = 32 },
            },
        },
        [32] = {
            text = "Monkeys! Dozens of them, swinging through the ropes, sitting in your basket, wearing your spare socks. Their leader, an elderly monkey with a grey beard, is sitting on your last sandbag and grinning.\n\nWithout sandbags you cannot steer at all. The Pudding will simply float wherever the wind fancies, which, at the moment, is towards a temple roof.",
            choices = {
                { text = "Offer them the bananas", to = 33, need = "bananas" },
                { text = "Chase them off with your umbrella", to = 35 },
            },
        },
        [33] = {
            text = "The old monkey sniffs the bananas, considers, and nods like a banker accepting a fair offer. In a flash every sandbag is back in place, neatly tied. One young monkey even returns your socks, folded.\n\nThe leader peels a banana, bows, and points to the north-east with it, towards Agra. Archibald is outraged. “He’s a better navigator than me. With a banana.”",
            lose = "bananas",
            choices = {
                { text = "Take off from Bombay", to = 36 },
            },
        },
        [34] = {
            text = "The Taj Mahal rises from the riverbank at Agra, white marble glowing pink in the dawn, perfectly reflected in its long pool. Even Archibald is speechless, which has never happened before.\n\nYou stay far longer than you meant to. In the gardens, the Maharaja of Bhurtipur, a jolly man with a turban like a wedding cake, is admiring the view and complaining that nobody ever brings him anything interesting.",
            set = "late",
            choices = {
                { text = "Give the Maharaja your glass globe", to = 37, need = "glass" },
                { text = "Admire the view and move on", to = 38 },
            },
        },
        [35] = {
            text = "You charge into the rigging, waving your umbrella and shouting “Shoo!” in your sternest Pall Mall voice. The monkeys shriek with delight. They think this is a game. They are very good at it.\n\nThe old leader claps his hands, and twenty monkeys leap at you at once, pulling at your hat, your coat-tails and your dignity.",
            fight = { name = "Monkey gang", skill = 6, stamina = 7, win = 36 },
        },
        [36] = {
            text = "At last the Plucky Pudding has all its sandbags, more or less, and only one monkey asleep in the basket, whom you gently return to a palm tree. Bombay falls behind.\n\nTwo ways lie ahead. North-east, Agra and the famous Taj Mahal. Due east, the open Bay of Bengal, the quickest road to China, if the weather behaves itself.",
            choices = {
                { text = "Visit the Taj Mahal at Agra", to = 34 },
                { text = "Head across the Bay of Bengal", to = 40 },
            },
        },
        [37] = {
            text = "The Maharaja turns the Murano globe in the sunlight and sighs with joy. “The whole world in a ball! Now I need never travel!” He throws a feast in your honour: curries, sweets, mangoes, and an elephant who plays the trumpet with its trunk.\n\nAt the end he presses a ruby the size of a pigeon’s egg into your hand. Archibald considers this comparison tasteless.",
            stamina = 4, gain = "ruby", lose = "glass",
            choices = {
                { text = "Fly north over the Himalayas", to = 39 },
                { text = "Head east towards Hong Kong", to = 40 },
            },
        },
        [38] = {
            text = "You tear yourself away from the Taj Mahal and cast off. Archibald looks back over his shoulder for a long time. “When I die,” he says, “I want something like that. Smaller, obviously. Pigeon-sized. In marble.”\n\nThe map offers two ways to China: north over the roof of the world, or east over the Bay of Bengal.",
            choices = {
                { text = "Fly north over the Himalayas", to = 39 },
                { text = "Head east across the Bay of Bengal", to = 40 },
            },
        },
        [39] = {
            text = "The Himalayas! Peaks so high that the clouds are below you. You land on a narrow ledge to take on fresh snow for tea, and find the ledge occupied.\n\nA yak. A huge, shaggy, extremely grumpy yak, chewing your basket with the slow determination of someone who has been waiting all his life for a basket to chew. He looks up and snorts. The ledge is his. So, apparently, is your balloon.",
            choices = {
                { text = "Offer the yak your Gruyère", to = 41, need = "cheese" },
                { text = "Wrestle the yak off the basket", to = 42 },
            },
        },
        [40] = {
            text = "Over the Bay of Bengal the sky turns the colour of a bruise. A monsoon storm swallows you whole. Rain comes sideways, then upwards. Lightning sizzles past the basket.\n\nArchibald is clinging to the rigging, shouting “I want my mother! I want Croydon!” You grab the ropes. Only steady hands and a cool head can keep the Pudding pointing east.",
            test = { stat = "skill", win = 43, lose = 44 },
        },
        [41] = {
            text = "The yak sniffs the Gruyère. His great face softens. He eats the whole wheel in one go, and then, to your astonishment, he smiles.\n\nHe nudges you towards a secret pass between two peaks where the wind blows straight to China, faster than any mule track. “Even yaks have contacts,” says Archibald, impressed. You whoosh through and save days.",
            lose = "cheese", unset = "late",
            choices = {
                { text = "Whoosh on to Hong Kong", to = 43 },
            },
        },
        [42] = {
            text = "You roll up your sleeves and seize the yak by the horns. The yak regards this as a rude introduction. He lowers his head and pushes back with the strength of a small mountain, which, in fur, is what he is.",
            fight = { name = "Grumpy Yak", skill = 8, stamina = 8, win = 43 },
        },
        [43] = {
            text = "Hong Kong! The harbour is crowded with junks with red bat-wing sails. The smell of roast duck rises from the waterfront. You land on the quay, very pleased with yourself.\n\nThen a familiar bowler hat appears from behind a stack of tea chests. Inspector Nab, sunburnt and furious, waves a warrant signed by the Governor. “Got you now! Bank robber! Moustache!”\n\nWorse, a customs officer has already confiscated everything smelly, fragile or yellow from your basket “for inspection”.",
            lose = { "cheese", "glass", "bananas" },
            choices = {
                { text = "Hide in a dim sum shop", to = 45 },
                { text = "Bluff your way past him", to = 46 },
            },
        },
        [44] = {
            text = "The storm hurls you up, down and sideways. When it finally spits you out, you are over Burma, then Siam, then somewhere nobody can name. It takes two days of zig-zagging to find the China coast.\n\nYou are bruised, soaked and behind schedule. Archibald has lost three tail feathers and all his good humour.",
            stamina = -2, set = "late",
            choices = {
                { text = "Limp on to Hong Kong", to = 43 },
            },
        },
        [45] = {
            text = "You dive through a bead curtain into a dim sum shop and hide behind a stack of bamboo steamers. The cook, Mrs Wong, gives you a wink and a plate of pork buns, dumplings and custard tarts. Nab stomps past outside.\n\nMrs Wong’s cousin sells silk next door, the finest in Hong Kong. “Strong as a sail,” she says. “Good for holes in balloons.”",
            stamina = 4,
            choices = {
                { text = "Buy a silk patch (3 sovereigns)", to = 47, cost = 3 },
                { text = "Sneak back to the balloon", to = 48 },
            },
        },
        [46] = {
            text = "You adjust your cravat and put on the voice of a duchess. “Bank robber? My good man, I am Lady Featherstonehaugh, and this is my pigeon.” Archibald, on cue, attempts a noble expression.\n\nInspector Nab squints. He looks at the moustache. He looks at the pigeon. It is all in the hands of fate.",
            test = { stat = "luck", win = 48, lose = 49 },
        },
        [47] = {
            text = "The silk is crimson, embroidered with tiny golden dragons and as strong as rope. Mrs Wong’s cousin folds it into a neat square and adds a needle and thread for free.\n\n“For when something bites your balloon,” she says cheerfully. Archibald asks what kind of something bites balloons. She only laughs.",
            gain = "silk",
            choices = {
                { text = "Sneak back to the balloon", to = 48 },
            },
        },
        [48] = {
            text = "You scramble into the basket and cast off before Nab can fill in the right forms. Hong Kong’s harbour shrinks below, and the wide sea opens up eastward.\n\nArchibald studies the horizon. “Japan is close. Yokohama, Mount Fuji, all very pretty. Or we can head straight out over the Pacific and pray. I’m a pigeon. I always pray.”",
            choices = {
                { text = "Hop across to Yokohama", to = 50 },
                { text = "Head straight out over the Pacific", to = 55 },
            },
        },
        [49] = {
            text = "Nab clamps the handcuffs on with a happy click. You spend a night in a Hong Kong cell with an escaped circus acrobat named Mr Lo, who teaches you to juggle with your boots.\n\nAt dawn, Mr Lo picks the lock with a chopstick, climbs onto your shoulders, and hoists you out through a skylight. Archibald is waiting on the roof, tapping a claw. “You lost a whole day.”",
            set = "late",
            choices = {
                { text = "Run for the balloon", to = 48 },
            },
        },
        [50] = {
            text = "Yokohama is all paper lanterns, tea houses and steaming noodle stalls. Beyond the town, Mount Fuji rises in a perfect snowy cone, as if someone drew it with a ruler.\n\nA poster announces a famous troupe of acrobats, the Long Noses, who need a volunteer “for a human pyramid, very high, very safe, mostly.” They pay in silver.",
            choices = {
                { text = "Join the acrobats for one night", to = 51 },
                { text = "Fly up around Mount Fuji", to = 52 },
            },
        },
        [51] = {
            text = "You are placed at the very top of a pyramid of twelve acrobats with enormous painted noses. The audience roars. You wobble, you sway, you sneeze, and the whole pyramid somehow sneezes with you and stays standing.\n\nThe crowd goes wild. The manager pays you six sovereigns and begs you to stay. Archibald, who passed the hat round, keeps one for himself.",
            gold = 6,
            choices = {
                { text = "Fly up around Mount Fuji", to = 52 },
            },
        },
        [52] = {
            text = "You float around the shoulders of Mount Fuji. The snow glitters, the lakes below shine like mirrors, and pilgrims in straw hats wave from the path to the summit.\n\nAt the foot of the mountain there is a little teahouse, and in town, the new telegraph office, where messages from London arrive in a single day by wire.",
            choices = {
                { text = "Check for news at the telegraph office", to = 53, without = "telegram", hide = true },
                { text = "Take tea at the mountain teahouse", to = 54 },
                { text = "Catch the high wind east", to = 55 },
            },
        },
        [53] = {
            text = "A clerk bows and hands you a telegram. It is from the Reform Club: “BANK ROBBER CAUGHT STOP ONE MR DASHWOOD STOP FALSE MOUSTACHE STOP INSPECTOR NAB PLEASE STOP CHASING EVERYONE STOP”.\n\nYou fold it carefully into your waistcoat. Archibald reads it twice and chuckles. “Proof! Now we only need to find Nab before he finds us. Which never takes long.”",
            gain = "telegram",
            choices = {
                { text = "Take tea at the mountain teahouse", to = 54 },
                { text = "Catch the high wind east", to = 55 },
            },
        },
        [54] = {
            text = "An old lady in a grey kimono serves you green tea with a slow, beautiful ceremony. Every movement is precise. You sit very still. Even Archibald stops fidgeting.\n\nYou come out feeling calm, rested and ready for anything, including the largest ocean on Earth. Mount Fuji watches you go, unbothered, as it has watched everyone go for a very long time.",
            stamina = 4,
            choices = {
                { text = "Catch the high wind east", to = 55 },
            },
        },
        [55] = {
            text = "The Pacific. Blue below, blue above, blue in every direction until you begin to feel blue yourself. There is no land for thousands of miles. The trade winds push you gently, very gently, far too gently, eastward.\n\nArchibald has started talking to a cloud he calls Gerald. Something must be done.",
            choices = {
                { text = "Use Eiffel’s chart to find the fast wind", to = 56, need = "wind_chart" },
                { text = "Scan the horizon with your spyglass", to = 58, need = "spyglass" },
                { text = "Drift with the trade winds", to = 57 },
            },
        },
        [56] = {
            text = "Following Eiffel’s arrows, you drop sandbags and climb higher and higher, until the air is thin and cold and your ears pop like champagne corks. Then, with a jolt, the river of air grabs the Pudding.\n\nYou rush east like an express train. Archibald is blown inside out, then back again. But the wind is wild, and it might carry you too high.",
            roll = { dice = 1, outcomes = { { upto = 2, to = 60 }, { upto = 6, to = 61 } } },
        },
        [57] = {
            text = "Days pass. The trade winds yawn. You play cards with Archibald, who cheats, and you eat your last biscuits. By the time anything happens, you have lost several precious days.\n\nAnd then something happens. A black balloon with a skull and crossbones painted on it rises out of a cloud, and a voice shouts “Ahoy! Prepare to be boarded, landlubber! Or skylubber! Whichever!”",
            set = "late",
            choices = {
                { text = "Face the sky pirates", to = 63 },
            },
        },
        [58] = {
            text = "Through the spyglass you sweep the horizon. Nothing, nothing, a whale, nothing... and then, far off, a black balloon with a skull and crossbones, coming your way with nasty speed.\n\nSky pirates! But they have not seen you yet. A great white cloud bank drifts nearby, thick as clotted cream.",
            choices = {
                { text = "Hide inside the cloud bank", to = 64 },
                { text = "Face the sky pirates", to = 63 },
            },
        },
        [59] = {
            text = "The captain of the steamer Henrietta snatches your gold, roars “Full steam!” and the ship tears out of New York harbour. When the coal runs out, he burns the deck chairs, then the doors, then his wooden leg.\n\nOn the dock, Inspector Nab grows smaller and smaller, shaking his fist. The Plucky Pudding is tied on deck, puffing proudly in the wind.",
            choices = {
                { text = "Steam across the Atlantic", to = 90 },
            },
        },
        [60] = {
            text = "The fast wind flings you upward. Higher. Higher. The sea becomes a puddle, the clouds a rug. The sky turns dark blue, then black, and stars come out at noon.\n\nAhead, huge and silver, the Moon is rising, and it is definitely getting bigger. “I think,” says Archibald in a tiny voice, “we have gone slightly too far.”",
            choices = {
                { text = "Let out some hot air at once", to = 61 },
                { text = "Keep rising for the view", to = 62 },
            },
        },
        [61] = {
            text = "You pull the valve cord. The Pudding sighs and sinks back into the river of air, which carries you east at a gallop. Days are saved by the hour.\n\nOne dawn, the coast of California appears, golden in the morning sun, with a city of wooden houses tumbling down steep hills to a magnificent bay. You are ahead of schedule. Archibald does a little dance.",
            unset = "late",
            choices = {
                { text = "Descend into San Francisco", to = 65 },
            },
        },
        [62] = {
            text = "You keep rising, and rising, until the Pudding gently bumps against the Moon. It is not made of cheese, which is a great disappointment to Archibald.\n\nYou plant your umbrella, declare the Moon a branch of the Reform Club, and settle down with your tea. You never win your bet, but you do become the first person in the Moon. They name a small crater after you. It is, unfortunately, the shape of a pigeon.",
            ending = "death",
        },
        [63] = {
            text = "The pirate balloon pulls alongside. Its captain has a beard that blows about like a thundercloud and a parrot on each shoulder. “Captain Cloudbeard!” he booms. “Terror of the upper air! Hand over your gold, your goods and that delicious-looking pigeon!”\n\nArchibald faints. The bosun, a large man called Gusty, grins and readies a boarding hook.",
            choices = {
                { text = "Offer the pirates a nice cup of tea", to = 67, need = "tea" },
                { text = "Fight the sky pirates", to = 66 },
            },
        },
        [64] = {
            text = "You plunge into the cloud. Everything turns white and wet and silent. Outside, you hear the pirates searching. “Where’d they go, Cap’n?” “Into that cloud, you fool!” “Which cloud? They all look the same!”\n\nAfter an hour they give up and drift away, arguing. When you come out, a friendly breeze carries you all the way to the American coast.",
            choices = {
                { text = "Descend into San Francisco", to = 65 },
            },
        },
        [65] = {
            text = "San Francisco is booming. Miners with dusty beards, merchants in tall hats, and a famous local eccentric who calls himself Emperor Norton the First, Emperor of the United States, who graciously knights Archibald.\n\nIn the hills, people still pan for gold. At the station, the great new railway crosses the whole continent. And there is a telegraph office, of course.\n\nYou leave your battered sea gear with the Emperor, who declares it a national treasure.",
            lose = { "spyglass", "wind_chart", "silk", "tea", "umbrella" },
            choices = {
                { text = "Visit the telegraph office", to = 73, without = "telegram", hide = true },
                { text = "Pan for gold in the hills", to = 74 },
                { text = "Head for the transcontinental railway", to = 75 },
            },
        },
        [66] = {
            text = "Gusty swings across on a rope, cutlass in his teeth. Captain Cloudbeard follows, both parrots screaming. You raise your umbrella. Archibald wakes up and pecks a parrot on the nose, purely on principle.\n\n“Have at you, scurvy gentlefolk!” roars the captain, who learnt his manners from a library book.",
            fight = { enemies = {
                { name = "Bosun Gusty", skill = 7, stamina = 6 },
                { name = "Captain Cloudbeard", skill = 9, stamina = 8 },
            }, win = 68 },
        },
        [67] = {
            text = "“Tea?” whispers Captain Cloudbeard. His lip trembles. “Proper tea? Earl Grey? I haven’t had a proper cuppa since I took up piracy.” You brew a pot on your spirit stove. The pirates sit in a row, little fingers raised.\n\nAt the end the captain blows his nose. “You’re a gentleman. Here.” He gives you a bag of coins and points you to a shortcut breeze to America.",
            lose = "tea", gold = 5,
            choices = {
                { text = "Follow the breeze to America", to = 65 },
            },
        },
        [68] = {
            text = "Cloudbeard and Gusty retreat to their own balloon, which promptly springs a leak and sinks gently into the sea, where they paddle off in a lifeboat, quarrelling. They have left behind a bag of gold.\n\nBut the battle has torn a long rip in the Plucky Pudding. Hot air is hissing out. You are slowly but definitely sinking.",
            gold = 8,
            choices = {
                { text = "Sew on the silk patch", to = 69, need = "silk" },
                { text = "Plug the hole with your umbrella", to = 70, need = "umbrella" },
                { text = "Hope for the best", to = 71 },
            },
        },
        [69] = {
            text = "You climb into the rigging with Mrs Wong’s needle and thread and sew the crimson silk patch over the rip. The golden dragons look very fierce on the striped balloon. The hissing stops.\n\nThe Pudding rises again, a little proud of its new tattoo. A few days later, the coast of California appears on the horizon.",
            choices = {
                { text = "Descend into San Francisco", to = 65 },
            },
        },
        [70] = {
            text = "You open the umbrella inside the balloon and jam it against the rip. It holds, more or less. The Pudding limps on, wheezing like an old gentleman climbing stairs.\n\nThe umbrella will never be the same again, and neither will you. But a few days later, the coast of California appears, golden and welcoming.",
            lose = "umbrella",
            choices = {
                { text = "Descend into San Francisco", to = 65 },
            },
        },
        [71] = {
            text = "You throw out everything you can spare: a spare boot, the cards, Archibald’s collection of interesting pebbles. You whistle a hopeful tune. The Pudding sinks lower and lower, until the waves splash the basket.\n\nArchibald closes his eyes. “If we survive this,” he says, “I am going to be a chicken. Chickens don’t fly.”",
            test = { stat = "luck", win = 65, lose = 72 },
        },
        [72] = {
            text = "With a gentle plop, the Plucky Pudding settles onto the waves. A family of whales comes to investigate, finds you charming, and adopts you.\n\nYou spend the rest of your life riding across the Pacific on the back of a whale called Bertha, eating fish and singing sea shanties. You never see London again. Archibald becomes the only pigeon in history to be a respected member of a whale pod.",
            ending = "death",
        },
        [73] = {
            text = "The telegraph clerk has a message waiting: “BANK ROBBER CAUGHT STOP ONE MR DASHWOOD STOP FALSE MOUSTACHE STOP INSPECTOR NAB PLEASE STOP CHASING EVERYONE STOP”.\n\nYou are innocent, officially! Now you only need to show it to Nab, who, being Nab, will certainly be lurking somewhere on the other side of America with handcuffs.",
            gain = "telegram",
            choices = {
                { text = "Pan for gold in the hills", to = 74 },
                { text = "Head for the transcontinental railway", to = 75 },
            },
        },
        [74] = {
            text = "You borrow a pan from an old miner called Whiskers McGee and squat in a cold mountain stream, swirling gravel. It takes ages. Archibald supervises from a rock, giving terrible advice.\n\nA frog jumps out of the water and lands on your hat. The old-timers say Calaveras County frogs are champion jumpers. You swirl one last time.",
            set = "late",
            roll = { dice = 1, outcomes = { { upto = 3, to = 76 }, { upto = 6, to = 77 } } },
        },
        [75] = {
            text = "The transcontinental railway runs all the way from California to the East Coast, opened only three years ago. A great steam engine snorts at the platform, its cowcatcher gleaming.\n\nThe conductor eyes your balloon. “You can ride inside, or float alongside, partner. Ticket’s four sovereigns. Floating’s free, but this here’s the Wild West, and things blow up mighty fast.”",
            choices = {
                { text = "Buy a train ticket (4 sovereigns)", to = 78, cost = 4 },
                { text = "Fly alongside the train", to = 79 },
            },
        },
        [76] = {
            text = "Nothing in your pan but gravel, a button, and the frog, which looks at you as if this is all your fault. Whiskers McGee laughs till his hat falls off.\n\n“That’s mining for ya, partner. Most of us get nothin’ but cold feet and a frog.” You give him back his pan and trudge to the railway station.",
            choices = {
                { text = "Head for the transcontinental railway", to = 75 },
            },
        },
        [77] = {
            text = "Something glints in the pan. You pick it out with trembling fingers: a gold nugget the size of a walnut! Whiskers McGee throws his hat in the air and dances a jig.\n\n“You’re rich, partner! Well, a bit rich. Rich enough to buy a mule. Or a moustache comb.” Archibald insists on biting it to check it is real, and chips his beak.",
            gain = "nugget",
            choices = {
                { text = "Head for the transcontinental railway", to = 75 },
            },
        },
        [78] = {
            text = "You settle into a plush seat, the balloon tied to the roof. Mountains, deserts and endless prairies roll past. You eat beans. Archibald eats beans. You both regret the beans.\n\nThen the train shudders to a halt. Ahead, thousands of buffalo are crossing the tracks, very slowly, with no intention of hurrying for anyone.",
            choices = {
                { text = "Wait for the buffalo to pass", to = 80 },
                { text = "Climb into the balloon and fly on", to = 79 },
            },
        },
        [79] = {
            text = "You float above the prairie, following the iron rails. Then the sky turns green, then black. A twister, a great spinning funnel of dust, comes roaring across the plains straight at you.\n\nCowboys gallop away below, hats flying. Archibald grips the rigging. “I knew the Wild West would be wild. I did not expect it to be this west.”",
            test = { stat = "skill", win = 81, lose = 82 },
        },
        [80] = {
            text = "A scout in buckskin with a splendid moustache and long hair rides up and introduces himself as Buffalo Bill Cody. He shares his coffee and tells tall tales about the prairie while the herd ambles past.\n\nIt is a lovely afternoon, and an even lovelier evening, and by the time the last buffalo has gone, a whole day has vanished with it.",
            stamina = 3, set = "late",
            choices = {
                { text = "Ride on to the Great Lakes", to = 81 },
            },
        },
        [81] = {
            text = "The Great Lakes glitter like silver plates. Ahead, a thunder roars and a great cloud of mist rises into the sky. Niagara Falls! Tons of water tumble over the edge every second.\n\nA guide points at the rising mist. “Updraft over the Falls, sir, could shoot you east like a cork. Or you could go the long way round, nice and safe, through Buffalo.”",
            choices = {
                { text = "Ride the updraft over the Falls", to = 83 },
                { text = "Take the long way round", to = 84 },
            },
        },
        [82] = {
            text = "The twister catches you and spins you like a top. Archibald goes round and round, then upside down, then round again. You lose your hat, your breakfast and your sense of direction.\n\nThe twister drops you, eventually, in a cornfield in Ohio, two days off course. You patch yourself up and float on, dizzy.",
            stamina = -3, set = "late",
            choices = {
                { text = "Drift on to the Great Lakes", to = 81 },
            },
        },
        [83] = {
            text = "You steer the Plucky Pudding into the roaring mist. The basket is soaked. Water drums on the balloon. Rainbows flash past. The updraft grabs you, but one false move and you will be plunging over the Falls instead of flying above them.",
            test = { stat = "skill", win = 100, lose = 86 },
        },
        [84] = {
            text = "You take the long, safe road through the town of Buffalo, where, disappointingly, there are no buffalo at all. Archibald demands a refund.\n\nIt takes an extra day, but you arrive dry and in one piece. The forests of New York State roll past below, gold and red with autumn.",
            set = "late",
            choices = {
                { text = "Float on to New York City", to = 85 },
            },
        },
        [85] = {
            text = "New York! Ships crowd the harbour, Broadway bustles, and the new Central Park spreads green among the brownstones. The steamship to Liverpool leaves this very evening.\n\nAnd on the dock, inevitable as rain, stands Inspector Nab, holding a pair of handcuffs that he has polished across three continents. “At last!” he cries. “The final chapter!”",
            choices = {
                { text = "Show Inspector Nab the telegram", to = 87, need = "telegram" },
                { text = "Run for the steamship", to = 88 },
                { text = "Take off from Central Park", to = 89 },
            },
        },
        [86] = {
            text = "A gust spins you sideways into the falling water. The Pudding is dragged over the edge, and you land, by sheer coincidence, in a large pickle barrel floating at the bottom.\n\nYou bob out, alive and very surprised, and become a sensation. You spend the rest of your days going over Niagara Falls in a barrel for cheering crowds, twice daily. You never get back to London. Archibald sells the tickets.",
            ending = "death",
        },
        [87] = {
            text = "Inspector Nab reads the telegram. He reads it again. His moustache trembles. Then he bursts into tears and hugs you. “Dashwood! I knew it! Well, I didn’t. I am so terribly sorry.”\n\nTo make amends he books you both onto the fastest steamer in the harbour, and pays himself. “I’m coming with you. After all this, I simply must see how it ends.” You have a new friend.",
            set = "friend", unset = "late",
            choices = {
                { text = "Steam across the Atlantic", to = 90 },
            },
        },
        [88] = {
            text = "You sprint along the dock, Nab puffing after you, and leap aboard the steamer Henrietta just as she casts off. Her captain is a wild-eyed fellow who could go faster, for a price.\n\n“Five sovereigns and I burn everything that isn’t nailed down,” he says. “Maybe the things that are, too.”",
            choices = {
                { text = "Pay for full steam (5 sovereigns)", to = 59, cost = 5 },
                { text = "Jump back to the balloon in the park", to = 89 },
            },
        },
        [89] = {
            text = "You race to Central Park and leap into the basket, but Inspector Nab is right behind you, panting. He grabs the edge as you rise. “One last round!” he roars, and draws his umbrella, slightly bent from three continents of service.\n\nArchibald sighs. “Here we go again. I’ll be on the bench.”",
            fight = { name = "Inspector Nab", skill = 7, stamina = 6, win = 90 },
        },
        [90] = {
            text = "The Atlantic. The last ocean. The waves are grey and huge, the wind wild. Behind you, America. Ahead, home. Archibald is pacing the rail and counting days on his claws, and he keeps running out of claws.\n\nA westerly gale is howling up from behind. You could ride it, risky but very fast. Or you could keep steady and trust your luck so far.",
            choices = {
                { text = "Ride the westerly gale", to = 91 },
                { text = "Keep steady as she goes", to = 92 },
            },
        },
        [91] = {
            text = "You open everything and let the gale grab you. The ship or the Pudding, whatever is carrying you, races over the waves like a runaway horse. Spray flies. Masts creak. Archibald is pinned to the rail by the wind like a feathered pancake.\n\nIt is wonderful, if you survive it.",
            test = { stat = "luck", win = 101, lose = 94 },
        },
        [92] = {
            text = "You keep a steady course across the grey ocean, day after day. Archibald plays patience. You drink the last of anything there is to drink.\n\nAt last a green smudge appears: Ireland! Then Cornwall, then the long run up the English Channel, and the Thames, and the smoke of London on the horizon.",
            choices = {
                { text = "Hurry to London", to = 93 },
            },
        },
        [93] = {
            text = "London! Big Ben looms through the fog. You land in Pall Mall, scattering cabbies, and dash towards the Reform Club. The great clock is about to strike.\n\nYou glance at Archibald. He glances at the clock. Everything depends on how many days you have lost along the way.",
            choices = {
                { text = "Stroll into the Reform Club on time", to = 95, noflag = "late" },
                { text = "Race the clock up the steps", to = 96, flag = "late" },
            },
        },
        [94] = {
            text = "The gale turns into a storm, the storm into a hurricane. You are tossed about for days and lose a whole lot of skin and dignity. You arrive off Ireland battered, soaked and late.\n\nArchibald, white as a seagull from the salt spray, looks at the coast of Cornwall and says only: “Home. Nearly.”",
            stamina = -3, set = "late",
            choices = {
                { text = "Hurry to London", to = 93 },
            },
        },
        [95] = {
            text = "You walk through the doors just as the clock begins to strike. Lord Stuffington-Smythe drops his port. The members rise and cheer. Eighty days, by balloon, round the world!\n\nHe hands you your winnings with a face like a wet weekend. Everyone wants to hear the story. Archibald clears his throat on the mantelpiece, ready to tell it all, mostly about himself.",
            choices = {
                { text = "Present the Maharaja’s ruby", to = 98, need = "ruby" },
                { text = "Show off your gold nugget", to = 98, need = "nugget" },
                { text = "Introduce your new friend Inspector Nab", to = 98, flag = "friend" },
                { text = "Simply collect your winnings", to = 99 },
            },
        },
        [96] = {
            text = "You fly up the steps three at a time. The doorman flings open the door. The clock is striking, and you are racing it, legs whirling, Archibald flapping ahead of you to hold the door.\n\nEverything depends on a last bit of luck.",
            test = { stat = "luck", win = 95, lose = 97 },
        },
        [97] = {
            text = "You burst into the room just as the last chime dies away. Lord Stuffington-Smythe holds up his pocket watch. “Eighty days and one minute! You lose!”\n\nYour savings are gone. But the newspapers love you: “ONE MINUTE LATE ROUND THE WORLD!” A publisher wants your memoirs. A circus wants Archibald. You will be fine. Probably. You can always go round again, in seventy-nine days.",
            ending = "end",
        },
        [98] = {
            text = "The members gasp. Your fortune is doubled, then tripled, as the story spreads. Inspector Nab, if he is with you, is made an honorary member and weeps into a napkin. The Maharaja’s ruby, the gold nugget, the tales of yaks and pirates, all end up in a glass case in the Club library.\n\nYou buy a new balloon, the Plucky Pudding II. Archibald receives a gold medal and a monument, pigeon-sized, in marble. Exactly as he wanted.",
            ending = "win",
        },
        [99] = {
            text = "You collect your winnings, your savings safe and doubled, and walk out into Pall Mall a celebrity. Strangers raise their hats. Cabbies wave.\n\nThat evening you sit by your fire with a cup of tea, the world behind you, and Archibald asleep on the back of your armchair. “Same time next year?” he mumbles. “Round the other way, maybe.”",
            ending = "win",
        },
        [100] = {
            text = "The updraft fires you out of the mist like a cork from a bottle. You shoot high over the Falls, rainbows streaming behind you, and the wind flings you eastward at tremendous speed.\n\nYou are soaked, shaken and laughing. Archibald’s feathers stick up in all directions. Within hours you are over the Hudson, a full day ahead of where you ought to be.",
            unset = "late",
            choices = {
                { text = "Float on to New York City", to = 85 },
            },
        },
        [101] = {
            text = "The gale carries you across the Atlantic in record time. On the fourth morning, Ireland appears, then Cornwall, and then the long run up the Channel and the Thames, with the smoke of London ahead.\n\nArchibald is counting on his claws again, and this time he has claws to spare. “We might do it,” he whispers. “We might actually do it.”",
            unset = "late",
            choices = {
                { text = "Hurry to London", to = 93 },
            },
        },
    },
}
