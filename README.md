<p align="center">
  <img src="assets/marcus-mascot.svg" width="180" alt="Marcus Domenicano" />
</p>

<h1 align="center">Marcus Domenicano</h1>

<p align="center">
  <img src="https://cdn.simpleicons.org/claude/c15f3c" width="32" alt="Claude" />
  &nbsp;&nbsp;<strong style="font-size:1.4em">×</strong>&nbsp;&nbsp;
  <img src="https://cdn.simpleicons.org/obsidian/7c3aed" width="32" alt="Obsidian" />
</p>

<p align="center">
  <strong>The best Claude Code agent for refactoring <code>.md</code> files inside an Obsidian vault.</strong>
  <br>
  Turn raw notes, PDFs, screenshots, web articles, and messy drafts into <br>
  structured, vault-ready documents — without losing a single word of the original.
</p>

<p align="center">
  <a href="https://docs.anthropic.com/en/docs/claude-code"><img src="https://img.shields.io/badge/built_for-Claude_Code-c15f3c?style=flat-square&labelColor=262624" alt="Claude Code"></a>
  <a href="https://obsidian.md"><img src="https://img.shields.io/badge/optimized_for-Obsidian-7c3aed?style=flat-square&labelColor=262624" alt="Obsidian"></a>
  <img src="https://img.shields.io/badge/setup-30s-faf9f6?style=flat-square&labelColor=262624" alt="Setup in 30 seconds">
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-262624?style=flat-square" alt="MIT"></a>
</p>

---

## Why Marcus

If you live in Obsidian and use Claude Code, you already know the pain: you dump raw class notes, half-broken imports, OCR'd slides, or a mess of screenshots into a note, and the vault looks terrible. Inline formatters "clean" the text but silently drop facts. Generic agents rewrite in their own voice and flatten your terminology. Manual cleanup takes hours per note.

**Marcus is the missing tool.** A Claude Code agent with one job: take anything you throw at it and produce a **finished, vault-ready `.md`** — saved directly to your Obsidian vault, named in `kebab-case`, linked with `[[wikilinks]]` to existing notes, formatted with proper Markdown, and — this is the point — **with zero information loss** and **the original author's voice preserved**.

It's the best option available for this specific job, and it was built because nothing else does it right.

### What makes it different

- **Zero information loss.** Every fact, term, and definition from the source is kept. Marcus is forbidden from summarizing, condensing, or omitting.
- **Original vocabulary is law.** Technical terms, jargon, proper nouns, and units of measurement are transcribed exactly as the author wrote them. No "simpler synonyms".
- **Mandatory topic elaboration.** Short, fragmented bullets are *never* shipped as-is — Marcus expands them into complete, navigable prose while staying in the author's tone.
- **No interpretation.** Zero opinions, zero external commentary, zero "helpful additions".
- **Obsidian-native output.** Files land in `vault/marcus/`, in `kebab-case`, with `[[wikilinks]]` to notes that already exist in your vault.
- **Works on any input.** Images, PDFs, websites, `.docx`, `.rtf`, raw text, bibliographic references — all handled through the same 10-step protocol.

---

## Install

```bash
git clone https://github.com/joshazze/marcus-domenicano.git
cd marcus-domenicano
./install.sh
```

The installer asks which mode to set up:

```
Marcus Domenicano - Installer
==============================

Choose your mode:

1) Standalone (no Obsidian — documents shown in terminal only)
2) Obsidian   (documents saved directly to your vault)

Enter 1 or 2:
```

Pick **2** for the full Obsidian workflow. The installer prompts for your vault path and wires everything into `~/.claude/CLAUDE.md`. That's it.

### Manual install

If you prefer to wire it up yourself:

| File | Use case |
|:---|:---|
| [`marcus-obsidian.md`](marcus-obsidian.md) | Saves output directly to your Obsidian vault |
| [`marcus-standalone.md`](marcus-standalone.md) | Terminal-only output, no vault integration |

Append the one you want to your Claude Code config:

```bash
cat marcus-obsidian.md >> ~/.claude/CLAUDE.md
```

If using the Obsidian file, replace `<YOUR_OBSIDIAN_VAULT_PATH>` with your vault's absolute path.

---

## Usage

Just mention Marcus in any Claude Code prompt:

```
marcus, refactor this note into a proper vault document: /path/to/raw-notes.md
```

```
marcus domenicano, turn these screenshots into a structured .md:

[drop images or paste raw content]
```

```
marcus, chart this article: https://example.com/paper
```

### Slash commands

| Command | What it does |
|:---|:---|
| `/marcus` | Process a single source — file, URL, or inline text |
| `/marcus-batch` | Refactor multiple notes or sources in one pass |
| `/marcus-review` | Re-pass an existing vault note through the full protocol |

### Name variations

Marcus answers to any of these (case-insensitive, with or without accents):

```
marcus · marcos · marco · marcu
domenicano · dominicano · domenico · dominico
marcus domenicano · marco dominicano · marcos domenicano · ...
```

---

## Supported inputs

| Type | Examples |
|:---|:---|
| Images | Screenshots, slide photos, whiteboards, diagrams |
| Documents | `.txt`, `.md`, `.docx`, `.rtf` |
| PDFs | Academic papers, textbooks, articles, handouts |
| Web | URLs, online docs, blog posts |
| References | Citations, abstracts, bibliographies |
| Raw text | Pasted notes, drafts, bullet lists |

---

## The 10-step protocol

Every document runs through the same fixed pipeline — no steps skipped:

1. **Identify the source.** Detect the input type and apply the right reading method.
2. **Full extraction.** Pull every textual and structural element — titles, lists, tables, formulas, code, captions, footnotes.
3. **Semantic analysis.** Map the topic hierarchy and flag incomplete sections.
4. **Grammar refinement.** Fix typos and punctuation only — never change meaning, never swap vocabulary.
5. **Topic elaboration.** Expand fragmented bullets into complete prose, in the author's tone.
6. **Structure layout.** Apply Markdown hierarchy — `#`, `##`, `###`, `####`.
7. **Visual enrichment.** Bold, italics, tables, code blocks, horizontal rules — mapped from the source's emphasis patterns.
8. **Vault save** *(Obsidian mode)*. Write to `vault/marcus/` in `kebab-case`, add `[[wikilinks]]` to related notes.
9. **Watermark.** Sign the document with the run date.
10. **Deliver.** Show the final Markdown and confirm the save path.

### The rules Marcus cannot break

- Never summarize, condense, or omit source content
- Never deliver fragmented topics without elaboration
- Never rewrite in a way that alters meaning, tone, or intent
- Never replace the author's terminology with synonyms
- Never inject external information, opinions, or commentary

---

## Obsidian integration

When Obsidian mode is active, output lands in a `marcus/` folder inside your vault:

```
YourVault/
└── marcus/
    ├── algoritmos-de-ordenacao.md
    ├── redes-neurais-convolucionais.md
    └── estruturas-de-dados.md
```

- File names: `kebab-case`, lowercase, no accents
- `[[wikilinks]]` automatically added to notes that already exist in your vault
- You organize subfolders manually — Marcus only writes

---

## Project structure

```
marcus-domenicano/
├── README.md                 ← you are here
├── marcus-obsidian.md        ← agent spec (Obsidian mode)
├── marcus-standalone.md      ← agent spec (terminal-only mode)
├── install.sh                ← installer
├── assets/
│   └── marcus-mascot.svg     ← the pirate mascot
└── LICENSE                   ← MIT
```

---

## Contributing

Pull requests are welcome. Areas that would most benefit:

- New slash commands for specific Obsidian workflows
- Better wikilink detection heuristics
- Additional input types (e.g. Jupyter notebooks, EPUB)
- Refinements to the elaboration strategy for specific domains

---

## License

[MIT](LICENSE).

---

<p align="center">
  <sub>Content refiner for Claude Code × Obsidian — est. 2026</sub>
</p>
