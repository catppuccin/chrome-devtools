rm -r themes
mkdir themes
for flavor in "latte" "frappe" "macchiato" "mocha"; do
  for accent in "rosewater" "flamingo" "pink" "mauve" "red" "maroon" "peach" "yellow" "green" "teal" "sky" "sapphire" "blue" "lavender"; do
    echo generating: $flavor $accent
    mkdir themes/${flavor}_${accent}
    ln -s ../../template/images ../../template/devtools.html ../../template/devtools.js themes/${flavor}_${accent}/
  done
done
whiskers template/manifest.json.tera
whiskers template/devtools.css.tera
