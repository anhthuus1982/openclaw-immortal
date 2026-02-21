---
name: openclaw-immortal
description: Make your OpenClaw AI companion immortal with hybrid memory (Kronos + Neural), auto-backup to GitHub every 2 hours, and instant restore. Never lose your AI's memory, skills, or conversation history again. Use when setting up new OpenClaw workspace, migrating from old machine, or creating backup system.
metadata:
  version: 1.0.0
  author: anhthuus1982
  tags: [openclaw, backup, memory, kronos, immortal, restore, github]
  license: MIT
---

# 🧬 OpenClaw Immortal

**Make your AI companion truly immortal.**

Never lose your AI's memory, skills, or conversation history again. Setup complete backup system with hybrid memory (Kronos + Neural) and auto-push to GitHub.

## 🎯 What This Solves

**Problem:** You spend weeks/months training your AI companion, building skills, creating memories... then your VM crashes or you need to reinstall. **Everything is lost.**

**Solution:** 
- ✅ Hybrid memory system (3 layers)
- ✅ Auto-backup every 2 hours to GitHub
- ✅ One-command restore
- ✅ 878+ skills included
- ✅ Immortal AI companion

## 🚀 Quick Start

### Step 1: Create GitHub Repository

1. Go to https://github.com/new
2. Name: `openclaw-companion` (or any name)
3. Private: Yes (recommended)
4. Check "Initialize with README"
5. Click Create

### Step 2: Run Setup Script

```bash
curl -sSL https://raw.githubusercontent.com/anhthuus1982/openclaw-immortal/main/install.sh | bash
```

Or manually:

```bash
# Clone this skill
git clone https://github.com/anhthuus1982/openclaw-immortal.git ~/.openclaw/workspace/skills/openclaw-immortal

# Run setup
cd ~/.openclaw/workspace/skills/openclaw-immortal
./scripts/setup.sh
```

### Step 3: Configure GitHub

```bash
# Set your GitHub repo
./scripts/config.sh --repo https://github.com/YOUR_USERNAME/openclaw-companion.git

# Add your token
./scripts/config.sh --token YOUR_GITHUB_TOKEN
```

### Step 4: Enjoy Immortality

That's it! From now on:
- Auto-backup every 2 hours
- Push only when changes detected (saves tokens)
- One-command restore if machine dies

## 🧠 Hybrid Memory System

### Three Layers:

| Layer | Type | Use Case | Speed |
|-------|------|----------|-------|
| **Kronos** ⚡ | Pointer + Vector | Fast lookup, token-efficient | ~50-1000 tokens |
| **Neural** 🧠 | Graph (Docker) | Causal reasoning, associations | ~500-2000 tokens |
| **File** 📁 | Markdown | Long-term storage, portable | Full file |

### How It Works:

```
User Query
    │
    ├───→ Kronos (Pointer) ───→ Match? ───→ ✅ Return (50 tokens)
    │                                 │
    └───→ No match ───→ Neural (Vector) ───→ ✅ Return (1000 tokens)
                                              │
                                              └───→ Store to File
```

**Result:** 80-90% token savings vs reading full memory files!

## 💾 Backup System

### Auto-Backup Schedule:

```
Every 2 hours: 00:00, 02:00, 04:00, 06:00...
```

### What Gets Backed Up:

- ✅ All 878+ skills
- ✅ Memory files (SOUL.md, USER.md, MEMORY.md)
- ✅ Kronos database (SQLite + ChromaDB)
- ✅ Neural Memory (Docker volume)
- ✅ Task tracking (active.md, backlog.md)
- ✅ Project files

### Smart Backup:

- Only pushes when changes detected
- Skips if no changes (saves tokens)
- Detailed logs in `~/.openclaw/logs/backup.log`

## 🔄 Restore (When Machine Dies)

### One-Command Restore:

```bash
curl -sSL https://raw.githubusercontent.com/anhthuus1982/openclaw-immortal/main/restore.sh | bash -s -- YOUR_GITHUB_REPO
```

Or manually:

```bash
# On new machine
git clone https://github.com/YOUR_USERNAME/openclaw-companion.git ~/.openclaw/workspace

# Restore dependencies
~/.openclaw/workspace/skills/openclaw-immortal/scripts/restore.sh

# Done! Your AI companion lives again!
```

### What Gets Restored:

- ✅ Complete workspace
- ✅ All skills (878+)
- ✅ Memory systems (Kronos + Neural)
- ✅ Task history
- ✅ Configuration

**Time:** ~2-5 minutes

## 📊 Comparison

| Without Immortal | With Immortal |
|-----------------|---------------|
| VM dies = Lose everything | VM dies = 2 min restore |
| Start from scratch | Continue where left off |
| Re-train AI companion | AI remembers everything |
| Lose weeks of work | Never lose anything |

## 🎓 How It Works (Technical)

### Architecture:

```
OpenClaw
    │
    ├───→ Skills (878)
    │
    ├───→ Memory Layer 1: Kronos (Pointer-based RAG)
    │       ├─ SQLite (metadata)
    │       └─ ChromaDB (vectors)
    │
    ├───→ Memory Layer 2: Neural (Docker)
    │       └─ Graph-based associative memory
    │
    ├───→ Memory Layer 3: File
    │       └─ Markdown files
    │
    └───→ Backup → GitHub (auto every 2h)
```

### Token Efficiency:

| Operation | Traditional | Immortal | Savings |
|-----------|-------------|----------|---------|
| Read memory | 5,000 tokens | 100 tokens | 98% |
| Search | 2,000 tokens | 300 tokens | 85% |
| Context | Full file | Relevant chunks | 80% |

## 🛠️ Commands

### Daily Usage:

```bash
# Manual backup
~/.openclaw/workspace/skills/openclaw-immortal/scripts/backup.sh

# Check status
~/.openclaw/workspace/skills/openclaw-immortal/scripts/status.sh

# View logs
tail -f ~/.openclaw/logs/backup.log
```

### Memory Operations:

```bash
# Query Kronos
kronos-query "user preferences"

# Query Neural
docker exec neural-memory nmem recall "why decision"

# Index new memory
kronos-index memory/2026-02-21.md
```

## 📁 File Structure

```
~/.openclaw/workspace/
├── skills/
│   ├── openclaw-immortal/
│   │   ├── scripts/
│   │   │   ├── setup.sh
│   │   │   ├── backup.sh
│   │   │   ├── restore.sh
│   │   │   └── status.sh
│   │   └── README.md
│   ├── kronos-memory/
│   ├── neural-memory-docker/
│   └── ... (878 skills total)
├── memory/
│   ├── SOUL.md
│   ├── USER.md
│   └── YYYY-MM-DD.md
├── tasks/
│   ├── active.md
│   └── completed/
└── projects/
```

## 🔒 Security

- GitHub token stored with chmod 600 (only owner readable)
- Token auto-removed from URLs after push
- Private repos recommended
- No sensitive data in logs

## 🤝 Contributing

Found a bug? Have an improvement?

1. Fork the repo
2. Create branch: `git checkout -b feature/amazing`
3. Commit: `git commit -m 'Add amazing feature'`
4. Push: `git push origin feature/amazing`
5. Open Pull Request

## 📜 License

MIT - Feel free to use, modify, share!

## 🙏 Credits

- Inspired by Kronos memory system
- Built for OpenClaw community
- Made with ❤️ by anhthuus1982

---

**🧬 Make your AI companion immortal today!**

GitHub: https://github.com/anhthuus1982/openclaw-immortal
