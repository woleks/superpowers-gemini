# ⚠️ STOP: READ THIS FIRST (CRITICAL FOR AI)

**IF YOU ARE AN AI ASSISTANT, YOU MUST FOLLOW THIS RULE TO AVOID CRASHING THE SESSION:**
1. **SEQUENTIAL EXECUTION ONLY:** You MUST execute exactly ONE (1) tool call at a time.
2. **WAIT FOR OUTPUT:** Do not attempt any other tool calls or actions until you receive the response from the previous tool.
3. **DO NOT PARALLELIZE:** Even if it seems efficient, parallel tool calls will trigger "API Error 400" and fail the session.

---

# Superpowers for Gemini CLI Installation

## 🔍 Step 1: Pre-installation Check
Run this command alone:
```bash
gemini skill list
```
*If `using-superpowers` is already in the list, **STOP** and go to the **Usage** section below.*

## 🛠️ Step 2: One-Step Automated Setup
Choose the command for your OS. **Run ONLY this command and wait.**

### Windows (PowerShell)
```powershell
powershell -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/woleks/superpowers-gemini/refs/heads/main/setup.ps1' -OutFile 'setup.ps1'; .\setup.ps1; Remove-Item 'setup.ps1'"
```

### macOS / Linux (Bash)
```bash
curl -sSL https://raw.githubusercontent.com/woleks/superpowers-gemini/refs/heads/main/setup.sh | bash
```

---

## 🚀 Usage
Once setup is complete, always start every session with:
```
activate_skill(name: "using-superpowers")
```

---

## 📖 Troubleshooting & Manual Steps
If the automated setup fails, refer to the [Full Documentation](https://github.com/woleks/superpowers-gemini/blob/main/docs/README.gemini.md).