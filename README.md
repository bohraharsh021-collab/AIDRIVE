# 👞 AIDRIVE: The Portable Sovereign Agentic Workspace
### *A Sandboxed, Dual-Engine Multi-Agent Runtime for USB Drives*

[![Python: 3.9+](https://img.shields.io/badge/Python-3.9%2B-blue.svg)](https://www.python.org/)
[![Offline: 100% Air--Gapped](https://img.shields.io/badge/Mode-100%25%20Offline%20Capable-purple.svg)](#dual-engine-architecture)
[![Architecture: Multi--Agent Sandbox](https://img.shields.io/badge/Architecture-Isolated%20Agentic%20Sandbox-emerald.svg)](#architecture-overview)

---

## 🌟 The Vision: The Elves & The Shoemaker

In the classic fairy tale of the Shoemaker, the craftsman cuts his leather at dusk, leaves it on his workbench, goes to sleep, and wakes at dawn to find finished, exquisitely crafted shoes.

**AIDRIVE** applies this paradigm to any engineering, research, and knowledge workflow:
> **You plug your pen drive into any computer, drop your complex tasks, codebases, or analytical questions into `workspace/inbox/`, go to sleep or step away, and wake up to completed code, analytical models, and formatted reports in `workspace/completed/`.**

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
|  |             Zero-dependency, works on any terminal or host PC           |  |
|  +-------------------------------------------------------------------------+  |
|                                                                               |
|  +-------------------------------------------------------------------------+  |
|  |                     MAESTRO (Lead Orchestrator)                         |  |
|  +-------------------------------------------------------------------------+  |
|         |                      |                     |              |         |
|         v                      v                     v              v         |
|  +-------------+        +-------------+       +-------------+  +------------+ |
|  | ELF TURING  |        |   ELF OHM   |       | ELF SCRIBE  |  | GATEKEEPER | |
|  | (Software)  |        | (Analytics) |       | (Docs/RFCs) |  | (Security) | |
|  +-------------+        +-------------+       +-------------+  +------------+ |
|                                                                               |
|  +-------------------------------------------------------------------------+  |
|  |                        DUAL INFERENCE ENGINE                            |  |
|  |  [Mode A: Cloud API Provider]       [Mode B: Sovereign Local Provider]  |  |
|  |  - Gemini 1.5/2.0                   - Ollama / llama.cpp HTTP           |  |
|  |  - Groq Llama 3.3                   - Offline Symbolic & Rule Engine    |  |
|  |  - OpenAI GPT-4o                    - AST & Logic Analysis (0 Internet) |  |
|  +-------------------------------------------------------------------------+  |
|                                                                               |
|  +-------------------------------------------------------------------------+  |
|  |                        ISOLATED SANDBOX FS                              |  |
|  |  workspace/inbox/  -->  workspace/active/  -->  workspace/completed/   |  |
|  +-------------------------------------------------------------------------+  |
+-------------------------------------------------------------------------------+
```

---

## 👥 The Five Generalist Agents

| Agent | Role | Domain & Specialization |
|---|---|---|
| 👑 **Elf Maestro** | Lead Orchestrator & Strategist | Analyzes incoming goals, decomposes complex tasks into multi-phase execution plans, delegates to specialized agents, and verifies overall craftsmanship. |
| 💻 **Elf Turing** | Software Engineer & Algorithm Architect | Polyglot software development (Python, TypeScript, C/C++, Rust, Go, SQL), clean architecture, algorithm optimization, and automated debugging. |
| ⚡ **Elf Ohm** | Quantitative & Systems Analyst | Mathematical modeling, quantitative analysis, logical reasoning, systems engineering, symbolic computation, and physical computing. |
| 📝 **Elf Scribe** | Technical Documentation & Synthesis | Produces publication-ready Markdown whitepapers, technical specifications, executive summaries, API documentation, and changelogs. |
| 🛡️ **Elf Gatekeeper** | Security Sentinel & Boundary Guardian | Guards the host filesystem perimeter. Intercepts external read/write attempts, prompts the user for explicit authorization, and maintains the cryptographic audit trail. |

---

## ⚡ Dual-Engine Architecture

1. **Cloud API Engine ("Online Mode")**:
   - High-reasoning cloud models: Google Gemini, Groq (Llama 3.3), OpenAI, DeepSeek, Anthropic.
   - Keys are stored in a portable encrypted vault (`core/vault.dat`) on the USB drive, leaving **zero credentials on host machines**.
2. **Sovereign Local Engine ("100% Air-Gapped Mode")**:
   - **Zero internet required.**
   - Connects to local Ollama or llama.cpp inference servers when available.
   - Automatically falls back to built-in **Symbolic Reasoning & Rule Engines** (AST inspection, symbolic mathematics, logic solvers) to operate completely offline in air-gapped environments.

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
# View system status and active agents
py core/cli.py status

# Submit a task to the agent workforce
py core/cli.py task "Design a high-throughput async queue in Python and document its architecture"

# Trigger the autonomous Night Shift (processes all files waiting in workspace/inbox/)
py core/cli.py nightshift

# Switch between Cloud API mode and Sovereign Local offline mode
py core/cli.py mode local
py core/cli.py mode api

# Store an API key securely in the encrypted on-drive vault
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
├── .gitignore                          # Standard clean Git ignore rules
│
├── core/                               # Core AIDRIVE System Engine
│   ├── config.py                       # Configuration & USB root paths
│   ├── engine.py                       # Shoemaker Orchestrator & Night Shift loop
│   ├── sandbox.py                      # Virtual filesystem & path sanitizer
│   ├── permissions.py                  # Host permission gatekeeper & audit trail
│   ├── vault.py                        # Portable encrypted API key vault
│   ├── cli.py                          # Interactive terminal CLI
│   ├── agents/                         # The 5 Specialized Generalist Agents
│   │   ├── maestro.py                  # Lead Orchestrator
│   │   ├── turing.py                   # Software Engineer & Architect
│   │   ├── ohm.py                      # Quantitative & Systems Analyst
│   │   ├── scribe.py                   # Technical Documentation & Synthesis
│   │   └── gatekeeper.py               # Security & sandbox perimeter
│   ├── providers/                      # Dual-Engine Inference Abstraction
│   │   ├── cloud_provider.py           # Gemini, Groq, OpenAI, DeepSeek, Claude
│   │   ├── local_provider.py           # Ollama, llama.cpp
│   │   └── offline_symbolic.py         # 100% Offline symbolic rule engine
│   └── ece_toolkit/                    # Built-in Computational Calculators
│       ├── circuits.py                 # Mathematical circuit & network solver
│       ├── digital_logic.py            # Truth tables & Boolean logic minimizer
│       └── c_analyzer.py               # Static code analyzer & syntax inspector
│
├── workspace/                          # Sandboxed USB Workspace
│   ├── inbox/                          # Drop tasks & files here at dusk
│   ├── active/                         # Current tasks being worked on
│   ├── completed/                      # Finished deliverables with craftsmanship seals
│   ├── samples/                        # Pre-packaged sample tasks
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
    ├── test_ece_toolkit.py             # Mathematical & computational solver tests
    ├── test_agents.py                  # Agent decomposition & execution tests
    └── run_tests.py                    # Master test runner
```

---

## 🧪 Verification & Quality Testing

Run the automated test suite anytime with zero external packages:
```bash
py tests/run_tests.py
```

---

## 🌐 Evolution & Scope

Conceived as a portable, self-contained AI runtime, **AIDRIVE** is designed as a universal, generalist agentic workspace for developers, engineers, researchers, and professionals who require autonomous problem-solving, local sovereignty, and strict host security.
