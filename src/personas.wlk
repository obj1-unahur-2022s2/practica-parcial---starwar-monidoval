import planetas.*


class Persona{
	var property edad
	
	
	
	method inteligencia(){return
		if(self.edad().between(20, 40)) {12}
		else {8}
	}
	method potencia(){return 20}
	method esDestacada(){return
		self.edad() == 25 or self.edad() == 35
	}
	method ofrecerTributo(planeta){}
	method valor(){return
		self.potencia() + self.inteligencia()
	}	
}

class Atleta inherits Persona{
	var masaMuscular=  4
	var property cantidadDeTecnicas = 2
	
	override method potencia(){return
		super() + (masaMuscular * cantidadDeTecnicas)
	}
	override method esDestacada(){return
		super() or (cantidadDeTecnicas > 5)
	}
	method entrenar(cantidadDeDias){
		masaMuscular += cantidadDeDias.div(5)
	}
	method aprenderUnaTecnica(){
		cantidadDeTecnicas ++
	}
	override method ofrecerTributo(planeta){
		planeta.construirMurallas(2)
		
	}
}

class Docente inherits Persona{
	var cantidadDeCursosDados = 0
	
	override method inteligencia(){return
		super() + (cantidadDeCursosDados * 2)		
	}
	override method esDestacada(){ return
		cantidadDeCursosDados > 3
	}
	override method ofrecerTributo(planeta){
		planeta.fundarUnMuseo()
	}
	override method valor(){ return
		super() + 5
	}	
}

class Soldado inherits Persona{
	var armas = []
	
	override method potencia(){return
		super() + (armas.sum({a => a. potenciaOtorgada(self)}))
	}
	override method ofrecerTributo(planeta){
		planeta.construirMurallas(5)
	}
}

class Pistolete{
	const property largo
	
	method potenciaOtorgada(soldado){return
		if (soldado.edad() > 30) {largo * 3}
		else {largo * 2}
	}
}
class Espadon{
	const property peso
	
	method potenciaOtorgada(soldado){return
		if (soldado.edad() < 40) {peso / 2}
		else {6}
	}
}	

