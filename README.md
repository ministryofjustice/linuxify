# linuxify

Transparently transform the macOS CLI into a fresh GNU/Linux CLI experience by

- installing missing GNU programs
- updating outdated GNU programs
- replacing pre-installed BSD programs with their preferred GNU implementation
- installing other programs common among popular GNU/Linux distributions

You should review the script, but if you want to go back you can uninstall just
as easily as the install.

## Prerequisites Install

First install Homebrew, see https://brew.sh/

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Using brew install git

```bash
brew install git
```

## Install

```bash
git clone https://github.com/ministryofjustice/linuxify
cd linuxify/
./linuxify install
```

## Uninstall

```bash
./linuxify uninstall
```

## Install Oh-My-Zsh

See https://github.com/ohmyzsh/ohmyzsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

After run this from the root of the project to link the `.bash_aliases` again after Oh-My-Zsh install

```bash
./scripts/set_aliases
```

## Chrome bookmarks

1. Open Chrome
2. Go to [chrome://bookmarks/](chrome://bookmarks/)
3. Click ... (Top right)
4. Add new folder named 'Team bookmarks'
5. Open that folder 
6. Click ... (Top right)
7. Import bookmarks
8. [/github_bookmarks2.html](/github_bookmarks2.html)