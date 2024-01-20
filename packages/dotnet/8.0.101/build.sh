#!/usr/bin/env bash

curl "https://download.visualstudio.microsoft.com/download/pr/9454f7dc-b98e-4a64-a96d-4eb08c7b6e66/da76f9c6bc4276332b587b771243ae34/dotnet-sdk-8.0.101-linux-x64.tar.gz" -Lo dotnet.tar.gz
tar xzf dotnet.tar.gz --strip-components=1
rm dotnet.tar.gz

# Cache nuget packages
export DOTNET_CLI_HOME=$PWD
./dotnet new console -o cache_application
./dotnet new console -lang F# -o fs_cache_application
./dotnet new console -lang VB -o vb_cache_application
# This calls a restore on the global-packages index ($DOTNET_CLI_HOME/.nuget/packages)
# If we want to allow more packages, we could add them to this cache_application

rm -rf cache_application fs_cache_application vb_cache_application
# Get rid of it, we don't actually need the application - just the restore
