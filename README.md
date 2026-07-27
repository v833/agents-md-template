# AGENTS.md 项目模板

一个可直接用于新项目的 GitHub Template Repository，为 Codex、Claude Code、Cursor、GitHub Copilot 和 Gemini CLI 提供统一的仓库级协作规则。

核心原则：

1. `AGENTS.md` 是导航地图，不是项目百科全书。
2. 信息按任务渐进式披露，不在启动时一次性灌入全部上下文。
3. 关键规则由测试、lint、类型系统和 CI 执行，而不是反复依赖文字提醒。
4. 仓库内已版本化的代码、文档、计划和验证结果是事实来源。

## 创建新项目

点击仓库页面的 **Use this template**，创建新仓库。第一次让 Agent 工作时，可以直接使用下面的提示：

```text
这是从 agents-md-template 创建的新项目。请先按照 AGENTS.md 的“首次初始化”流程检查仓库，列出可以自动填写的事实、仍需我确认的问题以及准备删除的无效文档入口。得到确认后更新 AGENTS.md，并运行初始化检查。
```

首次初始化完成后运行任一检查：

```powershell
pwsh -File ./scripts/check-template.ps1
```

```bash
bash ./scripts/check-template.sh
```

新仓库中的 GitHub Actions 也会检查 `<填写>` 是否已经清理。源模板仓库本身会跳过该检查。

## 包含内容

```text
AGENTS.md                         # 权威项目规则
CLAUDE.md                         # Claude Code 薄适配
GEMINI.md                         # Gemini CLI 薄适配
.cursor/rules/agents-md.mdc       # Cursor 薄适配
.github/copilot-instructions.md   # GitHub Copilot 薄适配
.github/workflows/template-check.yml
scripts/check-template.ps1
scripts/check-template.sh
docs/exec-plans/
├── README.md
├── active/
└── completed/
LICENSE
```

工具专属文件不复制完整规则，只指向根目录 `AGENTS.md`，避免多个版本逐渐分叉。

## 定制原则

- 只保留大多数任务都会使用、且无法从代码可靠推断的信息。
- 删除不存在且不需要的文档入口，不为空目录编写装饰性文档。
- 把安装、启动、相关测试和完整验证命令写成可直接执行的准确语法。
- 每个“不要”都提供正确替代路径和原因。
- 模块专属规则放到对应子目录的 `AGENTS.md`。
- Agent 反复犯同一种错误时，优先增加测试、lint 或脚本。

## 许可证

本模板使用 [MIT License](LICENSE)。

## 参考资料

- [OpenAI：Harness Engineering](https://openai.com/zh-Hans-CN/index/harness-engineering/)
- [AGENTS.md](https://agents.md/)
