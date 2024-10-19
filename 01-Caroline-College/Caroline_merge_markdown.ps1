# Define the path to the root folder where your markdown files are located
$rootFolder = "R:\Vaults\kStoryTeller\01-Caroline College"

# Define the path for the output file (the merged Markdown file)
$outputFile = "R:\Vaults\kStoryTeller\01-Caroline College\merged_output.txt"

# Ensure the output file is empty before merging content
Clear-Content $outputFile -ErrorAction Ignore

# Recursively get all markdown files (*.md) from the root folder and its subfolders
$markdownFiles = Get-ChildItem -Path $rootFolder -Recurse -Filter *.md

# Loop through each markdown file and append its content to the output file
foreach ($file in $markdownFiles) {
    # Write the filename as a header in the merged document (optional)
    #Add-Content -Path $outputFile -Value "# File: $($file.FullName)`n"

    # Append the content of each file to the output file
    #Get-Content -Path $file.FullName | Add-Content -Path $outputFile
    Get-Content -Path $file.FullName | Where-Object { $_.Trim() -ne "" } | Add-Content -Path $outputFile
    # Add a separator between files (optional)
    Add-Content -Path $outputFile -Value "`n---`n"
}

Write-Host "All markdown files have been merged into $outputFile"
