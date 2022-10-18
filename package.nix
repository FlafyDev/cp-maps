{ lib, runCommandLocal, makeWrapper, libsixel }:

runCommandLocal "cp-maps.sh"
{
  script = ./cp-maps.sh ;
  nativeBuildInputs = [ makeWrapper ];
} ''
  makeWrapper $script $out/bin/cp-maps \
    --prefix PATH : ${lib.makeBinPath [ libsixel ]} \
    --add-flags "${./images}"
''
