import cosas2.*

object camion {
	var property cosas = []
	const property tara = 1000
	
	method cargar(cosa) {
		cosas.add(cosa)
		cosa.sufrirConsecuencia()
	}
	
	method descargar(cosa) {
		cosas.remove(cosa)
	}
	
	method todoPesoPar() = cosas.all({ c => c.peso().even() })

	
	method hayAlgunoQuePesa(peso) = cosas.any({ c => c.peso() == peso})
	
	method elDeNivel(nivel) = cosas.find({ c => c.peligrosidad() == nivel})
	
	method pesoTotal() = cosas.sum({ c => c.peso() }) + tara
	
	method excedidoDePeso() = self.pesoTotal() > 2500
	
	method objetosQueSuperanPeligrosidad(nivel) = cosas.filter({ c => c.peligrosidad() > nivel})
	
	method objetosMasPeligrososQue(cosa) = self.objetosQueSuperanPeligrosidad(cosa.peligrosidad())
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) = not self.excedidoDePeso() and 
														  self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty()

	method tieneAlgoQuePesaEntre(min, max) = cosas.any({ c => c.peso().between(min, max) })
	
	method cosaMasPesada() = cosas.max({ c => c.peso() })
	
	method pesos() = cosas.map({ c => c.peso() })
}
