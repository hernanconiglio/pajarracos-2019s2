import islas.*

class Ave {
	method recibeUnDisgusto()
	method estaEnLaIsla(isla) { return isla.avesDeLaIsla().contains(self) } 
}

class Aguilucho inherits Ave {
	var property velocidad = 20
	
	method fuerza() {
		return if (velocidad <= 60) { 180 }
		else { 3 * velocidad }
	}

	override method recibeUnDisgusto() { velocidad = 80 }

	method relajate() { velocidad = 0.max(velocidad - 10) }

	method estaConforme(laIsla) { return laIsla.alpiste() >= 8 }

	method alimentarseDeIsla(isla) {
		if (self.estaEnLaIsla(isla)) { 
			isla.alpiste(0.max(isla.alpiste() - 3)) 
			velocidad += 15
		}
	} 
}

class Albatros inherits Ave {
	var property peso = 4000
	var property masaMuscular = 600
	
	method fuerza() {
		return if (peso < 6000) { masaMuscular }
		else { masaMuscular / 2 }
	}
	
	override method recibeUnDisgusto() { peso += 800 }
	
	method irAlGimnasio() { masaMuscular += 500 ; peso += 500 }
	
	method relajate() { peso = 0.max(peso - 300) }
	
	method estaConforme(laIsla) { return laIsla.avesConMasFuerza(self) <= 2 }
	
	method alimentarseDeIsla(isla) {
		if (self.estaEnLaIsla(isla)) { 
			isla.maiz(0.max(isla.alpiste() - 4)) 
			peso += 700
			masaMuscular += 700
		}
	} 	
}

object topeDeFuerza { var property valor = 2000 }

class Paloma inherits Ave {
	var property ira = 200
	
	method fuerza() { return 2 * ira }
	override method recibeUnDisgusto() { ira += 300 }
	method relajate() { ira = 0.max(ira - 50) }
	method estaConforme(laIsla) { return laIsla.avesDebiles().size() <= 1}
	method alimentarseDeIsla(isla) { /* no hace nada */}

	method equilibrarse() {
		if(self.fuerza() <= 700) { self.recibeUnDisgusto() }
		else { self.relajate() }
	}
	
}


class AguiluchoColorado inherits Aguilucho {
	
	override method fuerza() { return super() + 400 }
}

class PalomaTorcaza inherits Paloma {
	var property cantHuevos = 3
	override method fuerza() { return super() + (100 * cantHuevos) }
	override method recibeUnDisgusto() { super() ; cantHuevos += 1 }
}

class PalomaMontera inherits Paloma {
	override method fuerza() { return super().min(topeDeFuerza.valor()) }
}

class PalomaManchada inherits Paloma {
	var property nidos = #{}
	
	override method recibeUnDisgusto() { 
		super()
		nidos.add(new Nido())
	}
	
	override method relajate() {
		if (nidos.size() > 2) { nidos.forEach( { n=>n.grosor(n.grosor()+1) } ) }
		else { super() }
	}
	
	override method ira() {
		return super() + nidos.sum( { n=>n.potencia() } ) 
	}
}


class Nido {
	var property grosor = 5
	var property resistencia = 3
	
	method potencia() { return (grosor * resistencia) + 20 }
	
}