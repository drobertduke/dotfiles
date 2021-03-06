set -e

JENV="$HOME/.jenv"
JENV_VERSIONS="$JENV/versions"

# cleanup to avoid intermittent failures from rehashing

mkdir -p "$JENV"
find "$JENV" -type f -name '*.time' -delete
rm -rf "$JENV_VERSIONS" && mkdir -p "$JENV_VERSIONS"

for java in $(find /Library/Java/JavaVirtualMachines -mindepth 1 -maxdepth 1 ! -type l); do yes | (jenv add "$java/Contents/Home" > /dev/null); done
(jenv rehash &) 2> /dev/null

