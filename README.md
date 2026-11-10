# Arquitectura de aplicaciones con .NET

Práctica reconstruida progresivamente a partir del curso **Arquitectura de Aplicaciones Empresariales con .NET 10**, de **Alex Espejo Chavarría** en Udemy. El código original de los recursos pertenece a su autor; los commits documentan esta reconstrucción con fechas reales.

## Estado

Mauro informó el 10 de noviembre de 2026 que terminó el curso. Esa declaración amplía el alcance de la reconstrucción; no se ha comprobado un certificado o porcentaje actual en Udemy.

Se continúa la secuencia moderna de materiales **.NET 9**. El estado del código y la validación de cada etapa están en [etapas](docs/etapas.md). Los ZIP legacy no se mezclan automáticamente con esta solución.

El título actual del curso menciona .NET 10; estos recursos siguen apuntando a net9.0. No se han actualizado versiones por fuera de la etapa correspondiente.

## Ejecutar y configurar

Requisitos: SDK compatible con net9.0, runtime ASP.NET Core 9 y, desde la capa Repository, una base SQL Server de práctica independiente.

```powershell
dotnet restore src/Pacagroup.Ecommerce/Pacagroup.Ecommerce.sln --configfile NuGet.Config
dotnet build src/Pacagroup.Ecommerce/Pacagroup.Ecommerce.sln --no-restore -c Release
dotnet test src/Pacagroup.Ecommerce/Pacagroup.Ecommerce.sln --no-build --no-restore -c Release
```

El test original es una plantilla vacía y no acredita cobertura funcional. Las comprobaciones adicionales realizadas se describen por etapa.

NuGet.Config usa sólo nuget.org, sin modificar feeds globales. Las cadenas de conexión y claves de autenticación de los recursos se sustituyen por valores vacíos cuando aparecen; la configuración local se suministra mediante variables de entorno y nunca se publica.

## Procedencia y límites

[Curso y temario público](https://www.udemy.com/course/arquitectura-aplicaciones-empresariales-con-net-core/). [Trazabilidad](docs/trazabilidad.md). Los manifiestos source-vNN.json registran archivos, hashes y normalizaciones por recurso. No se redistribuyen vídeos, PDF, ZIP ni archivos personales del IDE.

Las etapas son material educativo, no una certificación de preparación para producción. La finalización declarada del curso no significa que todos sus recursos estén disponibles ni que su implementación completa ya esté publicada.
