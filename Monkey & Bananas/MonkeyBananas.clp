;Ingresar 1
(deftemplate mono
   (slot ubicacion)
   (slot estado))

;Ingresar 2
(defglobal ?*acciones* = (create$))

;Ingresar 3
(deffacts estado-inicial
   (mono (ubicacion cerca-de-la-puerta))
   (mono (ubicacion lejos-de-la-ventana))
   (mono (estado manos-libres)))

;Ingresar 4
(reset)

;Ingresar 5
(defrule r1
   (mono (ubicacion cerca-de-la-puerta))
   (mono (ubicacion lejos-de-la-ventana))
   =>
   (printout t "El mono va hacia la caja" crlf)
   (assert (mono (ubicacion cerca-de-la-caja)))
   (retract 1)
   (retract 2))

;Ingresar 6
(defrule r2
   (mono (ubicacion cerca-de-la-caja))
   (mono (estado manos-libres))
   =>
   (printout t "El mono tomó la caja" crlf)
   (assert (mono (estado manos-ocupadas)))
   (assert (mono (estado tomó-la-caja)))
   (retract 1)
   (retract 2))

;Ingresar 7
(defrule r3
   (mono (ubicacion cerca-de-la-caja))
   (mono (estado manos-ocupadas))
   (mono (estado tomó-la-caja))
   =>
   (printout t "El mono va debajo del plátano" crlf)
   (assert (mono (ubicacion debajo-del-plátano)))
   (retract 1)
   (retract 2)
   (retract 3))

;Ingresar 8
(defrule r4
   (mono (ubicacion debajo-del-plátano))
   =>
   (printout t "El mono sube a la caja" crlf)
   (assert (mono (ubicacion encima-de-la-caja)))
   (retract 1))

;Ingresar 9
(defrule r5
   (mono (ubicacion encima-de-la-caja))
   (mono (ubicacion debajo-del-plátano))
   =>
   (printout t "El mono salta hacia el plátano" crlf)
   (assert (mono (ubicacion salta-hacia-el-plátano)))
   (retract 1)
   (retract 2))

;Ingresar 10
(defrule r6
   (mono (ubicacion salta-hacia-el-plátano))
   =>
   (printout t "El mono tomó el plátano" crlf)
   (assert (mono (estado tiene-el-plátano)))
   (retract 1))

;Ingresar 11
(defrule r7
   (mono (estado tiene-el-plátano))
   =>
   (printout t "El mono pela el plátano" crlf)
   (assert (mono (estado pela-el-plátano)))
   (retract 1))

;Ingresar 12
(defrule r8
   (mono (estado pela-el-plátano))
   =>
   (printout t "El mono come el plátano" crlf)
   (assert (mono (estado come-el-plátano)))
   (retract 1))

;Ingresar 13
(defrule r9
   (mono (estado come-el-plátano))
   =>
   (printout t "El mono tira la cáscara del plátano" crlf)
   (assert (mono (estado tira-la-cascara)))
   (retract 1))

;Ingresar 14
(defrule r10
   (mono (estado tira-la-cascara))
   =>
   (printout t "El mono está satisfecho y se va a descansar" crlf)
   (assert (mono (estado satisfecho)))
   (retract 1))
