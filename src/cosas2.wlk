object knightRider {
	method peso() = 500
	
	method peligrosidad() = 10
	
	method totalBultos() = 1
	
	method sufrirConsecuencia() {}
}

object bumblebee {
	var esRobot = true
	
	method esRobot() = esRobot
	
	method peso() = 800
	
	method peligrosidad() = if (esRobot) {30} else {15}
	
	method transformar() { esRobot = not esRobot }	
	
	method totalBultos() = 2
	
	method sufrirConsecuencia() { esRobot = true }
}

object paqueteLadrillos{
	var property cantidadLadrillos = 0
	
	method peso() = cantidadLadrillos * 2
	
	method peligrosidad() = 2
	
	method totalBultos() { 
		var bultos = 0
		
		if (cantidadLadrillos <= 100) {bultos = 1} 
		if (cantidadLadrillos.between(101,300)) {bultos = 2}
		if (cantidadLadrillos >= 301) {bultos = 3}
		
		return bultos
		}
		
	method sufrirConsecuencia() { cantidadLadrillos += 12 }
}


object arena {
	var property peso = 0
	
	method peligrosidad() = 1
	
	method totalBultos() = 1
	
	method sufrirConsecuencia() { peso += 20 }
}

object bateriaAntiaerea {
	var property estaConMisiles = false
	
	method peso() = if (estaConMisiles) {300} else {200}
	
	method peligrosidad() = if (estaConMisiles) {100} else {0}
	
	method cargarMisiles() { estaConMisiles = true }
	
	method totalBultos() { 
		var totalBultos = 0
		
		if (estaConMisiles == true) {totalBultos = 2} 
		else {totalBultos = 1}
		
		return totalBultos
		}
		
	method sufrirConsecuencia() { self.cargarMisiles() }
}

object contenedor {
	var cosasDentro = []
	
	method meterCosa(unaCosa) {
		cosasDentro.add(unaCosa)
	}
	
	method sacarCosa(unaCosa) {
		cosasDentro.remove(unaCosa)
	}
	
	method peso() = 100 + cosasDentro.sum({ c => c.peso() })
	
	method peligrosidad() =
		if (cosasDentro.isEmpty()) {0}
		else {cosasDentro.max({ c => c.peligrosidad() }).peligrosidad()}

	method totalBultos() = 1 + cosasDentro.sum({ c => c.totalBultos() })
	
	method sufrirConsecuencia() {
		cosasDentro.forEach({ c => c.sufrirConsecuencia() })
	}
}

object residuosRadioactivos {
	var property peso = 0
	
	method peligrosidad() = 200
	
	method totalBultos() = 1
	
	method sufrirConsecuencia() {peso += 15}
}

object embalajeSeguridad {
	var property cosaQueEnvuelve
	
	method peso() = cosaQueEnvuelve.peso()
	
	method peligrosidad() = cosaQueEnvuelve.peligrosidad() / 2
	
	method totalBultos() = 2
	
	method sufrirConsecuencia() {}
}
