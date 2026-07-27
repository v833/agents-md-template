# AGENTS.md 项目模板

这是一个面向 Codex、Claude Code、Cursor、GitHub Copilot 等编码智能体的项目指令模板。

它遵循两个原则：

1. `AGENTS.md` 是导航地图，不是项目百科全书。
2. 关键规则应尽量由测试、lint、类型系统和 CI 执行，而不是反复依赖文字提醒。

## 使用方式

点击 GitHub 仓库页面的 **Use this template** 创建新项目，然后完成以下初始化：

1. 在 `AGENTS.md` 中搜索并替换全部 `<填写>`。
2. 删除仓库中不存在、也暂时不需要的文档入口。
3. 把安装、启动、相关测试和完整验证命令写成可直接执行的准确语法。
4. 补充仅存在于团队经验中的边界、设计原因和高风险区域。
5. 将格式、命名、依赖方向等确定性规则交给自动化工具。
6. 提交前运行下面的检查，确保模板占位项已清理：

```powershell
rg --line-number "<填写>" AGENTS.md
```

没有输出才表示初始化完成。

## 推荐用法

- 根 `AGENTS.md` 只保留大多数任务都会使用的信息。
- 模块专属规则放到对应子目录的 `AGENTS.md`。
- 复杂任务使用仓库内执行计划，而不是只保留在聊天记录中。
- Agent 反复犯同一种错误时，优先增加测试、lint 或脚本。
- 定期删除过时、重复或可直接从代码推断的规则。

## 适用范围

模板不绑定语言、框架或包管理器。它不会替项目预设许可证、目录结构、CI 或技术选型；这些内容应由新项目根据实际需求决定。

参考：

- [OpenAI：Harness Engineering](https://openai.com/zh-Hans-CN/index/harness-engineering/)
- [AGENTS.md](https://agents.md/)
