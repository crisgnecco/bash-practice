# awk no reconoce cada arch de estos por separado sino que los toma como conjunto.
awk '{ print NR $0 }' e1 e2 e3