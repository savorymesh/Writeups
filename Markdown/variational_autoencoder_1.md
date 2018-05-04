---
title: The Variational Autoencoder Part I
---

## Variational Bayes

### Problem Setup

Suppose we have a task in which we are given some data $x$ and are looking to
model things with some latent variables $Z$ which govern our data. We will
represent this probabilistically with a very simple model:
$$
p(x, z) = p(x | z) p(z)
$$
Here, $p(z)$ is a prior on $z$ and $p(x | z)$ is a conditional likelihood.
We do not have access to the marginal $p(x)$ (wouldn't that be nice?).

The generative process looks like

1. Sample some latent variables $z$ using $p(z)$
2. Use the values of $z$ to draw from $p(x | z)$ to get $x$.

Given these initial conditions, we would like to calculate the posterior
$p(z | x)$. We know from Bayes rule that this is
$$
p(z | x) = \frac{p(x, z) \times p (z)} {p(x)}.
$$  

So why can't we use compute this? Oftentimes, computing $p(x)$ turns out to be
intractable. Here, $p(x)$ is called the *evidence*. If $Z$ is discrete, we must
compute
$$
\sum_{support(Z)} p(x | z) p(z).
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

<figure align="center">
<img width=900 src="https://theclevermachine.files.wordpress.com/2012/10/metropolis2.gif">
<figcaption>Visualization of Metropolis sampler. The red line is the current
proposal distribution, while the black line is the target distribution.
From Dustin Stansbury's website.
</figcaption>
</figure>

MCMC, however, is a beast to get going. I'll talk about the
Metropolis/Metropolis Hastings algorithm, since that is not only the most well
known MCMC algorithm, but sadly also the only one I know. (The popular Gibbs
sampling is a special form of Metropolis-Hastings.) Like the accept/reject
method of sampling, Metropolis-Hastings requires the choice of proposal
distributions. However, here, the choice of proposal is much more finicky then
accept/reject. If the variance of the proposal is not large enough, we might get
highly autocorrelated samples. If it is too small, we might get many  rejections
in our sampling. The chain may never converge in reasonable time. And so on.
Properly utilizing this method is an art in itself. And even MCMC suffers from
issues of scalability eventually.

### Variational Inference

So, now we want a new method of getting at the posterior. We now turn to
variational inference. Variational inference involves approximation of the
posterior through using members of a new family of distributions $\mathcal Q$
for which computation is much easier to evaluate (e.g. is tractable). We refer
to $\mathcal Q$ as the *variational family*. We want to find $q^*(z | x) \in
\mathcal Q$ which is most similar to the true posterior $p(z | x)$. For now, we
will measure this similarity/dissimilarity by using the Kullback-Leibler
divergence, although other measures are certainly possible.

I will use $D$ to represent the Kullback-Leibler divergence. With our current
formulation, this means we want $q^*(z | x)$ such that
$$
q^*(z | x) =
\text{argmin}_{q(z | x) \in \mathcal Q} D \big (q(z|x), p(z|x) \big ).
$$
There is a reason that the assymmetric KL-divergence is given in this order, but
that's a discussion for another time. Our optimization problem is intrinsically
linked to a bound on the "loglihood" $\text{log } p(x)$ known as the
*variational lower bound* or the *Evidence Lower BOund (ELBO)*: for any $q \in
\mathcal Q$, we have
$$
\text{log } p(x) = \text{log } \int \frac{q(z|x)}{q(z|x)} p(x,z) dz \geq
\int q(z|x)\text{ log }\frac{p(x,z)}{q(z|x)} dz
= \text{E}_{q(z|x)} \text{ log }\frac{p(x,z)}{q(z|x)}.
$$
Here, Jensen's inequality has been applied to get the inequality in the middle.
You may have seen this bound before in the derivation of the EM algorithm.

Now, a simple manipulation of this bound using the identity
$p(x, z) = p(z | x) p(x)$ shows that
$$
\text{E}_{q(z|x)} \text{ log }\frac{p(x,z)}{q(z|x)}
 = \text{E}_{q(z|x)} \text{ log }{p(x)} +
\text{E}_{q(z|x)} \text{ log }\frac{p(z|x)}{q(z|x)} \\
= \text{log }p(x) - D \big (q(z|x), p(z|x) \big ).
$$
Note that we are able to remove the conditional expectation from $\text{log }
p(x)$ as it does not depend on $z$. Our final expression shows that with $p(x)$
held constant, maximizing the ELBO is equivalent to minimizing the same
KL divergence $D(q(z|x), p(z|x))$. Thus, variational inference is typically
expressed in terms of maximizing the ELBO.

## Variational Autoencoders

### Density Estimation and the ELBO

Up until now, we have been thinking in terms of posterior inference, the
traditional setting for variational Bayes. We are now going to take this one
step further. Let's say we want to maximize the log-likelihood term $\text{log }
p(x)$. We do not necessarily know $p$ in advance, so that this becomes a density
estimation problem. Direct density estimation problems are difficult, so what we
are going to do is instead maximize the ELBO in an attempt to  maximize
$\text{log } p(x)$. Let's reexamine the ELBO
$$
\text{E}_{q(z|x)} \text{ log }\frac{p(x,z)}{q(z|x)}.
$$
Because the marginal $p(x, z)$ decomposes into $p(x|z) p(z)$, we can rewrite
the ELBO as
$$
\text{E}_{q(z|x)} \text{ log }\frac{p(x|z)p(z)}{q(z|x)}.
$$
We can attach a natural interpretation to the term $p(x|z)$. This conditional
probability can be thought of as being part of the generative part of the model:
it explains what to do when given $x$ in the generative process. Moreover,  as
we have explained in the previous section, the term $q(z|x)$ is used to perform
inference on the posterior $p(z|x)$. The variational autoencoder is a technique
based around optimizing the ELBO over difference choices of $q(z|x)$ and
$p(z|x)$. That is, our objective is to find
$$
\text{max}_{p(x|z) \in \mathcal P, \ q(z|x) \in \mathcal Q}
\text{E}_{q(z|x)} \text{ log }\frac{p(x|z)p(z)}{q(z|x)}.
$$

### The Road Towards Gradient Descent

We are going to maximize the ELBO by using a combination of Monte-Carlo
integration and gradient descent, a technique known as *Black Box Variational
Inference*. Accordingly, let's begin to place the problem in a parametric
setting. We will let $p(x|z) \in \mathcal P$ by indexed by $\theta$ in $\Theta$,
and let $q(x|z) \in \mathcal Q$ be indexed by $\lambda \in \Lambda$.  Our
problem is now to find
$$
\text{max}_{\theta \in \Theta, \lambda \in \Lambda}
\text{E}_{q_\lambda (z|x)} \text{ log }\frac{p_\theta(x|z)p(z)}{q_\lambda(z|x)}.
$$
We will also assume some regularity of the ELBO in $(\theta, \lambda)$, so that
we can compute gradients and interchange integrals/expectations and derivatives.
To perform gradient descent, we of course need to be able to compute the gradient
$$
\nabla_{\theta, \lambda} \ \big [
\text{E}_{q_\lambda (z|x)} \text{ log }\frac{p_\theta(x|z)p(z)}{q_\lambda(z|x)} \big ].
$$
However, it turns out that this not so easy to compute. Let's split this into
two parts:
$$
\nabla_{\theta, \lambda} \ \big [
\text{E}_{q_\lambda (z|x)} \text{ log }\frac{p_\theta(x|z)p(z)}{q_\lambda(z|x)} \big ]
= \nabla_{\theta, \lambda} \ \big [
\text{E}_{q_\lambda (z|x)} \text{ log }p_\theta(x|z)p(z) \big ]
- \nabla_{\theta, \lambda} \ \big [
\text{E}_{q_\lambda (z|x)} \text{ log } q_\lambda(z|x) ) \big ].
$$
With very mild regularity assumptions (for Leibniz's rule), we can just push the
gradient into the expectation for the first part:
$$
\nabla_{\theta, \lambda} \ \big [
\text{E}_{q_\lambda (z|x)} \text{ log }p_\theta(x|z)p(z) \big ] =
\text{E}_{q_\lambda (z|x)} \big [ \nabla_{\theta}
\text{ log }p_\theta(x|z)p(z) \big ]
$$
and then this term can be approximated via Monte-Carlo integration. It's the
second term that gives us trouble. The quantity
$$
\nabla_{\theta, \lambda} \ \big [
\text{E}_{q_\lambda (z|x)} \text{ log } q_\lambda(z|x) ) \big ]
$$
has the expectation taken depending on $\lambda$, so that we can't push the
gradient inside the expectation.

A way we can attempt to get this around this is with a so-called "score
function estimator", named after the same score function used in Fisher
information. By evaluating the gradient term
$$\nabla_\lambda \text{ log } q_\lambda(z|x)
= \frac{\nabla_\lambda q_\lambda(z|x)}{q_\lambda(z|x)}
$$
one can show that
$$
\nabla_{\theta, \lambda} \ \big [
\text{E}_{q_\lambda (z|x)} \text{ log }p_\theta(x|z)p(z) \big ]
= \text{E}_{q_\lambda (z|x)} \big [ \big ( \text{ log }p_\theta(x|z)p(z)
- \text{log } q(z|x) \big ) \nabla_\lambda q(z|x) \big ]
$$
which we can now use Monte Carlo integration to take estimates of. We are going
spare the reader the full derivation of this identity because as it turns out,
the Monte Carlo estimates of this quantity have been shown to have very high
variance, too high to reasonably use in many cases. It seems that we are back
at square one with the issue of computing the gradient.

### Reparametrization Trick

We need to get an reasonable estimate of the gradient of the ELBO. To do so, we
rely on a small trick known as the *reparametrization trick*. We attempt to
represent the family of distributions $\mathcal Q$ in terms of a deterministic
transformation $T_\lambda(\epsilon, x)$ of a fixed distribution $\epsilon$. This
sounds more complicated than is really is. For example, if $\mathcal Q$ is the
family of $N(x, \sigma)$ distributions, we can let $\epsilon$ be a standard
$N(0,1)$ distribution. If $q_{\sigma^*} (z|x^*)$ is distributed as $N(x^*,
\sigma^*)$, we write the distribution in terms of $\epsilon$ as $x^* +
\sigma^\star \epsilon$. Many families of probability distributions (such as
location-scale families) can be represented this way.

Why do we do this? Recall that earlier we could not push in the gradient to
compute
$$
\nabla_{\theta, \lambda} \ \big [
\text{E}_{q_\lambda (z|x)} \text{ log } q_\lambda(z|x) ) \big ]
$$
because the expectation was taken against $q_\lambda(z|x)$. But with the
reparametrization trick, we can now do
$$
\nabla_{\theta, \lambda} \ \big [
\text{E}_{q_\lambda (z|x)} \text{ log } q_\lambda(z|x) ) \big ]
= \nabla_{\theta, \lambda} \ \big [
\text{E}_{p(\epsilon)} \text{ log }
q_\lambda \big ( T_\lambda(\epsilon, x) \big ) \big ]
= \text{E}_{p(\epsilon)} \big [ \nabla_\lambda
\text{ log } q_\lambda \big ( T_\lambda(\epsilon, x) \big ) \big ].
$$
Now, we can take Monte-Carlo estimates of this quantity. It turns out that the
Monte-Carlo estimates of the gradient expressed as
$$
\text{E}_{q_\lambda (z|x)} \big [ \nabla_{\theta}
\text{ log }p_\theta(x|z)p(z) \big ]
+ \text{E}_{p(\epsilon)} \big [ \nabla_\lambda
\text{ log } q_\lambda \big ( T_\lambda(\epsilon, x) \big ) \big ].
$$
have much lower variance than the score function estimator, allows us to
reasonably perform gradient descent. Finally, the hard part is out of the way!
With this being done, we can now optimize the ELBO through standard gradient
descent methods.

### Where Neural Nets Tie In

Let's go back a little bit and recall that our overall goal was to find
$$
\text{max}_{\theta \in \Theta, \lambda \in \Lambda}
\text{E}_{q_\lambda (z|x)} \text{ log }\frac{p_\theta(x|z)p(z)}{q_\lambda(z|x)}.
$$
We remarked earlier that $p_\theta(x|z)$ can be thought of as related to the
generative part of the model and learning $q_\theta(z|x)$ can be thought of
as performing inference. Both of these quantities also have natural
interpretations related to a certain type of architecture for neural networks.

<figure align="center">
<img width=500 src="https://blog.keras.io/img/ae/autoencoder_schema.jpg">
<figcaption> Simple diagram of autoencoder. Taken from the Keras blog.
</figcaption>
</figure>

In the standard autoencoder architecture, we use a neural network to predict
it's own inputs. The goal is to learn a latent represention. The *encoder* part
of the network maps the original input to the latent representation, while the
*decoder* part attempts to reconstruct the original input using the latent
representation. Training is done to minimize some form of reconstruction loss.  

This is surprisingly similar to our variational inference task. In particular,
we can think $q_\lambda (z|x)$ as being a "stochastic encoder", $Z$ as a
stochastic encoding, and $p_\theta (x|z)$ as a "stochastic decoder". We can
exploit this analogy by parametrizing $p_\theta(x|z)$ and $q_\lambda (z|x)$
using layers of a neural network. That is, the weights in the encoding layer of
a neural network will form the parameters $\theta$, and the weights in decoding
layers will contain the parameters $\lambda$.

<figure align="center">
<img width=500 src="https://jaan.io/images/encoder-decoder.png">
<figcaption>Diagram of variational autoencoder. Taken from the Jaan Altosaar's
blog. Note that I use different symbols for the parameters.
</figcaption>
</figure>

For example, we might choose $p_\theta(x|z)$ and $q_\lambda(z|x)$ to be both
Gaussian (as often is the case), and parametrize them as
$$
q_\lambda (z|x) \sim N(\mu = Enc_1 (\lambda, z), \ \Sigma = Enc_2(\lambda, z) \odot I) \\
p_\theta (x|z) \sim N(\mu = Dec_1 (\theta, z), \ \Sigma = Dec_2(\theta, z) \odot I)
$$
A typical prior on $Z$ might simply be a standard multivariate normal $p(z) \sim
N(0, I)$. Here, the point of using neural networks is exploit their power as
function appromixators, so that we can learn complex configurations in the
parameter space for the distributions.

For the variational autoencoder with our current setup, the overall process can
be thought of like this:

* We input some data $x_i$
* The encoder layers output some means and covariances for a multivariate normal
conditional on $x_i$
* We can sample from a $N(0, I)$ random variable and convert them into a sample
from $Z$ using the output of the encoder layers and the reparametrization
trick.
* The sample is now run through the decoder to get more means and covariances:
this is a "stochastic decoding".


## Recommended Reading

* [Rui Shu's blog post on density estimation](http://ruishu.io/2018/03/14/vae/)
* [Jaan Altosaar's writeup](https://jaan.io/what-is-variational-autoencoder-vae-tutorial/)
* [Performing some ELBO surgery](http://approximateinference.org/accepted/HoffmanJohnson2016.pdf)
* [Towards a deeper understanding](https://arxiv.org/pdf/1702.08658.pdf)
