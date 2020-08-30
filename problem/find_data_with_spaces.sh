#tested under centos7
#input with spaces
readarray  arr < <(find . -type f )

#output
for path in "${arr[@]}"; do echo $path; done
