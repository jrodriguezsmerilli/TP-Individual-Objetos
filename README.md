# TP Individual - Paradigma Orientado a Objetos (PDEP Entertainment)

## Decisiones Importantes

1. **Creación de la Superclase Banda y Subclases según el tipo de banda:** 
   Decisión de diseño casi sugerida por el texto, todas las bandas comparten los mismos mensajes aunque con comportamientos distintos y tienen una serie de atributos compartidos. De esta manera se favorece el polimorfismo y se evita repetir codigo en comportamiento repetido. Si no fuese porque el caso de Banda de Trap, donde no se suma a un precio base un costo extra, es un caso muy especifico, si se podría cuestionar más la desición porque es una de las cuestiones fundamentales que comparten.

2. **Manejo de los abonos:** 
   Manejar el abono a traves de objetos instanciados de clases que se comprometieron a seguir un acuerdo (en el caso de wollok implicito) de una interfaz. Como menciono en un comentario del codigo, el objeto fan podría haberse creado directamente ya que no tiene un estado propio, pero me gustaba más conceptualmente la idea de que fuesen clases tanto fan como vip. Además (no es propiamente una ventaja porque sería hablar de programar a la defensiva) si fan pasase a tener un estado propio sería más facil de implementar de esta manera.

3. **Cuestión de responsabilidades:**
   * **Modificación del porcentaje de descuento:** La promotora conoce a los asistentes, no a sus abonos, es por esto que (para evitar preguntar para ordenar) le ordena directamente al asistente que maneje el aumento de su abono. El asistente conoce a su abono, pero no sabe ni le corresponde saber como se incrementa, entonces le ordena al abono que se incremente. Finalmente el abono sabe como incrementarse.
   * **Venta y registro:** La productora se encarga de la venta de entradas, registra cada entrada vendida. Al momento de vender una entrada le deja la responsabilidad al asistente de comprarla y es este último el que verifica si puede hacerlo y se la registra como anotada. Ninguno modifica los atributos del otro.
   * **Encapsulamiento:** Datos como precios/presupuestos/descuentos/caracteristicas propias, se intentan mantener encapusladas y dejar la responsabilidad de manejarlas a sus objetos.

4. **Sets vs Listas:**
   * Use sets para cualquier atributo o dato vinculado a las bandas ya que no tenía sentido repetirlas.   
   * Use Listas para las entradas ya que si podían repetirse.

---

## Conceptos de la Materia Aplicados

1. **Uso de clases:** 
   Excepto por la productora, que es un objeto único, el resto del programa está compuesto por clases, que podrán instanciarse al momento de la ejecución. Esto se hizo de está manera porque van a existir muchos objetos del tipo entrada/asistente/banda, declararlas uno por uno repetiría logica, además que dejaría mucho trabajo de copiar y pegar cada vez que se quiera uno nuevo. Sumo a esto la primera desición explicada de usar clases y subClases para las bandas.

2. **Interfaz:** 
   En el caso de los estados no es necesario crear una superclase porque no hay un codigo general que se repita para ambos estados, solo la necesidad de poder responder a ciertos mensajes. Por esto se crea la interfaz (aunque en Wollok no haya que declararla como tal) que agruparía el comportamiento precio(Arg) e incrementarDescuento(), para mantener el polimorfismo.

3. **Uso de metodos abstractos:**
   En la creacion de la SuperClase, hay metodos como presupuesto() y costoExtra() que se crean para que tengan que describirse en cada Sub-Clase, para producir polimorfismo entre todas.
    
4. **Uso de colecciones:** 
   Muchos de los atributos de los objetos del TP necesitaban agrupar a muchos elementos de un mismo tipo. Además de da eso, se necesitaba modificar y trabajar las colecciones dentro del comportamiento para producir resultados.

5. **Funciones de Orden Superior:**
   Para manejar las colecciones del 4 se utilizan funciones como map o sum, entre otras.

6. **Bloque o closure:** 
   Para la utilizacion de la gran mayoría de funciones que modifican el contenido de las colecciones se necasitaron bloques como `{entrada => entrada.fecha().year() == new Date().year() - 1}`.

7. **Creacion de getters:** 
   Para mostrar algunos atributos de los objetos, como el atributo impuesto en productora.

8. **Manejo de errores:** 
   Para implementar la condicion de que para comprar tenga que tener saldo positivo inclui una condicion con un mensaje de error.

(No lo voy a señalar como otro inciso, pero varias de las decisiones tomadas donde se reflejan los primeros 3 puntos son para fomentar y aprovechar el polimorfismo)
