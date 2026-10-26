import productora.*
import bandas.*
class Entrada {
    const property banda
    //la fecha es un tipo date, se pone al momento de instanciar la clase
    const property fecha

    method precio() = 1000 + productora.impuesto()

}