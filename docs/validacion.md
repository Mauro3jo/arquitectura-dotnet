# Validación de la reconstrucción

Fecha: 2026-11-09. Entorno: Windows, SDK 10.0.403, runtime ASP.NET Core 9 disponible. Destino original `net9.0`, sin actualizar dependencias.

## v01 y v02

- Restauración desde nuget.org: correcta.
- Build Release de los 15 proyectos: correcto, cero errores y cero advertencias.
- Prueba MSTest original: 1/1 pasada. Es una plantilla sin aserciones, no una prueba de negocio.
- API ejecutada temporalmente sólo en localhost, cerrada al terminar.
- Dos GET a `/weatherforecast`: cinco elementos y contrato de campos correcto en cada respuesta.
- GET a `/openapi/v1.json` en Development: documento y ruta del ejemplo presentes.
- GET a `/customers`: 404, coherente con la ausencia de implementación en esta etapa.
- Manifiestos: 37 archivos seleccionados de v01 y 38 de v02 coinciden con los originales tras normalizar UTF-8 y saltos de línea. No hay modificaciones semánticas del código.

## Comprobación adicional de v02

Una comprobación temporal, separada del material del curso, verificó que `AddDomainServices` conserva la colección de servicios, resuelve `ICustomersDomain` como `CustomersDomain`, reutiliza la instancia dentro del mismo scope y crea otra entre scopes.

Los cinco métodos del dominio conservan explícitamente `NotImplementedException`. Eso valida fidelidad al estado incompleto del recurso, no funcionalidad de clientes. La extensión de DI existe; el scaffold Web API aún no consume el dominio.

## Publicación y límites

Se excluyeron binarios, cachés, archivos de usuario y ZIP. El escaneo de los textos seleccionados no encontró patrones de claves privadas, tokens o contraseñas. Es una revisión acotada, no una auditoría de seguridad exhaustiva.

La primera restauración falló por un feed corporativo heredado del equipo. Se agregó un NuGet.Config local con nuget.org y se repitió satisfactoriamente, sin tocar configuración global ni credenciales.

No hay base de datos, CRUD, autenticación ni frontend de negocio que validar en este corte. No se desplegó el proyecto. Las pruebas descritas son locales; no se configuró un pipeline CI.

Consulta de avisos NuGet del 2026-11-09, incluidas dependencias transitivas: los 15 proyectos no reportaron paquetes vulnerables en nuget.org. Este resultado depende del catálogo consultado y no sustituye una auditoría.
