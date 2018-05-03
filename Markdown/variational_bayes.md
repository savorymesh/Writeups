---
title: Variational Bayes
---

## Variational Bayes

Suppose we have a task in which we are given some data $x$ and are looking to
model things with some latent variables $Z$ which govern our data. We will
represent this probabilistically with a very simple model:
$$
p(x, z) = p(x | z) p(z)
$$
Of course, $p(z)$ is a prior on $z$ and $p(x | z)$ is a conditional likelihood.
We do not have access to the marginal $p(x)$ (wouldn't that be nice?).

The generative process looks like

1. Sample some latent variables $z_i$ from $p(z)$
2. Use the values of $z_i$ to draw from $p(x | z)$ to get $x_i$.

Given these initial conditions, we would like to calculate the posterior
$p(z | x)$. We know from Bayes rule that this is
$$
p(z | x) = \frac{p(x, z) \times p (z)} {p(x)}.
$$  

So why can't we use compute this? Oftentimes, computing $p(x)$ turns out to be
intractable. Here, $p(x)$ is called the *evidence*. If $z$ is discrete, we must
compute
$$
\sum_{support(z)} p(x | z) p(z).
$$
As the size of $z$ increases, the difficulty of this sum grows exponentially.
For example, if we have $Z$ be Bernoulli, we must compute $2^n$ sums if $z$ is
of dimension $n$. Similarly, if $Z$ is continuous, we may have issues computing
$$
\int p(x | z) p(z) dz.
$$
Having accepted that we can't compute the posterior directly, we turn to other
methods to approximate the posterior. One way of doing so is with MCMC, where
we build a Markov chain whose stationary distribution represents our final
outcome.

<p align="center">
<img width=500 src="Images/divergence.png">
<p>

MCMC, however, is a beast to get going. I'll talk about the
Metropolis/Metropolis Hastings algorithm, since that is not only the most well
known MCMC algorithm, but also the only one I know. (The popular Gibbs sampling
is a special form of Metropolis-Hastings.) Like the accept/reject method of
sampling, Metropolis-Hastings requires the choice of proposal  distributions.
However, here, the choice of proposal is much more finicky then accept/reject.
If the variance of the proposal is not large enough, we might get highly
autocorrelated samples. If it is too small, we might get many  rejections in our
sampling. The chain may never converge in reasonable time. And so on. Properly
utilizing this method is an art in itself. And even MCMC suffers from issues of
scalability eventually.

So we want a new method of getting at the posterior. We now turn to variational
inference. Variational inference involves approximation of the posterior through
using members of a new family of distributions $Q$ for which computation is
much easier to evaluate (e.g. is tractable). We refer to $Q$ as the *variational
family*. We want to find $q^*(z | x) \in Q$ which is most similar to the true posterior $p(z | x)$. For now, we will measure this similarity/dissimilarity by
using the Kullback-Leibler divergence, although other measures are certainly
possible.

Because I'm lazy with typing, I will use $D$ to represent the Kullback-Leibler divergence. With our current formulation, this means we want $q^*(z | x)$ such
that
$$
q^*(z | x) = \text{argmin}_{q(z | x) \in Q} D(q(z|x), p(z|x)).
$$
There is a reason that the assymmetric KL-divergence is given in this order,
but I will get to that later. Our optimization problem is intrinsically linked
to a bound on the "loglihood" $\text{log } p(x)$ known as the *variational
lower bound* or the *Evidence LOwer Bound (ELBO)* :
$$
\text{log } p(x) = \text{log } \int \frac{q(z|x)}{q(z|x)} p(x,z) dz \geq
\int q(z|x)\text{ log }\frac{p(x,z)}{q(z|x)} dz = 
= \text{E}_{q(z|x)} \text{ log }\frac{p(x,z)}{q(z|x)}
$$

---

$$
D \big (q(z | x), p(z | x) \big )
= \text{E}_{q(z|x)} \text{ log }\frac{q(z|x)}{p(z|x)}
\\
= \text{E}_{q(z|x)} \text{ log }{q(z|x)} -
\text{ E}_{q(z|x)} \text{ log } {p(z|x)}
\\
= \text{E}_{q(z|x)} \text{ log }{q(z|x)} -
\text{ E}_{q(z|x)} \text{ log } {\frac{p(x|z)p(z)}{p(x)}}
$$
