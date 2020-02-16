package micronaut.graal.demo

import io.micronaut.http.annotation.Controller
import io.micronaut.http.annotation.Get

@Controller("test")
class TestController(private val todoClient: TodoClient) {

    @Get
    suspend fun test(): ToDo {
        return todoClient.getTodo()
    }
}