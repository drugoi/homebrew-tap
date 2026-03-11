# homebrew-diddo

Homebrew tap for [diddo](https://github.com/drugoi/diddo-hooks).

## Install

```bash
brew tap drugoi/diddo
brew install diddo
```

## Publish this tap

This directory is meant to be pushed to a **separate** GitHub repo named `homebrew-diddo` under your account. Then users tap it as `drugoi/diddo` (from repo `drugoi/homebrew-diddo`).

1. Create a new repo on GitHub named **homebrew-diddo** (no need to add a README; you can push this folder).
2. From this directory:
   ```bash
   git init
   git add .
   git commit -m "Add diddo formula"
   git remote add origin https://github.com/drugoi/homebrew-diddo.git
   git push -u origin main
   ```
3. After that, the install instructions above work.

## Updating the formula on new releases

When you cut a new release (e.g. `v0.3.2`) in [diddo-hooks](https://github.com/drugoi/diddo-hooks):

1. After the release workflow has run and assets are on the [Releases](https://github.com/drugoi/diddo-hooks/releases) page, compute SHA256 for each of the four tarballs:
   ```bash
   for t in aarch64-apple-darwin x86_64-apple-darwin x86_64-unknown-linux-gnu aarch64-unknown-linux-gnu; do
     echo "$t: $(curl -sL "https://github.com/drugoi/diddo-hooks/releases/download/v0.3.2/diddo-0.3.2-${t}.tar.gz" | shasum -a 256 | awk '{print $1}')"
   done
   ```
2. In this repo, edit `Formula/diddo.rb`: update `version` and the four `sha256` values (and ensure the `url` lines use `#{version}` so they stay correct).
3. Commit, push, and optionally tag.
