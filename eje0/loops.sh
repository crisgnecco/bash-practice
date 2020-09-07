# Loops

cont=0
while [ $cont -lt 10 ]; do
  echo $cont
  # let is a bash keyword which allows a asignation with an arithmetic expression.
  let cont=$cont+1
done


cont=10
until [ $cont -eq 0 ]; do
  echo $cont
  let cont=$cont-1
done