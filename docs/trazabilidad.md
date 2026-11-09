# Trazabilidad y corte

Revisión: 2026-11-09. Fuente pública: https://www.udemy.com/course/arquitectura-aplicaciones-empresariales-con-net-core/.

El orden del temario permite ubicar la estructura de la solución en la clase 18, el dominio en la 19, su inyección de dependencias en la 20, la explicación conceptual de Repository en la 21 y su implementación en la 22. Es un conteo de las clases publicadas, contrastado con la referencia histórica a la clase 22; no es lectura del historial privado del alumno.

## Etapas seleccionadas

1. `Pacagroup.Ecommerce_v01.zip`: solución, proyectos y contratos del dominio. Correspondencia por contenido con las clases 18–19. SHA-256: `3af2ea789e77d2b36524b2d58a31aaf4903426743af1f1c4bf0d3ac2d21a1a2b`.
2. `Pacagroup.Ecommerce_v02.zip`: agrega `ConfigureServices.AddDomainServices` y la dependencia de DI. Correspondencia por contenido con la clase 20. SHA-256: `a0be63b9fdb17495456deda7f13f12b1f1fe63d8a745dc03f6d9200656b62820`.

El recurso v03 contiene Repository y queda excluido. Los materiales de otras generaciones de .NET no se encadenan artificialmente con esta secuencia.

## Límites

- Curso incompleto. No se afirma porcentaje ni última clase completada actuales.
- El corte antes de la implementación de Repository es conservador, no prueba que el alumno haya completado exactamente la clase 20.
- Los contratos del dominio mantienen `NotImplementedException`, tal como aparecen en esta etapa. No hay CRUD funcional, autenticación, base de datos conectada ni UI de negocio.
- El test incluido por el instructor es una plantilla vacía y no acredita cobertura funcional.
- La Web API sólo conserva el ejemplo meteorológico del scaffold.
- No se actualizan versiones ni se agregan funcionalidades de secciones posteriores.
- Se excluyen cachés, binarios, archivos personales del IDE y contenido ajeno al código necesario. Se normalizan saltos de línea del material original para que el diff sea legible.

Los archivos ZIP originales no se modifican. El historial de Git representa la reconstrucción actual y no el historial original de aprendizaje.
