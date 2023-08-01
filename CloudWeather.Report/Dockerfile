# Build Stage
FROM mcr.microsoft.com/dotnet/sdk:7.0-jammy AS build
WORKDIR /source
COPY . .
RUN dotnet restore "CloudWeather.Report.csproj" --disable-parallel
RUN dotnet publish "CloudWeather.Report.csproj" -c release -o /app --no-restore

# Server Stage
FROM mcr.microsoft.com/dotnet/aspnet:7.0-jammy
WORKDIR /app
COPY --from=build /app ./

EXPOSE 5000

ENTRYPOINT ["dotnet", "CloudWeather.Report.dll"]