import entradas.*

class Asistente{

    var abono
    const historialEntradas = []
    var dineroDisponible

    method comprar(entrada){
        if(dineroDisponible <= 0) {
            self.error("El asistente no tiene Saldo suficiente para realizar la compra.")
        }
        dineroDisponible -= abono.precio(entrada)
        historialEntradas.add(entrada)
    }

    method entradasAñoPasado() =  historialEntradas.filter( {entrada => entrada.fecha().year() == new Date().year() - 1} )

    method bandasQueComproEntrada() = historialEntradas.map({entrada => entrada.banda().nombre()}).asSet()

    /*Tambien podría haberse hecho que el asistente muestre su abono y la empresa lo modifique (a mi en cuanto a responsabilidades se me hace más logico), 
    pero tambien este formato permite evitar preguntar para ordenar*/
    method actualizarDescuentoAbono() {
        abono.incrementarDescuento()
    }
}

/* fan podría ser un objeto apuntado por todos los asistentes que tengan esa logica ya que no guarda un estado diferente para cada asistente, 
pero conceptualmente (no precticamente) me gusta más que comparta ser una clase con vip con un acuerdo de comportamiento*/

class Fan{
    method precio(entrada) = entrada.precio()
    method incrementarDescuento(){}
}

class Vip{
    var descuentoAbono = 0
    method precio(entrada) = entrada.precio() * (1-descuentoAbono)
    method incrementarDescuento(){
        descuentoAbono += 0.01
    }
}
