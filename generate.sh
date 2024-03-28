rm -r generated
mkdir generated
for flavor in "latte" "frappe" "macchiato" "mocha"; do
  for accent in "rosewater" "flamingo" "pink" "mauve" "red" "maroon" "peach" "yellow" "green" "teal" "sky" "sapphire" "blue" "lavender"; do
    echo generating: $flavor $accent
    mkdir generated/${flavor}_${accent}
    sed "s/accent:.*/accent: \"$accent\"/" template/manifest.json.hbr | whiskers - $flavor -o generated/${flavor}_${accent}/manifest.json
    sed "s/accent:.*/accent: \"{{$accent}}\"/" template/devtools.css.hbr | whiskers - $flavor -o generated/${flavor}_${accent}/devtools.css
    cp template/devtools.html template/devtools.js generated/${flavor}_${accent}
  done
done
