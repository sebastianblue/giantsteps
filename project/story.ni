"Giant Steps: Chapter 1: Autumn in New York" by You

The Studio is a room. "[roman type]You look around your tiny studio apartment, tucked into a corner of 178th street. [italic type]'Uptown Manhattan,'[roman type] as someone once described it to you. There's a magazine on the counter, and bills and mail pile up slowly. There's a couch pushed up against a big window, a grimy, scuffed rug underfoot, a wall phone by the door, instruments everywhere and a kitchen nook just over there."

[-- HELP (out of world) --]
Asking for help is an action out of world applying to nothing.
Understand "help" or "about" or "how to play" or "tutorial" as asking for help.
Carry out asking for help:
	say "[bold type]How to play (quick)[roman type][paragraph break]Try short, simple commands.[line break]• LOOK (or L) — refresh the room view[line break]• EXAMINE (or X) things — e.g., X MAGAZINE, X PAGES[line break]• Just try lots of different things, get creative. [line break] If stuck, EXAMINE (X) more. Type HELP again anytime.";

[-- PROLOGUE: multi-card title using NEXT/CONTINUE --]

Prologue-on is a truth state that varies. Prologue-on is true.
Prologue pages is a list of text that varies.
Prologue index is a number that varies.

[Hide the default banner until the prologue finishes.]
Rule for printing the banner text when Prologue-on is true:
	[skip it for now]
	rule succeeds.

[Block the initial automatic LOOK during the prologue.]
Before looking when Prologue-on is true:
	stop the action.

When play begins:
	now the command prompt is "(next) > ";
	now Prologue pages is {
		"[italic type][bold type]Giant Steps[roman type][paragraph break]chapter 1: Autumn in New York[paragraph break]a prototype of a game by sebastian blue[paragraph break]type 'help' for help.",
		"[italic type]It's been almost two months since I graduated. God, what the fuck did I think was going to happen when I moved to New York? [italic type] [paragraph break]'Oh, hello, Desmond, it's me, Mr. Tall! I'm excited to offer you a residency at my jazz club because you're so cool! And because you're so good at playing that there saxophone! Oh, and I'll pay off your $40,000 debts from jazz school!'", 
		"[italic type]Stupid. That's stupid. And I'm talking to myself again.",
		"[italic type]It took a long time to move here. It was nice of Dad to help me, but he left me with just enough shit to deal with. He always did that, try to help, but when it was all over, I always end up needing to do more than I did when we started."
	};
	now Prologue index is 1;
	say entry 1 of Prologue pages;
	say "[paragraph break][bracket]Type next.[close bracket]".

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
			now the command prompt is "> ";
			carry out the printing the banner text activity;  [show the standard banner now]
			try looking;                                      [then show the room]
			reject the player's command;
	otherwise:
		say "[bracket]Type next.[close bracket]";
		reject the player's command.


[--- CORE FURNISHINGS ---]
The couch is an enterable supporter in the Studio. The description is "It's certianly seen better days, but still the best place to crash between gigs. That is, if you ever get any gigs in this city, loser."

The rug is scenery in the Studio. The description is "Threadbare rectangle with a stubborn coffee halo. It ties the room together, barely. Doug gave it to you. Doug's mom's new boyfriend. The rug smells like him. That kinda sucks."
The coffee stain is part of the rug. Understand "coffee/halo/stain/ring" as the coffee stain. The description of the coffee stain is "A perfectly circular endorsement for coasters you do not own."

The window is scenery in the Studio. The description is "Streetlights smear across the glass; the city hums behind it."
The window pane is part of the window. The printed name is "window close-up". Understand "pane/close up/close-up" as the window pane. The description of the window pane is "Smudges, tape shadows from old posters, and you—tired, slightly heroic."

The city is scenery in the Studio. Understand "streetlights/neon/outside/street" as the city. The description is "A low, constant hush: buses sighing, a scooter whining three octaves too high, someone laughing like midnight owes them money."

The front door is scenery in the Studio. Understand "door" as the front door. The description is "The exit. On it: a battered subway map and more tape residue."
The subway map is part of the front door. Understand "map" as the subway map. The description is "Crumpled, annotated, and absolutely out of date—except for the parts you care about."
Some subway stops are part of the subway map. The printed name is "subway stops". The stops are scenery. Understand "stops/lines/stations/list/route" as the subway stops. The description of the subway stops is "Tall's is circled near 'Delancey', with arrows to 'Spring', 'Prince', and 'Canal'. There's also a star by 'Hoyt-Schermerhorn' for reasons Past You refuses to explain."

Some posters are scenery in the Studio. The description is "Gig flyers, half-peeling. You’ve headlined some of these—nice."

[--- INSTRUMENTS ---]
An instrument-thing is a kind of thing.
The saxophone is an instrument-thing in the Studio. The description is "Lacquered, road-worn, tuned to your mood."
The guitar is an instrument-thing in the Studio. The description is "Six strings and a history of late rent."

Some instruments are scenery in the Studio. Understand "instrument" or "instruments" as the instruments.
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

[--- PAPER THINGS ---]
The mail-bills is a thing in the Studio. The printed name is "some bills and mail".
Understand "bills" or "mail" or "envelopes/letters/stack" as the mail-bills.
The description is "Envelopes with complicated feelings about you. One looks friendly. The rest do not."
The friendly envelope is part of the mail-bills. Understand "friendly" as the friendly envelope.
The description of the friendly envelope is "Handwritten return address. The vibe is 'finally, something nice.'"

[--- KITCHEN NOOK & CLOSE-UPS ---]
The kitchen is scenery in the Studio. The description is "A tiny L-shape of counter under a cabinet, with a fridge big enough to dent your shins."
The kitchen-close is part of the kitchen. The printed name is "Kitchen Close-up". Understand "kitchen close/close-up/closer" as the kitchen-close. The description of the kitchen-close is "Crumbs, a chipped mug, and a note to buy coffee that you’ve ignored twice."

The counter is part of the kitchen. Understand "countertop/counter top/worktop" as the counter. The description is "Formica scars, ring marks, and an optimistic cutting board."

The cabinet is a closed openable container. It is part of the kitchen. The description is "Painted shut for years, then surrendered. Inside: mismatched glasses and a colander with ambition."
Some mismatched glasses are in the cabinet. The mismatched glasses are plural-named. The description is "Cloudy but serviceable. They clink like they're auditioning."
A colander is in the cabinet. The description is "A thousand holes and one dream."
Before taking something (called the loot) when the loot is in the cabinet and the cabinet is closed:
	say "You'll need to open the cabinet first." instead.

The fridge is a closed openable container. It is part of the kitchen. The description is "Hums like a practicing tuba."
A half lemon is in the fridge. Understand "lemon/half" as the half lemon. The description is "Zesty and brave."
A jar of pickles is in the fridge. Understand "pickle/pickles/jar" as the jar of pickles. The description is "Floating emerald ovals promising a briny future."
Two takeout boxes are in the fridge. The takeout boxes are plural-named. Understand "box/boxes/takeout" as the takeout boxes. The description is "Mysterious. You decide not to date them."
Before taking something (called the chow) when the chow is in the fridge and the fridge is closed:
	say "You'll need to open the fridge first." instead.
After opening the fridge:
	say "You open the fridge.[paragraph break]A cool wave of... personality.";
	try examining the fridge;
	stop the action.

The fridge-interior is scenery. The fridge-interior is part of the fridge. The printed name is "fridge close-up".
Understand "shelves/interior/inside/close-up/close up" as the fridge-interior.
The description of the fridge-interior is "Half a lemon, a heroic jar of pickles, and two takeout boxes with question marks on them."

[--- MAGAZINE: MULTIPLE PAGES + ADS ---]
The magazine is a thing in the Studio. The description is "Glossy culture mag—half features, half ads. You can [italic type]EXAMINE PAGES[roman type], then NEXT or PREVIOUS to flip."

The pages are part of the magazine. The printed name is "pages close-up". Understand "pages/page" as the pages.

Current page is a number that varies. Current page is 1.
Max pages is a number that varies. Max pages is 4.

To say show-page:
	if current page is 1:
		say "[bold type]PAGE 1 — Listings (Food & Rides)[roman type][line break]• Pizza Planet — 555-0199[line break]• Yellow Cab — 555-0129[line break]• Operator — 0";
	else if current page is 2:
		say "[bold type]PAGE 2 — Rooms & Rehearsal[roman type][line break]• Kite Studios (24h lockout) — 555-0145[line break]• Bulletin: 'late set players welcome'";
	else if current page is 3:
		say "[bold type]PAGE 3 — Repairs & Services[roman type][line break]• Mr. Lin (Sax repair) — 555-0177[line break]• Amp Doctor — 555-0158";
	else:
		say "[bold type]PAGE 4 — Classifieds[roman type][line break]• Landlord (Office) — 555-0119[line break]• Community Board: lost keys, found scarf.";
	say "[paragraph break][bracket]Type NEXT or PREVIOUS to flip pages. You can also DIAL numbers you see here.[close bracket]".

After examining the pages:
	say "[show-page]".

Flipping-next is an action applying to nothing. 
Understand "next" or "turn page" or "flip page" or "flip" or "turn to next page" as flipping-next.
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
The description of the jazz-ad is "TALL'S JAZZ CLUB — TONIGHT: Late Set Jam. Bring a horn. First drink on the house if you can play in Bb."

[--- PHONEBOOK (define before dialing uses it) ---]
Table of Phonebook
name (text)	number (text)	response (text)
"Pizza Planet"	"555-0199"	"[paragraph break]A cheerful voice: 'Pizza Planet! Specials after midnight: two toppings for the price of regret.'"
"Yellow Cab"	"555-0129"	"[paragraph break]A drone: 'All dispatchers busy. Please hold.' You are treated to two bars of hold music and a click."
"Kite Studios"	"555-0145"	"[paragraph break]'Kite Studios—lockouts tonight are booked, but noon is open. Bring earplugs.'"
"Mr. Lin"	"555-0177"	"[paragraph break]'Workshop.' (Silence.) Then: 'Leave message. I fix horns, not people.' Beep."
"Amp Doctor"	"555-0158"	"[paragraph break]Voicemail: 'Drop-offs 10–6. If it hums, that's a ground issue. If it screams, that's you.'"
"Landlord Office"	"555-0119"	"[paragraph break]Ring. Ring. Ring. A machine: 'Mailbox full.' Huh."
"Operator"	"0"	"[paragraph break]A crisp voice: 'Operator. What city and number please?' You panic and hang up politely."

[--- PHONE & CALLS (bug-safe) ---]
The wall phone is scenery in the Studio. Understand "phone" or "telephone" or "receiver" as the wall phone.
The description of the wall phone is "An honest-to-goodness wall phone with a coiled cord. Old-fashioned, but it never asks for an update[if phone-ringing is true]. It's ringing[end if]."

The dial pad is part of the wall phone. The printed name is "wall phone close-up".
Understand "pad/dial/keys/close-up/close up" as the dial pad.
The description of the dial pad is "Numbers that promise connection, if you know who to call."

Phone-rung is a truth state that varies. Phone-rung is false.
Phone-ringing is a truth state that varies. Phone-ringing is false.

Every turn when the turn count is 7 and phone-rung is false:
	now phone-rung is true;
	now phone-ringing is true;
	say "[bold type]*BRRRRING*[roman type] The wall phone bursts to life. ([italic type]ANSWER PHONE[roman type] to pick up.)".

[ Answering / hanging up ]
Picking up is an action applying to one thing.
Understand "answer [something]" or "pick up [something]" as picking up.

Check picking up:
	if the noun is not the wall phone:
		say "You can't answer that." instead.

Carry out picking up:
	if phone-ringing is false:
		say "You lift the receiver. Dial tone, then the sound of your own breathing.";
	else:
		now phone-ringing is false;
		begin the call.

[ Convenience: allow 'answer phone' or just 'answer' without hitting the parser bug ]

[-- PHONE PROXIMITY: must be at the phone to dial --]

The phone nook is an enterable supporter in the Studio. It is scenery and fixed in place.
The description is "Right under the wall phone—the perfect spot to lean while you dial."

[Convenience verbs to step over to the phone]
Approaching-phone is an action applying to nothing.
Understand "go to phone" or "go to the phone" or "go to wall phone" or
	"use phone" or "stand by phone" or "stand at phone" or "approach phone" as approaching-phone.
Carry out approaching-phone:
	if the player is on the phone nook:
		say "You're already by the wall phone.";
	else:
		now the player is on the phone nook;
		say "You step up to the wall phone.";

[Let 'enter phone' work as a shortcut]
Instead of entering the wall phone: try approaching-phone.

[You can't dial unless you're at the phone]
Check dialing when the player is not on the phone nook:
	say "You reach for where a cell *would* be. The wall phone's across the room—try [italic type]GO TO PHONE[roman type] first.";
	stop the action.

[Auto-step to the phone when answering/picking up]
Before picking up the wall phone when the player is not on the phone nook:
	say "You step over to the wall phone.";
	now the player is on the phone nook.

[Replace your existing 'Carry out answering' with this one]
Carry out answering:
	if the player is not on the phone nook:
		say "You step over to the wall phone.";
		now the player is on the phone nook;
	try picking up the wall phone.

[Optional: quick way to step away]
Stepping-away is an action applying to nothing.
Understand "step away" or "leave phone" or "leave the phone" or "back away" as stepping-away.
Check stepping-away:
	if the player is not on the phone nook:
		say "You're not exactly glued to it.";
		stop the action.
Carry out stepping-away:
	try exiting.
After getting off the phone nook:
	say "You step back from the wall phone." instead.

Answering is an action applying to nothing.
Understand "answer" or "answer phone" or "answer the phone" as answering.

Carry out answering:
	if the player is not on the phone nook:
		say "You step over to the wall phone.";
		now the player is on the phone nook;
	try picking up the wall phone.

Hanging up is an action out of world applying to nothing.
Understand "hang up" or "hang up phone" or "end call" as hanging up.
Carry out hanging up:
	if in-call is false:
		say "You place your hand on the hook, out of habit. No one to disappoint but the dial tone.";
	else:
		now in-call is false;
		now call-stage is 0;
		say "You return the receiver. A soft click, a louder room.";

[ Dialing numbers ]
Dialing is an action applying to one topic.
Understand "dial [text]" or "call [text]" as dialing.
Before dialing when in-call is true:
	say "You're already on a call. (Type HANG UP to end it.)" instead.
Carry out dialing:
	say "You tap the keypad: [the topic understood].";
	if phone-ringing is true:
		now phone-ringing is false;
		say "You silence the ring with your finger on the hook.";
	let matched be false;
	repeat through the Table of Phonebook:
		if the topic understood matches the text number entry or the topic understood matches the text name entry:
			now matched is true;
			say response entry;
			break;
	if matched is false:
		say "Dial tone, then a recorded pause. Either wrong number or the city is feeling shy tonight.";

[--- INCOMING CALL CONVO (simple branching) ---]
In-call is a truth state that varies. In-call is false.
Call-stage is a number that varies.

To begin the call:
	now in-call is true;
	now call-stage is 1;
	say "'Hey. It's Rena.' The voice sits somewhere between a yawn and a dare. 'Got a minute?'[paragraph break][bold type]1[roman type]) 'Yeah, what's up?'[line break][bold type]2[roman type]) 'Can this wait? I'm mid-something.'[line break][bold type]3[roman type]) 'Who is this again?'";
	say "[paragraph break][bracket]Type 1, 2, or 3. HANG UP to end the call.[close bracket]".

Choosing is an action applying to one number.
Understand "[number]" as choosing when in-call is true.

Carry out choosing:
	if call-stage is 1:
		if the number understood is 1:
			say "'Good. I need a sub for a late rehearsal—tomorrow, noon at Kite. Can you make it?'[paragraph break][bold type]1[roman type]) 'Yes. Text me the door code.'[line break][bold type]2[roman type]) 'Maybe. What's the pay?'[line break][bold type]3[roman type]) 'Can't. But I can call Kite (555-0145) to book a room later.'";
			now call-stage is 2;
		else if the number understood is 2:
			say "'Sure. Also—your landlord's office is on page four. Maybe call before they call you.' You hear a smile. 'Night.' The line clicks.";
			now in-call is false;
			now call-stage is 0;
		else if the number understood is 3:
			say "'Rena. The drummer. With the van. Please pretend you didn't forget.'[paragraph break][bold type]1[roman type]) 'Right, right. What's up?'[line break][bold type]2[roman type]) 'Sorry—long day. Call me tomorrow.'[line break][bold type]3[roman type]) 'Wrong number.'";
			now call-stage is 1;
		else:
			say "Pick 1, 2, or 3.";
	else if call-stage is 2:
		if the number understood is 1:
			say "'Perfect. I'll text. Bring both horn and guitar.' A beat. 'And maybe call Mr. Lin (555-0177) about that sticky octave key.' The line clicks.";
			now in-call is false;
			now call-stage is 0;
		else if the number understood is 2:
			say "'Fifty and a ride. Not nothing.' Another beat. 'Up to you.' The line dissolves into dial tone.";
			now in-call is false;
			now call-stage is 0;
		else if the number understood is 3:
			say "'Ha. Fair. Book if you want—Kite Studios, page two.' Click.";
			now in-call is false;
			now call-stage is 0;
		else:
			say "Pick 1, 2, or 3.";
	otherwise:
		say "The call's already done."

[ Only allow choosing/help/hang up while on a call ]
Before doing something when in-call is true:
	if the current action is choosing or the current action is asking for help or the current action is hanging up:
		continue the action;
	otherwise:
		say "You're on the phone. Choose [bold type]1–3[roman type], or type [bold type]HANG UP[roman type].";
		stop the action.

[--- QUALITY OF LIFE ---]
Instead of taking the subway map: say "It’s taped on in three different generations of tape. It’s essentially structural now."
Instead of taking the wall phone: say "Bolted into the past and the drywall."
Instead of entering the window: say "You value your limbs and your security deposit."

Test me with "space / help / look / x couch / x rug / x coffee / x window / x city / x instruments / x kitchen / x counter / x cabinet / open cabinet / take glasses / x colander / x fridge / open fridge / x fridge close-up / x magazine / x pages / next / next / previous / dial 555-0199 / dial kite studios / z / z / z / z / z / z / answer phone / 1 / 2 / hang up".
