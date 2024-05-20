;Ingresar 1
(deftemplate Smartphone
    (slot marca)
    (slot modelo)
    (slot color)
    (slot precio)
)

;Ingresar 2
(deftemplate OrdenCompra
    (multislot productos)
    (multislot metodoPago)    
)

;Ingresar 3
(deftemplate TarjetaCredito
    (slot banco)
    (slot grupo)
    (slot fechaExpiracion)
)

;Ingresar 4
(deftemplate Computador
    (slot marca)
    (slot modelo)
    (slot color)
    (slot precio)
)

;Ingresar 5
(deftemplate Vale
    (slot valor)
)

;Ingresar 6
(deftemplate Accesorio
    (slot tipo)    
    (slot precio)
)

;Ingresar 7
(deftemplate Cliente
    (slot nombre)
    (slot producto)
    (slot tipo) ; Menudista o Mayorista
)


;Ingresar Hechos
(deffacts Hechos    
    (Smartphone (marca Apple) (modelo iPhone15) (color rojo) (precio 17000))
    (Smartphone (marca Samsung) (modelo Note12) (color negro) (precio 15000))
    (TarjetaCredito (banco BBVA) (grupo VISA) (fechaExpiracion 011223))
    (TarjetaCredito (banco Liverpool) (grupo VISA) (fechaExpiracion 011224))
    (OrdenCompra (productos smartphone Apple iPhone15 rojo)(metodoPago BBVA VISA))
    (Computador (marca Apple) (modelo Air) (color gris) (precio 35000))
    (OrdenCompra (productos computador Apple Air gris smartphone Apple iPhone15 rojo)(metodoPago BBVA VISA))   
    (Cliente (nombre Alex)(producto smartphone)(tipo Menudista))
    (Cliente (nombre Dani)(producto computador)(tipo Menudista))
    (Cliente (nombre Johana)(producto accesorio)(tipo Mayorista))
    (Cliente (nombre Pedro)(producto smartphone)(tipo Mayorista))
    (Vale (valor 100))
    (Accesorio (tipo Mica)(precio 350))    
)

;Ingresar
(reset)

;oferta iPhone15
(defrule ofertaiPhone15
    (Smartphone (marca Apple) (modelo iPhone15) (color rojo) (precio 17000))
    (TarjetaCredito (banco BBVA) (grupo VISA) (fechaExpiracion 011223))
    (OrdenCompra (productos smartphone Apple iPhone15 rojo)(metodoPago BBVA VISA))
    =>
    (printout t "Oferta: 24 meses sin intereses en la compra de iPhone15" crlf)
)

;oferta Samsung
(defrule ofertaSamsung
    (Smartphone (marca Samsung) (modelo Note12) (color negro) (precio 15000))
    (TarjetaCredito (banco Liverpool) (grupo VISA) (fechaExpiracion 011224))       
    =>
    (printout t "Oferta: 12 meses sin intereses" crlf)
)

;oferta MacBookAir
(defrule ofertaMacBookAir
    (Smartphone (marca Apple) (modelo iPhone15) (color rojo) (precio 17000))
    (Computador (marca Apple) (modelo Air) (color gris) (precio 35000))    
    (OrdenCompra (productos computador Apple Air gris smartphone Apple iPhone15 rojo)(metodoPago BBVA VISA))
    =>
    (printout t "Oferta: 100 pesos en vale por cada 1000 pesos de compras" crlf)
)
 
;Ofersta de Smartphone
(defrule ofertaSmartphone
    (OrdenCompra (productos smartphone $?)(metodoPago $?))  
    =>
    (printout t "Oferta: Funda y Mica con 15 porciento de descuento" crlf)
) 

;segmentar Clientes por Consumo de Smartphone
(defrule segmentarClientesConsumoSmartphone
    (Cliente (nombre ?nombre) (producto smartphone) (tipo ?tipo))
    =>
    (printout t "El cliente " ?nombre " consumió productos de tipo smartphone." crlf))

;segmentar Clientes por Consumo de Computador
(defrule segmentarClientesConsumoComputador
    (Cliente (nombre ?nombre) (producto computador) (tipo ?tipo))
    =>
    (printout t "El cliente " ?nombre " consumió productos de tipo computador." crlf))

;segmentar Clientes en Consumo de Accesorios
(defrule segmentarClientesConsumoAccesorio
    (Cliente (nombre ?nombre) (producto accesorio) (tipo ?tipo))
    =>
    (printout t "El cliente " ?nombre " consumió productos de tipo accesorio." crlf))

;segmentar Clientes en Menudistas
(defrule segmentarClientesMenudistas
    (Cliente (nombre ?nombre)(producto $producto)(tipo Menudista))
    =>
    (printout t "El cliente " ?nombre " es un menudista" crlf)
)

;Segmentar clientes en mayoristas
(defrule segmentarClientesMayoristas
    (Cliente (nombre ?nombre)(producto $producto)(tipo Mayorista))
    =>
    (printout t "El cliente " ?nombre " es un mayorista" crlf)
)

;Compra smartphoneApple
(defrule CompraSmartphoneApple
    (Smartphone (marca Apple) (modelo iPhone15) (color rojo) (precio 17000))
    =>
    (assert (Cliente (nombre Omar)(producto smartphone)(tipo Menudista)))
)

;Compra smartphoneSamsung
(defrule CompraSmartphoneSamsung
    (Smartphone (marca Samsung) (modelo Note12) (color negro) (precio 15000))
    =>
    (assert (Cliente (nombre Dante)(producto smartphone)(tipo Menudista)))
)


;Compra accesorio
(defrule CompraAccesorio
    (Accesorio (tipo Mica)(precio 350))  
    =>
    (assert (Cliente (nombre Virgilio)(producto accesorio)(tipo Menudista)))
)

;Productos color rojo
(defrule ProductosColorRojo
    (Smartphone (marca ?marca) (modelo ?modelo) (color rojo) (precio ?precio))
    =>
    (printout t "Estos productos son color rojo: " ?modelo crlf)
)

;Productos color gris
(defrule ProductosColorCris
    (Computador (marca ?marca) (modelo ?modelo) (color gris) (precio ?precio)) 
    =>
    (printout t "Estos productos son color gris: " ?modelo crlf)
)

;Productos color negro 
(defrule ProductosColorNegro 
    (Smartphone (marca ?marca) (modelo ?modelo) (color negro) (precio ?precio))
    =>
    (printout t "Estos productos son color negro: " ?modelo crlf)
)

;vale de 100
(defrule valeDe100
    (Vale (valor 100))
    =>
    (printout t "Este vale tiene un valor de 100" crlf)
)

;PrecioMica
(defrule PrecioMica
    (Accesorio (tipo Mica)(precio ?precio))
    =>
    (printout t "Este es el precio de la mica:" ?precio crlf)
)

;Color del iphone15
(defrule ColorDelIphone15
    (Smartphone (marca Apple) (modelo iPhone15) (color ?color) (precio 17000))
    =>
    (printout t "Este es el color del iphone:" ?color crlf)
)

;Color del Note12
(defrule ColorDelNote12
    (Smartphone (marca Samsung) (modelo Note12) (color ?color) (precio 15000))
    =>
    (printout t "Este es el color del Note 12:" ?color crlf)
)

;Color del Air
(defrule ColorDelAir
    (Computador (marca Apple) (modelo Air) (color ?color) (precio 35000))
    =>
    (printout t "Este es el color del Air:" ?color crlf)
)

;Precio del iphone15
(defrule PrecioDelIphone15
    (Smartphone (marca Apple) (modelo iPhone15) (color rojo) (precio ?precio))
    =>
    (printout t "Este es el precio del Iphone15:" ?precio crlf)
)

;Precio del Note12
(defrule PrecioDelNote12
    (Smartphone (marca Samsung) (modelo Note12) (color negro) (precio ?precio))
    =>
    (printout t "Este es el precio del Note 12:" ?precio crlf)
)

;Precio del Air
(defrule PrecioDelAir
    (Computador (marca Apple) (modelo Air) (color gris) (precio ?precio))
    =>
    (printout t "Este es el precio de la Air:" ?precio crlf)
)

;Productos marca apple
(defrule ProductosMarcaApple
    (Smartphone (marca Apple) (modelo ?modelo) (color rojo) (precio 17000))
    (Computador (marca Apple) (modelo ?modelo) (color gris) (precio 35000))
    =>
    (printout t "Estos son los productos marca apple:" ?modelo crlf)
)

;Productos marca samsung
(defrule ProductosMarcaSamsung
    (Smartphone (marca Samsung) (modelo ?modelo) (color negro) (precio 15000))
    =>
    (printout t "Estos son los productos marca Samsung:" ?modelo crlf)
)

;Ejecutar reglas
(run)



