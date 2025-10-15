"Giant Steps: Chapter 1: Autumn in New York" by You

[==================== BASICS & UI ====================]

Release along with a website.
Release along with an interpreter. 

[ HELP ]
Asking for help is an action out of world applying to nothing.
Understand "help" or "about" or "how to play" or "tutorial" as asking for help.
Carry out asking for help:
	say "[bold type]How to play (quick)[roman type][paragraph break]Try short, simple commands.[line break]• LOOK (or L) — refresh the room view[line break]• EXAMINE (or X) things — e.g., X MAGAZINE, X PAGES[line break]• OPEN/CLOSE/TAKE/READ[line break]• PLAY SAXOPHONE / PLAY GUITAR[line break]• NEXT / PREVIOUS — flip the magazine[line break]• DIAL 555-0199 (from the wall phone)[line break]• ANSWER PHONE when it rings; during calls, type 1/2/3 or HANG UP[line break]• LEAVE or GO WEST — head out (only after you have somewhere to go)".

[ Let READ be a synonym for EXAMINE ]
Understand "read [something]" as examining.

[ PROLOGUE: multi-card intro ]
Prologue-on is a truth state that varies. Prologue-on is true.
Prologue pages is a list of text that varies.
Prologue index is a number that varies.
Subway-intro-fired is a truth state that varies. Subway-intro-fired is false.
To decide what text is normalized (T - text):
	let U be T;
	replace the text " " in U with "";
	replace the text "-" in U with "";
	replace the text "(" in U with "";
	replace the text ")" in U with "";
	replace the text "." in U with "";
	decide on U.
Rule for printing the banner text when Prologue-on is true: rule succeeds.  [suppress until we're done]
Before looking when Prologue-on is true: stop the action.

When play begins:
	now Prologue pages is {
		"[italic type][bold type]Giant Steps[roman type][paragraph break]chapter 1: Autumn in New York[paragraph break]a prototype of a game by sebastian blue[paragraph break]type 'help' for help.",
		"[italic type]It's been almost two months since I graduated. God, what did I think was going to happen when I moved to New York?[roman type][paragraph break]'Oh, hello, Desmond, it's me, Mr. Tall! Residency at my jazz club because you're so cool! And I'll pay off your $40,000 jazz-school debt!'.",
		"[italic type]Stupid. That's stupid. And I'm talking to myself again.",
		"It took a long time to move here. Dad helped. He always helps in a way that leaves a little extra for me to carry after."
	};
	now Prologue index is 1;
	say entry 1 of Prologue pages;
	say "[paragraph break][bracket]Type NEXT.[close bracket]".

After reading a command when Prologue-on is true:
	let cmd be the player's command in lower case;
	if cmd is "next" or cmd is "continue" or cmd is "start":
		increment Prologue index;
		if Prologue index <= the number of entries in Prologue pages:
			say entry Prologue index of Prologue pages;
			say "[paragraph break][bracket]Type next.[close bracket]";
			reject the player's command;
		otherwise:
			now Prologue-on is false;
			carry out the printing the banner text activity;
			try looking;
			reject the player's command;
	otherwise:
		say "[bracket]Type next.[close bracket]";
		reject the player's command.

[==================== THE APARTMENT ====================]

The Studio is a room. "[roman type]You look around your tiny studio apartment, tucked into a corner of 178th street. [italic type]'Uptown Manhattan,'[roman type] as someone once described it. There's a magazine on the counter, and some bills and mail pile up slowly. It's insane you haven't cleaned this place once since you've moved here. A couch is pushed up against a big window, a grimy, scuffed rug underfoot, instruments everywhere, a kitchen nook just over there—[bold type]and the apartment door to the west[roman type]."

[ WEST DOOR + HALLWAY (locked by invitation) ]
The Hallway is a room. "Dim, echoey. Stairs down to the street, smell of dust and last night's takeout."

The apartment door is a door. It is west of the Studio and east of the Hallway.
The apartment door is closed and unlocked. The printed name is "door". Understand "front door/door/out" as the apartment door.
Instead of opening the apartment door when invited-to-talls is false:
	say "You put a hand on the knob and stop. [italic type]You shouldn't leave if you have nowhere to go.[roman type]" instead.

Instead of going west from the Studio when invited-to-talls is false:
	say "[italic type]You shouldn't leave if you have nowhere to go.[roman type] Maybe figure out your night first, bro. Are you gonna do something, or wimp out and stay here and watch Tiny Desk videos again?" instead.


[ Quality-of-life: LEAVE goes west ]
Leaving is an action applying to nothing.
Understand "leave" or "go out" or "head out" or "exit apartment" as leaving.
Carry out leaving: try going west.

[ When you ARE invited, auto-open and start subway selection on first step into the Hallway ]
Before going west from the Studio when invited-to-talls is true:
	begin subway-choose;
	stop the action.


[==================== FURNISHINGS ====================]

The couch is an enterable supporter in the Studio. The description is "It's certainly seen better days, but still the best place to crash between gigs. Don't try to look between the cushions."
The cushions is part of the couch. Understand "cushions/between the cushions/between/pillows/between cushions/between pillows" as the cushions. The description is "Dude. I told you not to look between the cushions. There's nothing here. Surprise."
The rug is scenery in the Studio. The description is "Threadbare rectangle with a stubborn coffee halo. Doug gave it to you. It smells faintly like his mom's new boyfriend. That kinda sucks."
The coffee stain is part of the rug. Understand "coffee/halo/stain/ring" as the coffee stain. The description is "A perfectly circular endorsement for coasters you do not own."
The window is scenery in the Studio. The description is "Streetlights smear across the glass; the city hums behind it."
The window pane is part of the window. The printed name is "window close-up". Understand "pane/close up/close-up" as the window pane. The description is "Smudges, tape shadows from old posters, and you—tired, slightly heroic."
The city is scenery in the Studio. Understand "streetlights/neon/outside/street" as the city. The description is "A low, constant hush: buses sighing, a scooter whining three octaves too high, someone laughing like midnight owes them money."
Some posters are scenery in the Studio. The description is "Gig flyers, half-peeling. You've headlined some of these—nice."

[ INSTRUMENTS ]
An instrument-thing is a kind of thing.
The saxophone is an instrument-thing in the Studio. The description is "Lacquered, road-worn, tuned to your mood."
The guitar is an instrument-thing in the Studio. The description is "Six strings and a history of late rent."
Some instruments are scenery in the Studio. Understand "instrument/instruments" as the instruments.
The description of the instruments is "Your little orchestra: [a list of instrument-things in the Studio]. Try PLAY SAXOPHONE or PLAY GUITAR."
Playing is an action applying to one thing. Understand "play [something]" as playing.
Check playing:
	if the noun is not the saxophone and the noun is not the guitar:
		say "You noodle the air. It responds politely by doing nothing." instead.
Carry out playing:
	if the noun is the saxophone:
		say "You lay down a smoky riff. The room edits itself into black-and-white for a second.";
	otherwise:
		say "A gentle pattern, thumb and nail. The room exhales."

[ KITCHEN ]
The kitchen is scenery in the Studio. The description is "A tiny L-shape of counter under a cabinet, with a fridge big enough to dent your shins."
The kitchen-close is part of the kitchen. The printed name is "Kitchen Close-up". Understand "kitchen close/close-up/closer" as the kitchen-close. The description is "Crumbs, a chipped mug, and a note to buy coffee that you've ignored twice."
The counter is part of the kitchen. Understand "countertop/counter top/worktop" as the counter. The description is "Formica scars, ring marks, and an optimistic cutting board."
The cabinet is a closed openable container. It is part of the kitchen. The description is "Painted shut for years, then surrendered. Inside: mismatched glasses and a colander with ambition."
Some mismatched glasses are in the cabinet. The mismatched glasses are plural-named. The description is "Cloudy but serviceable. They clink like they're auditioning."
A colander is in the cabinet. The description is "A thousand holes and one dream."
Before taking something (called loot) when loot is in the cabinet and the cabinet is closed:
	say "You'll need to open the cabinet first." instead.
The fridge is a closed openable container. It is part of the kitchen. The description is "Hums like a practicing tuba."
A half lemon is in the fridge. Understand "lemon/half" as the half lemon. The description is "Zesty and brave."
A jar of pickles is in the fridge. Understand "pickle/pickles/jar" as the jar of pickles. The description is "Floating emerald ovals promising a briny future."
Two takeout boxes are in the fridge. The takeout boxes are plural-named. Understand "box/boxes/takeout" as the takeout boxes. The description is "Mysterious. You decide not to date them."
Before taking something (called chow) when chow is in the fridge and the fridge is closed:
	say "You'll need to open the fridge first." instead.
After opening the fridge:
	say "You open the fridge.[paragraph break]A cool wave of... personality.";
	try examining the fridge;
	stop the action.
The fridge-interior is scenery. The fridge-interior is part of the fridge. The printed name is "fridge close-up".
Understand "shelves/interior/inside/close-up/close up" as the fridge-interior.
The description of the fridge-interior is "Half a lemon, a heroic jar of pickles, and two takeout boxes with question marks on them."

[==================== MAIL (OPENABLE) ====================]

The mail-bills is a closed openable container in the Studio.
The printed name is "some bills and mail".
Understand "bills" or "mail" or "stack" or "pile" or "envelopes" or "letters" as the mail-bills.
The description is "A rubber-banded stack: some official windows, some handwritten. You could OPEN it."
Before taking something (called doc) when doc is in the mail-bills and the mail-bills is closed:
	say "You'll need to open the stack first." instead.
Instead of searching the mail-bills when the mail-bills is closed:
	say "Maybe start by opening the stack."
After opening the mail-bills:
	say "You peel the rubber band and spread things out: a friendly envelope, a landlord envelope, and a ConEd envelope."

The friendly envelope is a closed openable container in the mail-bills.
Understand "friendly" or "handwritten" as the friendly envelope.
The description of the friendly envelope is "Handwritten return address. The vibe is 'finally, something nice.'".
A handwritten letter is in the friendly envelope. The handwritten letter is portable.
The description of the handwritten letter is
	"[italic type]Hey—Proud of you for making the move. Call if you need a couch, or a pep talk. PS: Your tone on 'Body and Soul' gives me chills.[roman type] —M".

The landlord envelope is a closed openable container in the mail-bills.
Understand "landlord letter" or "rent" or "rent envelope" or "office" as the landlord envelope.
The description of the landlord envelope is "Printed window, stern font. Smells faintly of copier ozone."
A rent notice is in the landlord envelope. The rent notice is portable.
The description of the rent notice is
	"Balance due, circled twice. Office number scribbled at the bottom: 555-0119. Office hours 10–4, 'no checks in slot after hours.'"

The coned envelope is a closed openable container in the mail-bills.
Understand "coned" or "con ed" or "utility" or "electric" as the coned envelope.
The description of the coned envelope is "Classic blue bar stripes. The electricity of impending consequence."
An electric bill is in the coned envelope. The electric bill is portable.
The description of the electric bill is
	"Usage graph pretending to be art. Amount due highlighted. A small note: '[italic type]If you’re having trouble paying, call to set up a plan.[roman type]'"

[==================== MAGAZINE (RICHER) ====================]

The magazine is a thing in the Studio. The description is "A glossy culture magazine—scene write-ups, tiny reviews, classifieds, and gear ads. [italic type]EXAMINE PAGES[roman type], then type NEXT or PREVIOUS to flip."

The pages are part of the magazine. The printed name is "pages close-up". Understand "pages/page" as the pages.

Current page is a number that varies. Current page is 1. Max pages is a number that varies. Max pages is 4.
Knows-Talls-address is a truth state that varies. Knows-Talls-address is false.

To say show-page:
	if current page is 1:
		say "[bold type]PAGE 1 — Scene Report: Lower East Side[roman type][paragraph break]Tall's has quietly become the late-night hang—basement room, red door, low ceiling, louder conversations. If you can play in Bb, the house will make space.[paragraph break][italic type]Where:[roman type] 184 Ludlow St (downstairs). [italic type]Trains:[roman type] F/M/J/Z to Delancey–Essex.[paragraph break]Also noted: Kite Studios expands hours; Mr. Lin opens waitlist.[paragraph break][bracket]Numbers & classifieds on later pages. You can DIAL numbers from the wall phone.[close bracket]";
	else if current page is 2:
		say "[bold type]PAGE 2 — Rehearsal & Rooms[roman type][line break]• Kite Studios (24h lockout) — 555-0145[line break]• Bulletin: 'late set players welcome' at Tall's (see page 1).";
	else if current page is 3:
		say "[bold type]PAGE 3 — Repairs & Services[roman type][line break]• Mr. Lin (Sax repair) — 555-0177[line break]• Amp Doctor — 555-0158[line break][italic type]Tip:[roman type] buzzing? Check your ground first.";
	else:
		say "[bold type]PAGE 4 — Classifieds[roman type][line break]• Landlord Office — 555-0119[line break]• Rides: Yellow Cab — 555-0129[line break]• Pizza Planet — 555-0199 (two toppings after midnight).";
	say "[paragraph break][bracket]Type NEXT or PREVIOUS to flip pages.[close bracket]".

After examining the pages:
	say "[show-page]";
	if current page is 1:
		now Knows-Talls-address is true.

Flipping-next is an action applying to nothing.
Understand "next" or "next page" or "turn page" or "flip page" or "flip" or "turn to next page" as flipping-next.
Carry out flipping-next:
	if current page is max pages:
		now current page is 1;
	otherwise:
		increment current page;
	say "[show-page]".


Flipping-prev is an action applying to nothing.
Understand "previous" or "prev" or "back page" or "turn to previous page" as flipping-prev.
Carry out flipping-prev:
	if current page is 1:
		now current page is max pages;
	otherwise:
		decrement current page;
	say "[show-page]".

The jazz-ad is scenery. The jazz-ad is part of the pages. The printed name is "ad for Tall's Jazz Club".
Understand "ad/ads/advertisement/advertisements/adverts/tall/tall's/jazz/club" as the jazz-ad.
The description of the jazz-ad is "TALL'S JAZZ CLUB — TONIGHT: Late Set Jam. Bring a horn. First drink on the house if you can play in Bb. [italic type]184 Ludlow, basement.[roman type]"

[==================== PHONE + CALL ====================]

The wall phone is scenery in the Studio. Understand "phone/telephone/receiver" as the wall phone.
The description of the wall phone is "An honest-to-goodness wall phone with a coiled cord. Old-fashioned, but it never asks for an update[if phone-ringing is true]. It's ringing[end if]."
The dial pad is part of the wall phone. The printed name is "wall phone close-up".
Understand "pad/dial/keys/close-up/close up" as the dial pad. The description of the dial pad is "Numbers that promise connection, if you know who to call."

Phone-rung is a truth state that varies. Phone-rung is false. Phone-ringing is a truth state that varies. Phone-ringing is false.

Every turn when the turn count is 7 and phone-rung is false:
	now phone-rung is true;
	now phone-ringing is true;
	say "[bold type]*BRRRRING*[roman type] The wall phone bursts to life. ([italic type]ANSWER PHONE[roman type] to pick up.)".

[ Proximity: must be at the phone to dial ]
The phone nook is an enterable supporter in the Studio. It is scenery and fixed in place.
The description is "Right under the wall phone—the perfect spot to lean while you dial."

Approaching-phone is an action applying to nothing.
Understand "go to phone" or "go to the phone" or "go to wall phone" or
	"use phone" or "stand by phone" or "stand at phone" or "approach phone" as approaching-phone.

Carry out approaching-phone:
	if the player is on the phone nook:
		say "You're already by the wall phone.";
	else:
		silently try entering the phone nook;
		say "You step up to the wall phone.".

Instead of entering the wall phone: try approaching-phone.

[ Answering / hanging up ]
Picking up is an action applying to one thing.
Understand "answer [something]" or "pick up [something]" as picking up.

Check picking up:
	if the noun is not the wall phone:
		say "You can't answer that." instead.

Before picking up the wall phone when the player is not on the phone nook:
	silently try entering the phone nook.

Carry out picking up:
	if phone-ringing is false:
		say "You lift the receiver. Dial tone, then the sound of your own breathing.";
	else:
		now phone-ringing is false;
		begin the call.

Answering is an action applying to nothing.
Understand "answer" or "answer phone" or "answer the phone" as answering.

Carry out answering:
	if the player is not on the phone nook:
		silently try entering the phone nook;
	try picking up the wall phone.


Hanging up is an action out of world applying to nothing.
Understand "hang up" or "hang up phone" or "end call" as hanging up.
Carry out hanging up:
	if in-call is false:
		say "You place your hand on the hook, out of habit. No one to disappoint but the dial tone.";
	else:
		now in-call is false;
		now call-stage is 0;
		say "You return the receiver. A soft click, a louder room."

[ Dialing ]
Dialing is an action applying to one topic.
Understand "dial [text]" or "call [text]" as dialing.
Check dialing when the player is not on the phone nook:
	say "You reach for where a cell *would* be. The wall phone's across the room—try [italic type]GO TO PHONE[roman type] first." instead.
Before dialing when in-call is true:
	say "You're already on a call. (Type HANG UP to end it.)" instead.

[ Phonebook (define before we use it) ]
Table of Phonebook
name (text)	number (text)	response (text)
"Pizza Planet"	"555-0199"	"[paragraph break]A cheerful voice: 'Pizza Planet! Specials after midnight: two toppings for the price of regret.' A dry, angry voice then picks up: 'What the hell do you want?' a click."
"Yellow Cab"	"555-0129"	"[paragraph break]A drone: 'All dispatchers busy. Please hold.' You are treated to two bars of hold music and a click."
"Kite Studios"	"555-0145"	"[paragraph break]'Kite Studios—lockouts tonight are booked, but noon is open. Bring earplugs.'"
"Mr. Lin"	"555-0177"	"[paragraph break]'Workshop.' (Silence.) Then: 'Leave message. I fix horns, not people.' Beep. Click."
"Amp Doctor"	"555-0158"	"[paragraph break]Voicemail: 'Drop-offs 10–6. If it hums, that's a ground issue. If it screams, that's you.'"
"Landlord Office"	"555-0119"	"[paragraph break]Ring. Ring. Ring. A machine: 'Mailbox full.' Huh."
"Operator"	"0"	"[paragraph break]A crisp voice: 'Operator. What city and number please?' You panic and hang up politely."

Carry out dialing:
	let raw be the substituted form of "[the topic understood]";
	let dialed be normalized raw;
	if phone-ringing is true:
		now phone-ringing is false;
		say "You silence the ring with your finger on the hook.";
	say "You tap the keypad: [raw].";
	let matched be false;
	repeat through the Table of Phonebook:
		let nnum be normalized (number entry);
		let nname be normalized (name entry);
		if dialed is nnum or dialed is nname:
			now matched is true;
			say response entry;
			break;
	if matched is false:
		say "Dial tone, then a recorded pause. Either wrong number or the city is feeling shy tonight.".

[ Incoming call / dialog pushing Tall's invite ]
In-call is a truth state that varies. In-call is false.
Call-stage is a number that varies.
Invited-to-Talls is a truth state that varies. Invited-to-Talls is false.

To begin the call:
	now in-call is true;
	now call-stage is 1;
	say "'Hey. It's Rena.' The voice sits somewhere between a yawn and a dare. 'You should come out—Tall's is running a late jam tonight.'";
	say "[paragraph break][bold type]1[roman type]) 'What's up? Sell me.'[line break][bold type]2[roman type]) 'Tonight? I'm wrecked.'[line break][bold type]3[roman type]) 'Rena who?'";
	say "[paragraph break][bracket]Type 1, 2, or 3. HANG UP to end the call.[close bracket]".

Choosing is an action applying to one number.
Understand "[number]" as choosing when in-call is true.

Carry out choosing:
	if call-stage is 1:
		if the number understood is 1:
			say "'Late set. House trio is killing, horns rotate in, everyone listens. You need to be seen.'";
			say "[paragraph break][bold type]1[roman type]) 'Okay, make your pitch.'[line break][bold type]2[roman type]) 'I don't have the energy.'[line break][bold type]3[roman type]) 'Do they even let walk-ins?'";
			now call-stage is 2;
		otherwise if the number understood is 2:
			say "'Wrecked's fine. Play one tune, drink one drink, shake three hands. That's all. You'll thank me tomorrow.'";
			say "[paragraph break][bold type]1[roman type]) 'One tune, huh? Convince me.'[line break][bold type]2[roman type]) 'Pass.'[line break][bold type]3[roman type]) 'Feels risky without a call.'";
			now call-stage is 2;
		otherwise if the number understood is 3:
			say "'Rena. Drummer. The van. The sticks. The patience.' You can hear her grin. 'Tall's jam. Tonight.'";
			say "[paragraph break][bold type]1[roman type]) 'Right. Why me?'[line break][bold type]2[roman type]) 'Still a maybe.'[line break][bold type]3[roman type]) 'I don't even know the book.'";
			now call-stage is 2;
		otherwise:
			say "Pick 1, 2, or 3.";
	otherwise if call-stage is 2:
		if the number understood is 1:
			say "'You sound good. You need reps. People there can hire you. And the room forgives. Show up, take a chorus, leave a name.' A beat. 'So... tonight.'";
		otherwise if the number understood is 2:
			say "'Fine. Be tired on stage. Two choruses and bounce. Tall's. Tonight.' The confidence leaves no wedge for argument.";
		otherwise if the number understood is 3:
			say "'It's a jam, not a recital. Call something in Bb, listen hard, lay back on the head. Trust me.' A soft laugh. 'Tall's. Tonight.'";
		otherwise:
			say "Pick 1, 2, or 3.";
			stop the action;
		now invited-to-talls is true;
		now in-call is false;
		now call-stage is 0;
		say "You draw breath to ask where it is—click. Dead line. No address.";
	otherwise:
		say "The call's already done."

Before doing something when in-call is true:
	if the current action is choosing or the current action is asking for help or the current action is hanging up:
		continue the action;
	otherwise:
		say "You're on the phone. Choose [bold type]1–3[roman type], or type [bold type]HANG UP[roman type].";
		stop the action.

[==================== SUBWAY PICKER ====================]

[==================== SUBWAY PICKER (numbers-only, ~20 stops) ====================]

Subway-choosing is a truth state that varies. Subway-choosing is false.

[ Simple constant: which number is correct in the menu below ]
Correct stop index is a number that varies. Correct stop index is 1.

Table of Subway Stops
idx (number)	stop (text)
1	"Delancey–Essex"
2	"Spring St (6)"
3	"Prince St (R/W)"
4	"Canal St (A/C/E)"
5	"Hoyt–Schermerhorn"
6	"14 St–Union Sq"
7	"W 4 St–Wash Sq"
8	"34 St–Herald Sq"
9	"Times Sq–42 St"
10	"Grand St (B/D)"
11	"Bedford Av (L)"
12	"Atlantic Av–Barclays Ctr"
13	"2 Av (F)"
14	"Broadway–Lafayette"
15	"Essex St (J/M/Z)"
16	"1 Av (L)"
17	"7 Av–Park Slope"
18	"Nostrand Av (A/C)"
19	"Queensboro Plaza"
20	"Myrtle–Wyckoff Avs"

To begin subway-choose:
	now Subway-choosing is true;
	now the command prompt is "(subway) > ";
	say "[bold type]Subway — pick a stop:[roman type]";
	repeat through the Table of Subway Stops:
		say "[line break][bold type][idx entry])[roman type] [stop entry]";
	if Knows-Talls-address is true:
		say "[paragraph break][italic type](The magazine said Tall's is at 184 Ludlow, F/M/J/Z to Delancey–Essex.)[roman type]";
	say "[paragraph break][bracket]Type a number (1–[the number of rows in the Table of Subway Stops]).[close bracket]".

[ Only allow the picker inputs while the menu is up ]
Before doing something when Subway-choosing is true:
	if the current action is picking-station or the current action is asking for help:
		continue the action;
	otherwise:
		say "[bracket]Pick a stop by number.[close bracket]";
		stop the action.

Picking-station is an action applying to one number.
Understand "[number]" as picking-station when Subway-choosing is true.

Carry out picking-station:
	let N be the number understood;
	if N < 1 or N > the number of rows in the Table of Subway Stops:
		say "That number isn't on the board. 1–[the number of rows in the Table of Subway Stops].";
	else if N is Correct stop index:
		end-subway-choose(true);
	else:
		end-subway-choose(false).

To end-subway-choose (made-it - a truth state):
	now Subway-choosing is false;
	now the command prompt is "> ";
	if made-it is true:
		now the player is in Delancey Street;
	otherwise:
		say "You arrive to the station. It smells like rats. You hate rats. Also you have no idea where you are. Did you really think you could raw-dog the New York subway system? [line break] [italic type]Where the[roman type] fuck [italic type]am I?[roman type] Maybe actually figure out where Tall's is first, bro.";

Delancey Street is a room. "Lower East Side: neon bleed, late traffic, bass from a basement somewhere. A red door marked [italic type]Tall's[roman type] crouches under a short run of stairs. (And yeah—the address matches the magazine: 184 Ludlow.)"

[==================== QUALITY OF LIFE ====================]
After getting off the phone nook:
	say "You step back from the wall phone." instead.

[ Map taped to the apartment door ]
The subway map is scenery. It is part of the apartment door.
Understand "map" or "subway map" as the subway map.
The description of the subway map is "Crumpled, annotated, and out of date—except for the parts you care about."

Some subway stops are scenery. They are part of the subway map.
The printed name is "subway stops".
Understand "stops/lines/stations/list/route" as the subway stops.
The description of the subway stops is
	"Delancey–Essex, Spring, Prince, Canal, and Hoyt–Schermerhorn.".

Instead of taking the subway map:
	say "It’s taped on in three different generations of tape. It’s essentially structural now."
Instead of taking the wall phone: say "Bolted into the past and the drywall."
Instead of entering the window: say "You value your limbs and your security deposit."

[==================== TEST SCRIPT ====================]
Test me with "next / next / next / next / look / x magazine / x pages / next / next / previous / open mail / open friendly envelope / read letter / go to phone / dial 555-0119 / z / z / z / z / z / z / answer / 1 / 1 / leave / 1".
