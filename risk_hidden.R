###### parameters begin ########
N = 400  # just pick a value much greater than 1
alpha = 0.1  # the attacker’s relative computational power
lambda = 10  # blocks per second
d = 5  # the upper bound on the recent delay diameter in the network

waiting_time = 10
g = 100  # min(|future(x')|), where x' is x or any block in anticone(x),
         # and x is the block we want to confirm, ideally this should be
         # about waiting_time * lambda
###### parameters end ########

delta = alpha * lambda * d

Tmat = matrix(0, nrow = N, ncol = N)
for (l in 2:(N-1)) {
  Tmat[l,l-1] = 1 - alpha
  Tmat[l,l+1] = alpha
}
Tmat[N,N-1] = 1 - alpha
Tmat[N,N] = alpha
Tmat[1,1] = (1 - alpha) * exp(-delta)
Tmat[1,2] = exp(-delta) * (alpha + delta)
l = 3:(N-1)
Tmat[1,l] = dpois(l - 1, delta)
Tmat[1,N] = 1 - ppois(N - 2, delta)

library('markovchain')

mc = new('markovchain', transitionMatrix = Tmat)
station = steadyStates(mc)

print('Calculated stationary distribution')

a = (waiting_time + 2 * d) * alpha * lambda
l_vec = NULL
for (l in 1:N) {
	sum_m = 0
	for (m in 0:max(g - l, 0))
		sum_m = sum_m + dpois(m, a) * (alpha / (1 - alpha))^max(g - l - m, 0)
	sum_m = sum_m + 1 - ppois(max(g - l, 0), a)
	l_vec = c(l_vec, station[l] * sum_m)
}
risk_hidden = sum(l_vec)
print(risk_hidden)
