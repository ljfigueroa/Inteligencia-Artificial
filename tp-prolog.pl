windows(X) :- satisface(para_windows,X).
macos(X) :- satisface(para_macos,X).
linux(X) :- satisface(para_linux,X).
multiplataforma(X) :- windows(X); macos(X); linux(X).

multiplayer(X) :- satisface(es_multiplayer,X).
singleplayer(X) :- satisface(es_singleplayer,X).

fps(X) :- satisface(tipo_fps,X).
accion(X) :- satisface(tipo_accion,X).
shooter(X) :- satisface(tipo_shooter,X).
estrategia(X) :- satisface(tipo_estrategia,X).
simulacion(X) :- satisface(tipo_simulacion,X).


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
	write('¿Te interesa este atributo?: '), write(A), write(' '), read(Resp), nl,
	(
		(Resp == 's' ; Resp == 'si' ; Resp == 'sí') -> assert(si(A));
		assert(no(A)
	), fail).

borraResp :- retract(si(_)), fail.
borraResp :- retract(no(_)), fail.
borraResp.

juego :- adivina(Juego,_), write('Te recomendamos jugar: '), write(Juego), nl, borraResp.

adivina(csgo,X) :- csgo(X).
adivina(gta5,X) :- gta5(X).
adivina(dota2,X) :- dota2(X).
adivina(garrys_mod,X) :- garrys_mod(X).
adivina(cities_skyline,X) :- cities_skyline(X).
adivina(sims3,X) :- sims3(X).
adivina(goat_simulator,X) :- goat_simulator(X).
adivina(tf2,X) :- tf2(X).
adivina(hl2,X) :- hl2(X).
adivina(dirt3,X) :- dirt3(X).
adivina(football_manager,X) :- football_manager(X).
adivina(portal2,X) :- portal2(X).
adivina(dying_light,X) :- dying_light(X).
adivina(kerbal_space_program,X) :- kerbal_space_program(X).
adivina(l4d2,X) :- l4d2(X).
adivina(worms_armaggedon,X) :- worms_armaggedon(X).
adivina(no_sabemos,_).
