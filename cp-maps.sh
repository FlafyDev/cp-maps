dir=${1:-./images}

files=($dir/*)
img2sixel "${files[RANDOM % ${#files[@]}]}"
