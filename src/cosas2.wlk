/*
 * cosas2: Bien. Solo detalles que te los dejé indicados en el código, sobre todo
 * lo referente a utilizar variables innecesarias.
 */

object knightRider {
	/* Bien! */
	method peso() = 500
	
	method peligrosidad() = 10
	
	method totalBultos() = 1
	
	method sufrirConsecuencia() {}
}

object bumblebee {
	/* Bien. esRobot podría haber sido una var property para ahorrarte de escribir
	 * los métodos esRobot() y transformar().
	 */
	var esRobot = true
	
	method esRobot() = esRobot
	
	method peso() = 800
	
	method peligrosidad() = if (esRobot) {30} else {15}
	
	method transformar() { esRobot = not esRobot }	
	
	method totalBultos() = 2
	
	method sufrirConsecuencia() { esRobot = true }
}

object paqueteLadrillos{
	/* Bien! */
	var property cantidadLadrillos = 0
	
	method peso() = cantidadLadrillos * 2
	
	method peligrosidad() = 2
	
	method totalBultos() =
		/* Bien. No hacía falta usar una variable para resolver este método.
		 * Te dejo como sería esa solución:
		 */
		if (cantidadLadrillos <= 100) {1} 
		else if (cantidadLadrillos.between(101,300)) {2}
		else {3}
		
	method sufrirConsecuencia() { cantidadLadrillos += 12 }
}


object arena {
	/* Bien! */
	var property peso = 0
	
	method peligrosidad() = 1
	
	method totalBultos() = 1
	
	method sufrirConsecuencia() { peso += 20 }
}

object bateriaAntiaerea {
	/* Bien. El método cargarMisiles() estaría de más si ya tenés definida la
	 * var property estaConMisiles, porque queda implícito el setter estaConMisiles(valor)
	 */
	var property estaConMisiles = false
	
	method peso() = if (estaConMisiles) {300} else {200}
	
	method peligrosidad() = if (estaConMisiles) {100} else {0}
	
	method cargarMisiles() { estaConMisiles = true }
	
	method totalBultos() { return
		/* Bien. No hacía falta usar una variable para resolver este método.
		 * Te dejo como sería esa solución:
		 */		
		if (estaConMisiles) {2} 
		else {1}
	}
		
	method sufrirConsecuencia() { self.cargarMisiles() }
}

object contenedor {
	/* Bien.  La lista de cosasDentro podría ser una constante si siempre va a apuntar
	 * a la misma lista que agregará, quitará, vaciará cosas. Si nunca será apuntada 
	 * esa referencia a otra lista, entonces conviene que sea una constante. */
	const cosasDentro = []
	
	method meterCosa(unaCosa) {
		cosasDentro.add(unaCosa)
	}
	
	method sacarCosa(unaCosa) {
		cosasDentro.remove(unaCosa)
	}
	
	method peso() = 100 + cosasDentro.sum({ c => c.peso() }) /* es correcto, pero hubiese
	 * quedado mejor si usabas un método auxiliar que fuera pesoCosasDentro() que calculara
	 * la suma y a ese resultado sumarle 100 
	 */
	
	method peligrosidad() =
		if (cosasDentro.isEmpty()) {0}
		else {cosasDentro.max({ c => c.peligrosidad() }).peligrosidad()} /* es correcto, pero hubiese
	 * quedado mejor si usabas un método auxiliar que fuera objetoContenidoMasPeligroso() que retornara
	 * el objeto de mayor peligrosidad de la colección y luego a ese pedirle la peligrosidad()  
	 * */

	method totalBultos() = 1 + cosasDentro.sum({ c => c.totalBultos() })
	
	method sufrirConsecuencia() {
		cosasDentro.forEach({ c => c.sufrirConsecuencia() })
	}
}

object residuosRadioactivos {
	/* Bien! */
	var property peso = 0
	
	method peligrosidad() = 200
	
	method totalBultos() = 1
	
	method sufrirConsecuencia() {peso += 15}
}

object embalajeSeguridad {
	/* Bien! */
	var property cosaQueEnvuelve
	
	method peso() = cosaQueEnvuelve.peso()
	
	method peligrosidad() = cosaQueEnvuelve.peligrosidad() / 2
	
	method totalBultos() = 2
	
	method sufrirConsecuencia() {}
}
