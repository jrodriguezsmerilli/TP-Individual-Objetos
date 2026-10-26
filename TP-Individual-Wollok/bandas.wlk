import productora.*
class Banda{
    var nombre
    var canon = 1000000

    method nombre() = nombre
    method presupuesto() = canon + self.costoExtra()
    method costoExtra()
    method popularidad()
}

class BandaRock  inherits Banda{

    var solosDeGuitarra

    override method costoExtra() = 10000
    override method popularidad() = solosDeGuitarra * 100
}

class BandaIndie inherits Banda{

    var cantidadInstrumentos

    override method costoExtra() = 500 * cantidadInstrumentos
    override method popularidad() = nombre.size() * 3.14

}

class BandaTrap inherits Banda {

    var tieneIce

    /*Sería más correcto cambiar el canon dependiendo de la popularidad, pero es más facil sobreescribir el metodo presupuesto.
    
    Además, yo elegi crear una variable canon para un precioBase por tratarse de una banda, pero podría no haberse creado y haberse puesto directo en el metodo.
    Asi que no está tan mal sobreescribirlo
    
    */
   
    override method presupuesto() = canon * self.popularidad()
    
    override method costoExtra(){}
    override method popularidad(){
        if(ice){
            return 1000
        }
        else {
            return 0
        }
    }
}
