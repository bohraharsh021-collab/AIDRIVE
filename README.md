# 👞 AIDRIVE: The Shoemaker's Agentic Pen Drive
### *A Portable, Sandboxed, Dual-Engine Agentic AI Runtime for USB Drives*

[![License: MIT](https://img.shields.io/badge/License-MIT-emerald.svg)](LICENSE)
[![Python: 3.9+](https://img.shields.io/badge/Python-3.9%2B-blue.svg)](https://www.python.org/)
[![Tests: 15/15 Passing](https://img.shields.io/badge/Tests-15%2F15%20Passing-brightgreen.svg)](tests/)
[![Offline: 100% Air--Gapped](https://img.shields.io/badge/Mode-100%25%20Offline%20Capable-purple.svg)](#dual-engine-architecture)
[![Institution: BIT Sathy](https://img.shields.io/badge/Origin-BIT%20Sathy%20ECE-orange.svg)](#origin--academic-context)

---

## 🌟 The Vision: The Elves & The Shoemaker

In the classic fairy tale of the Shoemaker, the craftsman cuts his leather at dusk, leaves it on his workbench, goes to sleep, and wakes at dawn to find finished, exquisitely crafted shoes.

**AIDRIVE** applies this paradigm directly to modern engineering and computing:
> **You plug your pen drive into any college or lab computer, drop your lab assignments or engineering questions into `workspace/inbox/`, go to sleep or attend lectures, and wake up to finished code, circuit calculations, and formatted lab reports in `workspace/completed/`.**

The AI agents are **confined within a secure virtual sandbox** on the USB drive. If an agent attempts to access external files on the host computer, an interactive permission prompt is raised and logged to an immutable audit trail.

---

## 🏗️ Architecture Overview

```text
+-------------------------------------------------------------------------------+
|                            HOST OPERATING SYSTEM                              |
|                    (Windows 10/11, Ubuntu Linux, macOS)                       |
+-------------------------------------------------------------------------------+
        ^                                                               |
        | [PERMISSION GATEKEEPER]                                       |
        | Controlled by Gatekeeper Elf (Prompts: Allow Once / Deny)     |
        v                                                               v
+-------------------------------------------------------------------------------+
|                          AIDRIVE USB PERIMETER                                |
|                                                                               |
|  +-------------------------------------------------------------------------+  |
|  |                     INTERACTIVE TERMINAL CLI                            |  |
|  |             Zero-dependency, works on any terminal / lab PC             |  |
|  +-------------------------------------------------------------------------+  |
|                                                                               |
|  +-------------------------------------------------------------------------+  |
|  |                     MAESTRO (Lead Orchestrator)                         |  |
|  +-------------------------------------------------------------------------+  |
|         |                      |                     |              |         |
|         v                      v                     v              v         |
|  +-------------+        +-------------+       +-------------+  +------------+ |
|  | ELF TURING  |        |   ELF OHM   |       | ELF SCRIBE  |  | GATEKEEPER | |
|  | (Code & C)  |        | (ECE & BEEE)|       | (Docs/Lab)  |  | (Security) | |
|  +-------------+        +-------------+       +-------------+  +------------+ |
|                                                                               |
|  +-------------------------------------------------------------------------+  |
|  |                        DUAL INFERENCE ENGINE                            |  |
|  |  [Mode A: Cloud API Provider]       [Mode B: Sovereign Local Provider]  |  |
|  |  - Gemini 1.5/2.0                   - Ollama / llama.cpp HTTP           |  |
|  |  - Groq Llama 3.3                   - Offline Symbolic & Rule Engine    |  |
|  |  - OpenAI GPT-4o                    - SymPy & AST Analysis (0 Internet) |  |
|  +-------------------------------------------------------------------------+  |
|                                                                               |
|  +-------------------------------------------------------------------------+  |
|  |                        ISOLATED SANDBOX FS                              |  |
|  |  workspace/inbox/  -->  workspace/active/  -->  workspace/completed/   |  |
|  +-------------------------------------------------------------------------+  |
+-------------------------------------------------------------------------------+
```

---

## 👥 The Five Shoemaker Elves

| Elf | Persona | Specialization |
|---|---|---|
| 👑 **Maestro** | Lead Orchestrator | Analyzes tasks, breaks down complex goals into phases, delegates to specialist elves, and verifies craftsmanship. |
| 💻 **Turing** | Code & Algorithms | First-Year ECE ANSI C programming, pointer safety, dynamic memory debugging (`malloc`/`free`), and time complexity. |
| ⚡ **Ohm** | Circuit & Hardware Specialist | Ohm's Law, KCL/KVL, Thevenin/Norton equivalents, series/parallel RLC resonance, and digital logic minimization. |
| 📝 **Scribe** | Documentarian & Synthesizer | Formats publication-ready Markdown lab records, exam revision formula sheets, and changelogs with craftsmanship seals. |
| 🛡️ **Gatekeeper** | Security Sentinel | Enforces the USB sandbox perimeter. Halts external host file operations until the student grants explicit permission. |

---

## ⚡ Dual-Engine Architecture

1. **Cloud API Drive ("Online Elves")**:
   - High-reasoning cloud models: Google Gemini, Groq (Llama 3.3), OpenAI, DeepSeek, Anthropic.
   - Keys are stored in an encrypted vault (`core/vault.dat`) on the USB drive, leaving **zero trace on host computers**.
2. **Sovereign Local Drive ("Offline Elves")**:
   - **100% Air-Gapped! Zero internet required.**
   - Connects to local Ollama or llama.cpp servers if running.
   - Automatically falls back to built-in **Symbolic Math & Rule Engines** (`sympy`, AST parsers) that solve circuits, truth tables, and C debugging offline in restricted exam halls.

---

## 🚀 Quickstart Guide

### 1. Interactive Terminal Launcher
On Windows:
```cmd
START_AIDRIVE.bat
```
On Linux / macOS:
```bash
chmod +x START_AIDRIVE.sh
./START_AIDRIVE.sh
```

Or run directly with Python:
```bash
py core/cli.py
```

### 2. Direct CLI Commands
```bash
# View system status and elves
py core/cli.py status

# Run a task with the elves
py core/cli.py task "Solve series RLC circuit with R=20, L=5mH, C=2.2uF"

# Trigger the Night Shift (processes all files in workspace/inbox/)
py core/cli.py nightshift

# Switch between API mode and Sovereign Local offline mode
py core/cli.py mode local
py core/cli.py mode api

# Store an API key in the on-drive encrypted vault
py core/cli.py vault gemini YOUR_API_KEY_HERE
```

---

## 📁 Repository Directory Layout

```text
AIDRIVE/
├── START_AIDRIVE.bat                   # 1-Click Windows USB CLI launcher
├── START_AIDRIVE.sh                    # 1-Click Linux/macOS launcher
├── autorun.inf                         # USB Auto-run branding
├── README.md                           # Master repository documentation
├── LICENSE                             # MIT License
├── .gitignore                          # Standard clean Git ignore rules
│
├── core/                               # Core AIDRIVE System Engine
│   ├── config.py                       # Configuration & USB root paths
│   ├── engine.py                       # Shoemaker Orchestrator & Night Shift loop
│   ├── sandbox.py                      # Virtual filesystem & path sanitizer
│   ├── permissions.py                  # Host permission gatekeeper & audit trail
│   ├── vault.py                        # Portable encrypted API key vault
│   ├── cli.py                          # Interactive terminal CLI
│   ├── agents/                         # The 5 Shoemaker Elves
│   │   ├── maestro.py                  # Lead Orchestrator
│   │   ├── turing.py                   # C code & algorithms
│   │   ├── ohm.py                      # ECE circuits & digital logic
│   │   ├── scribe.py                   # Lab documentation & study notes
│   │   └── gatekeeper.py               # Security & sandbox perimeter
│   ├── providers/                      # Dual-Engine Inference Abstraction
│   │   ├── cloud_provider.py           # Gemini, Groq, OpenAI, DeepSeek, Claude
│   │   ├── local_provider.py           # Ollama, llama.cpp
│   │   └── offline_symbolic.py         # 100% Offline symbolic rule engine
│   └── ece_toolkit/                    # First-Year ECE Lab Calculators
│       ├── circuits.py                 # Ohm, KCL, KVL, Thevenin, RLC solver
│       ├── digital_logic.py            # Truth tables & Boolean minimizer
│       └── c_analyzer.py               # C syntax & pointer static inspector
│
├── workspace/                          # Sandboxed USB Workspace
│   ├── inbox/                          # Drop tasks & questions here at dusk
│   ├── active/                         # Current tasks being worked on
│   ├── completed/                      # Finished deliverables with craftsmanship seals
│   ├── samples/                        # Pre-packaged test exercises
│   └── quarantine/                     # Suspicious or blocked items
│
├── docs/                               # Conceptual & Strategic Documentation
│   ├── GENESIS_VISION_REPORT.md        # The Shoemaker philosophy & sandbox taxonomy
│   ├── STARTUP_360_MASTER_BLUEPRINT.md # Hardware pen drive specs, BOM, and roadmap
│   └── BIT_SATHY_ECE_SURVIVAL_GUIDE.md # 1st Year ECE Midterm Revision Sheet
│
└── tests/                              # Zero-Dependency Verification Suite
    ├── test_sandbox.py                 # Sandbox boundary security tests
    ├── test_permissions.py              # Permission request/grant/deny tests
    ├── test_ece_toolkit.py             # ECE mathematical solver tests
    ├── test_agents.py                  # Agent decomposition & execution tests
    └── run_tests.py                    # Master test runner (15/15 tests passing)
```

---

## 🧪 Verification & Quality Testing

Run the automated test suite anytime with zero external packages:
```bash
py tests/run_tests.py
```
Output:
```text
====================================================================
      [AIDRIVE] TEST SUITE: ZERO-DEFECT QUALITY VERIFICATION       
====================================================================
Ran 15 tests in 8.772s

OK
✅ ALL TESTS PASSED! AIDRIVE is solid, secure, and ready for deployment.
```

---

## 🎓 Origin & Academic Context

Conceived and developed by a **First-Year ECE Student** at **Bannari Amman Institute of Technology (BIT Sathy)**.  
Built to solve real-world lab constraints: firewalled college networks, air-gapped exam halls, restricted administrator rights, and automated night-shift learning assistance.
