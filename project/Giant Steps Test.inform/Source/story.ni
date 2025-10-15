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

[ Kept flags/utilities you already use elsewhere ]
Subway-intro-fired is a truth state that varies. Subway-intro-fired is false.

To decide what text is normalized (T - text):
	let U be T;
	replace the text " " in U with "";
	replace the text "-" in U with "";
	replace the text "(" in U with "";
	replace the text ")" in U with "";
	replace the text "." in U with "";
	decide on U.

Release along with a website.
Release along with an interpreter.

[ HELP ]
Understand "help" or "about" or "how to play" or "tutorial" as asking for help.
Carry out asking for help:
	say "[bold type]How to play (quick)[roman type][paragraph break]Try short, simple commands.[line break]• LOOK (or L) — refresh the room view[line break]• EXAMINE (or X) things — e.g., X MAGAZINE, X PAGES[line break]• OPEN/CLOSE/TAKE/READ[line break]• PLAY SAXOPHONE / PLAY GUITAR[line break]• NEXT / PREVIOUS — flip the magazine[line break]• DIAL 555-0199 (from the wall phone)[line break]• ANSWER PHONE when it rings; during calls, type 1/2/3 or HANG UP[line break]• LEAVE or GO WEST — head out (only after you have somewhere to go)".

[ Let READ be a synonym for EXAMINE ]
Understand "read [something]" as examining.

[ Kept flags/utilities you already use elsewhere ]
Subway-intro-fired is a truth state that varies. Subway-intro-fired is false.

To decide what text is normalized (T - text):
	let U be T;
	replace the text " " in U with "";
	replace the text "-" in U with "";
	replace the text "(" in U with "";
	replace the text ")" in U with "";
	replace the text "." in U with "";
	decide on U.

[ ==================== PROLOGUE: multi-card intro ==================== ]

Prologue-on is a truth state that varies. Prologue-on is true.
Prologue pages is a list of text that varies.
Prologue index is a number that varies.

[ Hide the standard banner while the prologue is active ]
Rule for printing the banner text when Prologue-on is true:
	rule succeeds.

[ Suppress the auto LOOK at game start while we're on the title cards ]
Before looking when Prologue-on is true:
	stop the action.

[ One helper to advance or finish the prologue ]
To advance the prologue:
	increment Prologue index;
	if Prologue index <= the number of entries in Prologue pages:
		say entry Prologue index of Prologue pages;
		say "[paragraph break][bracket]type next.[close bracket]";
	otherwise:
		now Prologue-on is false;
		carry out the printing the banner text activity;
		try looking.

When play begins:
	now Prologue pages is {
		"[italic type][bold type]Giant Steps[roman type][paragraph break]chapter 1: Autumn in New York[paragraph break]a prototype of a game by sebastian blue[paragraph break]type 'help' for help.",
		"[italic type]It's been almost two months since I graduated. Go, class of 2002! Just kidding. God, what did I think was going to happen when I moved to New York?[paragraph break]'Oh, hello, Desmond, it's me, Mr. Tall! Residency at my jazz club because you're so cool! And I'll pay off your $40,000 jazz-school debt!'",
		"[italic type]Stupid. That's stupid. And I'm talking to myself again.",
		"It took a long time to move here. Dad helped. He always helps in a way that leaves a little extra for me to carry after.[paragraph break][roman type]You put a record on your tiny AT turntable in the corner of your place. Jazz floods the room."
	};
	now Prologue index is 1;
	say entry 1 of Prologue pages;
	say "[paragraph break][bracket]type next.[close bracket]".

[ Treat a blank line (Enter) as NEXT; also accept NEXT/CONTINUE/START ]
After reading a command when Prologue-on is true:
	if the number of words in the player's command is 0:
		advance the prologue;
		reject the player's command;
	let cmd be the player's command in lower case;
	if cmd is "next" or cmd is "continue" or cmd is "start":
		advance the prologue;
		reject the player's command;
	say "[bracket]type next.[close bracket]";
	reject the player's command.

[==================== THE APARTMENT ====================]

The Studio is a room. "[paragraph break][roman type]You look around your tiny studio apartment, tucked into a corner of 178th street. [italic type]'Uptown Manhattan,'[roman type] as someone once described it. There's a magazine on the counter, and some bills and mail pile up slowly. [paragraph break]Posters hang on the walls. Your friend's LP is playing on an old turntable in the corner. It's insane you haven't cleaned this place once since you've moved here. A couch is pushed up against a big window, a grimy, scuffed rug underfoot, instruments everywhere, a kitchen nook just over there—and the apartment door to the west."

[==================== WEST DOOR + HALLWAY ====================]

The Hallway is a room. "Dim, echoey. Stairs down to the street, smell of dust and last night's takeout."

The apartment door is scenery and a door. It is west of the Studio and east of the Hallway.
The apartment door is closed and unlocked. The printed name is "door".
Understand "front door/door/out" as the apartment door.

[ Don’t even open the door if you’ve got nowhere to go ]
Instead of opening the apartment door when invited-to-talls is false:
	say "You put a hand on the knob and stop. [italic type]You shouldn't leave if you have nowhere to go.[roman type]";

[ Map LEAVE to going west ]
Leaving is an action applying to nothing.
Understand "leave" or "go out" or "head out" or "exit apartment" as leaving.
Carry out leaving: try going west.

[ Gate the exit: need an invite, then need the horn; otherwise kick to subway picker ]
Before going west from the Studio:
	if invited-to-talls is false:
		say "[italic type]You shouldn't leave if you have nowhere to go.[roman type] Maybe figure out your night first, bro. Are you gonna do something, or wimp out and stay here and watch Sex and the City again?" instead;
	if the player does not carry the saxophone:
		say "Forgetting something?" instead;
	[ You’re invited and carrying your horn: launch the subway picker ]
	begin subway-choose;
	stop the action.

[==================== RECORD PLAYER + RECORDS (Backyard is playing) ====================]

A vinyl-record is a kind of thing. Understand "record/vinyl/album/lp" as a vinyl-record.

The record player is scenery and a supporter in the Studio.
The record player can be switched on or switched off. The record player is switched on.
Understand "turntable/stereo/phonograph/player/record player" as the record player.
The description of the record player is
	"A thrift-store turntable flanked by two mismatched speakers. The belt’s a little wobbly, which is part of the charm. Right now the platter’s spinning [italic type][now-spinning][roman type].";

To say now-spinning:
	if a vinyl-record is on the record player:
		let R be a random vinyl-record which is on the record player;
		say "[printed name of R]";
	else:
		say "nothing in particular";

The milk crate is scenery and an open container in the Studio.
Understand "crate/record crate/records/stash" as the milk crate.
The description of the milk crate is "A black plastic crate stuffed with sleeves: classics, thrift finds, and a few you definitely 'borrowed' from friends.";

[ The one that’s actually playing ]
The Backyard single is scenery and the vinyl-record on the record player.
The printed name is "copy of 'Backyard' by 14th Street Band".
Understand "backyard/14th/street/band/single/'45'/ep" as the Backyard single.

[ Extra records in the crate, for flavor ]
The Kind of Blue LP is a vinyl-record in the milk crate. The printed name is "'Kind of Blue' LP".
The Blue Train LP is a vinyl-record in the milk crate. The printed name is "'Blue Train' LP".
The Soul Station LP is a vinyl-record in the milk crate. The printed name is "'Soul Station' LP".
The A Love Supreme LP is a vinyl-record in the milk crate. The printed name is "'A Love Supreme' LP".
The Mingus Ah Um LP is a vinyl-record in the milk crate. The printed name is "'Mingus Ah Um' LP".

[ Make sure it’s spinning from the top, even if Inform toggles defaults oddly ]
When play begins:
	now the record player is switched on;

[ LISTEN vibes ]
Instead of listening to the record player:
	say "The needle whispers across the groove; the room feels taped together by cymbal wash and tenor.";
Instead of listening in the Studio:
	say "From the corner: a late-night hush—dark chords, air in the bells, time stretched thin in a good way.";

[ Don’t let the player change/stop it—tonight’s vibe is perfect ]
Instead of taking a vinyl-record when the noun is on the record player:
	say "You hover over the sleeve. You can’t bring yourself to break the mood.";
Instead of putting a vinyl-record on the record player:
	say "You consider swapping it, then let your hand fall. This one fits the night a little too perfectly.";
Instead of switching off the record player:
	say "Not tonight. The room would feel wrong without it.";
Instead of changing-music:
	say "But this record's too good."
Instead of switching on the record player:
	if the record player is switched on:
		say "Already spinning. You like it that way.";
	else:
		now the record player is switched on;
		say "You nudge the switch; the platter settles into a slow, confident spin.";

[ If someone tries PLAY on the player or on an LP, steer them ]
Check playing the record player:
	say "It’s already spinning—exactly the vibe you need." instead.
Check playing a vinyl-record:
	say "You flip it in your hands, but the one on the platter is perfect." instead.

[ Convenience phrasings like 'change music' ]
Changing-music is an action applying to nothing.
Understand "change music" or "change the music" or "switch record" or "put on something else" or "spin something else" as changing-music.
Carry out changing-music:
	say "You reach for another sleeve, then smile and let it ride. This is the one.";

[==================== FURNISHINGS ====================]

The couch is scenery and an enterable supporter in the Studio.
The description is "It's certainly seen better days, but still the best place to crash between gigs. A stray MetroCard has migrated to the armrest like it pays rent, and a little spindle of burned CDs is listing under one leg. Don't try to look between the cushions."

The cushions are part of the couch.
Understand "cushions/between the cushions/between/pillows/between cushions/between pillows" as the cushions.
The description is "Dude. I told you not to look between the cushions. There's nothing here. Surprise. If you're hunting treasure, try the junk drawer like everyone else."

The rug is scenery in the Studio.
The description is "Threadbare rectangle with a stubborn coffee halo—thanks, Anthora cup. Doug gave it to you. It smells faintly like your mom's new boyfriend. That kinda sucks."

The coffee stain is part of the rug.
Understand "coffee/halo/stain/ring" as the coffee stain.
The description is "A perfectly circular endorsement for coasters you do not own. The ring matches your Anthora cup perfectly. Ha ha."

The window is scenery in the Studio.
The description is "Streetlights smear across the glass; the city hums behind it. Why the hell did you come here in the first place. The sunset is nice, though—it reminds you of home. A disposable camera is sunbathing on the sill like it’s going to take pictures of itself."

The window pane is part of the window.
The printed name is "window close-up".
Understand "pane/close up/close-up" as the window pane.
The description is "Smudges, tape shadows from the last tenant's old posters, and you in the reflection—tired, not heroic in the least."

The city is scenery in the Studio.
Understand "streetlights/neon/outside/street" as the city.
The description is "A low, constant hush: buses sighing, a scooter whining three octaves too high, someone laughing like midnight owes them money. On the corner, a Village Voice box losing a fight with gravity. Also a guy yelling [italic type]at[roman type] the library. Like, at the outside of the library. Who knows?"

Some posters are scenery in the Studio.
The description is "There's a poster of Charlie Parker. Isn't that nice? You've also got one of Sun Ra. Who do you think you are, bro? It's actually kind of cool. I bet girls will really love that one when they come over—not."

[ INSTRUMENTS ]
An instrument-thing is a kind of thing.

The saxophone is scenery and an instrument-thing in the Studio.
Understand "sax/saxophone/horn/selmer" as the saxophone.
The description is "[italic type]I remember when dad gave me this horn. I was just old enough to save all my lunch money to buy a beginner Yamaha horn, anything would have been better than the school model. [line break]When I got home from my last day of 11th grade, he had a shit-eating grin on his face. He was waiting for me to work hard enough to prove I wanted a nicer sax, and then he gave me his Selmer. What an asshole. Can't be too mad.[roman type] Your four-track is parked nearby—do you think it likes hearing you practice long tones all day?"

The guitar is scenery and an instrument-thing in the Studio.
The description is "This guitar just showed up in your life. It's not super clear where you got it, and you can't really play it that well. Jake, your first roommate, loved playing it for girls when they came over. That's the most action the guitar's seen. Besides the neck action (Yes, that's a joke about guitar luthiery). A stack of burned CDs leans against the case."

Some instruments are scenery in the Studio.
Understand "instrument/instruments" as the instruments.
The description of the instruments is "Look, we get it. You're a musician. You've got a guitar and a saxophone. Your four-track's stuck fast-forward button looks at you from the floor."

Playing is an action applying to one thing.
Understand "play [something]" as playing.
Check playing:
	if the noun is not the saxophone and the noun is not the guitar:
		say "You noodle the air. It responds politely by doing nothing." instead.
Carry out playing:
	if the noun is the saxophone:
		say "Wow, thank god you still remember your phrygian scales. Everyone was really worried whether you'd remember if there was an E natural in a Db phrygian scale. A huge round of applause when you hit it. Just kidding, there's nobody else here.";
	otherwise:
		say "A gentle pattern, thumb and nail. The room exhales."

[==================== KITCHEN ====================]

The kitchen is scenery in the Studio.
The description is "A tiny L-shape of counter under a cabinet, with a fridge big enough to dent your shins. There’s a junk drawer that contains every bad decision you’ve ever made in battery form."

The kitchen-close is part of the kitchen.
The printed name is "Kitchen Close-up".
Understand "kitchen close/close-up/closer" as the kitchen-close.
The description is "Crumbs, a chipped mug, and a note to buy coffee that you've ignored twice. The Anthora cup is right there, ring-branding the counter."

The kitchen-note is part of the kitchen-close.
The printed name is "To-Do Note".
Understand "coffee note/note/the note" as the kitchen-note.
The description is "It's a note. It says, 'Buy coffee.' Maybe you should buy coffee. Do you have money to buy coffee, dude?"

The counter is part of the kitchen.
Understand "countertop/counter top/worktop" as the counter.
The description is "Formica scars, ring marks, and an optimistic cutting board. An Anthora cup is auditioning another stain."

The cabinet is a closed openable container.
It is part of the kitchen.
The description is "Painted shut for years, then surrendered. Inside: mismatched glasses and a colander with ambition. The dead Sidekick lives in the junk drawer below, obviously."

Some mismatched glasses are in the cabinet.
The mismatched glasses are plural-named.
The description is "Cloudy but serviceable. Maybe one day, you'll have guests here and you can use them. For now, you'll just keep drinking mouth-to-sink. There's also a colander."

A colander is in the cabinet.
The description is "A thousand holes and one dream. Whatever the fuck that means."

Before taking something (called loot) when loot is in the cabinet and the cabinet is closed:
	say "You'll need to open the cabinet first." instead.

The fridge is a closed openable container.
It is part of the kitchen.
The description is "When you were visiting apartments with your mom and... Doug, you almost started weeping when you entered this one. It was the first one with a fridge. Beautiful stainless steel, the sheen on the outside matches the frigidity inside. But, no freezer. Alas. The fridge magnets are trying to class it up."

A half lemon is in the fridge.
Understand "lemon/half" as the half lemon.
The description is "Zesty and brave."

A jar of pickles is in the fridge.
Understand "pickle/pickles/jar" as the jar of pickles.
The description is "Floating emerald ovals promising a briny future."

Two takeout boxes are in the fridge.
The takeout boxes are plural-named.
Understand "box/boxes/takeout" as the takeout boxes.
The description is "Mysterious. You decide not to date them."

Before taking something (called chow) when chow is in the fridge and the fridge is closed:
	say "You'll need to open the fridge first." instead.

After opening the fridge:
	say "You open the fridge.[paragraph break]A cool wave of... personality. It can't smell bad if there's nothing in it. Well, there's a few things: half a lemon, a jar of pickles, and two takeout boxes.";
	try examining the fridge;
	stop the action.

The fridge-interior is scenery.
The fridge-interior is part of the fridge.
The printed name is "fridge close-up".
Understand "shelves/interior/inside/close-up/close up" as the fridge-interior.
The description is "Half a lemon, a heroic jar of pickles, and two takeout boxes with question marks on them."
[==================== MAIL (OPENABLE) ====================]

The mail-bills is scenery and a closed openable container in the Studio.
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
	"[italic type]Hey—Proud of you for making the move. Call if you need a couch, or a pep talk. PS: Your tone on 'Body and Soul' is so sweet, honey![roman type] —M (and Doug!)".

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

The magazine is scenery and a thing in the Studio. The description is "A glossy culture magazine—scene write-ups, tiny reviews, classifieds, and gear ads. [bracket]try looking at the page[close bracket]" 

The pages are part of the magazine. The printed name is "pages close-up". Understand "pages/page" as the pages.

Current page is a number that varies. Current page is 1. Max pages is a number that varies. Max pages is 6.
Knows-Talls-address is a truth state that varies. Knows-Talls-address is false.

To say show-page:
	if current page is 1:
		say "[bold type]PAGE 1 — Downtown Report[roman type][paragraph break]The scene fractured somewhere between Coltrane's sheets of sound and laptop glitch—now it's splintered into a dozen micro-movements, each with manifestos nobody reads and shows nobody promotes. Tonic's booking experimental Mondays. The Knitting Factory moved. Nobody cares.[paragraph break]What matters: [bold type]Tall's basement sessions where the piano's out of tune and the drummer studied in Berlin. Bring changes in three flats or go home.[paragraph break]Take the F train to Delancey Street. Exit, walk south on Essex, turn right on Delancey, left on Ludlow. Listen for it.[paragraph break][roman type][bracket]Payphone classifieds page 6. try the 'next' page[close bracket]";
	else if current page is 2:
		say "[bold type]PAGE 2 — On Technique & Silence[roman type][paragraph break]Monk said the piano ain't got no wrong notes. He was half-right. The wrong note is the one you don't commit to.[paragraph break]Downtown's full of conservatory kids playing Bergonzi patterns over 'Stella' like they're decoding the Rosetta Stone. Meanwhile the guy who dropped out sophomore year is making the room breathe because he learned space before speed.[paragraph break]The late set isn't about your Transcriptions folder. It's about making eye contact with the bassist during the bridge and meaning it.[paragraph break]Ornette said learn the changes, then forget them. He was completely right. [bracket]try the 'next' page[close bracket]";
	else if current page is 3:
		say "[bold type]PAGE 3 — Listening Notes[roman type][line break]• [italic type]Willisau Concert 1973[roman type] (import, good luck finding it) — Cecil Taylor, 47 minutes, no breaths. Sounds like architecture collapsing inward. Essential.[line break]• [italic type]Pier 34 Tape[roman type] (circulating CD-R) — Two basses, prepared guitar, traffic from FDR Drive. Recorded 2 a.m. July, sounds like humidity.[line break]• [italic type]The Köln Concert[roman type] — Everyone owns it, nobody admits they cry during Part IIc.[paragraph break]If your speakers can't reproduce a piano's lower register, you're listening to outlines. Borrow actual monitors or wait.[bracket]try the 'next' page[close bracket]";
	else if current page is 4:
		say "[bold type]PAGE 4 — Technical Information[roman type][paragraph break][italic type]Dmitri's Reed Adjustment, 555-0177[roman type][line break]Won't work on synthetic reeds. 'The cane remembers humidity; plastic remembers nothing.' Waiting list: two months.[paragraph break][italic type]Tube Amp Repair, 555-0158[roman type][line break]Brings dead Fenders back from 1964. Charges by honesty—admitted you gigged it in the rain, costs less.[paragraph break]Philosophy: Your instrument's limitations are compositional opportunities. A sticky G-sharp isn't a problem; it's a reason to avoid G-sharp.[paragraph break][bracket]try the 'next' page[close bracket]";
	else if current page is 5:
		say "[bold type]PAGE 5 — Calendar[roman type][paragraph break][italic type]Tonic, Monday[roman type] — Electroacoustic series. Last week: 40-minute feedback piece, half the room walked, other half wept. This week: who knows.[paragraph break][italic type]The Stone (when it opens)[roman type] — Zorn's new spot, invitation-only until it isn't. No drinks, no talking, no bullshit.[paragraph break][italic type]Some Williamsburg Loft[roman type] — Address via word-of-mouth. Prepared piano, analog synth, donation-based. BYOB, respect the neighbors.[paragraph break][italic type]55 Bar, Thursday[roman type] — Guitarist playing Wes lines through a cranked Deluxe Reverb. The only standards set worth attending.[paragraph break]The Voice stopped reviewing half these shows. Good. Criticism's dead anyway. [bracket]try the 'next' page[close bracket]";
	else if current page is 6:
		say "[bold type]PAGE 6 — Miscellany[roman type][paragraph break]Repair: 555-0177[line break]Amplification: 555-0158[line break]Car service (when the F stops running): 555-0129[paragraph break]• Soprano player seeking duos. Interested in Braxton, Lacy, silence. No bebop tourists.[line break]• Rehearsal space, Greenpoint. Month-to-month, no heat, G train. Bring space heater and humility.[line break]• Trading: Complete Ayler box set for working cassette four-track. Serious offers only.[paragraph break][italic type]Coda:[roman type] The tradition isn't what happened. It's what happens next, badly, in a basement, for nobody.[paragraph break] And that's the zine, baby.".

After examining the pages:
	say "[show-page]";
	if current page is 1:
		now Knows-Talls-address is true.

Flipping-next is an action applying to nothing.
Understand "yes" or "next" or "next page" or "turn page" or "flip page" or "flip" or "turn to next page" as flipping-next.
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

Every turn when the turn count is 15 and phone-rung is false:
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
	say "'It's Rena.' Not a question. The voice carries last night's cigarettes and this morning's coffee. 'Tall's. Late jam. You're coming.'";
	say "[paragraph break][bold type]1[roman type]) 'Am I? Tell me why.'[line break][bold type]2[roman type]) 'Tonight? I'm destroyed.'[line break][bold type]3[roman type]) 'Rena who?'";
	say "[paragraph break][bracket]Type 1, 2, or 3. HANG UP to end the call.[close bracket]".

Choosing is an action applying to one number.
Understand "[number]" as choosing when in-call is true.

Carry out choosing:
	if call-stage is 1:
		if the number understood is 1:
			say "'Because the rhythm section isn't garbage for once. Kenji's on bass—the guy who did that Tonic residency, actual time. Piano player came up under someone who matters. Drums are solid. Sign-up's at one but the real players show by midnight.' Pause. 'Be one of them.'";
			say "[paragraph break][bold type]1[roman type]) 'What's your angle here?'[line break][bold type]2[roman type]) 'I'm not going.'[line break][bold type]3[roman type]) 'Is this an open thing or do I need an in?'";
			now call-stage is 2;
		otherwise if the number understood is 2:
			say "'Good. Exhausted reads honest.' A lighter flicks on her end. 'One tune. Make it not embarrassing. Three people in that room book gigs. That's it. That's the math.'";
			say "[paragraph break][bold type]1[roman type]) 'One tune gets me what, exactly?'[line break][bold type]2[roman type]) 'Not interested.'[line break][bold type]3[roman type]) 'Walking into a jam cold sounds like a bad idea.'";
			now call-stage is 2;
		otherwise if the number understood is 3:
			say "'Rena. I drove you back from that warehouse thing in Red Hook. You fell asleep holding your horn case.' Dry laugh. 'Anyway. Tall's tonight. Jam. I told Kenji you don't suck. Don't make me a liar.'";
			say "[paragraph break][bold type]1[roman type]) 'Why'd you tell him that?'[line break][bold type]2[roman type]) 'Maybe. Probably not.'[line break][bold type]3[roman type]) 'I don't know their repertoire.'";
			now call-stage is 2;
		otherwise:
			say "Pick 1, 2, or 3.";
	otherwise if call-stage is 2:
		if the number understood is 1:
			say "'Because you don't sound like you're quoting anyone yet. That window closes.' Traffic noise, a siren. 'Room's small, ceiling's low, everyone's had two drinks minimum. You call a tune in Bb, play the form, don't overplay the bridge. If you listen, they remember. If you showboat, they remember differently.' Beat. 'Ludlow. Red door. Downstairs.'";
		otherwise if the number understood is 2:
			say "'Yeah you are. Play tired. Chet Baker made a career out of it.' Her voice gets an edge. 'Three minutes. In and out. Tall's cares if you improved the last eight bars, not if you're chipper about it.' Not asking anymore. 'Red door. Ludlow. Basement. Tonight.'";
		otherwise if the number understood is 3:
			say "'It's a session, not a dissertation defense. Bring a head in Bb. 'Confirmation' if you want respect, 'Autumn Leaves' if you want to actually play. State the melody, don't rush, let the bass walk. The form does the work.' A short laugh. 'Tall's. Ludlow. Red basement door. Tonight.' She already assumes you're showing.";
		otherwise:
			say "Pick 1, 2, or 3.";
			stop the action;
		now invited-to-talls is true;
		now in-call is false;
		now call-stage is 0;
		say "[paragraph break]You start to ask which block on Ludlow, is there a sign, what time exactly—click. Line goes dead. She figured you'd either know or figure it out.";
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
