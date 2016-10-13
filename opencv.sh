# Compile opencv code in command line.
# 
echo "compiling $1"
if [[ "$1 == *.c" ]]
then
    gcc -g `pkg-config --cflags opencv`  -o `dirname $1`/`basename $1 .c` $1 `pkg-config --libs opencv`;
elif [[ "$1 == *.cpp" ]]
then
    g++ -g `pkg-config --cflags opencv` -std=c++11 -std=gnu++11 -o `dirname $1`/`basename $1 .cpp` $1 `pkg-config --libs opencv`;
else
    echo "Please compile only .c or .cpp files"
fi
echo "Output file => ${1%.*}"
