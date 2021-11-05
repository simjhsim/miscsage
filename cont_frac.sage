# cont_frac.sage

# Description: Variations of continued fraction algorithms


# neg_cont_frac produces continued fractions with negative signs
def neg_cont_frac(x,prec):
	iters = []
	alpha = x
	for i in range(prec):
		iters.append(ceil(alpha))
		if (alpha == ceil(alpha)):
			alpha = 0
			break
		else:
			alpha = 1 / (ceil(alpha) - alpha)
	if alpha != 0:
		iters.append(alpha)
	return iters



def neg_cont_paths(x):
	iterations = neg_cont_frac(x,1000)
	prev = [0,1]
	next = [-1,0]
	buff = [0,0]

	steps = [next]

	for i in iterations:
		buff[0] = i * next[0] - prev[0]
		buff[1] = i * next[1] - prev[1]
		prev = next
		next = buff
		steps.append(buff)
	return steps



