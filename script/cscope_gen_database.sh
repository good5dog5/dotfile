find ./ -type f -name "*.c" -o -name "*.h" -o -name "*.cpp" > cscope.files
find /usr/include/ -maxdepth 1 -type f -name "*.[hc]" >> cscope.files

for dir in /usr/include/i386-linux-gnu/sys \
           /usr/include/i386-linux-gnu/bits 

do 
   find $dir -type f -name "*.[hc]" -o -name "*.cpp" >> cscope.files
done           

cscope -Rbq -i cscope.files
