#!/bin/sh
filename=$1;
extname=${filename##*.};
if [ "$extname" = "cpp" ] ; then
  bname=`basename "$filename" .cpp`
  g++ -std=c++11 -Wall "$filename" -o "$bname" && ./"$bname"
elif [ "$extname" = "c" ] ; then
  bname=`basename "$filename" .c`
  gcc -std=c99 -Wall "$filename" -o "$bname" && ./"$bname"
elif [ "$extname" = "py" ] ; then
  python3 "$filename"
elif [ "$extname" = "java" ] ; then
  bname=`basename "$filename" .java`
  javac "$filename" && java "$bname"
elif [ "$extname" = "html" ] ; then
  google-chrome "$filename"
  exit
elif [ "$extname" = 'cs' ] ; then
  dotnet run
else
 echo "unsupported file type!"
fi
echo -e "\n=========================================="
read -n1 -p 'Program is complete,press any key to exit.'
