# One Sample t-test
# Supponiamo di avere un vettore x unidimensionale
# Vogliamo effettuare un t-test 
# a una coda di livello 1-alpha=95%
> x <- c(2928, 2997, 2689, 3081, 3011, 2996, 2962, 3007,
        3000, 2953, 2792, 2947, 3094, 2913, 3017)
> t.test(x, mu = 3010, alternative = "less")

One Sample t-test

data = x
t = -1.9031, df = 14, p-value = 0.0389
Alternative hypothesis: true mean is less than 3010
95 percent confidence interval:
-Inf 3006.211
sample estimates:
mean of x
     2959.133

> t.test(x, mu = 3010, alternative = "less", conf.lev = 0.99)

One Sample t-test

data = x
t = -1.9031, df = 14, p-value = 0.0389
Alternative hypothesis: true mean is less than 3010
99 percent confidence interval:
-Inf 3029.283
sample estimates:
mean of x
     2959.133

# Lettura: p=0.039, se alpha=1% (conf.lev=0.99) 
# allora alpha<p e quindi NON SIAMO
# AUTORIZZATI A RIFIUTARE l'ipotesi nulla; 
# se invece fissiamo alpha=5% (conf.lev=0.95)
# allora alpha>p e quindi POSSIAMO  RIGETTARE
# L'IPOTESI NULLA, e accettare l'ipotesi alternativa.
# Aumentando il livello di confidenza alpha del t-test
# si allarga l'intervallo di confidenza;
# Aumentando la dimensione campionaria n si restringe
# l'intervallo di confidenza.
# -------------------------------
# Two sample t-test
# Dobbiamo disporre di due campioni, che per questo
# esempio ci creiamo ad hoc
> nonsmokers = c(18,22,21,17,20,17,23,20,22,21)
> smokers = c(16,20,14,21,20,18,13,15,17,21)
> plot(density(nonsmokers))      
> plot(density(smokers))         
> boxplot(nonsmokers,smokers,ylab="Scores on Digit Span Task",
+         names=c("nonsmokers","smokers"),
+         main="Digit Span Performance by\n Smoking Status")
> mean(nonsmokers)
[1] 20.1
> sd(nonsmokers)
[1] 2.131770
> mean(smokers)
[1] 17.5
> sd(smokers)
[1] 2.953341

> sqrt(var(nonsmokers)/length(nonsmokers)) # standard error
[1] 0.674125
> sqrt(var(smokers)/length(smokers)) # standard error
[1] 0.9339284

# Effettuiamo un t-test con i parametri di default: due code, conf.lev=95%,
# Correzione Welch per varianze non uniformi
> t.test(nonsmokers,smokers) 

	Welch Two Sample t-test

data:  nonsmokers and smokers 
t = 2.2573, df = 16.376, p-value = 0.03798
alternative hypothesis: true difference in means is not equal to 0 
95 percent confidence interval:
 0.1628205 5.0371795 
sample estimates:
mean of x mean of y 
     20.1      17.5
# Essendo p-value<alpha si rifiuta l'ipotesi nulla, e quindi i due campioni
# NON appartengono alla stessa popolazione

# Nota bene: per default t.test() calcola la differenza sottraendo
# il secondo campione dal primo (in questo secondo esempio, 
# alternative= nonsmokers-smokers greater than 0)
> t.test(nonsmokers,smokers,alternative="greater",var.equal=T)

	Two Sample t-test

data:  nonsmokers and smokers 
t = 2.2573, df = 18, p-value = 0.01833
alternative hypothesis: true difference in means is greater than 0 
95 percent confidence interval:
 0.6026879       Inf 
sample estimates:
mean of x mean of y 
     20.1      17.5

# Con un p-value di 1.8% si rifiuta l'ipotesi nulla 
# di uguaglianza tra le medie con una maggior confidenza, e si accetta
# l'ipotesi alternativa che la media per i nonsmokers sia maggiore.
# Si noti che i gradi di libertà sono trattati diversamente
# senza la correzione richiesta per varianze non uniformi.
