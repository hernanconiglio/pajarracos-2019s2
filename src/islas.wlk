import aves.*

class Isla {
	var property avesDeLaIsla = #{}
	var property alpiste = 10
	var property maiz = 10
		
	method avesDebiles() { return avesDeLaIsla.filter( { a=>a.fuerza() < 1000 } ) }
	method agregarAves(listaDeAves) { avesDeLaIsla.addAll(listaDeAves) }
	method fuerzaTotal() { return avesDeLaIsla.sum( { a=>a.fuerza()} ) }
	method esRobusta() { return avesDeLaIsla.all( { a=>a.fuerza() > 300 } ) }
	method terremoto() { avesDeLaIsla.forEach( { a=>a.recibeUnDisgusto() } ) }
	method tormenta() { self.avesDebiles().forEach( { a=>a.recibeUnDisgusto() } ) }
	
	method avesCasiCapitanas() { return avesDeLaIsla.filter( { a=>a.fuerza().between(1000,3000) } ) }
	method aveCapitana() { return self.avesCasiCapitanas().max( { a=>a.fuerza() } ) }
	method sesionRelax() { avesDeLaIsla.forEach( { a=>a.relajate() } ) }
	method avesConMasFuerza(ave) { return avesDeLaIsla.count( { a=>a.fuerza() > ave.fuerza() } ) }
	method estaEnPaz() { return avesDeLaIsla.all( { a=>a.estaConforme() } ) }
}
