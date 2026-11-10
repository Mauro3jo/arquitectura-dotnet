# Base mínima de práctica

Estos scripts habilitan únicamente Customers, Users y sus procedimientos para la secuencia v12. No son una copia completa de Northwind ni contienen datos de usuarios.

- 01-customers.sql: esquema mínimo reconstruido a partir de los contratos de columnas, más procedimientos del archivo objects.sql del curso.
- 02-users.sql: tabla y procedimientos de Users-Objects.sql del curso.
- source-sql.json: hashes de los materiales originales y transformaciones realizadas.

Se quitaron las instrucciones que elegían/creaban la base original. Se agregaron guardas de base de sistema y objetos existentes. Los procedimientos Users usan CREATE, en lugar de CREATE OR ALTER, para no reemplazar implementaciones previas.

Usar exclusivamente una base nueva y vacía de práctica. Ejecutar con sqlcmd -b (o SQLCMD Mode, respetando :ON ERROR EXIT). No ejecutar contra una base de trabajo, producción ni una Northwind existente.

Ejemplo Windows, con SQL Server LocalDB y sqlcmd ya instalados:

```powershell
SqlLocalDB create ArchitectureCoursePractice
SqlLocalDB start ArchitectureCoursePractice
sqlcmd -S "(localdb)\ArchitectureCoursePractice" -E -b -Q "CREATE DATABASE ArchitecturePractice;"
sqlcmd -S "(localdb)\ArchitectureCoursePractice" -E -d ArchitecturePractice -b -i database/01-customers.sql
sqlcmd -S "(localdb)\ArchitectureCoursePractice" -E -d ArchitecturePractice -b -i database/02-users.sql
```

El ejemplo presupone que esos nombres todavía no existen. Si ya existen, elegí otros nombres nuevos; no borres ni reutilices una base con información.

La aplicación v12 crea automáticamente dbo.Logs por el sink SQL de Serilog. La cuenta de esta práctica necesita permisos para crear esa tabla, además de ejecutar los procedimientos. No trasladar esos permisos amplios a producción.

Se validaron ambos scripts en una base nueva independiente, el flujo completo de la API y el rechazo al repetir la creación. Los registros creados durante las pruebas fueron sintéticos.
