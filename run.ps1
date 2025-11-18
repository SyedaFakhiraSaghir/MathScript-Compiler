<<<<<<< HEAD
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
=======
# PowerShell Run Script for MathSeq Compiler
# This script will build and run the compiler with example files

param(
    [string]$Example = "all"
)

$ErrorActionPreference = "Continue"

Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "MathSeq Compiler - Build and Run" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

# Step 1: Try to build using PowerShell script
Write-Host "Step 1: Building the compiler..." -ForegroundColor Yellow
& powershell -ExecutionPolicy Bypass -File build.ps1 -Mode release

if ($LASTEXITCODE -eq 0) {
    # Build successful with native Windows compiler
    Write-Host ""
    Write-Host "Build successful!" -ForegroundColor Green
    $TARGET = "bin\mathseqc.exe"
    
    if (Test-Path $TARGET) {
        Write-Host ""
        Write-Host "Step 2: Running compiler with examples..." -ForegroundColor Yellow
        Write-Host ""
        
        # Get all test files
        $testFiles = @()
        if (Test-Path "test\examples") {
            $testFiles = Get-ChildItem "test\examples\*.mathseq" -ErrorAction SilentlyContinue
        }
        
        if ($testFiles.Count -eq 0) {
            Write-Host "No test files found in test\examples\" -ForegroundColor Yellow
        } else {
            foreach ($file in $testFiles) {
                Write-Host "=====================================" -ForegroundColor Cyan
                Write-Host "Compiling: $($file.Name)" -ForegroundColor Cyan
                Write-Host "=====================================" -ForegroundColor Cyan
                Write-Host ""
                
                & $TARGET $file.FullName -ast -output "$($file.BaseName).asm"
                Write-Host ""
            }
        }
    }
} else {
    # Try WSL
    Write-Host ""
    Write-Host "Native compiler not found. Trying WSL..." -ForegroundColor Yellow
    
    try {
        $wslResult = & wsl make release 2>&1
        if ($LASTEXITCODE -eq 0) {
            Write-Host "Build successful with WSL!" -ForegroundColor Green
            $TARGET = "bin\mathseqc"
            
            Write-Host ""
            Write-Host "Step 2: Running compiler with examples..." -ForegroundColor Yellow
            Write-Host ""
            
            # Get all test files
            $testFiles = @()
            if (Test-Path "test\examples") {
                $testFiles = Get-ChildItem "test\examples\*.mathseq" -ErrorAction SilentlyContinue
            }
            
            if ($testFiles.Count -eq 0) {
                Write-Host "No test files found in test\examples\" -ForegroundColor Yellow
            } else {
                foreach ($file in $testFiles) {
                    Write-Host "=====================================" -ForegroundColor Cyan
                    Write-Host "Compiling: $($file.Name)" -ForegroundColor Cyan
                    Write-Host "=====================================" -ForegroundColor Cyan
                    Write-Host ""
                    
                    # Convert Windows path to WSL path
                    $wslPath = $file.FullName -replace "C:", "/mnt/c" -replace "\\", "/"
                    $wslOutput = "$($file.BaseName).asm"
                    
                    & wsl $TARGET $wslPath -ast -output $wslOutput
                    Write-Host ""
                }
            }
        } else {
            Write-Host ""
            Write-Host "Build failed. Error message:" -ForegroundColor Red
            Write-Host $wslResult -ForegroundColor Red
            Write-Host ""
            Write-Host "Please ensure:" -ForegroundColor Yellow
            Write-Host "  1. WSL is installed and Ubuntu is set up" -ForegroundColor Yellow
            Write-Host "  2. You have run: wsl (to initialize Ubuntu)" -ForegroundColor Yellow
            Write-Host "  3. Build tools are installed in WSL: sudo apt update && sudo apt install -y build-essential" -ForegroundColor Yellow
            Write-Host ""
            Write-Host "Or install a native C++ compiler:" -ForegroundColor Yellow
            Write-Host "  - MinGW-w64: https://www.mingw-w64.org/downloads/" -ForegroundColor Yellow
            Write-Host "  - Visual Studio Build Tools: https://visualstudio.microsoft.com/downloads/" -ForegroundColor Yellow
            exit 1
        }
    } catch {
        Write-Host ""
        Write-Host "WSL build failed: $_" -ForegroundColor Red
        Write-Host ""
        Write-Host "Options:" -ForegroundColor Yellow
        Write-Host "  1. Install WSL and Ubuntu: wsl --install -d Ubuntu" -ForegroundColor Yellow
        Write-Host "  2. After reboot, run: wsl (to initialize)" -ForegroundColor Yellow
        Write-Host "  3. Install build tools in WSL: sudo apt update && sudo apt install -y build-essential" -ForegroundColor Yellow
        Write-Host "  4. Then run: wsl make release" -ForegroundColor Yellow
>>>>>>> 601c4fd (Initial push after zip extraction)
        exit 1
    }
}

<<<<<<< HEAD
# Build the command
$cmd = "& `"$CompilerPath`" `"$SourceFile`""
if ($Options) {
    $cmd += " $Options"
}

# Run the compiler
Invoke-Expression $cmd
=======
Write-Host "=====================================" -ForegroundColor Green
Write-Host "Done! Compiler built and tested." -ForegroundColor Green
Write-Host "=====================================" -ForegroundColor Green
>>>>>>> 601c4fd (Initial push after zip extraction)

