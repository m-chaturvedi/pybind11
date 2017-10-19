EX_NUM=1
WITH_AD=1
export PYTHONPATH=/usr/bin/python2.7-dbg

if [ $1 -eq 1 ]; then
g++ -w -g -O0 -std=c++11 -fPIC \
	-shared -o basics.so -Wno-deprecated-declarations \
	-Wno-strict-prototypes \
	-fno-inline-small-functions \
	-I/home/chaturvedi/workspace/pybind11/include \
	-I/home/chaturvedi/workspace/eigen \
	-I/usr/include/python2.7_d \
       	`python2.7-dbg-config --cflags --ldflags` \
         ex$EX_NUM.cpp $2 $3 $4 $5
elif [ $1 -eq 2 ]; then

g++ -w -g -O0 -std=c++11 -fPIC \
	-shared -o basics.so -Wno-deprecated-declarations \
	-Wno-strict-prototypes -fno-inline-small-functions \
	-I/home/chaturvedi/workspace/pybind11-drake/include \
	-I/home/chaturvedi/workspace/eigen \
	-I/usr/include/python2.7_d \
       	`python2.7-dbg-config --cflags --ldflags` \
         ex$EX_NUM.cpp $2 $3 $4 $5

elif [ $1 -eq 3 ]; then
g++  -c -w -g -O0 -std=c++11 -fPIC \
	-Wno-deprecated-declarations \
	-Wno-strict-prototypes -fno-inline-small-functions \
	-I/home/chaturvedi/workspace/pybind11/cmake-build-debug/install/include  \
	-I/home/chaturvedi/workspace/eigen \
       	`python2.7-dbg-config --includes` \
         ex3.cpp $2 $3 $4 $5 && \

g++  -v -w -g -O0 -std=c++11 -fPIC \
	-Wno-deprecated-declarations \
	-Wno-strict-prototypes -fno-inline-small-functions \
	ex3.o \
	-L/usr/lib/x86_64-linux-gnu/ \
	-L/usr/lib -lpython2.7_d -lpthread -ldl  -lutil -lm  -Xlinker -export-dynamic \
	-Wl,-O1 -Wl,-Bsymbolic-functions \
	\
&& echo "GREAT SUCCESS" && ./a.out

else
	echo "WRONG OPTION";
	exit 1
fi
 
#&&  python2.7-dbg my_python.py $WITH_AD
