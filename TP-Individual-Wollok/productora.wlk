import entradas.*
import asistentes.*
import bandas.*

object productora{

    const bandas = #{}

    const entradasVendidas = []

    var impuesto = 0

    method impuesto() = impuesto

    method venderEntrada(asistente, banda, fecha){
        const nuevaEntrada = new Entrada(banda = banda, fecha = fecha)
        asistente.comprar(nuevaEntrada)
        entradasVendidas.add(nuevaEntrada)
    }

    method agregarBanda(unaBanda) {
        bandas.add(unaBanda)
    }

    method gananciaTotal() = entradasVendidas.sum({entrada => entrada.precio()}) - bandas.sum({banda => banda.presupuesto()})

    method cantidadEntradasVendidas() = entradasVendidas.size()

    method bandaMasPopular() = bandas.max({ banda => entradasVendidas.count({entrada => entrada.banda() == banda })})

    method bonificarA(unAsistente) {
        unAsistente.actualizarDescuentoAbono()
    }

}
