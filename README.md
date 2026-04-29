
# med-ELIZA Archive

**Medical English Linking Keywords Finder for PubMed Zipped Archive**

ELIZA cgi-bash version **rev. 1.91**

![License](https://img.shields.io/badge/License-MIT-blue.svg)
![Language](https://img.shields.io/badge/Language-Bash%20%2B%20Awk-green.svg)

---

## Overview

**med-ELIZA** is a fast keyword association search tool for the entire PubMed abstract corpus.

It works on the PubMed Zipped Archive (text format) and provides **four-level search**:

- **KWIC** — Keyword In Context (with frequency of neighboring words)
- **InLine** — Multiple keywords appearing in the **same sentence**
- **Multi** — Multiple keywords appearing in the **same abstract**
- **Link** — Analysis of associated / co-occurring words

Extremely useful for medical paper writing, literature reviews, and terminology research.

---

## Features

- Lightweight CGI written in pure **Bash + Awk** (no external database required)
- Private per-user cache (`/tmp/`)
- Ajax UI with jQuery
- Integration with WordNet and Gene dictionary
- Triplet words and Verb dictionary support
- Strict / Loose search mode
- History and restore function

---

## File Structure

```bash
med-eliza/
├── pd-cgi                  # Main script (needs execute permission)
├── pd.conf.example         # Configuration template
├── install.sh              # Installation script
├── README.md
├── LICENSE
├── docs/
│   └── architecture.md     # Detailed architecture (optional)
├── scripts/                # Optional update scripts
└── pubmedxml/              # ← Put your PubMed *.txt files here
```

---

## Quick Start

### 1. Clone the repository

```bash
git clone https://github.com/yourname/med-eliza-archive.git
cd med-eliza-archive
```

### 2. Install

```bash
chmod +x install.sh
./install.sh
```

### 3. Configuration

```bash
cp pd.conf.example pd.conf
# Edit pd.conf (especially XMLDIR)
```

### 4. Place PubMed Data

Put your files in the `pubmedxml/` directory:

- pubmed*.txt (converted PubMed Zipped Archive)
- gene-utf8.txt (optional)

### 5. Deploy on Apache (example)

```bash
sudo cp pd-cgi /usr/lib/cgi-bin/pd-cgi
sudo cp pd.conf /usr/lib/cgi-bin/pd.conf
sudo chmod 755 /usr/lib/cgi-bin/pd-cgi
sudo systemctl restart apache2
```

Then access: http://your-server/cgi-bin/pd-cgi

---

## License

MIT License (free to use, modify, and distribute)

---

## Original Site

[https://med-eliza.pw/](https://med-eliza.pw/) (scheduled to close in 2026)

---

## Author

- **lapidem** (Qus)
- Years: 2019–2025

---

## Contribution

This repository is an **archive** for long-term preservation. Bug reports and Pull Requests are welcome!

---

**Enjoy powerful medical literature search with ELIZA!** 🧬📚