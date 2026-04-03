#!/usr/bin/env python3
from __future__ import annotations

import re
import sys
from pathlib import Path


ROOT_DIR = Path(__file__).resolve().parent.parent
MARKDOWN_LINK_RE = re.compile(r"\[[^\]]+\]\(([^)]+)\)")
REQUIRED_PATHS = [
    Path("README.md"),
    Path("CONTRIBUTING.md"),
    Path("AGENTS.md"),
    Path("LICENSE"),
    Path("SECURITY.md"),
    Path("CODE_OF_CONDUCT.md"),
    Path(".codex/INSTALL.md"),
    Path("docs/README.claude-code.md"),
    Path("docs/README.codex.md"),
    Path("docs/README.gemini.md"),
    Path(".github/ISSUE_TEMPLATE/bug_report.md"),
    Path(".github/ISSUE_TEMPLATE/skill_proposal.md"),
    Path(".github/pull_request_template.md"),
]


def iter_markdown_files() -> list[Path]:
    return sorted(path for path in ROOT_DIR.rglob("*.md") if ".git" not in path.parts)


def check_required_paths(errors: list[str]) -> None:
    for rel_path in REQUIRED_PATHS:
        if not (ROOT_DIR / rel_path).exists():
            errors.append(f"Missing required repository file: {rel_path}")


def check_markdown_links(errors: list[str]) -> None:
    for md_file in iter_markdown_files():
        text = md_file.read_text(encoding="utf-8")
        for match in MARKDOWN_LINK_RE.finditer(text):
            target = match.group(1).strip()
            if (
                not target
                or target.startswith("#")
                or "://" in target
                or target.startswith("mailto:")
            ):
                continue

            rel_target = target.split("#", 1)[0]
            target_path = (md_file.parent / rel_target).resolve()
            if not target_path.exists():
                errors.append(
                    f"Broken local markdown link in {md_file.relative_to(ROOT_DIR)}: {target}"
                )


def main() -> int:
    errors: list[str] = []
    check_required_paths(errors)
    check_markdown_links(errors)

    if errors:
        for error in errors:
            print(error)
        print("Repository documentation checks failed.")
        return 1

    markdown_files = iter_markdown_files()
    print(
        "Verified "
        f"{len(REQUIRED_PATHS)} required repository files and "
        f"{len(markdown_files)} Markdown files."
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
