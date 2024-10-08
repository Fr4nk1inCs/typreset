# Typreset (W.I.P.)

A collection of [Typst](https://typst.app) presets to provide a starting point for your writing.

Available presets:

- `font.set-font()`: Chinese & English Font support.
- `homework`: Homework template with `simple_question` and `complex_question` frame to write your homework.
- `report`: Report template to write your report.

At this time there is no manual or handbook for this project. But our `tests/` directory contains some examples of how to use this project.

## Usage

Typrest supports Typst 0.6.0 and newer.

At this time there is no release of this project. You need to manually configure your local Typst packages.

- Clone this project to `{data-dir}/typst/packages/local/typreset/0.1.0`, where `data-dir` [depends on your systems](https://github.com/typst/packages#local-packages). For example, in Linux, it is `~/.local/share/typst/packages/local/typreset/0.1.0`:

  ```bash
  mkdir -p ~/.local/share/typst/packages/local/typreset/
  git clone https://github.com/Fr4nk1inCs/typreset.git ~/.local/share/typst/packages/local/typreset/0.1.0
  ```

Then you can use the presets in your Typst project:

```typ
#import "@local/typreset:0.1.0": *
```

## Fonts

The default font family for English is [Linux Libertine](https://linuxlibertine.sourceforge.net/Libertine-EN.html). It's bundled with Typst, so you don't need to install it.

The default math font is [Libertinus](https://github.com/alerque/libertinus) Math, which you need to install manually.
For Arch-based Linux distributions, you can install it from `libertinus-font`
package in `extra` repository. You can also install it from
[its GitHub release page](https://github.com/alerque/libertinus/releases).

### Language-specific Fonts

#### Simplified Chinese

Typreset uses the [fandol](https://ctan.org/pkg/fandol) fonts as the default simplified Chinese fonts in Typreset. If you want to use these fonts, you need to [install them](https://mirrors.ctan.org/fonts/fandol.zip).
