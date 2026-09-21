# CV & Cover Letter AI Agent

Generate a polished CV and cover letter based on a job description — using the rules from Sections 3 & 4.

## What You Get

One slash command:
- `/build_cv_coverletter` — 4-step workflow (READ → MATCH → PROVE → POLISH), generates both the polished CV and the cover letter

## Prerequisites

### 1. Install OpenCode

OpenCode hosts the `build_cv_coverletter` command.

**Option A: Install via script (recommended)**

```bash
curl -fsSL https://opencode.ai/install | bash
```

**Option B: Install via Homebrew (macOS/Linux)**

```bash
brew install anomalyco/tap/opencode
```

**Option C: Install via npm**

```bash
npm install -g opencode-ai
```

**Verify:**

```bash
opencode --version
```

### 2. Install Typst

Typst compiles the `.typ` files into PDFs.

**Option A: Install via script**

```bash
curl -fsSL https://typst.app/install.sh | sh
```

**Option B: Install via Homebrew (macOS/Linux)**

```bash
brew install typst
```

**Option C: Download binary**

Visit [https://typst.app/download/](https://typst.app/download/)

**Verify:**

```bash
typst --version
```

### 3. Configure an LLM Provider

OpenCode requires an API key for an LLM provider (Claude, GPT, Gemini, etc.).

**Using OpenCode Zen (free):**

```bash
opencode
# Then run: /connect
```

Select `opencode` and sign in at [https://opencode.ai/auth](https://opencode.ai/auth).

---

## Project Setup

### Project structure

```
cv_cover_letter_agent/
├── .opencode/
│   └── commands/
│       └── build_cv_coverletter.md    ← command definition
├── inputs/
│   ├── experience.md                  ← your CV background
│   └── jd.md                          ← job description
├── playbooks/
│   ├── cv_analysis.md                 ← CV rules
│   ├── cover_letter_analysis.md       ← cover letter rules
│   ├── cv_template.typ                ← CV header template
│   └── cv_body.typ                    ← CV body template
├── outputs/                           ← generated files go here
├── INSTALL.md                         ← installation guide
└── README.md                          ← this file
```

### Prepare your input files

**`inputs/experience.md`** — Your raw background (as-is, no polish needed):

```
Personal Details:
Name: [Your Name]
Phone: [Your Phone]
Email: [Your Email]
LinkedIn: [Your LinkedIn URL]

Education:
- [Degree, Institution, Year — GPA/Honors]

Work Experience:
- [Company, Role, Duration]
  - [What you did]
  - [What you did]

Projects:
- [Project Name]
  - [What you did]

Skills:
- [Tools, languages, techniques]
```

**`inputs/jd.md`** — The job description: copy-paste the exact text from the posting.

---

## Quick Start

```bash
cd cv_cover_letter_agent
opencode
/build_cv_coverletter inputs/experience.md inputs/jd.md
```

Or via CLI:

```bash
opencode run "/build_cv_coverletter inputs/experience.md inputs/jd.md"
```

---

## Output

Everything saves to `outputs/`:

| File | Description |
|------|-------------|
| `01_jd_analysis.md` | What the employer needs (responsibilities, skills, outcomes, seniority) |
| `01_jd_analysis.pdf` | PDF version |
| `02_cv_match.md` | Where you fit, gaps, what to emphasize |
| `02_cv_match.pdf` | PDF version |
| `03_polished_cv.md` | Rewritten CV (5 sections: About Me → Education → Honors & Awards → Experience → Projects) |
| `03_polished_cv.pdf` | Final formatted CV PDF (compiled via Typst) |
| `04_cover_letter.md` | 4-layer cover letter (Hook → Proof → Pattern → Practical) |
| `04_cover_letter.pdf` | Compiled cover letter PDF (compiled via Typst) |

### PDF compilation details

- **CV PDF**: compiled from `outputs/cv.typ` using `typst compile outputs/cv.typ outputs/03_polished_cv.pdf`
- **Cover letter PDF**: compiled from `outputs/cover_letter.typ` using `typst compile outputs/cover_letter.typ outputs/04_cover_letter.pdf`
- **Analysis PDFs**: auto-converted from `.md` via Typst with these conversion rules:
  - `##` → `==` (level-2 heading)
  - `**bold**` → `*italic*` (emphasis)
  - `$` → `USD` (escape dollar signs)
  - `@` → `at` (escape email addresses)

---

## The 3 Rules the Agent Enforces

1. **Progressive scope** — every experience adds new skill/scope/responsibility
2. **Zero fluff** — no "highly motivated," "passionate," "passionately"
3. **Quantified claims** — every bullet has a number with a purpose

**Bullet formula:** Technique → Scale → Business Outcome — Metric

---

## The Co-Pilot Rule

The agent handles execution. You handle judgment.

- Are the numbers real? Can you defend them in an interview?
- Does the claim survive an interview?
- Is this honest? Never let AI invent a metric you can't defend.

---

## Troubleshooting

### `opencode: command not found`

OpenCode is not in your PATH. Reinstall or add it to your shell profile:

```bash
which opencode
brew install anomalyco/tap/opencode
```

### `typst: command not found`

Install Typst and verify:

```bash
brew install typst
typst --version
```

### PDF compilation fails

Test Typst with a simple document:

```bash
echo '= Hello World' > /tmp/test.typ
typst compile /tmp/test.typ /tmp/test.pdf
```

### Command not found in OpenCode

Make sure `.opencode/commands/build_cv_coverletter.md` exists in your project directory. OpenCode loads commands from this location automatically.

### No provider configured

Run `/connect` in OpenCode, or use:

```bash
opencode auth login
```

---

## Token Usage

Check your OpenCode token usage anytime:

```bash
opencode stats
```

---

## Need Help?

- OpenCode docs: [https://opencode.ai/docs](https://opencode.ai/docs)
- Typst docs: [https://typst.app/docs](https://typst.app/docs)

