return {
    title       = "The Ravens of the Tower",
    author      = "Gamebook",
    lang        = "en",
    blurb       = "Midnight at the Tower of London: the ravens have vanished, a ghost walks, and you have a deadline.",
    sheet       = true,
    start       = 1,
    start_gold  = 5,
    start_items = { "torch", "camera", "sandwich" },
    items = {
        torch        = "Pocket torch",
        camera       = "Flash camera",
        sandwich     = "Pickle sandwich",
        cage_key     = "Raven enclosure key",
        library_book = "Overdue library book",
        tube_map     = "Old Tube map",
        cheese       = "Wheel of Wensleydale",
        magnifier    = "Holmes’s magnifier",
    },
    sections = {
        [1] = {
            text = "Midnight. Fog. The Tower of London looms over the Thames like a very old, very grumpy wedding cake.\n\nMrs Thistlewood, editor of The Evening Crumpet, gave you one job: “The ravens have vanished and a ghost walks the Tower. Legend says if the ravens leave, the kingdom falls. Get me the story by breakfast, junior.” You are a junior reporter and an amateur ghost-hunter, armed with a torch, a camera and a pickle sandwich.",
            choices = {
                { text = "Knock at the Yeoman Warder’s lodge", to = 2 },
                { text = "Tiptoe onto Tower Green", to = 5 },
                { text = "Slip into the White Tower", to = 8 },
            },
        },
        [2] = {
            text = "A Yeoman Warder in a red-and-gold nightshirt opens the door. He is Mr Higgins, the Ravenmaster, and his moustache is drooping with grief.\n\n“Gone,” he sniffs. “All seven. Merlina, Harris, Jubilee, Poppy, the lot. Vanished at teatime. And now there’s a ghost wailing about the place at night. Two ghosts, if you count Her Majesty Anne Boleyn, but she’s no trouble. Lovely manners.”",
            choices = {
                { text = "Ask to see the empty enclosure", to = 3 },
                { text = "Ask about the new ghost", to = 4 },
            },
        },
        [3] = {
            text = "The ravens’ enclosure is empty except for a heap of soggy biscuits and a note, pecked into a paper bag in wobbly capitals:\n\n“RAVENS UNITED. NO MORE DRY BISCUITS. WE WANT CHEESE. ON STRIKE UNTIL FURTHER NOTICE.”\n\n“A strike!” gasps Higgins. “In nine hundred years!” He presses a heavy iron key into your hand and three coins for the night bus. “Find them, and you can lock them back in yourself.”",
            gain = "cage_key", gold = 3, set = "strike_note",
            choices = {
                { text = "Ask about the new ghost", to = 4 },
                { text = "Head into the courtyard", to = 6 },
            },
        },
        [4] = {
            text = "Higgins lowers his voice. “This new one goes ‘Wooooo’ in a Cockney accent, trips over its own hem and smells powerfully of cheddar. Not a proper ghost at all, if you ask me. Proper ghosts smell of lavender and regret.”\n\nHe shivers and pours you a cup of builder’s tea strong enough to stand a spoon in. You feel braver at once.",
            stamina = 2,
            choices = {
                { text = "Look at the ravens’ enclosure", to = 3 },
                { text = "Head into the courtyard", to = 6 },
            },
        },
        [5] = {
            text = "Tower Green glows silver under the moon. Near the memorial, a lady in Tudor velvet drifts across the grass with her head tucked underneath her arm, exactly as the old music-hall song promised.\n\nThe head notices you and smiles brightly. “Oh, a visitor! How lovely. Nobody visits any more, they only scream and run off. Do come here, darling, I don’t bite. I can’t, really, not from down here.”",
            choices = {
                { text = "Curtsey and say good evening", to = 7 },
                { text = "Hide behind a cannon", to = 10 },
            },
        },
        [6] = {
            text = "The Tower courtyard lies silent under the fog. A cold wind rattles the flagpole. Somewhere a door creaks, somewhere a pigeon snores. Without its ravens the whole place feels oddly lopsided, like a cake without its cherry.\n\nYou check your notebook. The night is young, but breakfast is not far off, and Mrs Thistlewood does not accept excuses.",
            choices = {
                { text = "Go to Tower Green", to = 5 },
                { text = "Explore the White Tower", to = 8 },
                { text = "Visit the Jewel House", to = 11 },
                { text = "Go down to Traitors’ Gate", to = 14 },
            },
        },
        [7] = {
            text = "Anne Boleyn’s head beams as you curtsey. “Such manners! Henry never curtseyed, you know.” She chats about fashion, fog and the shocking price of collars.\n\n“That wailing fellow is no ghost, darling. Real ghosts don’t leave cheese crumbs. And poor Bartholomew in the chapel of the White Tower keeps moaning about some library book. Do be kind to him.” Her ghostly calm settles your nerves like a warm bath.",
            stamina = 2, luck = 1,
            choices = {
                { text = "Thank her and return to the courtyard", to = 6 },
                { text = "Go straight to the White Tower", to = 8 },
            },
        },
        [8] = {
            text = "Inside the White Tower, rows of armour stand to attention in the gloom. The biggest of all is Henry VIII’s, broad as a wardrobe and twice as shiny. It seems to be watching you. You are almost sure its visor just moved.\n\nFrom the floor above, a sad voice wails: “Overdue! Ooooverduuue!”",
            choices = {
                { text = "Climb to St John’s Chapel", to = 9 },
                { text = "Inspect Henry VIII’s armour", to = 18 },
                { text = "Back away to the courtyard", to = 6 },
            },
        },
        [9] = {
            text = "In the pale stone chapel sits a see-through gentleman in a Victorian Warder’s uniform, clutching a fat book and sobbing into his whiskers.\n\n“Bartholomew Quill, Yeoman Warder, died 1858,” he sniffs. “I borrowed this from the British Museum Reading Room in 1857 and never took it back. A Natural History of Ravens. The fines must be astronomical! I can’t leave the Tower. Would you… return it for me?”",
            choices = {
                { text = "Promise to return the book", to = 19 },
                { text = "Politely decline and leave", to = 6 },
            },
        },
        [10] = {
            text = "You crouch behind a cannon. A moment later a figure in a white bedsheet scurries past, going “Wooo… woooo…” in a bored voice. It trips over its hem, says a word not suitable for a family newspaper, and carries on towards the Jewel House.\n\nA chunk of cheddar falls out of the sheet and rolls to your feet. Definitely not Anne Boleyn.",
            choices = {
                { text = "Tackle the sheet-ghost", to = 12 },
                { text = "Follow it quietly", to = 13 },
            },
        },
        [11] = {
            text = "The Jewel House glitters even in the dark. The Imperial State Crown, the Sovereign’s Sceptre with its enormous Cullinan diamond, a golden salt cellar the size of a dustbin.\n\nYou notice tiny beak-scratches all over the glass of the Crown’s case, as if someone had been tapping to get in. On the floor, a trail of cheese crumbs leads off towards Traitors’ Gate.",
            set = "crumbs",
            choices = {
                { text = "Follow the crumbs", to = 14 },
                { text = "Lean closer to look at the Crown", to = 21 },
                { text = "Return to the courtyard", to = 6 },
            },
        },
        [12] = {
            text = "You leap out with a war cry worthy of Boudica. The sheet-ghost squeals, whips out a rolled-up newspaper and swats at you furiously. Ghost or not, it fights dirty. Up on the battlements, a pigeon settles down to watch, as if it had bought a ticket.",
            fight = { name = "Fake Ghost in a Sheet", skill = 5, stamina = 5, win = 15, flee = 6 },
        },
        [13] = {
            text = "You creep after the sheet-ghost, stepping only on the quiet cobbles. It stops by the Jewel House and whispers into a walkie-talkie. You edge closer, holding your breath, praying your knees won’t creak and that the pigeons won’t give you away.",
            test = { stat = "luck", win = 16, lose = 17 },
        },
        [14] = {
            text = "Traitors’ Gate: a great black arch over dark water, where unhappy prisoners once arrived by boat. Tonight the river laps at the steps, the fog smells of cheese, and the crumbs stop right at the edge.\n\nFrom here you could take to the Thames, go up to Tower Hill and the Underground, or catch the night bus to Baker Street, where they say a certain detective still takes cases.",
            choices = {
                { text = "Find a boat on the Thames", to = 24 },
                { text = "Go down into the Underground", to = 40 },
                { text = "Take the night bus to Baker Street", to = 60 },
                { text = "Go back to the courtyard", to = 6 },
            },
        },
        [15] = {
            text = "The sheet comes off. Underneath is a spotty young man with a cheese sandwich in each pocket. “I’m Nigel,” he wails. “It’s my Uncle Pete, Cheddar Pete! He pays the ravens in cheese to pinch shiny things. Says the Crown’s next. He hides out at Aldwych, the old Tube station. Don’t tell him I told you!”\n\nHe drops a sandwich in his panic and flees into the fog, leaving a smell of cheddar behind him.",
            
            choices = {
                { text = "Return to the courtyard", to = 6 },
                { text = "Hurry to Traitors’ Gate", to = 14 },
            },
        },
        [16] = {
            text = "The walkie-talkie crackles. “Nigel, it’s Uncle Pete. Keep the guards spooked. Ravens are fed and happy. Meet me at Aldwych, the old station, when you’re done. And stop eating the stock!”\n\nThe sheet-ghost sighs, “Yes, Uncle Pete,” and wanders off. You scribble everything down. Aldwych! A ghost station for a ghost. How very poetic.",
                        choices = {
                { text = "Return to the courtyard", to = 6 },
                { text = "Hurry to Traitors’ Gate", to = 14 },
            },
        },
        [17] = {
            text = "A pigeon gives you away with a loud coo. The sheet-ghost spins round, yells “Wooo! Go away!” and shoves you. You stagger backwards, trip over a cannonball and tumble with a great splash into the old moat.\n\nYou climb out dripping. Your camera, sadly, has gone to live with the frogs.",
            stamina = -2, lose = "camera",
            choices = {
                { text = "Squelch back to the courtyard", to = 6 },
            },
        },
        [18] = {
            text = "You tap Henry VIII’s breastplate. Clang. The armour turns its head with a creak like a rusty gate, raises an enormous sword and booms: “WHO DARETH POKE THE KING?”\n\nIt seems nobody told the armour that Henry has been gone for nearly five hundred years.",
            fight = { name = "Animated Suit of Armour", skill = 7, stamina = 8, win = 20, flee = 6 },
        },
        [19] = {
            text = "Bartholomew’s eyes fill with ghostly tears. He hands you the book. It is heavy, dusty and stamped DUE BACK 14 MARCH 1857.\n\n“Bless you! Take it to the Reading Room at the British Museum, ask for Miss Inkwell. And if you see the ravens, tell them old Bartholomew sends his regards. I used to feed them proper cheese, you know.”",
            gain = "library_book",
            choices = {
                { text = "Return to the courtyard", to = 6 },
            },
        },
        [20] = {
            text = "With a final clank the armour falls apart into a heap of pots and pans. Something rattles inside the helmet: a silver spoon, a thimble and a teaspoon, all polished to a shine. Ravens love shiny things. Somebody has been using this armour as a piggy bank.\n\nYou pocket the loot as evidence, and the armour’s good luck rubs off on you.",
            luck = 1,
            choices = {
                { text = "Climb to St John’s Chapel", to = 9 },
                { text = "Return to the courtyard", to = 6 },
            },
        },
        [21] = {
            text = "You press your nose against the glass for a closer look at the beak-scratches. Your breath fogs the case. Somewhere a little red light blinks. Then another. Then a lot of them, all at once, in a way that seems rather personal.",
            test = { stat = "luck", win = 23, lose = 22 },
        },
        [22] = {
            text = "ALARM! Steel shutters slam down on every door. Bells ring. The shutters, it turns out, are on a timer, and the timer is broken, and the man who fixes it retired in 1987.\n\nYou are still there today. The guides call you “The Nosy Reporter” and point you out to schoolchildren, between the Crown and the gift shop. At least the view is sparkly. THE END.",
            ending = "death",
        },
        [23] = {
            text = "The little red lights blink, think about it, and go back to sleep. Phew. Under the case you spot something the ravens dropped: a shiny Victorian sixpence. Lucky you.\n\nThe cheese crumbs still lead off towards Traitors’ Gate, a little trail of cheddar breadcrumbs, like a fairy tale for mice.",
            luck = 1,
            choices = {
                { text = "Follow the crumbs", to = 14 },
                { text = "Return to the courtyard", to = 6 },
            },
        },
        [24] = {
            text = "Bobbing by the steps is a battered rowing boat. In it sits a crooked old boatman with one eyebrow, two teeth and a hat that might once have been a cat.\n\n“Name’s Grimsby,” he croaks. “Upriver to Westminster? Three coins. Very reasonable. No refunds, no questions, no lifejackets.”",
            choices = {
                { text = "Pay him the fare (3 gold)", to = 25, cost = 3 },
                { text = "Haggle like a market trader", to = 26 },
                { text = "Borrow his boat when he isn’t looking", to = 28 },
            },
        },
        [25] = {
            text = "Grimsby pockets your coins and rows. Halfway under Tower Bridge he stops, leans on his oars and grins his two-toothed grin.\n\n“Fare’s gone up,” he says. “Pay again, or swim. River’s lovely this time of year. Bit wet.”\n\nHe holds out a grubby palm. Under the bridge, the black water gurgles hungrily round the boat.",
            choices = {
                { text = "Refuse and stand up to him", to = 29 },
                { text = "Leap onto a passing barge", to = 30 },
            },
        },
        [26] = {
            text = "“Three coins? For that bucket?” you cry. “I’ll give you a pickle sandwich and a mention in The Evening Crumpet.” Grimsby scratches his single eyebrow. He looks at the sandwich. He looks at you. He looks at the river. You can almost hear the cogs turning, slowly, like a very old clock.",
            roll = { dice = 1, outcomes = { { upto = 3, to = 29 }, { upto = 6, to = 31 } } },
        },
        [27] = {
            text = "Grimsby topples backwards into the Thames with a mighty splash and comes up spluttering, clinging to a lifebuoy. “You’ll ’ear from my solicitor!” he shouts, drifting gently towards Greenwich.\n\nYou take the oars yourself. You row on past HMS Belfast, the dome of St Paul’s glowing in the fog.",
                        choices = {
                { text = "Stop at a mudbank to search", to = 34 },
                { text = "Row straight on to Westminster", to = 35 },
            },
        },
        [28] = {
            text = "Grimsby turns to light his pipe. You hop in, grab the oars and push off. Rowing, as it happens, is harder than it looks in films. The current tugs. The boat spins. Grimsby shouts something rude about your mother and starts wading after you, waving his pipe.",
            test = { stat = "skill", win = 32, lose = 33 },
        },
        [29] = {
            text = "Grimsby whips out an oar and swings it like a cricket bat. “Nobody haggles with Grimsby!” The boat rocks wildly under Tower Bridge as you dodge and duck. Water slops over the sides, and somewhere above, a late bus honks in sympathy.",
            fight = { name = "Crooked Boatman", skill = 6, stamina = 7, win = 27, flee = 30 },
        },
        [30] = {
            text = "A long barge loaded with crates chugs past. You take a running jump off the side of the rowing boat, arms flailing like a startled swan, aiming for the barge’s deck. Grimsby watches with interest, already counting your coins. The gap is wider than it looked. It always is.",
            test = { stat = "skill", win = 32, lose = 33 },
        },
        [31] = {
            text = "Grimsby bursts out laughing, settles for the mention in the paper (“Spell it G-R-I-M-S-B-Y, mind”) and rows you upriver for free, grumbling the whole way. He points out the sights: “That’s St Paul’s. That’s the Globe. That’s where I lost my other teeth.”\n\nAt low tide a mudbank glistens on the south shore.",
                        choices = {
                { text = "Ask him to stop at the mudbank", to = 34 },
                { text = "Go straight to Westminster", to = 35 },
            },
        },
        [32] = {
            text = "You land safely and, after some splashing, find your rhythm. You glide upriver alone past HMS Belfast, under London Bridge and Southwark Bridge, the dome of St Paul’s glowing in the fog like a giant lightbulb.\n\nAt low tide a mudbank glistens on the south shore. Mudlarks find all sorts there: coins, pipes, Roman hairpins.",
            choices = {
                { text = "Stop at the mudbank to search", to = 34 },
                { text = "Row on to Westminster", to = 35 },
            },
        },
        [33] = {
            text = "Splash! The Thames grabs you and carries you off downstream at an alarming speed, past Greenwich, past the Thames Barrier, past Southend Pier, where a man selling candyfloss waves.\n\nYou wash up three days later on a beach in Calais, where a kindly fisherman gives you onion soup. Your story never makes the paper, but you learn excellent French. THE END.",
            ending = "death",
        },
        [34] = {
            text = "You squelch about in the mud with your torch. You find three old coins, a clay pipe, a Roman oyster shell and, most interesting of all, a soggy cheese wrapper printed: PROPERTY OF C. PETE, ALDWYCH STATION. DO NOT TOUCH. ESPECIALLY YOU, NIGEL.\n\nThe cold river mud gets into your socks and your soul.",
            gold = 3, stamina = -1,
            choices = {
                { text = "Row on to Westminster", to = 35 },
                { text = "Wade ashore and make for Aldwych", to = 52 },
            },
        },
        [35] = {
            text = "Westminster. The Houses of Parliament rise from the river like a giant gothic toast rack, and above them Big Ben’s great clock face glows. From the belfry comes a faint sound: “Caw! Caw! Caw!” Then what sounds suspiciously like chanting.\n\nAcross the road stands Westminster Abbey, where kings are crowned and poets are buried.",
            choices = {
                { text = "Visit Westminster Abbey", to = 36 },
                { text = "Head for Big Ben", to = 70 },
            },
        },
        [36] = {
            text = "The Abbey door is ajar. Inside, moonlight pours through the stained glass. Kings and queens lie in stone, looking peaceful, except for the one who appears to have a pigeon on his nose.\n\nOn the tomb of Geoffrey Chaucer sits a large, glossy, very sulky raven wearing a tiny cardboard sign: ON STRIKE.",
            choices = {
                { text = "Talk to the raven", to = 37 },
                { text = "Rest a moment in Poets’ Corner", to = 38 },
                { text = "Sit in the Coronation Chair", to = 39 },
            },
        },
        [37] = {
            text = "“Harris,” croaks the raven, “Tower Ravens’ Union, shop steward. We’ve had nine hundred years of dry biscuits. We want cheese. Proper cheese. Cheddar Pete promised us cheese if we fetched him shiny things, but he pays us in rind. Rind!”\n\nHe flaps his wings. “Comrade Merlina leads the strike from the belfry of Big Ben. Tell her Harris sent you.”",
            set = "strike_note",
            choices = {
                { text = "Hurry to Big Ben", to = 70 },
                { text = "Rest in Poets’ Corner", to = 38 },
            },
        },
        [38] = {
            text = "You sit down among Chaucer, Dickens and a plaque for Shakespeare, who isn’t actually buried here but likes to be included. A kindly verger in slippers appears with a pot of tea and a digestive biscuit.\n\n“Don’t mind the raven,” she whispers. “He’s been reading Dickens all night. Hard Times, mostly.” You feel much restored.",
            stamina = 3,
            choices = {
                { text = "Talk to the raven", to = 37 },
                { text = "Hurry to Big Ben", to = 70 },
            },
        },
        [39] = {
            text = "You sit in the ancient oak Coronation Chair, where every monarch since Edward II has been crowned. It is hard and rather wobbly, but you feel majestic. You give a royal wave to the empty pews. A ghostly chorister claps politely.\n\nThe verger appears, tuts “Not for sitting, dear,” and shoos you off. Still, you feel a little bit regal.",
            skill = 1,
            choices = {
                { text = "Talk to the raven", to = 37 },
                { text = "Rest in Poets’ Corner", to = 38 },
            },
        },
        [40] = {
            text = "Tower Hill station is closed for the night, but a ticket lady with a beehive hairdo is still sitting in her booth knitting a scarf of extraordinary length.\n\nBeside the barriers is a rusty door marked STAFF ONLY. NO ENTRY. ESPECIALLY NOT TO ALDWYCH. A cold draught whistles under it, smelling faintly of cheese.",
            choices = {
                { text = "Buy a night ticket and a map (2 gold)", to = 41, cost = 2 },
                { text = "Sneak through the staff door", to = 42 },
            },
        },
        [41] = {
            text = "The ticket lady takes your coins and slides over a ticket and a crinkly old map. “Proper Tube map, that, from when there were stations what don’t exist no more. Aldwych, British Museum, Down Street. Mind the gap, love. Mind all the gaps.”\n\nShe opens the staff door for you with a wink and goes back to her knitting.",
            gain = "tube_map",
            choices = {
                { text = "Go down into the tunnels", to = 43 },
            },
        },
        [42] = {
            text = "You wait until the ticket lady is counting stitches, then slip through the staff door. Beyond it, a narrow spiral staircase plunges into darkness. The steps are slippery, the rail is wobbly and the bulb at the top has been dead since roughly the Coronation.",
            test = { stat = "luck", win = 43, lose = 44 },
        },
        [43] = {
            text = "The tunnels stretch away in every direction, black and echoing. Old rails gleam. Somewhere, a train that shouldn’t exist rumbles past. A sign, half-peeled, points to ALDWYCH, BRITISH MUSEUM and, oddly, DOWN STREET.\n\nThe darkness is very dark. Even the darkness looks nervous.",
            choices = {
                { text = "Switch on your torch", to = 45, need = "torch" },
                { text = "Follow the old Tube map", to = 46, need = "tube_map" },
                { text = "Feel your way in the dark", to = 47 },
            },
        },
        [44] = {
            text = "Your foot slips. You bounce down the spiral staircase like a pinball, bump, bump, bump, all the way to the bottom, and land in a heap with a polite “ow”. Nothing broken. Mostly bruised pride and a little bit of bottom.",
            stamina = -2,
            choices = {
                { text = "Pick yourself up", to = 43 },
            },
        },
        [45] = {
            text = "Your torch beam catches two red eyes. Then whiskers. Then a great deal more rat than you were expecting: a sewer rat the size of a corgi, sitting on its haunches and sniffing at your pocket.\n\nIt bares a pair of yellow teeth like old piano keys. It is, you suspect, peckish.",
            choices = {
                { text = "Fight the giant rat", to = 49 },
                { text = "Offer it your pickle sandwich", to = 50, need = "sandwich" },
                { text = "Tiptoe past it", to = 51 },
            },
        },
        [46] = {
            text = "The old map shows a secret passage marked in faded red ink: “Staff shortcut, do not use, rats.” You take it, neatly avoiding a large squeaking shape in the main tunnel.\n\nThe passage forks. One way, the map says ALDWYCH. The other way, BRITISH MUSEUM, closed 1933, with a little drawing of a mummy and the word “Boo”.",
            choices = {
                { text = "Take the passage to Aldwych", to = 52 },
                { text = "Take the passage to British Museum", to = 55 },
            },
        },
        [47] = {
            text = "You shuffle along in pitch darkness, one hand on the damp wall, counting steps. Left? Right? Was that a rail, or a tail? You try to remember which way the draught was blowing, and whether it smelt of cheese or of something worse.",
            roll = { dice = 1, outcomes = { { upto = 2, to = 48 }, { upto = 6, to = 45 } } },
        },
        [48] = {
            text = "You walk. And walk. You go round in circles so many times you become the first person ever to complete the Circle Line on foot, in the dark, backwards.\n\nYou are never quite found. Night workers sometimes hear a polite voice in the tunnels asking, “Excuse me, is this the way to Aldwych?” They call you the Phantom of Mind the Gap. THE END.",
            ending = "death",
        },
        [49] = {
            text = "The giant rat lunges with a squeak that echoes down the tunnel like a rusty violin. You grab a length of old pipe and defend yourself as best you can. Water drips from the ceiling, the rails hum, and the rat smells of drains and old crisps.",
            fight = { name = "Giant Sewer Rat", skill = 7, stamina = 7, win = 52, flee = 43 },
        },
        [50] = {
            text = "You unwrap your pickle sandwich and toss it over. The giant rat catches it in mid-air, chews thoughtfully, and its whole face melts into an expression of pure bliss.\n\nIt rolls over to have its tummy scratched, then trots ahead of you down the tunnel like a furry tour guide, stopping now and then to make sure you’re keeping up.",
                        choices = {
                { text = "Follow your new friend", to = 52 },
            },
        },
        [51] = {
            text = "You flatten yourself against the tunnel wall and edge sideways, very slowly, like a crab at a funeral. The rat sniffs the air. Its whiskers twitch. You try very hard not to think about pickle, which is, of course, the only thing you can think about.",
            test = { stat = "skill", win = 52, lose = 49 },
        },
        [52] = {
            text = "Aldwych: a ghost station, closed since 1994. Old posters advertise shows nobody remembers. The tiles are cracked, the platform is dusty, and the whole place is piled high with crates stamped CHEESE, FRAGILE and THIS WAY UP.\n\nA chalkboard reads: SHINY STUFF IN, CHEESE OUT. From somewhere comes whistling, and footsteps. Cheddar Pete is coming back.",
            choices = {
                { text = "Search the crates quickly", to = 53 },
                { text = "Hide and wait for Pete", to = 54 },
                { text = "Slip down the tunnel to British Museum", to = 55 },
            },
        },
        [53] = {
            text = "You rummage. Wensleydale, Stilton, Red Leicester, a wheel of Cheddar as big as a tractor tyre. You take a wheel of Wensleydale, as evidence. On top of a crate lies a ledger:\n\n“Ravens: 3 spoons, 1 teapot, 1 tiara. Paid in rind. NEXT JOB: THE CROWN. Thursday. Meet ravens at Big Ben belfry. Bring cheese. Not much.”",
            gain = "cheese", set = "pete_plan",
            choices = {
                { text = "Hide and wait for Pete", to = 54 },
                { text = "Slip down the tunnel to British Museum", to = 55 },
            },
        },
        [54] = {
            text = "You duck behind a tower of Red Leicester. A round man in a striped jumper strolls onto the platform, twirling a moustache waxed into two cheese straws. Cheddar Pete! He sniffs the air suspiciously. “I smell… a reporter.” He starts poking about between the crates, getting closer.",
            test = { stat = "luck", win = 56, lose = 57 },
        },
        [55] = {
            text = "British Museum station, closed 1933. Legend says the ghost of an Egyptian princess haunts it. Sure enough, a small figure in bandages is sitting on the platform bench, waiting for a train that will never come.\n\n“Evening,” she says cheerfully. “Stairs to the museum are behind the poster. Or the ghost train goes to Westminster. It’s always late.”",
            choices = {
                { text = "Climb the hidden stairs to the museum", to = 67 },
                { text = "Catch the ghost train to Westminster", to = 35 },
            },
        },
        [56] = {
            text = "Pete gives up, pulls out a walkie-talkie and chuckles. “Nigel? Tonight’s the night. The ravens meet in Big Ben’s belfry. I bring ’em a bit of rind, they fly to the Tower and fetch me the Crown. Then it’s off to Amsterdam with the jewels and the cheese! Ha!”\n\nHe waddles off up the escalator. You have the whole plan.",
            set = "pete_plan",
            choices = {
                { text = "Take the tunnel to British Museum", to = 55 },
                { text = "Race up to the street and to Big Ben", to = 70 },
            },
        },
        [57] = {
            text = "A hand grabs your collar. “Gotcha!” Before you can say “free press”, Pete stuffs you into an empty cheese crate and nails down the lid. “Next stop, Amsterdam!” he cackles.\n\nIt is dark in here, and it smells very strongly of a cheese called Stinking Bishop. You hear the crate being wheeled away.",
            choices = {
                { text = "Eat your way out", to = 58 },
                { text = "Kick the lid with all your might", to = 59 },
            },
        },
        [58] = {
            text = "Somebody has left a fat wedge of Wensleydale in the corner of the crate. You nibble. You munch. You chomp. The wedge is gone, and so, by some cheesy miracle, is the bottom of the crate, which was made of cheese-board.\n\nYou drop out onto the tracks, well fed and smelling like a picnic, and creep away.",
            stamina = 4,
            choices = {
                { text = "Hurry down the tunnel", to = 55 },
            },
        },
        [59] = {
            text = "You brace your back against the crate and kick, hard, with both feet, like a donkey that has strong opinions about Stinking Bishop. The nails groan. The lid creaks. The crate keeps rolling towards the old goods lift and, beyond it, the river.",
            test = { stat = "skill", win = 55, lose = 88 },
        },
        [60] = {
            text = "The night bus drops you at Baker Street. At number 221B the lights are on, though the museum closed hours ago. Behind the window you can see a figure in a deerstalker, puffing a pipe and playing the violin very badly.\n\nThe great detective is fictional, of course. But tonight, so is common sense.",
            choices = {
                { text = "Knock at the door of 221B", to = 61 },
                { text = "Climb in through the window", to = 62 },
            },
        },
        [61] = {
            text = "The door opens by itself. In the sitting room, Sherlock Holmes, or his waxwork, or his ghost, or all three, looks you up and down.\n\n“You have come from the Tower. You have met a headless queen. You are a reporter, poorly paid. Sit. Ghosts of fictional people are the most reliable kind, you know. Now. What data have you brought me?”",
            choices = {
                { text = "Show him the cheese crumbs", to = 63, flag = "crumbs" },
                { text = "Admit you have no clues", to = 64 },
                { text = "Peek at his desk by the window", to = 62 },
            },
        },
        [62] = {
            text = "You try to climb onto the windowsill of 221B, which is high, narrow and covered in the droppings of a very well-fed pigeon. Your fingers grip. Your feet scrabble. Below you, a dustbin waits with its lid open, like a mouth.",
            test = { stat = "skill", win = 65, lose = 66 },
        },
        [63] = {
            text = "Holmes examines a crumb under his lens. “Wensleydale, cut with a cheese wire, by a left-handed man who hums. Your ravens are on strike for cheese. A smuggler uses cheese as bait so they will steal shiny things. His den: the ghost station at Aldwych. His target: the Crown. The ravens roost somewhere high and noisy. Big Ben, obviously.”\n\n“Elementary,” he adds, very pleased with himself.",
            set = { "pete_plan", "strike_note" },
            choices = {
                { text = "Ask what to do next", to = 64 },
            },
        },
        [64] = {
            text = "The ghost of Mrs Hudson floats in with a tray of tea and crumpets. You eat three. Holmes taps his pipe.\n\n“When you have eliminated the impossible, whatever remains, however improbable, is the British Museum. A friend in the Reading Room knows everything about ravens. Or go to Aldwych. Or to Big Ben. I would go to all three, but I have a violin to torture.”",
            stamina = 3,
            choices = {
                { text = "Go to the British Museum", to = 67 },
                { text = "Take a cab to Aldwych", to = 52 },
                { text = "Hurry to Big Ben", to = 70 },
            },
        },
        [65] = {
            text = "You tumble through the window onto Holmes’s desk, scattering papers marked “The Case of the Curious Kipper”. Under your nose lies a heavy brass magnifying glass.\n\n“Take it,” says Holmes, without looking up from his violin. “You will need to read very small writing tonight. I never use it anyway. I see everything perfectly well already.”",
            gain = "magnifier",
            choices = {
                { text = "Thank him and sit down", to = 61 },
            },
        },
        [66] = {
            text = "Your fingers slip and you drop neatly into the dustbin with a clang. The lid closes on you. When you finally fight your way out, covered in tea leaves and kipper bones, a bin lorry has just driven off. Your camera fell out on the way and is now on its way to the dump.\n\nA ghostly voice chuckles from upstairs. “Use the door next time.”",
            stamina = -2, lose = "camera",
            choices = {
                { text = "Knock at the door instead", to = 61 },
            },
        },
        [67] = {
            text = "The British Museum at night: the Great Court gleams under its glass roof like a frozen wedding veil. A night guard snores at his desk. Somewhere the Lewis Chessmen are glaring at each other.\n\nTo one side is the round Reading Room. Down the hall stands the Rosetta Stone. And outside the gates, an all-night cheese cart is doing a roaring trade with taxi drivers.",
            choices = {
                { text = "Go into the Reading Room", to = 68 },
                { text = "Examine the Rosetta Stone", to = 69 },
                { text = "Visit the all-night cheese cart", to = 74 },
                { text = "Dash to Big Ben", to = 70 },
            },
        },
        [68] = {
            text = "Under the great blue-and-gold dome of the Reading Room, a ghostly librarian with a pencil in her bun glides between the shelves. This must be Miss Prudence Inkwell. She turns to you with an expression that could freeze the Thames.\n\n“Shhhh,” she says, though you haven’t said anything yet. “Can I help you? Quietly?”",
            choices = {
                { text = "Return Bartholomew’s library book", to = 71, need = "library_book" },
                { text = "Sneak past her to the raven shelf", to = 72 },
            },
        },
        [69] = {
            text = "The Rosetta Stone, the famous slab that unlocked Egyptian hieroglyphs. The same decree in hieroglyphs, Demotic and Greek. But look closer: along the bottom edge there is a fourth line of tiny scratches, like bird footprints.\n\nIt is far too small to read with the naked eye.",
            choices = {
                { text = "Study it with Holmes’s magnifier", to = 73, need = "magnifier" },
                { text = "Give up and go to the Reading Room", to = 68 },
            },
        },
        [70] = {
            text = "You stand at the foot of the Elizabeth Tower, which everybody calls Big Ben, although strictly Big Ben is the bell. Three hundred and thirty-four steps lead to the belfry. From the top drifts the sound of cawing, cheering and someone banging a beak on a tin plate like a gavel.\n\nThe clock says a quarter to three. Your deadline is breathing down your neck.",
            choices = {
                { text = "Climb the 334 steps", to = 76 },
                { text = "Lie in wait for Cheddar Pete", to = 77, flag = "pete_plan" },
                { text = "Give up and go home to bed", to = 87 },
            },
        },
        [71] = {
            text = "Miss Inkwell opens the book, sees the date stamp and gasps. “1857! Bartholomew Quill! The fine is…” She counts on her fingers, then on yours. Then she smiles. “Waived. And here is his deposit, with interest.” She hands you five coins and a cup of tea.\n\nA cold breeze sighs through the dome: Bartholomew, free at last, whispers, “Call me if you need a proper fright.”",
            set = "book_returned", gold = 5, stamina = 2, lose = "library_book",
            choices = {
                { text = "Back to the Great Court", to = 67 },
                { text = "Head for Big Ben", to = 70 },
            },
        },
        [72] = {
            text = "You tiptoe towards a shelf marked ORNITHOLOGY and pull out a book. Unfortunately it is the bottom book of a tower of books. There is a long, slow, magnificent avalanche of encyclopaedias. Miss Inkwell’s “SHHHHHH!” rattles the windows.\n\nYou crawl out with a bump on the head and a strong feeling you are no longer welcome.",
            stamina = -1,
            choices = {
                { text = "Apologise and leave", to = 67 },
                { text = "Flee to Big Ben", to = 70 },
            },
        },
        [73] = {
            text = "Through the lens, the bird-scratches become words: a fourth language, Raven! The stone’s ancient scribes have carved a handy phrasebook. “Caw” means hello. “Caw-caw” means please. “Cr-r-ruk” means “I have cheese”. “Kraa” means “Your feathers are magnificent”.\n\nYou practise under your breath until you can caw like a native.",
            set = "raven_tongue",
            choices = {
                { text = "Go to the Reading Room", to = 68 },
                { text = "Hurry to Big Ben", to = 70 },
            },
        },
        [74] = {
            text = "The cheese cart is run by a jolly woman in a striped apron. “Midnight cheese for midnight people!” she sings. She has Cheddar, Stilton, Double Gloucester, and a magnificent wheel of Wensleydale, the cheese of champions.\n\n“Four coins for the Wensleydale, love. Ravens go mad for it, so I hear.”",
            choices = {
                { text = "Buy the Wensleydale (4 gold)", to = 75, cost = 4 },
                { text = "Go back into the museum", to = 67 },
            },
        },
        [75] = {
            text = "You hand over your coins and stagger off with a wheel of Wensleydale the size of a car tyre. It is crumbly, creamy and smells heavenly. A passing fox follows you hopefully for three streets before giving up.\n\n“Good luck with your ravens!” calls the cheese lady, and gives you a free cracker for the road.",
            gain = "cheese", stamina = 1,
            choices = {
                { text = "Head for Big Ben", to = 70 },
                { text = "Go back into the museum", to = 67 },
            },
        },
        [76] = {
            text = "You start up the stairs. Fifty steps: fine. A hundred: breathing hard. Two hundred: your legs have filed a formal complaint. Three hundred: you are fairly sure you can see the ghost of Christopher Wren pointing and laughing. The great clockwork ticks around you like a giant’s heartbeat.",
            test = { stat = "stamina", win = 78, lose = 79 },
        },
        [77] = {
            text = "You hide behind a statue of Boudica. Soon a cart rattles up, pushed by Cheddar Pete, with Nigel in his sheet riding on top of a pile of rind. “Right, Nigel, up we go, and then the Crown!”\n\nYou step out. “Stop in the name of the free press!” Pete rolls up his sleeves. Nigel goes “Wooo” half-heartedly. It’s two against one.",
            fight = { enemies = {
                { name = "Nigel the Sheet-Ghost", skill = 5, stamina = 4 },
                { name = "Cheddar Pete", skill = 8, stamina = 8 },
            }, win = 80, flee = 76 },
        },
        [78] = {
            text = "The belfry! Beside the enormous bell, the seven ravens of the Tower sit on the beams in a solemn row, with tiny placards: BISCUITS ARE FOR PIGEONS. CHEESE NOT CHAINS. WHAT DO WE WANT? CHEESE! WHEN DO WE WANT IT? CAW!\n\nIn the middle, a magnificent raven with a tiara on her head fixes you with a beady eye. This is Merlina, Queen of the Ravens.",
            choices = {
                { text = "Greet them in their own language", to = 81, flag = "raven_tongue" },
                { text = "Offer them the Wensleydale", to = 82, need = "cheese" },
                { text = "Read out their demands with respect", to = 83, flag = "strike_note" },
                { text = "Flap your arms and shoo them home", to = 84 },
            },
        },
        [79] = {
            text = "Somewhere around step three hundred your legs simply give up and you crawl the rest of the way on hands and knees, wheezing like a set of bagpipes with a puncture. You finally flop onto the belfry floor, red as a postbox.",
            stamina = -2,
            choices = {
                { text = "Stagger into the belfry", to = 78 },
            },
        },
        [80] = {
            text = "Pete crashes into his own cart and is buried under an avalanche of rind. Nigel surrenders at once and helps you tie his uncle up with a string of cheese. “Sorry, Uncle Pete. The free press is very persuasive.”\n\nYou leave them for the police, who arrive whistling, and turn to the tower. The ravens are still up there.",
            set = "pete_caught",
            choices = {
                { text = "Climb the 334 steps", to = 76 },
            },
        },
        [81] = {
            text = "“Caw. Kraa,” you say carefully. Hello. Your feathers are magnificent.\n\nThe ravens fall silent. Merlina tilts her head, clearly impressed. “A human who speaks proper Raven! Haven’t heard that since old Bartholomew.” She smooths her feathers. “Very well. We will listen. But talk is cheap. Cheese is not.”",
            choices = {
                { text = "Offer them the Wensleydale", to = 82, need = "cheese" },
                { text = "Promise them a better deal", to = 85 },
            },
        },
        [82] = {
            text = "You roll out the wheel of Wensleydale. Seven beaks drop open. There is a moment of holy silence, and then a joyful frenzy of crumbs.\n\nMerlina wipes her beak on a beam. “Now THAT is cheese. Not rind. Very well, human. We will end the strike. We go home to the Tower, on condition of cheese on Sundays.” The ravens cheer. Somebody bangs the bell, gently.",
            lose = "cheese", set = "ravens_deal",
            choices = {
                { text = "Lead the ravens home to the Tower", to = 97, flag = "pete_caught" },
                { text = "Warn them about Cheddar Pete", to = 86, noflag = "pete_caught" },
            },
        },
        [83] = {
            text = "You read their demands aloud, slowly and with feeling, the way the newsreaders do. “No more dry biscuits. Cheese for all. Fair pay for fair pecking.” The ravens nod, impressed.\n\nMerlina cocks her head. “Well spoken. We have been cheated, you see. Cheddar Pete promised us cheese for shiny things and gave us nothing but rind. So: who will pay?”",
            choices = {
                { text = "Offer them the Wensleydale", to = 82, need = "cheese" },
                { text = "Promise them a better deal", to = 85 },
            },
        },
        [84] = {
            text = "“Shoo! Home! Bad birds!” you shout, flapping your arms. Seven ravens look at you with deep contempt. Then all seven take off at once in a storm of black feathers, swooping and pecking at your hat. You stumble backwards, waving blindly, straight towards the edge of the great bell.",
            test = { stat = "luck", win = 85, lose = 96 },
        },
        [85] = {
            text = "Merlina settles on the bell and looks at you for a long time. “You have spirit, human. I like that. Here is our offer: bring us Cheddar Pete, the rind-merchant who cheated us, and we will consider going home. Ravens never forget a debt.”\n\nThe other ravens nod and mutter, “Never forget. Caw.”",
            choices = {
                { text = "Hand over Pete, already caught", to = 90, flag = "pete_caught" },
                { text = "Wait for Pete to show up", to = 89, noflag = "pete_caught" },
            },
        },
        [86] = {
            text = "“Cheddar Pete is coming here tonight,” you warn them, “to send you after the Crown.” The ravens bristle. Merlina’s eyes narrow to two shiny buttons.\n\nAt that very moment, footsteps clatter up the stairs, and a voice puffs, “Evening, my feathered friends! Uncle Pete’s brought you some lovely rind!”",
            choices = {
                { text = "Face Pete in the belfry", to = 89 },
            },
        },
        [87] = {
            text = "You decide that ravens can look after themselves, ghosts can haunt whoever they like, and nobody ever got a front page while asleep, but nobody ever fell off a clock tower while asleep either.\n\nYou go home, eat toast and sleep till noon. Mrs Thistlewood puts you on the gardening column. You become rather good at marrows. THE END.",
            ending = "end",
        },
        [88] = {
            text = "The lid holds firm. The crate is loaded onto a barge, the barge sails down the Thames, across the North Sea and up a canal, and two days later you are unpacked in a cheese shop in Amsterdam.\n\nThe owner takes one sniff and puts you in the window with a label: RARE ENGLISH REPORTER, AGED IN STINKING BISHOP. You are very popular with tourists. THE END.",
            ending = "death",
        },
        [89] = {
            text = "Cheddar Pete stomps into the belfry with a sack of rind, Nigel behind him in his bedsheet. He sees you, and his cheese-straw moustache quivers with rage. “You again! Nigel, get the snoop!”\n\nThe ravens flutter up to the beams to watch, like spectators at Wimbledon. The great bell hangs above you all, silent and enormous.",
            choices = {
                { text = "Fight Pete and Nigel", to = 93 },
                { text = "Call on Bartholomew’s ghost", to = 94, flag = "book_returned" },
                { text = "Hide behind the great bell", to = 95 },
            },
        },
        [90] = {
            text = "You present Cheddar Pete to the ravens, by telling them he is under arrest and in a police cell eating porridge. Merlina is satisfied. “Justice is served. Not with cheese, sadly, but served.”\n\nAt dawn the seven ravens fly home to the Tower, grumbling. Higgins weeps for joy. Your story runs on page seven, next to the crossword. Case solved. Not bad at all, junior. THE END.",
            ending = "win",
        },
        [91] = {
            text = "Cheddar Pete ends up wedged upside down in his own sack of rind, legs kicking. Nigel surrenders and holds out his wrists. The ravens swoop down and sit on Pete in a row, looking very smug.\n\nA police constable puffs up the stairs, sees the scene and simply writes “Ravens” in his notebook. Pete and Nigel are led away.",
            set = "pete_caught",
            choices = {
                { text = "Lead the ravens home to the Tower", to = 97, flag = "ravens_deal" },
                { text = "Ask Merlina to come home", to = 90, noflag = "ravens_deal" },
            },
        },
        [92] = {
            text = "You duck and dodge round the great bell, Pete puffing behind you, Nigel tripping over his sheet. Round and round you go like a very silly carousel. Then you spot the bell’s huge striking hammer, and the lever that works it.",
            choices = {
                { text = "Pull the hammer lever", to = 95 },
                { text = "Turn and fight again", to = 93 },
            },
        },
        [93] = {
            text = "Pete swings his sack of rind like a medieval flail while Nigel flaps his sheet in your face. It is the strangest fight in the history of Westminster, and that is saying something. Parliament has seen some odd scraps, but never one with this much cheese in it.",
            fight = { enemies = {
                { name = "Nigel the Sheet-Ghost", skill = 5, stamina = 4 },
                { name = "Cheddar Pete", skill = 8, stamina = 8 },
            }, win = 91, flee = 92 },
        },
        [94] = {
            text = "“Bartholomew!” you shout. “Proper fright, please!”\n\nThe temperature drops. Frost creeps over the bell. A shimmering Victorian Warder rises through the floor, eyes blazing, whiskers bristling, and roars “OOOOVERDUUUE!” in a voice that rattles the clock hands.\n\nNigel faints. Pete, who has never met a real ghost, screams like a kettle and dives head first into his own sack of rind.",
            choices = {
                { text = "Tie them up before they recover", to = 91 },
            },
        },
        [95] = {
            text = "You make a dash for the great bell, Pete lumbering after you. The whole belfry trembles. The striking hammer is right above you, poised to strike three o’clock, and you are standing exactly where it would be very unwise to stand.",
            test = { stat = "luck", win = 91, lose = 96 },
        },
        [96] = {
            text = "BONG! Big Ben strikes three, and you are standing far too close. The sound picks you up and fires you out of the belfry like a cork from a bottle. You sail over the Thames, over the South Bank, over Waterloo station, and land in a pigeon’s nest on Nelson’s Column.\n\nNelson does not want a lodger. Neither do the pigeons. You are still up there, writing very small articles. THE END.",
            ending = "death",
        },
        [97] = {
            text = "At dawn you march back through the Tower gates with seven ravens perched on your arms, shoulders and hat. Higgins bursts into tears and blows his nose on his ruff. Anne Boleyn waves her head from Tower Green. The kingdom, it seems, will not fall today.\n\nThe ravens hop towards their empty enclosure and look at you expectantly. Mrs Thistlewood’s deadline is in one hour.",
            choices = {
                { text = "Unlock the enclosure and snap a photo", to = 99, need = { "cage_key", "camera" } },
                { text = "Let Higgins do it and write it up", to = 98 },
            },
        },
        [98] = {
            text = "Higgins unlocks the enclosure and the ravens hop in, demanding cheese. You run all the way to the office and write the whole story without a single picture.\n\nIt runs on page five: RAVENS RETURN, SMUGGLER SNARED. Mrs Thistlewood grunts, “Not bad, junior. Next time, bring a photo.” The ravens get cheese on Sundays. The kingdom stands. You call that a win. THE END.",
            ending = "win",
        },
        [99] = {
            text = "You turn the key, the ravens hop proudly home, and Merlina poses on the gate with her tiara as your flash goes POP. Behind her, faintly, Anne Boleyn holds up her head and smiles for the camera.\n\nFront page, special edition: GHOST, RAVENS AND CHEESE: HOW OUR REPORTER SAVED THE CROWN. Mrs Thistlewood gives you a raise, a desk and a cheese allowance. The ravens send a thank-you card. THE END.",
            ending = "win",
        },
    },
}
