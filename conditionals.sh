# Conditionals

# spaces are mandatory in bash
#Does the file exist?
if [ -e "./script1.sh" ]
then
      #echo "Tiene permisos de lectura"
      echo "The path exists"
else
      echo "The path doesn't exist"
fi

#Is it written? weight grater than 0kb
if [ -s "./script1.sh" ]
then
      #echo "Tiene permisos de lectura"
      echo "It is written"
else
      echo "It is empty"
fi

#can it read? Does ir have permissions?
if [ -r "./script1.sh" ]
then
      #echo "Tiene permisos de lectura"
      echo "It can read"
else
      echo "it cannot read"
fi