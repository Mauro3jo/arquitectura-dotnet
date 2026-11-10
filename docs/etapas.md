# Etapas reconstruidas

Cada etapa se valida antes de su commit y push. Las pruebas adicionales usan una instancia LocalDB separada con datos sintÃ©ticos, sin operar sobre bases existentes.

- v01 y v02: ver informe histÃ³rico de validaciÃ³n.
- v03: Repository y Dapper. ValidaciÃ³n en curso, todavÃ­a sin publicaciÃ³n de esta etapa.

La finalizaciÃ³n del curso fue declarada por Mauro. El repositorio refleja solamente los recursos reconstruidos y comprobados.
- v04: importado del recurso homónimo. Build Release y test de plantilla correctos; CRUD SQL real y regresiones en todas las capas disponibles, DI y HTTP/OpenAPI del scaffold verificados.
- v05: importado del recurso homónimo. Build Release y test de plantilla correctos; CRUD SQL real y regresiones en todas las capas disponibles, DI y HTTP/OpenAPI del scaffold verificados.
- v06: importado del recurso homónimo. Build Release y test de plantilla correctos; CRUD SQL real y regresiones en todas las capas disponibles, DI y HTTP/OpenAPI del scaffold verificados.
- Advertencia de seguridad del material: AutoMapper 14.0.0 reporta CVE-2026-32933 (alto). Estas versiones son snapshots educativos, no aptos para desplegar sin corregir. Referencia: https://github.com/advisories/GHSA-rvv3-g6hj-g44x.
- v07: importado del recurso homónimo. Build Release y test de plantilla correctos; CRUD SQL real y regresiones en todas las capas disponibles, DI y HTTP/OpenAPI del scaffold verificados.

- v08: API Customers y configuración saneada. Build Release sin errores; conserva advertencias de nulabilidad y AutoMapper del material. Test de plantilla, CRUD HTTP real, listado/actualización persistidos, OpenAPI y rechazo de identificador inconsistente verificados.
- Límites observados en v08: duplicado de cliente devuelve 500; lectura de cliente inexistente devuelve 200, IsSuccess=true y Data=null; borrado repetido devuelve 200, IsSuccess=true y Data=false. Se preservan como comportamiento del recurso, no como buenas prácticas de API.
- v09: build Release sin errores y test original correctos; CRUD HTTP SQL real, documentación y regresiones verificados. Se mantienen las advertencias y limitaciones de los recursos, sin declarar preparación para producción.
