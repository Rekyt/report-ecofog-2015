# report-template
Simple LaTeX report template for internships

## Structure

Each part is numbered. The references are specifically formated using `cell.bst` the reference format from **Cell** journal. Bibliography should be put into a BibTeX file named `Bibliography.bib`, it is rendered with `natbib`
Because of academic requirements, the report should be rendered with XeLaTeX so that it is in Times New Roman

## Rendering

A `Makefile` is included to render easily, with `clean`command to cleanup directory.

## Dependencies

This template uses various packages:
- `fontspec` to use custom font Times New Roman
- `geometry` to reduce the margins
- `mathtools` to get access to extended controls of equations
- `color` to be able to define custom colors
- `xcolor` to color rows of tables
- `hyperref` to transform references to links
- `natbib` to handle bibliography & references
- `caption` to have bold labels for figures
- `siunitx` to handle SI units properly

This template also include [TexCount|https://github.com/EinarAndreas/TeXcount], a tool to count words in LaTeX documents, this tool is from Einar Andreas, I didn't make it.

## Possible improvements

Use of another bibliography package, natbib does not allow for a lot of flexibility, but was used for simplicity here.
