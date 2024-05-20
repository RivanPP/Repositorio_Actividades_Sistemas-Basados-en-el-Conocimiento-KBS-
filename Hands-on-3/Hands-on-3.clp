;Arbol de decision convertido a reglas
(clear)

(deftemplate rule
   (multislot sintomas-signos)
   (slot enfermedad))

(deffacts info
   (rule (sintomas-signos congestion estornudos fiebre fatiga) (enfermedad resfriado))
   (rule (sintomas-signos fiebre-alta dolores tos dolor-de-garganta) (enfermedad gripe))
   (rule (sintomas-signos tos-persistente dificultad-para-respirar sibilancias flema) (enfermedad bronquitis))
   (rule (sintomas-signos sibilancias-recurrentes opresion-pecho tos-nocturna respiracion-rapida) (enfermedad asma))
   (rule (sintomas-signos mareos dolor-cabeza presion-arterial-alta latidos-irregulares) (enfermedad hipertension))
   (rule (sintomas-signos sed-excesiva aumento-apetito glucosa-alta fatiga) (enfermedad diabetes)))

(defrule reading-input
   =>
   (printout t "Ingresa tu signo o sintoma: " )
   (assert (sintomas-signos (explode$ (readline)))))
 
(defrule checking-input
   (sintomas-signos $? ?sintomas-signos $?)
   (rule (sintomas-signos $? ?sintomas-signos $?) (enfermedad ?enfermedad))
   =>
   (printout t "sintomas o signos: " ?sintomas-signos " Enfermedad: " ?enfermedad crlf))

(reset)
(run)

