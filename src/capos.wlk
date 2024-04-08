object rolando{
	var property capacidad = 2
	var property artefactos = #{}
	var property hogar = castilloDePiedra
	const property historialDeArtefactos = []
	var property poderBase = 5
	
	method agarrar(artefacto){
		if(self.puedeAgregar()){
			artefactos.add(artefacto)
		}
	}
	
	method poderPelea() = self.poderBase() + self.poderArtefactos()
	
	method artefactos() = artefactos
	
	method puedeAgregar() = artefactos.size()<capacidad
	
	method irAlCastillo(){
		self.guardarArtefactosEnHogar()
		self.liberarEspacio()
	}
	
	method guardarArtefactosEnHogar() {
		hogar.guardarTodosLosArtefactos(artefactos)
	}
	
	method liberarEspacio() {
		artefactos.clear()
	}
	
	method posee(artefacto) = self.todasLasPosesiones().contains(artefacto)
	
	method todasLasPosesiones() = artefactos.union(hogar.baul())
	
	method poderArtefactos() = artefactos.sum({artefacto => artefacto.poder(self)})
	
	method batalla(){
		artefactos.forEach({artefacto => artefacto.usar()})
		poderBase += 1
	}
		 
}

///ARTEFACTOS///

object espadaDelDestino{
	var primeraVez = true
	
	method poder(personaje) = personaje.poderBase() * self.coeficiente()
	
	method usar(){
		primeraVez = false
	}
	
	method coeficiente() = if(primeraVez) 1 else 0.5
}

object libroDeHechizos{
	method poder(personaje){
		
	}
	method usar(){
		
	}
}

object armaduraDeAceroValyrio{
	
	method poder(personaje) = 6
	
	method usar(){
		
	}
}

object collarDivino{
	var usos = 0
	
	method poder(personaje) = 3 + self.extra(personaje)
		
	method extra(personaje) = if (personaje.poderBase()>6) usos else 0
	
	method usar(){
		usos += 1
	}
}

///CASTILLO///

object castilloDePiedra {
	const baul = #{}

	method guardarTodosLosArtefactos(artefactos) {
		baul.addAll(artefactos)
	}
}