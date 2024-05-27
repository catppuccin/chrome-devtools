_default:
  @just --list

outdir := "themes"

clean:
  rm -r {{ outdir }}
  mkdir {{ outdir }}

link:
  #!/usr/bin/env bash

  echo "Linking non-Whiskers template files..."

  whiskers --list-flavors -o plain | while read -r flavor; do
    whiskers --list-accents -o plain | while read -r accent; do
      mkdir "{{ outdir }}/${flavor}_${accent}"
      ln -s ../../template/images ../../template/devtools.html ../../template/devtools.js "{{ outdir }}/${flavor}_${accent}/"
    done
  done

build: clean link
  whiskers template/manifest.json.tera
  whiskers template/devtools.css.tera
