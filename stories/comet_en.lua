return {
    title      = "The Jolly Rocket",
    author     = "Gamebook",
    lang       = "en",
    blurb      = "Cabin kid on a pirate starship: win back the Admiral's treasure map from a card-sharp robot.",
    sheet      = true,
    start      = 1,
    start_gold = 8,
    items = {
        spyglass  = "Brass spyglass",
        parrot    = "Robo-parrot",
        cheese    = "Lunar cheddar",
        grog      = "Ginger grog",
        repellent = "Kraken repellent",
        deck      = "Marked deck",
        map       = "Andromeda map",
        hat       = "Captain's hat",
    },
    sections = {
        [1] = {
            text = "Six bells on the pirate starship Jolly Rocket, and you are scrubbing the poop deck, which in space is exactly as glamorous as it sounds. You are the cabin kid: the youngest, the smallest and the only one who knows where the mop lives.\n\nA bellow rattles every porthole. \"CABIN KID! To me!\" That is Admiral Calico Comet, and he sounds like a man who has lost something important. Possibly his dignity.",
            choices = {
                { text = "Hurry to the captain's cabin", to = 2 },
                { text = "Slip into the crew mess first", to = 3 },
            },
        },
        [2] = {
            text = "Admiral Calico Comet sits slumped beneath a portrait of Sir Francis Drake, his ginger whiskers drooping. \"I lost it,\" he moans. \"The map to the treasure of the Andromeda Galleon. And my hat! Gambled away in a game of cards with a robot called the Ace of Spanners.\"\n\nHe blows his nose on the flag. \"Get them back, kid, before the crew finds out their captain is a hatless twit.\"",
            choices = {
                { text = "Check on the crew in the mess", to = 3 },
                { text = "Head straight for the bridge", to = 4 },
            },
        },
        [3] = {
            text = "In the mess, first mate Anne Bonny-Byte and quartermaster Mary Read-Only are muttering over bowls of grey space-gruel. \"No treasure, no shore leave, and this gruel winked at me,\" grumbles Anne. \"One more week of this and it's mutiny.\"\n\nMary nods darkly and sharpens a spoon. You make a careful mental note: the crew wants shore leave, decent food and a captain who does not lose maps at cards.",
            set = "heard_grumble",
            choices = {
                { text = "Report to the captain's cabin", to = 2 },
                { text = "Head for the bridge", to = 4 },
            },
        },
        [4] = {
            text = "On the bridge, old Sextant Sam the navigator unrolls a star chart covered in tea rings. \"The Ace of Spanners could be anywhere, kid. But three spots hear every rumour in the system.\"\n\nHe taps them with a fishbone. \"The Asteroid of Treasure Island, where an android cook knows everyone. Port Royal Station, full of smugglers and card sharps. Or the Rings of Saturn car-boot sale, where you can buy anything, including trouble.\"",
            choices = {
                { text = "Set course for Treasure Island", to = 5 },
                { text = "Dock at Port Royal Station", to = 21 },
                { text = "Visit the Rings of Saturn sale", to = 35 },
            },
        },
        [5] = {
            text = "The Asteroid of Treasure Island is shaped suspiciously like a skull, which the tourist board insists is a coincidence. A creaky sign reads: The Spyglass Inn, Est. 1883, Fine Food, No Questions.\n\nAll over the dusty ground someone has painted large red Xs, dozens of them. Beyond the inn rises Skeleton Ridge, where a thin voice is singing about toasted cheese.",
            choices = {
                { text = "Enter the Spyglass Inn", to = 6 },
                { text = "Dig where X marks the spot", to = 7 },
                { text = "Climb up Skeleton Ridge", to = 8 },
            },
        },
        [6] = {
            text = "Behind the counter stands Long John Silver, an android cook with one titanium leg and a smile full of chrome teeth. On his shoulder a robotic parrot squawks \"Pieces of eight! Pieces of eight!\" in perfect binary.\n\n\"Welcome, shipmate,\" purrs Silver, stirring a pot that bubbles ominously. \"Hungry? Curious? Both cost money aboard the Spyglass, though a willing pair of hands is always welcome in my galley.\"",
            choices = {
                { text = "Pay for gossip (3 doubloons)", to = 9, cost = 3, noflag = "double_tip", hide = true },
                { text = "Offer to help in the kitchen", to = 10 },
                { text = "Order the stargazy pie (2 doubloons)", to = 11, cost = 2 },
                { text = "Leave for Halley's Comet", to = 50 },
            },
        },
        [7] = {
            text = "You grab a shovel propped conveniently against a rock, choose the most promising X and dig with the enthusiasm of a terrier at the seaside. Dust flies. Pebbles bounce off your nose. Something below goes clunk, and something else, rather worryingly, goes beep.",
            roll = { dice = 1, outcomes = {
                { upto = 2, to = 12 },
                { upto = 5, to = 13 },
                { upto = 6, to = 14 },
            } },
        },
        [8] = {
            text = "On Skeleton Ridge lives Ben Gunn the Ninth, a hermit robot marooned here so long that moss grows on his elbows. \"Many's the long night I've dreamed of cheese,\" he sighs. \"Toasted, mostly.\"\n\nHis eyes light up like headlamps. \"You wouldn't have a nibble of cheese about you, would you, young sailor? Ben Gunn knows a thing or two about robots that cheat.\"",
            choices = {
                { text = "Give him your lunar cheddar", to = 15, need = "cheese" },
                { text = "Ask him about the Ace of Spanners", to = 16 },
                { text = "Go down to the Spyglass Inn", to = 6 },
            },
        },
        [9] = {
            text = "Silver pockets the doubloons and leans close, smelling of engine oil and gravy. \"The Ace of Spanners, eh? Flew to Mars, he did, to fleece tourists on top of Olympus Mons.\"\n\nHe taps his nose. \"Here's a secret for free, shipmate. That robot can never, ever refuse a double-or-nothing. It's in his programming, poor tin fool.\" The parrot looks at you with a price tag dangling from its foot.",
            set = "double_tip",
            choices = {
                { text = "Buy the robo-parrot (4 doubloons)", to = 17, cost = 4, without = "parrot", hide = true },
                { text = "Climb up Skeleton Ridge", to = 8 },
                { text = "Leave for Halley's Comet", to = 50 },
            },
        },
        [10] = {
            text = "Silver hands you an apron printed with a skull and crossed spatulas. \"Twelve hungry customs inspectors want twelve plates of fish and chips, and they want 'em in sixty seconds. Go!\"\n\nThe fryer spits like a dragon, the fish slither, the chips leap about in zero gravity. You will need quick hands and a cool head to get through this.",
            test = { stat = "skill", win = 18, lose = 19 },
        },
        [11] = {
            text = "The stargazy pie arrives, a proud Cornish classic with little fish heads poking out of the crust to gaze at the stars. Here they gaze at actual stars through the window, which makes them look rather smug.\n\nIt is delicious. Warmth floods your boots and your courage climbs back up to where it belongs. Silver watches you lick the plate and chuckles.",
            stamina = 4,
            choices = {
                { text = "Pay for gossip (3 doubloons)", to = 9, cost = 3, noflag = "double_tip", hide = true },
                { text = "Offer to help in the kitchen", to = 10 },
                { text = "Leave for Halley's Comet", to = 50 },
            },
        },
        [12] = {
            text = "The ground erupts and out pops a Rusty Mole-bot, a burrowing robot with drill-bit hands and a deep grudge against anyone who digs on its patch. \"MY HOLE,\" it grinds. \"FIND YOUR OWN HOLE.\"\n\nIt whirrs its drills and charges at your knees. There is nothing for it but to grab the shovel and fight.",
            fight = { name = "Rusty Mole-bot", skill = 6, stamina = 5, win = 13 },
        },
        [13] = {
            text = "Under the X lies a battered sea chest. Inside, wrapped in an old copy of the Pirates' Gazette, gleam six shiny doubloons. Somebody really did bury treasure here, although judging by the note, it was mostly to hide it from his mother-in-law.\n\nThe hole below looks deep and inviting. Surely there is more down there?",
            gold = 6,
            choices = {
                { text = "Visit the Spyglass Inn", to = 6 },
                { text = "Climb up Skeleton Ridge", to = 8 },
                { text = "Dig deeper, much deeper", to = 20 },
            },
        },
        [14] = {
            text = "No gold, but something far stranger: a perfect wheel of lunar cheddar, sealed in wax, stamped Product of the Moon. It smells strong enough to stun a seagull at forty paces.\n\nUp on Skeleton Ridge, the singing about toasted cheese stops abruptly. Somebody up there has a very good nose.",
            gain = "cheese",
            choices = {
                { text = "Climb up Skeleton Ridge", to = 8 },
                { text = "Visit the Spyglass Inn", to = 6 },
            },
        },
        [15] = {
            text = "Ben Gunn hugs the cheese and weeps oily tears. \"Bless you, sailor! Take this brass spyglass, I've nothing left to look at but cheese.\"\n\nThen he whispers, \"That Ace of Spanners stopped here once. He keeps spare aces hidden in a panel in his chest, he does. Shout it out in front of a crowd and he'll be shamed into honesty.\" You thank him and pocket the precious secret.",
            lose = "cheese",
            gain = "spyglass",
            set = "knows_cheat",
            choices = {
                { text = "Visit the Spyglass Inn", to = 6 },
                { text = "Leave for Halley's Comet", to = 50 },
            },
        },
        [16] = {
            text = "\"Ben Gunn don't give secrets away free,\" says the hermit, folding his mossy arms. Then he immediately gives one away free, because he hasn't spoken to anyone in eleven years.\n\n\"The Ace went off to Mars, he did. Silly tin dandy can't say no to a double-or-nothing, never could. Lost his own left foot that way once.\" He sniffs hopefully at your pockets. \"Got any cheese yet?\"",
            set = "double_tip",
            choices = {
                { text = "Visit the Spyglass Inn", to = 6 },
                { text = "Leave for Halley's Comet", to = 50 },
            },
        },
        [17] = {
            text = "You hand over the doubloons and the robo-parrot hops onto your shoulder. \"Captain Flint Two-Point-Oh,\" it announces. \"Navigation, insults and light thieving. Pieces of eight!\"\n\nSilver waves a sentimental spatula. \"Treat him kindly, shipmate. He once nicked the Governor of Jamaica's wig in mid-sentence.\" The parrot preens with obvious pride.",
            gain = "parrot",
            choices = {
                { text = "Climb up Skeleton Ridge", to = 8 },
                { text = "Leave for Halley's Comet", to = 50 },
            },
        },
        [18] = {
            text = "Twelve perfect plates, golden and crisp, slide out with a second to spare. The customs inspectors applaud with their clamps. Silver pays you three doubloons and a fish finger, and leans close.\n\n\"You've earned a secret, shipmate. The Ace of Spanners is on Mars, top of Olympus Mons, and he can never refuse a double-or-nothing.\" He winks. \"Fancy buying my parrot, by any chance?\"",
            gold = 3,
            stamina = 2,
            set = "double_tip",
            choices = {
                { text = "Buy the robo-parrot (4 doubloons)", to = 17, cost = 4, without = "parrot", hide = true },
                { text = "Climb up Skeleton Ridge", to = 8 },
                { text = "Leave for Halley's Comet", to = 50 },
            },
        },
        [19] = {
            text = "The fryer roars, the batter explodes, and you emerge with no eyebrows and a fish stuck to your forehead. The customs inspectors laugh so hard one of them blows a fuse.\n\nSilver chuckles kindly. \"Never mind, shipmate. Here's one for nothing: the Ace of Spanners is on Mars, and he can't refuse a double-or-nothing.\" Your face stings, but your brain is richer.",
            stamina = -2,
            set = "double_tip",
            choices = {
                { text = "Climb up Skeleton Ridge", to = 8 },
                { text = "Leave for Halley's Comet", to = 50 },
            },
        },
        [20] = {
            text = "You dig. And dig. And dig some more, past the rocks, past the fossils, past a very surprised Mole-bot family having dinner. Then the shovel goes through into nothing at all.\n\nYou have dug straight through the asteroid. Out you pop on the far side and drift gently off into the stars, still clutching your shovel. Somewhere, a robotic parrot squawks \"Greedy!\" Your adventure ends here.",
            ending = "death",
        },
        [21] = {
            text = "Port Royal Station floats where the old Jamaican pirate port might have floated, had it not slid into the sea in 1692. This one is bolted firmly to an asteroid, just in case.\n\nAt the airlock, two Customs Robots block your way, all flashing lights and clipboards. \"ANYTHING TO DECLARE? PARROTS? CANNONS? UNPAID LIBRARY BOOKS?\" Their stun-prods crackle in an unfriendly way.",
            choices = {
                { text = "Bribe them (4 doubloons)", to = 24, cost = 4 },
                { text = "Fight your way past", to = 22 },
                { text = "Sneak in through the cargo chute", to = 23 },
            },
        },
        [22] = {
            text = "\"NON-COMPLIANCE DETECTED,\" beeps the first robot. \"PREPARE FOR PAPERWORK,\" beeps the second, which sounds far worse. They advance with prods raised and rubber stamps at the ready.\n\nYou roll up your sleeves. Two against one is hardly fair, but nobody ever said customs was fair.",
            fight = { enemies = {
                { name = "Customs Robot Mk I", skill = 6, stamina = 4 },
                { name = "Customs Robot Mk II", skill = 7, stamina = 5 },
            }, win = 24 },
        },
        [23] = {
            text = "Round the back, a chute marked Cargo Only, Absolutely No Cabin Kids yawns invitingly. You squeeze in feet first and push off.\n\nThe chute twists, drops, loops the loop and splits into several pipes. One leads to the promenade. Another, by the smell of it, leads to the station laundry. Only luck will decide which one you end up in.",
            test = { stat = "luck", win = 24, lose = 25 },
        },
        [24] = {
            text = "Port Royal's promenade is a glorious jumble of neon, rope and roaring laughter. Smugglers haggle over Martian spices, a band plays a hornpipe on theremins, and nobody looks at you twice.\n\nThree places catch your eye: a tavern run by the hologram of Grace O'Malley, the Pirate Queen of Connacht; a gambling hall called the Dead Man's Chest; and a ship's chandler selling supplies.",
            choices = {
                { text = "Visit Grace O'Malley's tavern", to = 26 },
                { text = "Enter the Dead Man's Chest", to = 27 },
                { text = "Browse the ship's chandler", to = 28 },
                { text = "Leave for Halley's Comet", to = 50 },
            },
        },
        [25] = {
            text = "Whoosh, flump. You land in the station laundry, where you are washed, spun, starched, folded and very nearly ironed before you manage to escape out of a hatch.\n\nYou emerge onto the promenade crisp, dizzy, faintly lavender-scented and slightly smaller than when you went in. A passing smuggler compliments your pleats.",
            stamina = -2,
            choices = {
                { text = "Stagger onto the promenade", to = 24 },
            },
        },
        [26] = {
            text = "The hologram of Grace O'Malley fizzes behind the bar, red hair blazing. \"I once sailed up the Thames to meet Queen Elizabeth herself, child. I can handle one cabin kid.\" She serves you soda bread and a bowl of stew so good your toes cheer.\n\n\"The Ace of Spanners? Cheating scrap heap. Keeps spare aces in a panel in his chest. Call him out before a crowd and he'll fold.\"",
            stamina = 4,
            set = "knows_cheat",
            choices = {
                { text = "Ask Grace about rival pirates", to = 29 },
                { text = "Return to the promenade", to = 24 },
            },
        },
        [27] = {
            text = "The Dead Man's Chest is all green baize, flickering lanterns and pirates trying very hard to look innocent. A croupier with an eyepatch on each eye deals cards somehow.\n\nIn a dark corner, a shady dealer in a velvet coat opens his cloak to reveal a deck of cards. \"Marked,\" he whispers. \"Every card. Perfect for, ahem, educating robots.\"",
            choices = {
                { text = "Play a hand (2 doubloons)", to = 30, cost = 2, noflag = "played", hide = true },
                { text = "Buy the marked deck (5 doubloons)", to = 31, cost = 5, without = "deck", hide = true },
                { text = "Return to the promenade", to = 24 },
            },
        },
        [28] = {
            text = "The ship's chandler is a tiny shop crammed to the ceiling with rope, rivets, ship's biscuits and barrels. The owner, an octopus in a cardigan, greets you with four hands and stocks shelves with the other four.\n\n\"Ginger grog, dearie? Fizzy, warming and loved by every crew from here to Neptune. Cures sulks, sniffles and the beginnings of mutinies.\"",
            choices = {
                { text = "Buy ginger grog (2 doubloons)", to = 34, cost = 2, without = "grog", hide = true },
                { text = "Return to the promenade", to = 24 },
            },
        },
        [29] = {
            text = "Grace leans in, voice low. \"Two rival captains hunt your galleon. Blackbeard the Thirteenth plaits sparklers into his beard to look terrifying, so mind the fireworks. And Dame Francesca Drake, descendant of Sir Francis himself.\"\n\nShe smiles. \"Like her ancestor before the Armada, Francesca can never refuse a game of bowls. Challenge her, and she forgets all about fighting.\" You file that away carefully.",
            set = "know_rivals",
            choices = {
                { text = "Return to the promenade", to = 24 },
            },
        },
        [30] = {
            text = "You slap down your stake and the croupier deals. Around the table, a Venusian merchant, a nervous accountant and a pirate with a hook for a nose study their cards with deadly seriousness.\n\nYou peek at yours. It could be brilliant. It could be terrible. Honestly, you are not entirely sure what game you are playing. The dice will decide.",
            roll = { dice = 2, outcomes = {
                { upto = 6, to = 32 },
                { upto = 12, to = 33 },
            } },
        },
        [31] = {
            text = "The dealer hands over the deck with a flourish and a wink. Each card has a tiny secret scratch on its back, invisible unless you know where to look. You now know where to look.\n\n\"Use it wisely,\" he murmurs. \"Or at least use it on a robot. Robots never suspect a cabin kid.\" He melts back into the shadows, counting your doubloons.",
            gain = "deck",
            choices = {
                { text = "Go back to the card table", to = 27 },
                { text = "Return to the promenade", to = 24 },
            },
        },
        [32] = {
            text = "The pirate with the hook nose lays down five kings and a pickled herring, which apparently beats everything. Your stake vanishes into his waistcoat.\n\n\"Better luck next time, nipper,\" he chuckles, ruffling your hair with his hook. It is not your finest moment, but at least you still have your boots, and you are learning.",
            set = "played",
            choices = {
                { text = "Go back to the card table", to = 27 },
                { text = "Return to the promenade", to = 24 },
            },
        },
        [33] = {
            text = "You lay down your cards with no idea what they mean. The whole table gasps. \"A Full Andromeda!\" cries the croupier. \"Nobody has seen one since 1720!\"\n\nA pile of doubloons slides your way. The Venusian merchant faints into his soup. You nod wisely as if you planned every bit of it, and pocket seven shiny coins.",
            gold = 7,
            set = "played",
            choices = {
                { text = "Go back to the card table", to = 27 },
                { text = "Return to the promenade", to = 24 },
            },
        },
        [34] = {
            text = "The octopus wraps a stone bottle of ginger grog in brown paper and ties it with a bow, all eight arms working at once. \"There you go, dearie. One sip and a sulky crew turns sweet as a mermaid's lullaby.\"\n\nThe bottle fizzes gently against your hip as you step back out into the bustle of Port Royal.",
            gain = "grog",
            choices = {
                { text = "Return to the promenade", to = 24 },
            },
        },
        [35] = {
            text = "The Rings of Saturn car-boot sale is the biggest jumble sale in the solar system. Stalls perch on drifting chunks of ice, and shoppers hop between them clutching bargains: second-hand cannons, slightly haunted teapots, a moon that was only used on Sundays.\n\nA stallholder with a megaphone shouts \"Everything must go! Mostly into orbit!\" Where do you start?",
            choices = {
                { text = "Browse the stalls", to = 36 },
                { text = "Ask stallholders about the robot", to = 37 },
                { text = "Visit the fortune teller's tent", to = 38 },
            },
        },
        [36] = {
            text = "The stalls groan with treasures. One old dear sells a polished brass spyglass for three doubloons. Next door, a nervous chemist offers spray-cans of kraken repellent for four, \"smells of grandmother's perfume, krakens hate it.\" A cheerful lad sells bottles of fizzy ginger grog for two.\n\nYou jingle your purse and consider your options carefully. Bargains, after all, are only bargains if you need them.",
            choices = {
                { text = "Buy the spyglass (3 doubloons)", to = 39, cost = 3, without = "spyglass", hide = true },
                { text = "Buy kraken repellent (4 doubloons)", to = 40, cost = 4, without = "repellent", hide = true },
                { text = "Buy ginger grog (2 doubloons)", to = 41, cost = 2, without = "grog", hide = true },
                { text = "Finish shopping and move on", to = 42 },
            },
        },
        [37] = {
            text = "A stallholder selling pre-loved cannonballs remembers the robot well. \"The Ace of Spanners? Bought a sunhat for Mars. Off to Olympus Mons to fleece the tourists, he said.\"\n\nShe lowers her voice. \"Can't say no to a double-or-nothing, that one. Last week he bet his own nose on a coin toss, and lost.\" You thank her and buy nothing, which she forgives, just about.",
            set = "double_tip",
            choices = {
                { text = "Browse the stalls", to = 36 },
                { text = "Visit the fortune teller's tent", to = 38 },
            },
        },
        [38] = {
            text = "Inside a tent stitched from old sails sits Madame Nebula, a fortune teller with a crystal ball that is clearly a goldfish bowl, goldfish included. \"Cross my palm with doubloons, little sailor, and the stars shall speak.\"\n\nThe goldfish stares at you meaningfully. Even it seems to know something.",
            choices = {
                { text = "Pay for a fortune (2 doubloons)", to = 48, cost = 2, noflag = "knows_cheat", hide = true },
                { text = "Browse the stalls", to = 36 },
                { text = "Ask stallholders about the robot", to = 37 },
            },
        },
        [39] = {
            text = "The old dear polishes the spyglass on her sleeve before handing it over. \"Belonged to my late husband. He used it to spot comets, shortcuts and his mother coming up the garden path.\"\n\nYou put it to your eye. Saturn's rings leap closer, and somewhere far off you swear you see a highway of glittering ice.",
            gain = "spyglass",
            choices = {
                { text = "Back to the stalls", to = 36 },
            },
        },
        [40] = {
            text = "The chemist hands you a pink spray-can with a nervous smile. \"One squirt, and any kraken flees for its life. Possibly two squirts for a large one. Do not spray near your nose, or your eyebrows, or anyone you love.\"\n\nYou give it a cautious sniff. Lavender, mothballs and old talcum powder. Grandma would be proud.",
            gain = "repellent",
            choices = {
                { text = "Back to the stalls", to = 36 },
            },
        },
        [41] = {
            text = "The cheerful lad hands over a stone bottle of ginger grog that fizzes like a firework. \"Best on the rings! Brewed in a Cornish cave, shipped by comet, guaranteed to cheer up the grumpiest crew you ever sailed with.\"\n\nYou tuck it carefully in your bag. Thinking of Anne Bonny-Byte's scowl, it might come in handy.",
            gain = "grog",
            choices = {
                { text = "Back to the stalls", to = 36 },
            },
        },
        [42] = {
            text = "As you head back towards the Jolly Rocket, three figures leap out from behind a stall of second-hand anchors. The Saturn Scallywags! Rival pirates, with stripy jumpers and very bad teeth.\n\n\"Hand over your doubloons, nipper,\" sneers their bosun, swinging a frying pan with menace. \"Or we'll sell you on the next stall as a slightly used cabin kid.\"",
            choices = {
                { text = "Fight the Scallywags' bosun", to = 43 },
                { text = "Run away across the ice chunks", to = 44 },
                { text = "Pay them off (3 doubloons)", to = 45, cost = 3 },
            },
        },
        [43] = {
            text = "The bosun spits on his frying pan for luck and charges, while his two shipmates hang back to cheer and sell popcorn to the gathering crowd.\n\nYou stand your ground among the anchors and teapots. It is you against him, and the whole car-boot sale is watching.",
            fight = { name = "Scallywag Bosun", skill = 7, stamina = 6, win = 46 },
        },
        [44] = {
            text = "You turn and sprint, hopping from one chunk of floating ice to the next like a stone skipping across a pond. Behind you the Scallywags howl and give chase, slipping and sliding.\n\nThe chunks wobble and spin. One wrong step and you'll go sprawling into a stall of very breakable antique moons.",
            test = { stat = "skill", win = 49, lose = 47 },
        },
        [45] = {
            text = "You make your way back to the Jolly Rocket, a little poorer or a little bruised, but in one piece. Sextant Sam hauls you aboard and plots a course.\n\n\"The quickest way to anywhere, kid, is along Halley's Comet. It's a proper highway these days, with lanes and tollbooths and everything.\" The engines cough, then roar.",
            choices = {
                { text = "Take the Halley's Comet highway", to = 50 },
            },
        },
        [46] = {
            text = "With a final clang, the bosun's frying pan flies off into orbit and he sits down hard on a pile of cushions. His shipmates flee, abandoning their popcorn. Five doubloons tumble out of his pockets.\n\nAlso, a crumpled note: \"Orders from Dame Francesca Drake: beat Blackbeard to the galleon. Remember the Dame never refuses a game of bowls, so no bowling near her.\" Interesting.",
            gold = 5,
            set = "know_rivals",
            choices = {
                { text = "Head back to your ship", to = 45 },
            },
        },
        [47] = {
            text = "Your foot lands on a chunk of ice, the chunk lands on a stall of antique moons, and the whole lot goes up like a skittle alley. You bounce off three teapots and a startled vicar.\n\nThe Scallywags laugh so hard they forget to chase you. Bruised and a little dented, you limp back to the Jolly Rocket with your dignity in tatters.",
            stamina = -3,
            choices = {
                { text = "Limp back to your ship", to = 45 },
            },
        },
        [48] = {
            text = "Madame Nebula peers into the goldfish bowl and gasps. \"I see a robot, cheating! Spare aces, hidden in a panel in its chest. Call it out before a crowd and it shall crumble!\"\n\nThe goldfish blows a single bubble. \"And I see cheese,\" she adds darkly. \"Beware the moon of cheese, little sailor.\" You leave with goosebumps and a useful secret.",
            set = "knows_cheat",
            choices = {
                { text = "Browse the stalls", to = 36 },
                { text = "Ask stallholders about the robot", to = 37 },
            },
        },
        [49] = {
            text = "You skip across the last ice chunk, do a triple spin worthy of an Olympic skater, and land neatly on the gangplank of the Jolly Rocket. The Scallywags crash into each other behind you in a satisfying heap.\n\nThe crowd at the car-boot sale bursts into applause. You bow. You feel lucky, and you feel ready for anything.",
            luck = 1,
            choices = {
                { text = "Climb aboard and cast off", to = 45 },
            },
        },
        [50] = {
            text = "Halley's Comet roars across the sky, now a cosmic motorway with glowing lanes, ice-block bollards and a service station that opens once every seventy-six years. Today, luckily, it is open.\n\nThe fast lane cuts straight through the blazing tail. The scenic slow lane curves past Planet Kraken. Ships honk and overtake. Sextant Sam hands you the wheel. \"Your call, kid.\"",
            choices = {
                { text = "Race through the comet's tail", to = 51 },
                { text = "Take the scenic slow lane", to = 52 },
                { text = "Spot a shortcut with your spyglass", to = 53, need = "spyglass" },
                { text = "Stop at the service station", to = 54 },
            },
        },
        [51] = {
            text = "You slam the throttle forward and the Jolly Rocket leaps into the comet's tail. Chunks of ice the size of cathedrals spin past your windows. Dust sparkles like glitter at a wedding.\n\nThe ship shakes, the crew screams, and Sextant Sam hides under his chart. Only fast hands and sharp eyes will get you through in one piece.",
            test = { stat = "skill", win = 55, lose = 56 },
        },
        [52] = {
            text = "The slow lane drifts past Planet Kraken, a soggy green world of endless seas. Suddenly, a tentacle the length of a cricket pitch slaps against the hull, then another, then six more. The Space Kraken has found you!\n\nIts great eye fills the porthole, glowing with interest. The ship groans as the tentacles squeeze. You have very little time to decide.",
            choices = {
                { text = "Fight the Space Kraken", to = 58 },
                { text = "Spray it with kraken repellent", to = 59, need = "repellent" },
                { text = "Offer it the lunar cheddar", to = 60, need = "cheese" },
                { text = "Abandon ship in an escape pod", to = 61 },
            },
        },
        [53] = {
            text = "Through the brass spyglass you spot a little-used slip road, unmarked on any chart, ducking under the comet's nucleus. You swing the wheel and the Jolly Rocket zips through it, overtaking a queue of freighters stuck behind a slow-moving asteroid tractor.\n\nIn no time at all, a red planet looms ahead. Mars! Sextant Sam pats you on the back proudly.",
            luck = 1,
            choices = {
                { text = "Land on Mars", to = 55 },
            },
        },
        [54] = {
            text = "Halley's Rest Stop serves a full cosmic breakfast: beans from Venus, Martian mushrooms, and toast cut into the shape of little comets. You eat until your belly hums.\n\nThe waitress, who has worked here since 1910, says she has seen a robot with a sunhat pass by, heading for Mars. Refreshed and well fed, you climb back into the pilot's seat.",
            stamina = 4,
            choices = {
                { text = "Race through the comet's tail", to = 51 },
                { text = "Take the scenic slow lane", to = 52 },
            },
        },
        [55] = {
            text = "Mars, and Olympus Mons, the tallest volcano in the solar system, which has been turned into the biggest tourist trap in the solar system. There are souvenir stalls, a cable car, nine million steps and a giant sign: I Climbed Olympus Mons And All I Got Was This Sunburn.\n\nAt the very top, so the guidebook says, a robot runs a card table for tourists.",
            choices = {
                { text = "Ride the cable car (2 doubloons)", to = 63, cost = 2 },
                { text = "Climb the nine million steps", to = 64 },
                { text = "Browse the souvenir shop", to = 65 },
            },
        },
        [56] = {
            text = "A chunk of ice clips your wing and the Jolly Rocket spins out of the tail like a sycamore seed. Alarms wail. Through the windscreen you see something very dark and very hungry: a black hole, swirling like the plughole of a cosmic bath.\n\nYou yank the controls into full reverse and hope with every fibre of your being.",
            test = { stat = "luck", win = 52, lose = 57 },
        },
        [57] = {
            text = "The black hole gives a long, satisfied slurp and in you go, ship, crew, captain and all. You are stretched thinner and thinner, like spaghetti at an Italian restaurant, until you are the longest cabin kid in history.\n\nOn the bright side, scientists will study you for centuries. On the less bright side, there is no way back. Your adventure ends here.",
            ending = "death",
        },
        [58] = {
            text = "The Space Kraken roars a bubbly roar and wraps its tentacles round the mainmast. You grab a boathook and leap onto the deck, where tentacles thrash in every direction like a very angry octopus at a disco.\n\nAim for the tips, Sextant Sam yells, they're ticklish. Or you can always run for an escape pod if things go badly.",
            fight = { name = "Space Kraken", skill = 8, stamina = 9, win = 62, flee = 61 },
        },
        [59] = {
            text = "One squirt of kraken repellent and the air fills with lavender, mothballs and old talcum powder. The Space Kraken's eye waters. It sneezes so hard that it shoots backwards into the sea of Planet Kraken with a mighty splash.\n\nThe crew cheer. Sextant Sam opens all the windows. Somewhere below, a kraken is sulking, and you are free to sail on to Mars.",
            choices = {
                { text = "Sail on to Mars", to = 55 },
            },
        },
        [60] = {
            text = "You hold out the wheel of lunar cheddar. The Space Kraken sniffs, gasps, and swallows it whole. Its eye goes all soft and misty. It purrs like a gigantic cat.\n\nFrom now on, it seems, the Space Kraken is your friend. It carries the Jolly Rocket all the way to Mars on its head, then waves goodbye with seven tentacles. \"Just whistle,\" it rumbles, \"if you need me.\"",
            lose = "cheese",
            set = "kraken_friend",
            choices = {
                { text = "Step off onto Mars", to = 55 },
            },
        },
        [61] = {
            text = "Your escape pod shoots off into space, tumbles for three days and lands with a squelch on a small yellow moon that smells strongly of cheddar. The whole moon is made of cheese. Ben Gunn would weep with joy.\n\nThere is no fuel, no radio, and nothing to eat but cheese, cheese and more cheese. You are marooned, well fed, and slightly constipated. Your adventure ends here.",
            ending = "end",
        },
        [62] = {
            text = "Tickled at last on the tip of its longest tentacle, the Space Kraken collapses into helpless giggles and lets go of the ship. With a burp it coughs up an old boot and a rubber duck, then slinks back into the sea.\n\nThe boot you throw back. The duck you give to Sextant Sam, who looks thrilled. Next stop, Mars.",
            choices = {
                { text = "Sail on to Mars", to = 55 },
            },
        },
        [63] = {
            text = "The cable car rattles up the slopes of Olympus Mons. Out of the window you can see the great canyon of Valles Marineris, two rovers playing tag and a tour guide shouting facts at a very bored family from Pluto.\n\n\"And at the top,\" she cries, \"meet our famous card-playing robot! Bring money, leave without it!\" The car jolts to a stop at the summit.",
            choices = {
                { text = "Step out onto the summit", to = 66 },
            },
        },
        [64] = {
            text = "Nine million steps. You start bravely, singing a sea shanty. By step ten thousand you are humming. By step two million you are whimpering. Elderly tourists in sensible shoes overtake you, chatting about their grandchildren.\n\nThe summit is still a long way above you. Your legs feel like jelly, and you need every ounce of stamina left in your body.",
            test = { stat = "stamina", win = 66, lose = 67 },
        },
        [65] = {
            text = "The Olympus Mons souvenir shop sells snow globes full of red dust, pencils shaped like volcanoes, and hats that say Kiss Me I'm A Martian. Behind the till, a robot with a bored face offers snacks and drinks.\n\nA tray of free sandwich samples sits beside the till, under a sign reading Taste the Red Planet, next to bottles of fizzy ginger grog imported from Saturn.",
            choices = {
                { text = "Buy ginger grog (2 doubloons)", to = 68, cost = 2, without = "grog", hide = true },
                { text = "Try a free Mars sandwich sample", to = 69 },
                { text = "Return to the foot of the volcano", to = 55 },
            },
        },
        [66] = {
            text = "At the summit sits the Ace of Spanners, a chrome robot in a sunhat, shuffling cards at blinding speed in front of a crowd of tourists. On the table, as prizes, lie a rolled map stamped Andromeda and Admiral Comet's magnificent feathered hat.\n\n\"Ah, a new victim,\" it clicks. \"Care for a game, little sailor? Winner takes all.\" The tourists lean in eagerly.",
            choices = {
                { text = "Challenge it to a rematch", to = 70 },
                { text = "Expose the aces in its chest panel", to = 71, flag = "knows_cheat" },
                { text = "Deal with your marked deck", to = 72, need = "deck" },
                { text = "Draw your cutlass and fight", to = 73 },
            },
        },
        [67] = {
            text = "Around step eight million you collapse in a heap, wheezing like an old accordion. A kindly tourist donkey, sent up by the Olympus Mons Rescue Service, scoops you onto its back.\n\nIt carries you the rest of the way to the summit, humming quietly, then charges you nothing because you look so pathetic. Your legs may never forgive you.",
            stamina = -3,
            choices = {
                { text = "Slide off the donkey at the summit", to = 66 },
            },
        },
        [68] = {
            text = "The bored robot wraps a bottle of ginger grog in a paper bag printed with I Survived Olympus Mons. \"Imported from the Rings of Saturn,\" it drones. \"Good for crews, colds and the start of mutinies. Have a nice day.\"\n\nThe bottle fizzes reassuringly in your bag.",
            gain = "grog",
            choices = {
                { text = "Keep browsing the shop", to = 65 },
                { text = "Return to the foot of the volcano", to = 55 },
            },
        },
        [69] = {
            text = "The Mars sandwich turns out to be cheese and pickle on red bread, and it is surprisingly wonderful. You munch it on a bench overlooking the red desert, watching dust devils dance between the craters.\n\nStrength returns to your arms and legs. You feel ready to climb a volcano, or at least ride up one.",
            stamina = 3,
            choices = {
                { text = "Keep browsing the shop", to = 65 },
                { text = "Return to the foot of the volcano", to = 55 },
            },
        },
        [70] = {
            text = "\"A rematch it is,\" clicks the Ace of Spanners, and its hands become a silver blur. Cards fly, flip and land in neat piles in front of you. The tourists hold their breath. Someone drops an ice cream.\n\nYou pick up your hand and try to look like a seasoned card sharp from the Dead Man's Chest. The robot's eyes glow red. The game begins.",
            roll = { dice = 2, outcomes = {
                { upto = 7, to = 74 },
                { upto = 12, to = 75 },
            } },
        },
        [71] = {
            text = "You point a finger. \"Ladies and gentlemen, this robot cheats! Look in its chest panel!\" The tourists gasp. A small girl from Pluto marches up and yanks the panel open. Out flutter forty-two aces.\n\nThe crowd boos like a pantomime audience. The Ace of Spanners blushes bright orange and shoves both the map and the hat into your arms. \"Take them! Just stop looking at me!\"",
            gain = { "map", "hat" },
            choices = {
                { text = "Set sail for the Sargasso Nebula", to = 82 },
            },
        },
        [72] = {
            text = "\"Let's use my deck this time,\" you say sweetly. The robot shrugs, too vain to suspect a cabin kid. You deal. Thanks to the tiny scratches, you know every card in its hand before it does.\n\nYou win the map. You win the hat. You win its sunhat for good measure, then give it back, because you are not a monster. The Ace of Spanners sobs mechanically.",
            gain = { "map", "hat" },
            choices = {
                { text = "Set sail for the Sargasso Nebula", to = 82 },
            },
        },
        [73] = {
            text = "\"Violence? How vulgar,\" clicks the Ace of Spanners, but it springs up anyway and whips out a pair of razor-sharp playing cards. The tourists form a circle and start taking pictures.\n\nIt flicks cards at you like shuriken. You duck, weave and close in, grabbing a souvenir walking stick as a weapon. This robot is fast, and it fights dirty.",
            fight = { name = "Ace of Spanners", skill = 8, stamina = 8, win = 75 },
        },
        [74] = {
            text = "The robot lays down a royal flush with a smug click. You lose. The tourists groan in sympathy. \"Better luck next millennium,\" sneers the Ace of Spanners, patting the map.\n\nYou feel your cheeks burn. You could go home and admit defeat. Or you could remember what you have learned about this robot's weaknesses, and its programming.",
            choices = {
                { text = "Offer it double or nothing", to = 76, flag = "double_tip" },
                { text = "Draw your cutlass and fight", to = 73 },
                { text = "Slink home in shame", to = 77 },
            },
        },
        [75] = {
            text = "The Ace of Spanners sags, defeated, and slides the Andromeda map across the table. \"Fair and square,\" it grumbles, although you suspect it does not know what fair means.\n\nBut it keeps one metal hand firmly on the Admiral's feathered hat. \"The hat is not part of the deal. It suits me.\" It does not. Nothing suits a robot less than feathers.",
            gain = "map",
            choices = {
                { text = "Demand the hat as well", to = 79 },
                { text = "Let the parrot snatch the hat", to = 80, need = "parrot" },
                { text = "Set sail for the Sargasso Nebula", to = 82 },
            },
        },
        [76] = {
            text = "\"Double or nothing,\" you say. The robot's eyes flicker. Its fingers twitch. \"Must... resist...\" it clicks. \"Cannot... resist! DOUBLE OR NOTHING ACCEPTED!\"\n\nIt is a simple coin toss this time, the map and the hat against your boots, your purse and your dignity. The coin spins into the thin Martian air. Heads or tails, it all comes down to luck.",
            test = { stat = "luck", win = 78, lose = 73 },
        },
        [77] = {
            text = "You trudge back to the Jolly Rocket empty-handed. The Admiral weeps into his gruel. The crew grumble louder than ever, but nobody mutinies, because nobody can be bothered.\n\nYou spend the next ten years scrubbing the poop deck and polishing the captain's spare, slightly worse hat. It is not a terrible life. It is just not a treasure-hunting one. Your adventure ends here.",
            ending = "end",
        },
        [78] = {
            text = "The coin lands. Heads! The crowd erupts. The Ace of Spanners stares at the coin, then at you, then sits down heavily on its own sunhat.\n\n\"Double or nothing,\" it whimpers, pushing the map and the feathered hat towards you. \"Why do I always say yes?\" A small tourist pats it kindly on the head. You march off, map under one arm, hat under the other.",
            gain = { "map", "hat" },
            choices = {
                { text = "Set sail for the Sargasso Nebula", to = 82 },
            },
        },
        [79] = {
            text = "You plant your feet and glare at the robot. \"That hat belongs to Admiral Calico Comet, scourge of the seven moons. Hand it over.\"\n\nThe robot glares back. The tourists chant \"HAT! HAT! HAT!\" Whether it gives in or not depends on whether fortune is smiling at you today.",
            test = { stat = "luck", win = 80, lose = 81 },
        },
        [80] = {
            text = "In a flurry of feathers, the hat is yours. Either the robot cracked under pressure, or Captain Flint Two-Point-Oh swooped down and nicked it in mid-sentence, cackling \"Pieces of eight!\" Either way, the Admiral's magnificent hat now sits in your hands.\n\nThe Ace of Spanners shakes its fist as you head back to the Jolly Rocket. The tourists give you a standing ovation.",
            gain = "hat",
            choices = {
                { text = "Set sail for the Sargasso Nebula", to = 82 },
            },
        },
        [81] = {
            text = "\"Never!\" cries the robot, jams the feathered hat on its head and rockets off into the Martian sky on a jet of steam, cackling. The tourists boo it all the way to the horizon.\n\nNever mind. You still have the map, and the map is what really matters. Probably. The Admiral will just have to wear his spare hat, the one with the moth holes.",
            choices = {
                { text = "Set sail for the Sargasso Nebula", to = 82 },
            },
        },
        [82] = {
            text = "Following the Andromeda map, the Jolly Rocket enters the Sargasso Nebula, a thick green fog full of drifting space-weed that wraps around ships and never lets go. Wrecks of old galleons float everywhere like forgotten bath toys.\n\nIn the distance, strange ghostly lights blink and beckon. The weed rustles. The map says the treasure lies at the very heart of the nebula.",
            choices = {
                { text = "Steer carefully through the weed", to = 83 },
                { text = "Follow the ghostly lights", to = 84 },
                { text = "Let the parrot navigate", to = 85, need = "parrot" },
                { text = "Scan the fog with your spyglass", to = 85, need = "spyglass" },
            },
        },
        [83] = {
            text = "You grip the wheel and steer between the clumps of weed, left, right, left again, as tendrils reach for the hull like the fingers of a grumpy grandmother. Sextant Sam reads out the map in a quavering voice.\n\nOne wrong turn and the weed will have you. You need a steady hand and very quick reflexes.",
            test = { stat = "skill", win = 85, lose = 86 },
        },
        [84] = {
            text = "The ghostly lights flicker closer and turn out to be lanterns, held by the ghost of Calico Jack Rackham, the dashing pirate of the Caribbean, with his famous striped trousers. \"This way, young sailor,\" he croons, \"this way to the treasure.\"\n\nHe seems friendly enough. But he is a ghost, and ghosts get lonely. You will need luck on your side.",
            test = { stat = "luck", win = 85, lose = 87 },
        },
        [85] = {
            text = "At the heart of the nebula floats the Andromeda Galleon, golden and glorious, its sails made of starlight. But you are not alone. Two ships flank it: one belongs to Blackbeard the Thirteenth, sparklers fizzing in his beard, and the other to Dame Francesca Drake, polishing her cutlass.\n\n\"That treasure is ours, cabin kid,\" they shout together, then glare at each other. \"MINE!\"",
            choices = {
                { text = "Fight both of them", to = 88 },
                { text = "Whistle for your kraken friend", to = 89, flag = "kraken_friend" },
                { text = "Challenge Dame Drake to bowls", to = 90, flag = "know_rivals" },
                { text = "Try to parley with them", to = 91 },
            },
        },
        [86] = {
            text = "A tendril of weed lassoes the ship and out of the fog rises a Weed-Wraith, a ghostly monster made of slime, seaweed and a lost sock. It wails like a bagpipe with hiccups and reaches for you with soggy green fingers.\n\nYou grab a boathook. If you can beat it, the weed will let go.",
            stamina = -2,
            fight = { name = "Weed-Wraith", skill = 7, stamina = 6, win = 85 },
        },
        [87] = {
            text = "Calico Jack leads you on and on, deeper into the fog, until you arrive at a ghostly tavern full of long-dead pirates singing sea shanties. \"Welcome, matey!\" they roar. \"Stay forever!\"\n\nAnd you do. You become a cheerful little ghost, and spend eternity singing What Shall We Do With the Drunken Sailor in four-part harmony. Your adventure ends here.",
            ending = "death",
        },
        [88] = {
            text = "Blackbeard the Thirteenth and Dame Francesca Drake swing across on ropes, landing on your deck with a thud and a curtsey respectively. The sparklers in Blackbeard's beard crackle fiercely. Drake's cutlass flashes.\n\n\"One at a time,\" says Drake politely. \"Manners,\" agrees Blackbeard. This is the fight of your life, and both of them are formidable.",
            fight = { enemies = {
                { name = "Blackbeard XIII", skill = 9, stamina = 8 },
                { name = "Dame Francesca Drake", skill = 8, stamina = 7 },
            }, win = 92 },
        },
        [89] = {
            text = "You put two fingers to your lips and whistle. Out of the nebula surges the Space Kraken, tentacles waving joyfully. It plucks Blackbeard from one ship and Dame Drake from the other, and dangles them upside down by their boots.\n\n\"Put us down!\" they shriek. The kraken winks at you and carries them off to Planet Kraken for a very long swim. The galleon is yours.",
            choices = {
                { text = "Board the Andromeda Galleon", to = 92 },
            },
        },
        [90] = {
            text = "You hold up a cannonball. \"Dame Drake, I challenge you to a game of bowls!\" Her eyes light up. \"Bowls! I simply cannot refuse.\" She lays out a pitch on the galleon's deck. Blackbeard sulks, and his sparklers set off the sprinklers.\n\nNow you must actually win. You roll your cannonball towards the jack and pray for a steady hand.",
            test = { stat = "skill", win = 92, lose = 88 },
        },
        [91] = {
            text = "\"Gentle pirates,\" you begin, \"surely there's enough treasure for everyone?\" Blackbeard strokes his sparkling beard. Drake taps her cutlass thoughtfully.\n\nThen you add, \"Of course, Blackbeard said Dame Drake's ship looks like a bathtub.\" Drake gasps. Blackbeard splutters. If luck is with you, they will be at each other's throats in seconds, and forget all about you.",
            test = { stat = "luck", win = 92, lose = 88 },
        },
        [92] = {
            text = "The rivals are gone, sulking off into the fog. You step aboard the Andromeda Galleon. Its hold glitters with treasure: golden doubloons, sapphire moons, a crown made of comet dust and a teapot belonging to Queen Anne herself.\n\nThere is more than you could ever carry. A small sign on the wall reads: Please Take Only What You Need. The Management.",
            choices = {
                { text = "Fill your pockets sensibly", to = 93 },
                { text = "Grab absolutely everything", to = 94 },
            },
        },
        [93] = {
            text = "You fill your pockets, your bag, your hat and both your boots with gold, then waddle back to the Jolly Rocket, clinking at every step like a very rich wind chime.\n\nSextant Sam whistles in admiration. \"Fifty doubloons at least, kid, and enough sapphires to buy Port Royal twice over.\" You have done it. The treasure of the Andromeda Galleon is yours!",
            gold = 50,
            choices = {
                { text = "Return to the Jolly Rocket", to = 95 },
            },
        },
        [94] = {
            text = "You ignore the sign and start shovelling. Gold, sapphires, the crown, the teapot, the chandelier, the galleon's own steering wheel. The pile grows higher and higher, wobbling above your head.\n\nSomething creaks. Something groans. The entire mountain of treasure sways like a jelly in an earthquake. Only luck can save you now.",
            test = { stat = "luck", win = 93, lose = 96 },
        },
        [95] = {
            text = "Back aboard the Jolly Rocket, trouble is waiting. Anne Bonny-Byte and Mary Read-Only stand on the deck with the whole crew behind them, waving mops and ladles. \"Mutiny!\" cries Anne. \"Unless somebody gives us a reason not to.\"\n\nAdmiral Calico Comet hides behind the mast. All eyes turn to you. You are only the cabin kid, but right now, you are in charge.",
            choices = {
                { text = "Share the ginger grog", to = 97, need = "grog" },
                { text = "Promise shore leave and real food", to = 97, flag = "heard_grumble" },
                { text = "Throw a party (20 doubloons)", to = 97, cost = 20 },
                { text = "Make a rousing speech", to = 98 },
            },
        },
        [96] = {
            text = "With a mighty rumble, the mountain of treasure collapses on top of you. You are buried under ten thousand doubloons, three crowns and a teapot. It is, without doubt, the richest way anyone has ever been flattened.\n\nYears later, archaeologists dig you out, perfectly preserved and still clutching a sapphire. They put you in a museum. Your adventure ends here.",
            ending = "death",
        },
        [97] = {
            text = "The crew cheer. Anne Bonny-Byte throws down her mop, Mary Read-Only hugs the ship's cat, and someone strikes up a hornpipe on the theremin. \"Three cheers for the cabin kid!\" Mutiny is averted, and the Jolly Rocket rings with laughter.\n\nAdmiral Calico Comet creeps out from behind the mast, looking hopeful and very bald under the starlight. He clears his throat.",
            choices = {
                { text = "Hand the Admiral his hat", to = 100, need = "hat" },
                { text = "Report to the Admiral", to = 101 },
            },
        },
        [98] = {
            text = "You climb onto a barrel and clear your throat. \"Shipmates! Think of Mary Read and Anne Bonny, of Grace O'Malley and Sir Francis Drake! Did they mutiny when times were hard? Well, actually, some of them did, but that's not the point!\"\n\nThe crew look at each other doubtfully. Only a truly skilful speech will win them over now.",
            test = { stat = "skill", win = 97, lose = 99 },
        },
        [99] = {
            text = "The crew are not convinced. With a cheerful roar, they elect Anne Bonny-Byte as captain and lock the Admiral in the larder with the gruel. They are very polite about it.\n\nYou keep your share of the treasure and your job as cabin kid, and the new captain gives everyone shore leave on Saturn. It is not a disaster, but it is not quite a triumph either. Your adventure ends here.",
            ending = "end",
        },
        [100] = {
            text = "You hand Admiral Calico Comet his magnificent feathered hat. He puts it on, stands tall, and his whiskers bristle with pride. Then he takes it off again and places it on your head.\n\n\"Treasure, a happy crew and my hat back? Kid, you've earned this. From now on you're Captain of the Jolly Rocket, and I'll be the cook.\" The crew roar. Best ending: a true pirate legend!",
            ending = "win",
        },
        [101] = {
            text = "You hand the Andromeda map and the treasure to Admiral Calico Comet, who weeps with joy and promotes you on the spot to Junior First Mate, Deck-Scrubbing Optional.\n\nThe crew are happy, the coffers are full, and the Jolly Rocket sails off towards new adventures. The Admiral's hat is still missing, but you have a feeling you'll find it someday. You win!",
            ending = "win",
        },
    },
}
