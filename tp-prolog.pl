windows(X) :- satisface('que corra en Windows',X).
macos(X) :- satisface('que corra en Mac OS X',X).
linux(X) :- satisface('que corra en GNU/Linux',X).
multiplataforma(X) :- windows(X); macos(X); linux(X).

multiplayer(X) :- satisface('que sea multijugador',X).
singleplayer(X) :- not(multiplayer(X)).

fps(X) :- satisface('de tipo FPS',X).
accion(X) :- satisface('de acción',X).
shooter(X) :- satisface('de tipo shooter',X).
estrategia(X) :- satisface('de estrategia',X).
simulacion(X) :- satisface('de simulación',X).


csgo(X) :- multiplataforma(X), multiplayer(X), fps(X), accion(X), shooter(X).
gta5(X) :- windows(X), multiplayer(X), accion(X).
dota2(X) :- multiplataforma(X), multiplayer(X), estrategia(X).
garrys_mod(X) :- multiplataforma(X), multiplayer(X), simulacion(X).
cities_skyline(X) :- multiplataforma(X), singleplayer(X), estrategia(X), simulacion(X).
sims3(X) :- windows(X), singleplayer(X), simulacion(X).
goat_simulator(X) :- multiplataforma(X), singleplayer(X), simulacion(X).
tf2(X) :- multiplataforma(X), multiplayer(X), fps(X), accion(X), shooter(X), estrategia(X).
hl2(X) :- multiplataforma(X), singleplayer(X), fps(X), accion(X).
dirt3(X) :- (windows(X); macos(X)), multiplayer(X), simulacion(X).
football_manager(X)  :- multiplataforma(X), multiplayer(X), simulacion(X).
portal2(X) :- multiplataforma(X), multiplayer(X), estrategia(X).
dying_light(X) :- (windows(X); linux(X)), multiplayer(X), accion(X).
kerbal_space_program(X) :- multiplataforma(X), singleplayer(X), simulacion(X).
l4d2(X) :- multiplataforma(X), multiplayer(X), fps(X), accion(X), shooter(X).
worms_armaggedon(X) :- windows(X), multiplayer(X), estrategia(X).

:- dynamic si/1,no/1.
satisface(Atributo,_) :-
(
	si(Atributo) -> true ;
	(
		no(Atributo) -> fail ;
		pregunta(Atributo)
	)
).

pregunta(A) :-
	write('¿Te interesa un juego '), write(A), write('? '), read(Resp), nl,
	(
		(Resp == 's' ; Resp == 'si' ; Resp == 'sí') -> assert(si(A));
		assert(no(A)
	), fail).

borraResp :- retract(si(_)), fail.
borraResp :- retract(no(_)), fail.
borraResp.

juego :- adivina(Juego,_), write('Te recomendamos jugar: '), write(Juego), nl, borraResp.

adivina('Counter Strike: Global Offensive',X) :- csgo(X), !.
adivina('Grand Theft Auto: V',X) :- gta5(X), !.
adivina('DOTA 2',X) :- dota2(X), !.
adivina('Garry\'s Mod',X) :- garrys_mod(X), !.
adivina('Cities Skyline',X) :- cities_skyline(X), !.
adivina('The Sims 3',X) :- sims3(X), !.
adivina('Goat Simulator',X) :- goat_simulator(X), !.
adivina('Team Fortress 2',X) :- tf2(X), !.
adivina('Half-Life 2',X) :- hl2(X), !.
adivina('DiRT 3',X) :- dirt3(X), !.
adivina('Football Manager',X) :- football_manager(X), !.
adivina('Portal 2',X) :- portal2(X), !.
adivina('Dying Light',X) :- dying_light(X), !.
adivina('Kerbal Space Program',X) :- kerbal_space_program(X), !.
adivina('Left 4 Dead 2',X) :- l4d2(X), !.
adivina('Worms: Armaggedon',X) :- worms_armaggedon(X), !.
adivina('no sabemos :(',_).
