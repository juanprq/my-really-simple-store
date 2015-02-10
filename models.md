Models for the application
===

Admin
---
	
	* email:string
	* name:string
	* identification:string validation only digits
	* cellphone:string validation only digits
	* createdAt
	* updatedAt

Client
---

	* name:string
	* identification:string
	* points:integer (podria ser calculado), ya que puede tener reglas de negocio asociada al vencimiento de puntos
	* invoices -* Invoice
	* createdAt
	* updatedAt

Product
---

	* name:string
	* barcode:string
	* price:decimal
	* points:integer
	* stock:integer
	* photo:Image
	* createdAt
	* updatedAt

Invoice
---

	* admin:Admin
	* client:Client
	* total:decimal
	* customs(?):decimal o una regla de como calcular el impuesto si es que se debe sacar
	* invoiceDetails -* InvoiceDetail
	* createdAt
	* updatedAt

InvoiceDetail
---

	* quantity:integer > 0
	* price:decimal (calculado) cantidad por precio en producto pero se persiste
	* points:integer (calculado) cantidad por puntos en producto pero se persiste
	* product:Product
	* createdAt
	* updatedAt