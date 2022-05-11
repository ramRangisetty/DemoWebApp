#generate runtime image
FROM mcr.microsoft.com/dotnet/aspnet:5.0
COPY /app/out .
ENTRYPOINT [ "dotnet", "DemoWebApp.dll" ]