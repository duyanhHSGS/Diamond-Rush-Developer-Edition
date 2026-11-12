#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"
mkdir -p build
rm -rf -- build/classes
mkdir -p build/classes
export CLASSPATH=/usr/local/share/java/freej2me.jar

# JDK tools must be on PATH; Java ME APIs must be on CLASSPATH.
javac -source 7 -target 7 -encoding UTF-8 -d build/classes src/*.java

jar_name="$(sed -n 's/^MIDlet-Jar-URL: //p' 'Application Descriptor' | tr -d '\r')"
jad_name="${jar_name%.jar}.jad"

{
    printf 'Manifest-Version: 1.0\n'
    grep -v '^MIDlet-Jar-URL:' 'Application Descriptor'
    printf 'MIDlet-Icon: /icon.png\n\n'
} > build/MANIFEST.MF

jar cfm "build/$jar_name" build/MANIFEST.MF -C build/classes . -C res .
cp 'Application Descriptor' "build/$jad_name"
printf 'MIDlet-Jar-Size: %s\n' "$(wc -c < "build/$jar_name")" >> "build/$jad_name"

printf 'Built: build/%s and build/%s\n' "$jar_name" "$jad_name"
