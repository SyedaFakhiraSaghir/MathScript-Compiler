# MathSeq Compiler - Complete Guide (Roman Urdu Mein)

## Project Kya Hai? 🔍

Yeh ek **MathSeq Compiler** hai jo mathematical sequences aur patterns ke liye ek DSL (Domain-Specific Language) compiler hai.

### Project Structure:
```
MathScript-Compiler/
├── include/           # Header files (C++ headers)
│   ├── token.h       # Token definitions
│   ├── ast.h         # Abstract Syntax Tree
│   ├── parser.h      # Parser
│   ├── semantic.h    # Semantic analyzer
│   ├── symbol_table.h # Symbol table
│   ├── codegen.h     # Code generator
│   └── optimizer.h   # Optimizer
├── src/              # Source code files
│   ├── lexer.cpp     # Lexer implementation
│   ├── parser.cpp    # Parser implementation
│   ├── semantic.cpp  # Semantic analyzer
│   ├── symbol_table.cpp
│   ├── codegen.cpp   # Code generator
│   ├── optimizer.cpp # Optimizer
│   └── main.cpp      # Main entry point
├── test/
│   └── examples/     # Example .mathseq files
│       ├── simple.mathseq
│       ├── fibonacci.mathseq
│       ├── arithmetic.mathseq
│       └── errors.mathseq
├── Makefile          # Linux/Mac build file
├── build.ps1         # Windows build script
└── run.ps1           # Windows run script
```

## Compiler Kaise Kaam Karta Hai? ⚙️

Compiler 6 phases mein kaam karta hai:

### Phase 1: Lexical Analysis (Tokenization)
- Source code ko tokens mein break karta hai
- Keywords, identifiers, operators identify karta hai
- Example: `let a: int = 5` → tokens: `let`, `a`, `:`, `int`, `=`, `5`

### Phase 2: Syntax Analysis (Parsing)
- Tokens se Abstract Syntax Tree (AST) banata hai
- Grammar rules check karta hai
- Syntax errors detect karta hai

### Phase 3: Semantic Analysis
- Type checking karta hai
- Variable scope check karta hai
- Semantic errors detect karta hai

### Phase 4: Code Generation
- AST se intermediate code (Three-Address Code) generate karta hai
- Temporary variables create karta hai

### Phase 5: Optimization
- Constant folding
- Dead code elimination
- Code optimize karta hai

### Phase 6: Output
- Final intermediate code output karta hai

## Windows Par Step-by-Step Run Karne Ka Tareeqa 🚀

### Prerequisites Check Karein

Pehle check karein ke aapke paas kya kya hai:

**Option A: WSL (Windows Subsystem for Linux) - Recommended**
- WSL already install ho chuka hai
- System reboot ki zarurat hai

**Option B: Native C++ Compiler**
- MinGW-w64 ya Visual Studio Build Tools chahiye

---

## METHOD 1: WSL Use Karke Run Karne Ka Tareeqa (Recommended) 📋

### Step 1: System Reboot Karein
```powershell
# System ko reboot karein (WSL ke liye zaroori hai)
```

**Kyun?** WSL install hone ke baad system ko reboot karna zaroori hota hai taake WSL properly initialize ho.

### Step 2: WSL Initialize Karein (Reboot ke baad)

PowerShell open karein aur yeh command run karein:
```powershell
wsl
```

**Pehli baar run karne par:**
- Ubuntu setup window khulegi
- Username aur password set karna hoga
- Setup complete hone tak wait karein (5-10 minutes)

### Step 3: WSL Mein Build Tools Install Karein

WSL mein (Ubuntu terminal mein) yeh commands run karein:
```bash
# Update package list
sudo apt update

# Build tools install karein
sudo apt install -y build-essential make
```

**Build tools kya hain?** 
- `g++` - C++ compiler
- `make` - Build automation tool

### Step 4: Project Directory Mein Jaayein

WSL terminal mein project directory mein jana hoga:
```bash
# Windows path ko WSL path mein convert karna
cd /mnt/c/Users/22K-4646/Desktop/MathScript-Compiler-main/MathScript-Compiler-main/MathScript-Compiler-main

# Ya current directory check karein
pwd
```

### Step 5: Project Build Karein

WSL terminal mein:
```bash
make release
```

**Yeh kya karega?**
- Saare `.cpp` files ko compile karega
- `bin/mathseqc` executable banayega

**Output:**
```
Build complete: bin/mathseqc
```

### Step 6: Compiler Test Karein

**Example 1: Simple Program**
```bash
./bin/mathseqc test/examples/simple.mathseq -ast
```

**Example 2: Fibonacci Sequence**
```bash
./bin/mathseqc test/examples/fibonacci.mathseq -ast -output fib.asm
```

**Example 3: Arithmetic Operations**
```bash
./bin/mathseqc test/examples/arithmetic.mathseq -tokens -ast
```

### Step 7: Output Dekhein

Compiler output mein yeh dikhega:
- Phase 1: Lexical Analysis ✅
- Phase 2: Syntax Analysis ✅
- Phase 3: Semantic Analysis ✅
- Phase 4: Code Generation ✅
- Phase 5: Optimization ✅
- Phase 6: Final Output ✅

---

## METHOD 2: PowerShell Scripts Use Karke (Bina WSL) 📋

Agar aap WSL use nahi karna chahte, to native Windows compiler chahiye.

### Step 1: MinGW-w64 Install Karein

1. Download: https://www.mingw-w64.org/downloads/
2. Installer se install karein
3. PATH environment variable mein `bin` folder add karein

### Step 2: PowerShell Script Se Build Karein

PowerShell mein (project directory mein):
```powershell
# Build script run karein
powershell -ExecutionPolicy Bypass -File build.ps1 -Mode release
```

### Step 3: Compiler Run Karein

```powershell
# Run script se sab kuch automatically
powershell -ExecutionPolicy Bypass -File run.ps1
```

Ya manually:
```powershell
# Simple example
.\bin\mathseqc.exe test\examples\simple.mathseq -ast

# Fibonacci with output file
.\bin\mathseqc.exe test\examples\fibonacci.mathseq -ast -output fibonacci.asm
```

---

## Quick Start Commands (WSL Use Karte Hue) ⚡

Agar WSL ready hai, to yeh commands direct use karein:

### Build Commands:
```bash
# Release build (optimized)
make release

# Debug build (with debug symbols)
make debug

# Clean build (purani files delete)
make clean
```

### Run Commands:
```bash
# Simple test
./bin/mathseqc test/examples/simple.mathseq -ast

# Fibonacci with output
./bin/mathseqc test/examples/fibonacci.mathseq -ast -output fib.asm

# Arithmetic with tokens
./bin/mathseqc test/examples/arithmetic.mathseq -tokens -ast

# Optimization disabled
./bin/mathseqc test/examples/arithmetic.mathseq -no-opt
```

### Makefile Targets:
```bash
make test        # Run tests
make example     # Compile example program
make help        # Help menu dikhaye
```

---

## Compiler Options 📝

Compiler ke saath yeh options use kar sakte hain:

- `-tokens` - Token stream print kare
- `-ast` - Abstract Syntax Tree print kare
- `-no-opt` - Optimization disable kare
- `-output <file>` - Output file specify kare

**Example:**
```bash
./bin/mathseqc program.mathseq -tokens -ast -output output.asm
```

---

## Example Programs Samjhein 📚

### 1. Simple Program (`simple.mathseq`)
```mathseq
func main() -> int {
    let a: int = 1
    print a
    return 0
}
```

**Kya karta hai?** Simple variable declare karke print karta hai.

### 2. Fibonacci Sequence (`fibonacci.mathseq`)
```mathseq
func fibonacci(n: int) -> sequence {
    let a: int = 0
    let b: int = 1
    let result: sequence = [a, b]
    
    while length(result) < n {
        let next: int = a + b
        result = result + [next]
        a = b
        b = next
    }
    
    return result
}

func main() -> int {
    let count: int = 10
    let fib_sequence: sequence = fibonacci(count)
    print "Fibonacci sequence: " fib_sequence
    return 0
}
```

**Kya karta hai?** Fibonacci sequence generate karta hai.

### 3. Arithmetic Operations (`arithmetic.mathseq`)
```mathseq
func calculate(a: int, b: int) -> int {
    let sum: int = a + b
    let product: int = a * b
    let difference: int = a - b
    
    if sum > product {
        return sum
    } else {
        return product
    }
}

func main() -> int {
    let x: int = 15
    let y: int = 3
    let result: int = calculate(x, y)
    print "Result: " result
    return 0
}
```

**Kya karta hai?** Arithmetic operations perform karta hai.

---

## Troubleshooting 🔧

### Problem 1: "make: command not found"
**Solution:** WSL mein build tools install karein:
```bash
sudo apt update && sudo apt install -y build-essential
```

### Problem 2: "g++: command not found"
**Solution:** WSL mein g++ install karein:
```bash
sudo apt install -y g++
```

### Problem 3: WSL not working after reboot
**Solution:** 
```powershell
wsl --update
wsl --status
```

### Problem 4: Build errors
**Check:**
- Saare source files present hain?
- Include directory sahi hai?
- C++17 support hai?

---

## Complete Workflow Summary 📋

1. ✅ **System Reboot** (WSL ke liye)
2. ✅ **WSL Initialize** (`wsl` command se)
3. ✅ **Build Tools Install** (`sudo apt install -y build-essential`)
4. ✅ **Project Directory** mein jayein
5. ✅ **Build** (`make release`)
6. ✅ **Run Examples** (`./bin/mathseqc test/examples/...`)
7. ✅ **Output Dekhein** ✅

---

## Next Steps 🎯

Project successfully run hone ke baad:

1. **Apne programs likhein** - `.mathseq` files bana kar test karein
2. **Compiler phases explore karein** - `-tokens` aur `-ast` flags se
3. **Code generation dekhein** - Output files mein intermediate code dekhein
4. **Optimization explore karein** - `-no-opt` flag se compare karein

---

## Helpful Resources 📖

- **README.md** - Project documentation
- **WINDOWS_SETUP.md** - Windows setup instructions
- **Example files** - `test/examples/` directory mein

**Happy Compiling! 🎉**

