# AGENTS.md

本文件指导 **Codex、Antigravity 等非-Claude AI** 在 `heliangos` 中工作。

## 必读入口

1. 开始任务前读取 [README.md](README.md)，确认仓库定位、模块和文档职责。
2. 记录聊天、建立联系人或处理跨仓库派生事实时，读取 [ai/wechat-workflow.md](ai/wechat-workflow.md)。
3. 起草、修改或审阅微信回复时，读取 [ai/wechat-writing-style.md](ai/wechat-writing-style.md)。
4. 仅当用户明确要求 commit 或 push 时，读取 [ai/git-workflow.md](ai/git-workflow.md)。

## Codex & Antigravity 专用补充

### 配置位置

- **Codex**：[.codex/](.codex/) 下存放 `agents/*.toml`、`hooks.json` 和 Hook 配置。
- **跨工具技能**：[.agents/skills/](.agents/skills/) 下存放 `wechat-work-style` 与 `wechat-log-and-route`。

### Hook

[.codex/hooks.json](.codex/hooks.json) 配置 `PreToolUse` 钩子，拦截 computer-use 的键盘输入与批量动作（`type`、`key`、`hold_key`、`computer_batch`、`teach_batch`、`teach_step`）。脚本复用 [.claude/hooks/block-wechat-automation.ps1](.claude/hooks/block-wechat-automation.ps1)，确保 AI 不替用户输入或发送微信消息。

### 中文 Markdown 编码

编辑中文文档时保持 UTF-8；使用 PowerShell 整体读写文件时必须显式指定 `-Encoding UTF8`，修改后检查乱码和 Mojibake。
