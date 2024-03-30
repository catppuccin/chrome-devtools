tc() { set ${*,,} ; echo ${*^} ; }
rm -r themes
mkdir themes
for flavor in "latte" "frappe" "macchiato" "mocha"; do
  for accent in "rosewater" "flamingo" "pink" "mauve" "red" "maroon" "peach" "yellow" "green" "teal" "sky" "sapphire" "blue" "lavender"; do
    echo generating: $flavor $accent
    mkdir themes/${flavor}_${accent}
    whiskers template/manifest.json.hbr $flavor -o themes/${flavor}_${accent}/manifest.json --overrides "{\"accent\":\"$(tc $accent)\"}"
    whiskers template/devtools.css.hbr $flavor -o themes/${flavor}_${accent}/devtools.css --overrides "{\"accent\":\"{{$accent}}\"}"
    cp template/devtools.html template/devtools.js themes/${flavor}_${accent}
  done
done
