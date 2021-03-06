object knightRider {
	method peso() = 500
	method peligrosidad() = 10
}

object bumblebee {
	var esRobot = true
	
	method peso() = 800
	
	method peligrosidad() = if (esRobot) {30} else {15}
	
	method transformar() { esRobot = not esRobot }	
}

object paqueteLadrillos{
	var property cantidadLadrillos = 0
	
	method peso() = cantidadLadrillos * 2
	
	method peligrosidad() = 2
}


object arena {
	var property peso = 0
	
	method peligrosidad() = 1
}

object bateriaAntiaerea {
	var property estaConMisiles = false
	
	method peso() = if (estaConMisiles) {300} else {200}
	
	method peligrosidad() = if (estaConMisiles) {100} else {0}
	
	method cargarMisiles() { estaConMisiles = true }
	
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
}

object residuosRadioactivos {
	var property peso = 0
	
	method peligrosidad() = 200
}

object embalajeSeguridad {
	var property cosaQueEnvuelve
	
	method peso() = cosaQueEnvuelve.peso()
	
	method peligrosidad() = cosaQueEnvuelve.peligrosidad() / 2
	
}


