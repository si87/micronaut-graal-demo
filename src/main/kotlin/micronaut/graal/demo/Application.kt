package micronaut.graal.demo

import io.micronaut.runtime.Micronaut

object Application {

    @JvmStatic
    fun main(args: Array<String>) {
        Micronaut.build()
                .packages("micronaut.graal.demo")
                .mainClass(Application.javaClass)
                .start()
    }
}