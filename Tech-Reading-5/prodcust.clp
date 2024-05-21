
;load-prod-cust.clp Corregido

;;Defining a template for representing/modelling products in Jess Working Memory

(deftemplate product
  (slot part-number)
  (slot name)
  (slot category)
  (slot price)
)

;;Storing five products (or five Facts) in Jess Working Memory via deffacts function 

(deffacts products 
        (product (name USBMemory) (category storage) (part-number 1234) (price 9.99))
        (product (name Amplifier) (category electronics) (part-number 2341) (price 399.99))
        (product (name Speakers) (category electronics) (part-number 23241) (price 19.99))
        (product (name iPhone7) (category smartphone) (part-number 3412) (price 99.99))
        (product (name SamsungEdge7) (category smartphone) (part-number 34412) (price 88.99))
)

;;Defining a template for representing/modelling cutomers in Jess Working Memory

(deftemplate customer
  (slot customer-id)
  (multislot name)
  (multislot address)
)

;;Storing three customers (or three Facts) in Jess Working Memory via deffacts function 

(deffacts customers
  (customer (customer-id 101) (name joe smith) (address bla bla bla))
  (customer (customer-id 102) (name mary) (address bla bla bla))
  (customer (customer-id 103) (name bob) (address bla bla bla))
)

;load-prodcust-rules.clp


;; Defining a rule for finding customer names and printing such names
(defrule my-rule11
   (customer (name ?n)) => (printout t "Customer name found:" ?n  crlf ))

;; Defining a rule for finding a customer's data via their customer-id
;; you can replace the customer-id 101 with either 102 or 103 (see deffacts customers)
(defrule my-rule12
   ?c <- (customer (customer-id 101) (name ?name) (address ?address))
   =>
   (printout t "customer-id 101 belongs to:: " ?name " with address:: " ?address crlf))


;;Defining a rule for finding "electronic products"
(defrule my-rule13
   (product (category electronics) (name ?name))
   =>
   (printout t "Electronic product found: " ?name crlf))


;; Defining a rule for finding smartphones cheaper than 50 dlls
;; note the use of NOT, if Jess does not find a match for a given pattern then the rule returns a FALSE
;; however you can use NOT for making the rule to return true

(defrule my-rule14
   (not (product (category smartphone) (price ?p&:(< ?p 50)) (name ?n)))
   =>
   (printout t "no smartphones cheaper than 50" crlf))


;; Defining a rule for finding smartphones cheaper than 100 dlls
(defrule my-rule15
   (product (category smartphone) (price ?p&:(< ?p 100)) (name ?n))
   =>
   (printout t ?n " is cheaper than 100 dlls" crlf))

;run-prodcust.clp corregido
;;Guardar
(save "/Users/Ivan/OneDrive/Desktop/prodcust")

;;Cargar
(load "/Users/Ivan/OneDrive/Desktop/prodcust")



