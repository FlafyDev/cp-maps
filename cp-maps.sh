length=145
index=$(($RANDOM % $length)) 
name=$(cat maps.json | jq -r "keys | .[$index]")
link=$(cat maps.json | jq -r ".\"${name}\"")

# echo $link
wget -q -O- $link | img2sixel
# echo $name
