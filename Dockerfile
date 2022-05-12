FROM mcr.microsoft.com/dotnet/sdk:5.0

WORKDIR /app

COPY *.csproj .

RUN dotnet restore

COPY . /app

ENTRYPOINT ["dotnet", "DemoWebApp.dll"]