
awk '{ 
    for(i=1;i<=NF;i++)
        cantRepAsoc[$i]++ }

    END { 
        for(pal in cantRepAsoc){
            print pal " " cantRepAsoc[pal] > "asociativo.txt"
        }
    }' < $1 #arch en el q se quiere contar rep 

# sort list by field



 