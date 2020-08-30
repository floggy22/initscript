#tested under centos7
#input with spaces
readarray  arr < <(find . -type f )

#output did not work correct
for path in "${arr[@]}"; do echo $path; done

find . -type f -print0 | while read -d $'\0' fn; do md5sum "$fn"; done

#array has wrong CR
readarray arr < <(find . -type f -print0 | while read -d $'\0' fn; do echo "$fn"; done)

#debug
printf '[%s]\n' "${arr[@]}"
