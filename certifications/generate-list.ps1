# PowerShell script to regenerate certifications list JSON
# run this whenever you add or remove PDF files

$folder = Join-Path $PSScriptRoot ''
$files = Get-ChildItem -Path $folder -Filter '*.pdf' | Sort-Object Name |
    Select-Object -ExpandProperty Name

$json = $files | ConvertTo-Json -Depth 1
Set-Content -Path (Join-Path $folder 'list.json') -Value $json -Encoding UTF8
Write-Host "Generated list.json with $($files.Count) entries."
