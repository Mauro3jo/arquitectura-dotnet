# Etapas reconstruidas

Estado verificado el 10 de noviembre de 2026. Se publicaron v01 a v12 de la secuencia moderna .NET 9, con un commit por recurso y fechas reales. Después se aplicó una corrección de seguridad separada.

La finalización del curso fue declarada por Mauro. Este repositorio refleja únicamente los materiales reconstruidos y comprobados, no certifica su progreso privado en Udemy.

## Secuencia y comprobaciones

- v01: solución por capas y contratos de dominio. Build, plantilla de test y scaffold HTTP/OpenAPI comprobados.
- v02: inyección de dependencias del dominio. Build, DI y scaffold comprobados.
- v03: DapperContext y repositorios genérico/Customers. CRUD SQL real comprobado.
- v04: Unit of Work y delegación del dominio. CRUD SQL, consistencia de instancias por scope y regresiones comprobados.
- v05: registro de dependencias de infraestructura. Resolución por DI y CRUD comprobados.
- v06: DTO, aplicación, mapping y Response. CRUD en las capas disponibles y conversión entre entidades/DTO comprobados.
- v07: registro de dependencias de aplicación. Resolución por DI y regresiones comprobadas.
- v08: API Customers. CRUD HTTP real, listado y actualización persistidos, OpenAPI y rechazo de identificador inconsistente comprobados.
- v09: Swagger. Documento de endpoints y regresión CRUD comprobados.
- v10: signup/signin y generación JWT. Alta, usuario duplicado, contraseña incorrecta, cuenta inexistente y token generado comprobados con cuentas sintéticas.
- v11: autorización JWT. Sin token o token inválido devuelve 401; token válido habilita CRUD.
- v12: logging Serilog. Un error sintético se persistió en archivo y en la tabla Logs de SQL.

Cada etapa pasó build Release y el test de plantilla antes de publicarse. v03-v07 se probaron también con un ejecutable externo de integración por capas; v08-v12, con un cliente HTTP externo contra SQL real. Estas verificaciones no son una suite automatizada incluida en el repositorio ni implican cobertura completa.

## Verificación final

- AutoMapper y bibliotecas criptográficas corregidos en un commit adicional: ver [seguridad](seguridad.md).
- Flujo HTTP, autenticación, autorización y logging repetidos después del parche.
- Scripts SQL publicados comprobados en otra base nueva vacía de la instancia aislada.
- Ambos scripts rechazan reemplazar objetos existentes. También se comprobó el rechazo de una base de sistema.
- Configuración publicada sin cadenas de conexión ni claves JWT reales. ZIP originales conservados.

## Limitaciones observadas en el código del curso

- Crear un Customer duplicado devuelve 500 y puede exponer el texto de la excepción.
- Consultar un Customer inexistente devuelve 200, IsSuccess=true y Data=null.
- Repetir un borrado devuelve 200, IsSuccess=true y Data=false.
- El test MSTest original está vacío. Su resultado 1/1 no demuestra cobertura funcional.
- Hay advertencias de nulabilidad/documentación XML; no se afirma compilación sin advertencias.
- No se comprobó concurrencia, rendimiento, despliegue, TLS de producción ni seguridad integral.
- No hay frontend ni CI configurado en este repositorio.

## Materiales que no se mezclaron

Los ZIP modernos llegan a -v12. Los archivos _v11, _v12 y posteriores pertenecen a generaciones diferentes (.NET Core 2.2 a .NET 7) y no constituyen la siguiente revisión de esta solución.

Esos materiales antiguos contienen temas como validación, versionado, health checks, paginación, Redis, rate limiting y reorganización de capas. No se incorporaron como una supuesta v13 ni se retrocedió el framework para completar artificialmente la secuencia.

No se encontró implementación moderna verificable de todas las secciones posteriores del temario actual, por ejemplo EF Core, CQRS/MediatR y mensajería. Para reproducir fielmente esas etapas faltan sus recursos actuales o una referencia concreta de las clases. Haber terminado el curso no convierte automáticamente los archivos antiguos en su versión actual.
