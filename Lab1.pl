%Profesiones
agente(leon).
estudiante(ashley).
espia(ada).
investigador(luis).

% Edades
edad(leon, 27).
edad(ashley, 20).
edad(ada, 26).
edad(luis, 32).

% Armas
arma(leon, pistola).
arma(leon, cuchillo).
arma(ada, pistola).
arma(luis, cuchillo).

% Tipos de arma
tipo_arma(pistola, fuego).
tipo_arma(cuchillo, blanca).

% Ubicacion de los personajes
ubicacion(leon, pueblo).
ubicacion(luis, pueblo).
ubicacion(ada, pueblo).
ubicacion(ada, castillo).

% Enemigos y su causa de infeccion
enemigo(ganados).
enemigo(regeneradores).
infectado_por(ganados, las_plagas).
infectado_por(regeneradores, las_plagas).

% Ubicacion en la que aparece cada enemigo
ubicacion(ganados, pueblo).
ubicacion(ganados, castillo).
ubicacion(regeneradores, isla).

% Dificultades
dificultad(pueblo, alta).
dificultad(castillo, alta).
dificultad(isla, muy_alta).

% Reglas

% Regla para definir quién cuenta como personaje de la historia apartir de su rol
persona(P) :-
    agente(P);
    estudiante(P);
    espia(P);
    investigador(P).

% Regla para determinar los personajes que cuentan con un arma de
% fuego
armado_a_distancia(P) :-
    persona(P),
    arma(P, A),
    tipo_arma(A, fuego).

% Regla para identificar personajes que llevan tanto pistola como
% cuchillo
bien_equipado(P) :-
    persona(P),
    arma(P, pistola),
    arma(P, cuchillo).

% Regla para determinar que personajes están en una zona de dificultad
% alta O muy alta
en_peligro_alto(P) :-
    persona(P),
    ubicacion(P, Lugar),
    dificultad(Lugar, D),
    (D == alta ; D == muy_alta).

% Regla para clasificar como veterano a todo personaje mayor o igual
% a 27 años
veterano(P) :-
    persona(P),
    edad(P, E),
    E >= 27.

% Regla para determinar que personaje se puede encontrar con que
% enemigo
enfrenta_enemigo(P, En) :-
    persona(P),
    enemigo(En),
    ubicacion(P, Lugar),
    ubicacion(En, Lugar).

% Regla 6 para detectar personajes vulnerables: estan en una zona de
% dificultad muy alta o no portan ningun arma de fuego
necesita_refuerzo(P) :-
    persona(P),
    ubicacion(P, Lugar),
    dificultad(Lugar, D),
    (D == muy_alta ;
    \+ armado_a_distancia(P)).

