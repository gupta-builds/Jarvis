#!/usr/bin/env bash
# verify-tar.sh <tar path>  (Build 4b, 2026-10-14)  Lists a tar with GNU tar. Prints entries=N, rc=<tar exit code>, notes=<stderr lines other than xattr notices>.
tar_path="$1"
list=$(mktemp /tmp/tar-verify-list.XXXXXX)
err=$(mktemp /tmp/tar-verify-err.XXXXXX)
tar -tf "$tar_path" > "$list" 2> "$err"
rc=$?
echo "entries=$(wc -l < "$list")"
echo "rc=$rc"
echo "notes=$(grep -vc LIBARCHIVE.xattr "$err")"
rm -f "$list" "$err"
