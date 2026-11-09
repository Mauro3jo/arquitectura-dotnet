# Arquitectura de aplicaciones con .NET

Reconstrucción de práctica del curso **Arquitectura de Aplicaciones Empresariales con .NET 10**, de **Alex Espejo Chavarría** en Udemy. El código de partida proviene de los materiales del instructor; este repositorio no atribuye su autoría original al alumno ni afirma que el curso esté terminado.

## Alcance publicado

Se conserva la base **.NET 9** de `Pacagroup.Ecommerce_v01.zip` y `Pacagroup.Ecommerce_v02.zip`:

- Estructura de la solución por capas.
- Entidad `Customer` y contratos de dominio.
- Registro de dependencias del dominio con ciclo de vida scoped.
- Web API y prueba de plantilla originales.

El temario sitúa estas etapas antes de la clase 22, dedicada a implementar Repository. La reconstrucción se detiene conservadoramente después de los contenidos de la clase 20. Una observación histórica ubicó la reproducción en la 22, pero no demuestra que estuviera completada ni el avance actual. Ver [trazabilidad](docs/trazabilidad.md).

**No es un e-commerce terminado.** Los cinco métodos de `CustomersDomain` siguen arrojando `NotImplementedException` porque así está el material de esta etapa. No se incluyen Repository, UnitOfWork, CRUD de clientes, autenticación, conexión a base de datos ni secciones posteriores.

## Ejecutar

Requisitos: SDK de .NET compatible con `net9.0` y runtime ASP.NET Core 9. Se validó con SDK 10.0.403 y runtime 9 instalado. El framework y los paquetes del material no fueron migrados.

Desde la raíz:

```powershell
dotnet restore src/Pacagroup.Ecommerce/Pacagroup.Ecommerce.sln --configfile NuGet.Config
dotnet build src/Pacagroup.Ecommerce/Pacagroup.Ecommerce.sln --no-restore -c Release
dotnet test src/Pacagroup.Ecommerce/Pacagroup.Ecommerce.sln --no-build --no-restore -c Release
$env:ASPNETCORE_ENVIRONMENT = 'Development'
dotnet run --project src/Pacagroup.Ecommerce/Pacagroup.Ecommerce.Services.WebApi --no-launch-profile --urls http://127.0.0.1:5189
```

El ejemplo responde en `/weatherforecast`; el documento OpenAPI está en `/openapi/v1.json` en Development. `/customers` todavía no existe. El test de plantilla pasa pero no contiene aserciones: no representa cobertura funcional.

`NuGet.Config` usa sólo nuget.org para no heredar feeds corporativos del equipo. No contiene credenciales y no modifica la configuración global.

## Historial real de reconstrucción

- `723b62a`: alcance, procedencia y exclusiones.
- `8931384`: v01, estructura y contratos de dominio.
- `be12105`: v02, inyección de dependencias del dominio.

Los commits usan la fecha real de reconstrucción. No simulan actividad pasada ni afirman que el alumno escribió el código original del instructor.

## Verificación

Ambas etapas compilaron sin errores ni advertencias; se ejecutó el test original y se verificaron respuestas HTTP reales del ejemplo y OpenAPI. En v02 también se comprobó resolución de DI y separación entre scopes. Detalles y límites en [validación](docs/validacion.md).

## Procedencia

[Curso y temario público](https://www.udemy.com/course/arquitectura-aplicaciones-empresariales-con-net-core/). Los manifiestos [v01](docs/source-v01.json) y [v02](docs/source-v02.json) registran hashes de los ZIP y de cada archivo seleccionado.

Se conservan nombres y diseño del curso, normalizando sólo codificación y saltos de línea. No se añade una licencia de terceros ni se redistribuyen vídeos, PDF, ZIP, secretos o archivos personales del IDE. Los originales se mantuvieron intactos.
