---
name: build_cv_coverletter
description: Generate a polished CV and cover letter using the 4-step workflow (READ → MATCH → PROVE → POLISH)
---

Generate a polished CV and cover letter using the 4-step workflow.

INPUTS:
- CV: $1
- Job Description: $2

PLAYBOOKS (always follow these rules):
- CV rules: playbooks/cv_analysis.md (4 sections, 3 rules, bullet formula)
- Cover Letter rules: playbooks/cover_letter_analysis.md (Hook → Proof → Pattern → Practical)

PDF FORMAT RULES (always follow these rules when generating 03_polished_cv.pdf):
- Use pure Typst (no pandoc) — compile with `typst compile cv.typ 03_polished_cv.pdf`
- Start from `playbooks/cv_template.typ`, substitute `{{NAME}}` with name from $1
- Name as a level-1 heading: `= {{NAME}}` (same style as section headings)
- Three-line header: name / contact line / tagline (italic)
- Escape `@` as `at` in email addresses; escape `$` as `USD` (Typst treats $ as a variable reference)
- Margins: `#set page(margin: (top: 0.6in, bottom: 0.6in, left: 0.5in, right: 0.5in))`

SECTION ORDER (in cv_body.typ):
1. About Me — skills only, no accomplishments
2. Education — MSc and BSc each on their own line (append `\` after each line except the last in a group)
3. Honors & Awards — as bullet list
4. Experience — level-2 headings for each role
5. Projects — each project gets its own level-2 heading line (like Experience entries), with bullets underneath

LINE BREAK RULES:
- Each stacked entry on its own line with `\` at the end (Typst hard line break)
- About Me categories: `Programming: ... \` (each category ends with `\`)
- Education: `MSc ... \` then `BSc ...` on next line (no `\` after BSc)
- Full-sentence bullets use dashes `- ` at the start

BULLET RULES:
- Full-sentence bullets, no arrows, no bold inside bullets
- Project bullets use dashes `- ` with full sentence descriptions; each project is introduced with its own level-2 heading line (same format as Experience entries)
- Honor bullets use dashes `- `

STEPS:

Step 1 — READ: Extract employer needs from the JD
Read $2 and identify:
- 3 critical responsibilities
- 5 essential skills
- Key business outcomes
- Seniority signal

Step 2 — MATCH: Find gaps and strengths in your CV vs JD
Read $1 and compare to the JD analysis. Identify:
- Best fits (experience that maps to JD requirements)
- Missing evidence (gaps)
- What to emphasize

Step 3 — PROVE: Rewrite weak CV bullets, then export to PDF
1. Rewrite each weak CV bullet using: Technique → Scale → Business Outcome — Metric
   Follow CV playbook rules: no fluff, every claim quantified, progressive scope
2. Export to PDF:
   a. Read name from `Name:` field in $1
   b. Copy `playbooks/cv_template.typ` to `outputs/cv.typ`
   c. Substitute `{{NAME}}` placeholder with the actual name
   d. Append `playbooks/cv_body.typ` content to `outputs/cv.typ`
   e. Compile with: `typst compile outputs/cv.typ outputs/03_polished_cv.pdf`
3. Consistency check before compiling:
   - No `$` symbols (use `USD` instead)
   - No bare `@` in email (use `at`)
   - No `##` headings (use `==` for level-2 headings)
   - No `**bold**` (use `*italic*` for emphasis)
   - All `\` line breaks in place for stacked items (About Me categories, Education)
   - Right-to-work only in header tagline, NOT in About Me

Step 4 — POLISH: Generate the 4-layer cover letter
Write a cover letter:
- Hook: Mirror exact job title (excluding parenthetical notes like "(Welcome Fresh Graduate)") + 2-3 core competencies from JD
- Proof: Role → Action → Metric → Outcome in every paragraph — ONE PARAGRAPH PER EXPERIENCE. Do NOT merge multiple experiences into a single paragraph. Each experience (internship, project, etc.) gets its own paragraph following the format: "At [Company], I [specific technical action with tool] that resulted in [metric] [business outcome]."
- Pattern: Cross-sector metrics → transferable capability
- Practical: Logistics + forward-looking value statement
- Format: Begin with "Dear Human Resources Manager," and end with "Yours faithfully, [Your Name]"
- Format: Do NOT include layer labels (Hook, Proof, Pattern, Practical) in the output — these are internal structure only

OUTPUT:
Save to outputs/ folder and display:
- outputs/01_jd_analysis.md
- outputs/01_jd_analysis.pdf (auto-export from .md via Typst — `##`→`==`, `**bold**`→`*italic*`, `$`→`USD`)
- outputs/02_cv_match.md
- outputs/02_cv_match.pdf (auto-export from .md via Typst — same conversion rules)
- outputs/03_polished_cv.md (5 sections: About Me → Education → Honors & Awards → Experience → Projects)
- outputs/03_polished_cv.pdf (final formatted PDF, same content as .md)
- outputs/04_cover_letter.md (4 layers: Hook → Proof → Pattern → Practical)
- outputs/04_cover_letter.pdf — compile from outputs/cover_letter.typ using Typst

All .md output files are automatically exported as .pdf using the markdown→Typst conversion rules listed above.

COVER LETTER PDF FORMAT (when generating outputs/04_cover_letter.pdf):
- Use same margins as CV: `#set page(margin: (top: 0.6in, bottom: 0.6in, left: 0.5in, right: 0.5in))`
- Header format: Name as plain text (no `=` heading), then contact line on next line — NO tagline/right-to-work line in header
- Contact line MUST include phone, email (escaped as `at`), and LinkedIn — do NOT omit contact info
- Begin with "Dear Human Resources Manager," and end with "Yours faithfully, [Your Name]"
- Do NOT use CV-style header (no level-1 heading, no italic tagline)

MARKDOWN → TYPST CONVERSION RULES (when exporting any .md file to .pdf):
- `##` (markdown level-2 heading) → `==` (Typst level-2 heading)
- `###` (markdown level-3 heading) → `===` (Typst level-3 heading)
- `**bold**` (markdown) → `*italic*` (Typst uses single `*` for emphasis)
- `$` → `USD` (escape dollar signs; Typst treats `$` as variable reference)
- `@` → `at` (escape email addresses)
- `---` → keep as-is (Typst handles horizontal rules)
- `| table |` → keep as-is (Typst handles tables natively)
- `- item` → keep as-is (bullet list)
- `1. item` → keep as-is (numbered list)

Remember: the agent handles execution. You handle judgment.
- Are the numbers real? Can you defend them in an interview?
- Does the claim survive an interview?
- Is this honest? Never invent a metric you can't defend.

WORKFLOW DISCIPLINE:
- Always create 4 tasks (Step 1–4) and mark each as completed when done — do not leave any as in_progress
- Verify all 4 tasks are checked before ending workflow (auto-reminder to self)
- Before clearing the outputs/ folder, confirm with the user first
- If any task remains in_progress, report it to user before proceeding
