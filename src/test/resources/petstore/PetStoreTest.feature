@parallel=false
Feature: Gestión de mascotas en PetStore

Background:
* url petstoreBaseUrl
* header Accept = 'application/json'
* def datos = read('classpath:petstore/data/pet_payload.json')

Scenario: Agregar una mascota de manera exitosa
Given path 'pet'
And request datos.mascotaNueva
When method post
Then status 200                                                                                                     
And match response.id == datos.id                       
And match response.name == datos.mascotaNueva.name
And match response.status == datos.mascotaNueva.status

Scenario: Consultar la mascota creada y verificar que existe
Given path 'pet', datos.id
When method get
Then status 200
And match response.id == datos.id
And match response.name == '#present'

Scenario: Actualizar la mascota y verificar los nuevos valores
Given path 'pet'
And request datos.mascotaActualizada
When method put
Then status 200
And match response.id == datos.id
And match response.name == datos.mascotaActualizada.name
And match response.status == datos.mascotaActualizada.status

Scenario: Filtrar por estado vendido y verificar que la mascota aparece
Given path 'pet', 'findByStatus'
And param status = datos.estadoFiltro
When method get
Then status 200
And match response[*].status contains datos.estadoFiltro
And match response[*].id contains datos.id