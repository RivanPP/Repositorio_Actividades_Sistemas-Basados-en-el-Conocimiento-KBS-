;Base-de-conocimientos
(assert(resfriado congestion estornudos fiebre fatiga))
(assert(gripe fiebre-alta dolores tos  dolor-de-garganta))
(assert(bronquitis tos-persistente dificultad-para-respirar sibilancias flema))
(assert(asma sibilancias-recurrentes opresion-pecho tos-nocturna respiracion-rapida))
(assert(hipertension mareos dolor-cabeza presion-arterial-alta latidos-irregulares))
(assert(diabetes sed-excesiva aumento-apetito glucosa-alta fatiga))

;Ingresar esto para antes para ejecutar las reglas
(watch facts)
(watch activations) 

;Regla para consultar Enfermedades
;Enfermedad1
(defrule enfermedad1
 (resfriado $?)
=>
 (printout t "Es la resfriado" crlf)) 

;Enfermedad2
(defrule enfermedad2
 (gripe $?)
=>
 (printout t "Es la gripe" crlf)) 

;Enfermedad3
(defrule enfermedad3
 (bronquitis $?)
=>
 (printout t "Es la bronquitis" crlf)) 

;Enfermedad4
(defrule enfermedad4
 (asma $?)
=>
 (printout t "Es la asma" crlf)) 

;Enfermedad5
(defrule enfermedad5
 (hipertension $?)
=>
 (printout t "Es la hipertension" crlf)) 

;Enfermedad6
(defrule enfermedad6
 (diabetes $?)
=>
 (printout t "Es la diabetes" crlf)) 

;Regla para consultar Signos
;Enfermedad1
(defrule mostrar-signos-e1
   (resfriado ?signo1 ?signo2 $?resto)
   =>
   (printout t "Los signos de la enfermedad son: " ?signo1 " y " ?signo2 crlf)
)

;Enfermedad2
(defrule mostrar-signos-e2
   (gripe ?signo1 ?signo2 $?resto)
   =>
   (printout t "Los signos de la enfermedad son: " ?signo1 " y " ?signo2 crlf)
)

;Enfermedad3
(defrule mostrar-signos-e3
   (bronquitis ?signo1 ?signo2 $?resto)
   =>
   (printout t "Los signos de la enfermedad son: " ?signo1 " y " ?signo2 crlf)
)

;Enfermedad4
(defrule mostrar-signos-e4
   (asma ?signo1 ?signo2 $?resto)
   =>
   (printout t "Los signos de la enfermedad son: " ?signo1 " y " ?signo2 crlf)
)

;Enfermedad5
(defrule mostrar-signos-e5
   (hipertension ?signo1 ?signo2 $?resto)
   =>
   (printout t "Los signos de la enfermedad son: " ?signo1 " y " ?signo2 crlf)
)

;Enfermedad6
(defrule mostrar-signos-e6
   (diabetes ?signo1 ?signo2 $?resto)
   =>
   (printout t "Los signos de la enfermedad son: " ?signo1 " y " ?signo2 crlf)
)


;Regla para consultar Sintomas
;Enfermedad1
(defrule mostrar-sintoma-e1
   (resfriado $?resto ?sintoma1 ?sintoma2)
   =>
   (printout t "Los signos de la enfermedad son: " ?sintoma1 " y " ?sintoma2 crlf)
)

;Enfermedad2
(defrule mostrar-sintoma-e2
   (gripe $?resto ?sintoma1 ?sintoma2)
   =>
   (printout t "Los signos de la enfermedad son: " ?sintoma1 " y " ?sintoma2 crlf)
)

;Enfermedad3
(defrule mostrar-sintoma-e3
   (bronquitis $?resto ?sintoma1 ?sintoma2)
   =>
   (printout t "Los signos de la enfermedad son: " ?sintoma1 " y " ?sintoma2 crlf)
)

;Enfermedad4
(defrule mostrar-sintoma-e4
   (asma $?resto ?sintoma1 ?sintoma2)
   =>
   (printout t "Los signos de la enfermedad son: " ?sintoma1 " y " ?sintoma2 crlf)
)

;Enfermedad5
(defrule mostrar-sintoma-e5
   (hipertension $?resto ?sintoma1 ?sintoma2)
   =>
   (printout t "Los signos de la enfermedad son: " ?sintoma1 " y " ?sintoma2 crlf)
)

;Enfermedad6
(defrule mostrar-sintoma-e6
   (diabetes $?resto ?sintoma1 ?sintoma2)
   =>
   (printout t "Los signos de la enfermedad son: " ?sintoma1 " y " ?sintoma2 crlf)
)


;Eliminar por identificador
;Enfermedad1
(defrule retractar-enfermedad1
  ?enfermedad <- (resfriado $?)
  =>
  (retract ?enfermedad)
)

;Enfermedad2
(defrule retractar-enfermedad2
  ?enfermedad <- (gripe $?)
  =>
  (retract ?enfermedad)
)

;Enfermedad3
(defrule retractar-enfermedad3
  ?enfermedad <- (bronquitis $?)
  =>
  (retract ?enfermedad)
)

;Enfermedad4
(defrule retractar-enfermedad4
  ?enfermedad <- (asma $?)
  =>
  (retract ?enfermedad)
)

;Enfermedad5
(defrule retractar-enfermedad5
  ?enfermedad <- (hipertension $?)
  =>
  (retract ?enfermedad)
)

;Enfermedad6
(defrule retractar-enfermedad6
  ?enfermedad <- (diabetes $?)
  =>
  (retract ?enfermedad)
)