# Corrección de seguridad posterior a v12

Verificada el 10 de noviembre de 2026. Es una adaptación separada de los recursos del curso; los commits históricos y los manifiestos source-v01 a source-v12 no se reescriben.

## Cambios mínimos

- AutoMapper 15.0.1 → 15.1.1 en Application.Main: corrige [CVE-2026-32933](https://github.com/advisories/GHSA-rvv3-g6hj-g44x).
- System.Security.Cryptography.Pkcs 9.0.4 transitivo → referencia explícita 9.0.21 en Infrastructure.Data y Transversal.Logging. Lo introducían Microsoft.Data.SqlClient y el sink SQL de Serilog. Avisos: [GHSA-846f-f764-76mx](https://github.com/advisories/GHSA-846f-f764-76mx) y [GHSA-2fmv-rv2c-59x7](https://github.com/advisories/GHSA-2fmv-rv2c-59x7).
- System.Security.Cryptography.Xml 8.0.2 transitivo → referencia explícita 8.0.5 en Infrastructure.Repository. Lo introducía la cadena de dependencias de Microsoft.AspNetCore.Identity 2.3.1. El parche cubre los avisos detectados, incluido [GHSA-c399-9853-6jmj](https://github.com/advisories/GHSA-c399-9853-6jmj).
- No se cambian contratos, endpoints ni versiones mayores de esas bibliotecas. Los hashes antes/después constan en security-patch.json.

## Validación

Restore y build Release correctos. El último build incremental registró 0 errores y 19 advertencias de documentación XML del recurso; otros proyectos conservan advertencias de nulabilidad en compilaciones completas. El test original pasó (1/1), pero está vacío y no cuenta como cobertura funcional.

Se repitieron pruebas HTTP contra una instancia SQL LocalDB independiente: alta/lectura/listado/actualización/borrado de clientes, rechazo de identificadores inconsistentes, signup/signin, usuario duplicado, contraseña incorrecta, usuario inexistente, JWT válido/inválido y ausencia de token. El error sintético de autenticación se escribió en SQL y archivo.

La auditoría con dependencias transitivas de los 15 proyectos no reportó paquetes vulnerables en nuget.org en esta revisión:

```powershell
dotnet list src/Pacagroup.Ecommerce/Pacagroup.Ecommerce.sln package --vulnerable --include-transitive --source https://api.nuget.org/v3/index.json
```

Esto no sustituye una auditoría de seguridad de la aplicación. Los snapshots históricos mantienen dependencias vulnerables y no deben desplegarse. main conserva limitaciones de manejo de errores, validación y diseño descritas en etapas.md.
