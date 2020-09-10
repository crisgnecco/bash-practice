echo "+54(011)4652-2097" |
    awk '{ 
            split($0,paisyResto,"(")
            split(paisyResto[2],numProvNum,")")
    }
    END { 
            print paisyResto[1]
            print numProvNum[1]
            print numProvNum[2]      s
        }'
