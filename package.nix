{ lib, runCommandLocal, makeWrapper, libsixel, jq }:

runCommandLocal "cp-maps.sh"
{
  script = ./cp-maps.sh ;
  nativeBuildInputs = [ makeWrapper ];
} ''
  makeWrapper $script $out/bin/cp-maps \
    --prefix PATH : ${lib.makeBinPath [ jq libsixel ]} \
    --add-flags "${./maps.json}"
''
