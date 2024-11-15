#!/opt/homebrew/bin/pwsh

# usage: ./sort-images.ps1 *.jpg *.jpeg

# The script move images into different directories based on the month in which
# the photos had been taken. First loop goes through all the parameters passed
# to the script, and second loop processes the files corresponding to the pattern,
# uses ExifTool to determine the date they were taken, and formats this information
# in the form yyyy-mm. If necessary, creates the corresponding directory and finally
# moves the image file to that directory.

# Note:
# Try on macos with powershell installed, but not working.

foreach ($arg in $args) {
    foreach ($file in Get-Item $arg) {
        $yearmonth = &exiftool -s3 -d '%Y-%m' -DateTimeOriginal $file
        if ($yearmonth) {
            $targetdir = New-Item -ItemType Directory -Path $yearmonth -Force
            Move-Item -Path $file -Destination $targetdir
        } else {
            Write-Host "No DateTimeOriginal found for $file"
        }
    }
}