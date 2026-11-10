# Arquitectura de aplicaciones con .NET

Práctica reconstruida progresivamente a partir del curso **Arquitectura de Aplicaciones Empresariales con .NET 10**, de **Alex Espejo Chavarría** en Udemy. El código original de los recursos pertenece a su autor. Los commits registran esta reconstrucción, con fechas reales; no simulan el historial original de aprendizaje.

## Estado

Publicadas las **12 etapas modernas disponibles**, desde la solución por capas hasta Customers, Dapper, Unit of Work, Swagger, registro/login, JWT y logging. Después de v12 se agregó un parche de seguridad separado. Ver [etapas y límites](docs/etapas.md) y [correcciones de seguridad](docs/seguridad.md).

Mauro informó el 10 de noviembre de 2026 que terminó el curso. No se verificó un certificado ni el porcentaje privado actual. El repositorio no pretende contener secciones cuyos recursos actuales no están disponibles.

Aunque el título del curso menciona .NET 10, esta secuencia apunta a **net9.0**. Los ZIP de otras generaciones no se mezclaron con ella.

## Ejecutar

Requisitos: SDK compatible con net9.0, runtime ASP.NET Core 9, SQL Server de práctica y sqlcmd para los scripts. El ejemplo local usa PowerShell y LocalDB en Windows.

1. Prepará una base **nueva y vacía** siguiendo [database/README.md](database/README.md).
2. Restaurá y compilá desde la raíz:

```powershell
dotnet restore src/Pacagroup.Ecommerce/Pacagroup.Ecommerce.sln --configfile NuGet.Config
dotnet build src/Pacagroup.Ecommerce/Pacagroup.Ecommerce.sln --no-restore -c Release
dotnet test src/Pacagroup.Ecommerce/Pacagroup.Ecommerce.sln --no-build --no-restore -c Release
```

El test original es una plantilla vacía: 1/1 no equivale a cobertura funcional. Las verificaciones adicionales realizadas están documentadas por etapa.

3. Configurá sólo esta sesión de PowerShell y arrancá la API en loopback:

```powershell
$env:ASPNETCORE_ENVIRONMENT = "Development"
$env:ConnectionStrings__NorthwindConnection = "Server=(localdb)\ArchitectureCoursePractice;Database=ArchitecturePractice;Integrated Security=true;Encrypt=false"
$env:Jwt__Issuer = "architecture-course-local"
$env:Jwt__Audience = "architecture-course-local"
$bytes = New-Object byte[] 48
$rng = [Security.Cryptography.RandomNumberGenerator]::Create()
$rng.GetBytes($bytes)
$rng.Dispose()
$env:Jwt__Key = [Convert]::ToBase64String($bytes)
dotnet run --project src/Pacagroup.Ecommerce/Pacagroup.Ecommerce.Services.WebApi --no-build --no-launch-profile -c Release --urls http://127.0.0.1:5189
```

Encrypt=false y HTTP se usan únicamente en esta práctica local aislada. No usar esta configuración en una red compartida o producción.

4. Abrí http://127.0.0.1:5189/swagger. Registrá una cuenta ficticia con POST /api/Auth/SignUp, iniciá sesión con POST /api/Auth/SignIn y usá su accessToken en **Authorize** para probar /api/Customers. Los cuerpos se describen en Swagger. No uses datos personales ni contraseñas reales.

Al terminar, Ctrl+C y eliminá la clave de esa sesión:

```powershell
Remove-Item Env:Jwt__Key
```

La clave se genera de nuevo en cada arranque del ejemplo; los tokens anteriores dejarán de ser válidos. Serilog escribe logs locales y crea la tabla Logs en la base de práctica. Los directorios de logs están excluidos de Git.

NuGet.Config usa sólo nuget.org, sin modificar feeds globales. Las cadenas de conexión y claves originales fueron sustituidas por valores vacíos antes del primer commit que las contenía.

## Procedencia y límites

[Curso y temario público](https://www.udemy.com/course/arquitectura-aplicaciones-empresariales-con-net-core/) · [Trazabilidad](docs/trazabilidad.md) · [Validación](docs/etapas.md)

Los manifiestos source-vNN.json registran archivos, hashes y normalizaciones por recurso. security-patch.json identifica la adaptación posterior. No se redistribuyen videos, PDF, ZIP, datos personales ni archivos del IDE.

Material educativo, no listo para producción. La auditoría final no encontró paquetes vulnerables conocidos en nuget.org, pero eso no certifica la seguridad de la aplicación. Persisten comportamientos de error y otras limitaciones del curso descritos en etapas.md. La autoría y las licencias de los materiales y dependencias deben respetarse.
