# 🧪 API Testing con Karate DSL

Este proyecto contiene pruebas automatizadas de APIs utilizando **Karate DSL**, ejecutadas con **JUnit 5** y gestionadas con **Maven**.

Se incluyen pruebas para dos servicios:

* **PetStore API**
* **ReqRes API**

---

## 📁 Estructura del Proyecto

```
api-test/
│── src/
│   ├── test/
│   │   ├── java/
│   │   │   ├── petstore/
│   │   │   │   └── PetStoreRunner.java
│   │   │   ├── reqres/
│   │   │   │   └── ReqResRunner.java
│   │   │
│   │   ├── resources/
│   │       ├── petstore/
│   │       │   ├── PetStoreTest.feature
│   │       │   └── data/pet_payload.json
│   │       ├── reqres/
│   │       │   ├── ReqResTest.feature
│   │       │   └── data/user_payload.json
│   │       └── karate-config.js
│
│── pom.xml
│── logback-test.xml
│── .gitignore
```

---

## ⚙️ Tecnologías utilizadas

* Java 11
* Maven
* Karate DSL (v1.4.1)
* JUnit 5
* Logback

---

## 🚀 Ejecución de pruebas

Para ejecutar todas las pruebas:

```bash
mvn clean test "-Dkarate.env=qa"
```

Para ejecutar un runner específico:

```bash
mvn test "-Dkarate.env=qa" "-Dtest=PetStoreRunnerTest"
```

```bash
mvn test "-Dkarate.env=qa" "-Dtest=ReqResRunnerTest"
```

---

## 🌐 Configuración de entornos

El archivo `karate-config.js` define los entornos disponibles:

```javascript
var entornos = {
    qa:{
        petstoreBaseUrl: "https://petstore.swagger.io/v2",
        reqresBaseUrl: "https://reqres.in/api",
        reqresApiKey: "<API_KEY>"
    }
};
```

Por defecto se utiliza el entorno **qa**.

---

## 🐶 Pruebas PetStore

Se validan los siguientes flujos:

* Crear mascota
* Consultar mascota por ID
* Actualizar mascota
* Filtrar mascotas por estado

### Ejemplo de datos

```json
{
  "id": 456789123,
  "mascotaNueva": {
    "name": "Firulais",
    "status": "available"
  }
}
```

---

## 👤 Pruebas ReqRes

Se validan los siguientes escenarios:

* Consultar usuario por ID
* Actualizar usuario
* Eliminar usuario
* Validar que el usuario eliminado no existe en la lista

---

## 📊 Reportes

Karate genera reportes HTML automáticamente en:

```
target/karate-reports/
```

Abrir el archivo `.html` en el navegador para ver el detalle de ejecución.

---

## 🧠 Buenas prácticas implementadas

* Uso de **data-driven testing** con archivos JSON
* Separación de entornos
* Validaciones claras con `match`
* Configuración de timeouts
* Logs controlados con Logback

---

## ⚠️ Notas importantes

* El ID de la mascota debe ser único para evitar errores `404` o conflictos.
* ReqRes es una API simulada, algunos cambios no persisten realmente.
* Asegúrate de tener conexión a internet al ejecutar las pruebas.

---

## 👨‍💻 Autor: Vera Samuel

Proyecto desarrollado como práctica de automatización de APIs con Karate DSL.
