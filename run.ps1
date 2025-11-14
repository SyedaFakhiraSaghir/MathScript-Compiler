# Helper script to run the compiler easily
# Usage: .\run.ps1 [source-file] [options]

param(
    [Parameter(Mandatory=$true, Position=0)]
    [string]$SourceFile,
    
    [Parameter(ValueFromRemainingArguments=$true)]
    [string[]]$Options
)

$ProjectDir = "MathScript-Compiler-main"
$CompilerPath = Join-Path $ProjectDir "bin\mathseqc.exe"

if (-not (Test-Path $CompilerPath)) {
    Write-Host "Error: Compiler not found at $CompilerPath" -ForegroundColor Red
    Write-Host "Please build it first with: .\make release" -ForegroundColor Yellow
    exit 1
}

# Convert forward slashes to backslashes if needed
$SourceFile = $SourceFile -replace '/', '\'

# If relative path, try to resolve it relative to project directory or current directory
if (-not [System.IO.Path]::IsPathRooted($SourceFile)) {
    # Try relative to project directory first
    $TestPath1 = Join-Path $ProjectDir $SourceFile
    if (Test-Path $TestPath1) {
        $SourceFile = $TestPath1
    }
    # If not found, try current directory (might be in project dir already)
    elseif (-not (Test-Path $SourceFile)) {
        Write-Host "Error: Could not find file: $SourceFile" -ForegroundColor Red
        Write-Host "Tried: $TestPath1 and $SourceFile" -ForegroundColor Yellow
        exit 1
    }
}

# Build the command
$cmd = "& `"$CompilerPath`" `"$SourceFile`""
if ($Options) {
    $cmd += " $Options"
}

# Run the compiler
Invoke-Expression $cmd

