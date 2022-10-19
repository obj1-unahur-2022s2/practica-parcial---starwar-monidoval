import personas.*


class Planeta {
	const habitantes = #{}
	var cantidadDeMuseos = 0
	var longitudTotalMurallas = 0
	
	method delegacionDiplomatica(){return
		habitantes.filter({p => p.esDestacada()})
	}
	method valorInicialDeDefensa(){return
		habitantes.count({p => p.potencia()>= 30} )
	}
	method esCulto(){return
		cantidadDeMuseos >= 2 and habitantes.all({p => p.inteligencia() >= 10})
	}
	method potenciaReal(){return
		self.potenciaDeHabitantes().sum()		
	}
	method potenciaDeHabitantes(){return
		habitantes.map({p => p.potencia()})
	}
	method construirMurallas(cantidad){
		longitudTotalMurallas += cantidad
	}
	method fundarUnMuseo(){
		cantidadDeMuseos ++
	}	
	method potenciaMayor(){ return
		habitantes.max(self.potenciaDeHabitantes())
	}
	method potenciaAparente(){return
		self.potenciaMayor() * habitantes.size()
		
	}
	method necesitaReforzarse(){return
		self.potenciaAparente() >= (self.potenciaReal() * 2)
	}
	method recibirTributos(){
		habitantes.forEach({p => p.ofrecerTributo(self)})
	}
	method apaciguarAOtroPlaneta(unPlaneta){
		self.habitantesValiosos().forEach({p => p.ofrecerTributo(unPlaneta)})
		
	}
	method habitantesValiosos(){return
		habitantes.filter({p => p.valor() >= 40})
	}
	
	
}
