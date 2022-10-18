file=${1:-maps.json}
length=$(cat $file | jq length)
index=$(($RANDOM % $length)) 
name=$(cat $file | jq -r "keys | .[$index]")
link=$(cat $file | jq -r ".\"${name}\"")

# echo $link
wget -q -O- $link | img2sixel
# echo $name
