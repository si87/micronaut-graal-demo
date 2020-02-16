package micronaut.graal.demo

import io.micronaut.http.annotation.Get
import io.micronaut.http.client.annotation.Client

@Client("http://jsonplaceholder.typicode.com")
interface TodoClient {

    @Get("/todos/1")
    suspend fun getTodo() : ToDo
}