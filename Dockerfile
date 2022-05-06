#get base sdk from microsoft
FROM mcr.microsoft.com/dotnet/sdk:5.0 As build-env
WORKDIR /app

#copy .csproj files and restore dependencies
COPY *.csproj ./
RUN dotnet restore

#copy the project files and build our release
COPY . ./
RUN dotnet publish -c Release -o out

#generate runtime image
FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /app
EXPOSE 80
EXPOSE 5000
EXPOSE 5001
COPY --from=build-env /app/out .
ENTRYPOINT [ "dotnet", "DemoWebApp.dll" ]
