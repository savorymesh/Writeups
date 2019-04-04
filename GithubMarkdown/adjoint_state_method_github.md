---
title: The Adjoint State MEthod
---

Suppose <img src="svgs/f7b1f3a6e2471469a9ef46a4d339e77b.svg" align=middle width=62.81979pt height=26.25315pt/> and <img src="svgs/95ca9d52f0551cd33d448521262c6a31.svg" align=middle width=50.507985pt height=28.46184pt/>.


## Variational Bayes

### Problem Setup

Suppose we have a task in which we are given some data <img src="svgs/332cc365a4987aacce0ead01b8bdcc0b.svg" align=middle width=9.3951pt height=14.15535pt/> and are looking to
model things with some latent variables <img src="svgs/5b51bd2e6f329245d425b8002d7cf942.svg" align=middle width=12.397275pt height=22.46574pt/> which govern our data. We will
represent this probabilistically with a very simple model:
<p align="center"><img src="svgs/a6f98703197fbfaf6e58d6215ff31236.svg" align=middle width=140.8506pt height=16.438356pt/></p>
Here, <img src="svgs/8fffcccc47f9f88dac738cc6bbf65e09.svg" align=middle width=29.423625pt height=24.6576pt/> is a prior on <img src="svgs/f93ce33e511096ed626b4719d50f17d2.svg" align=middle width=8.367645pt height=14.15535pt/> and <img src="svgs/31cc8ef4946c3831ff915d0e939556ab.svg" align=middle width=43.384935pt height=24.6576pt/> is a conditional likelihood.
We do not have direct access to the marginal <img src="svgs/c9ea84eb1460d2895e0cf5125bd7f7b5.svg" align=middle width=30.45108pt height=24.6576pt/> (wouldn't that be nice?).

The generative process looks like

1. Sample some latent variables <img src="svgs/f93ce33e511096ed626b4719d50f17d2.svg" align=middle width=8.367645pt height=14.15535pt/> using <img src="svgs/8fffcccc47f9f88dac738cc6bbf65e09.svg" align=middle width=29.423625pt height=24.6576pt/>
2. Use the values of <img src="svgs/f93ce33e511096ed626b4719d50f17d2.svg" align=middle width=8.367645pt height=14.15535pt/> to draw from <img src="svgs/31cc8ef4946c3831ff915d0e939556ab.svg" align=middle width=43.384935pt height=24.6576pt/> to get <img src="svgs/332cc365a4987aacce0ead01b8bdcc0b.svg" align=middle width=9.3951pt height=14.15535pt/>.

Given these initial conditions, we would like to calculate the posterior
<img src="svgs/f2cb9cefe63d5d3111d76457baac9f42.svg" align=middle width=43.384935pt height=24.6576pt/>. We know from Bayes rule that this is
<p align="center"><img src="svgs/7ef84ab42d8f86874f39767b2b4d1e74.svg" align=middle width=169.45335pt height=38.834895pt/></p>  

So why can't we use compute this? Oftentimes, computing <img src="svgs/c9ea84eb1460d2895e0cf5125bd7f7b5.svg" align=middle width=30.45108pt height=24.6576pt/> turns out to be
intractable. Here, <img src="svgs/c9ea84eb1460d2895e0cf5125bd7f7b5.svg" align=middle width=30.45108pt height=24.6576pt/> is called the *evidence*. If <img src="svgs/5b51bd2e6f329245d425b8002d7cf942.svg" align=middle width=12.397275pt height=22.46574pt/> is discrete, we must
compute
<p align="center"><img src="svgs/9af2b7bd1ecfb4f5c0290cc98f7e68e2.svg" align=middle width=142.581945pt height=40.54809pt/></p>
As the size of <img src="svgs/f93ce33e511096ed626b4719d50f17d2.svg" align=middle width=8.367645pt height=14.15535pt/> increases, the difficulty of this sum grows exponentially.
For example, if we have <img src="svgs/5b51bd2e6f329245d425b8002d7cf942.svg" align=middle width=12.397275pt height=22.46574pt/> be Bernoulli, we must compute <img src="svgs/f8f25e4580c418a51dc556db0d8d2b93.svg" align=middle width=16.34523pt height=21.8394pt/> sums if <img src="svgs/f93ce33e511096ed626b4719d50f17d2.svg" align=middle width=8.367645pt height=14.15535pt/> is
of dimension <img src="svgs/55a049b8f161ae7cfeb0197d75aff967.svg" align=middle width=9.867pt height=14.15535pt/>. Similarly, if <img src="svgs/5b51bd2e6f329245d425b8002d7cf942.svg" align=middle width=12.397275pt height=22.46574pt/> is continuous, we may have issues computing
<p align="center"><img src="svgs/3a889f61fba1a14aa80e2cb1bb6df546.svg" align=middle width=113.476275pt height=36.53001pt/></p>
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
posterior through using members of a new family of distributions <img src="svgs/6a9d8a6a427f6ba46cc6a55a2031303d.svg" align=middle width=13.42473pt height=22.46574pt/>
for which computation is much easier to evaluate (e.g. is tractable). We refer
to <img src="svgs/6a9d8a6a427f6ba46cc6a55a2031303d.svg" align=middle width=13.42473pt height=22.46574pt/> as the *variational family*. We want to find <img src="svgs/29e3c152c187599795f3c09c89c8a890.svg" align=middle width=84.11535pt height=24.6576pt/> which is most similar to the true posterior <img src="svgs/f2cb9cefe63d5d3111d76457baac9f42.svg" align=middle width=43.384935pt height=24.6576pt/>. For now, we
will measure this similarity/dissimilarity by using the Kullback-Leibler
divergence, although other measures are certainly possible.

I will use <img src="svgs/78ec2b7008296ce0561cf83393cb746d.svg" align=middle width=14.06625pt height=22.46574pt/> to represent the Kullback-Leibler divergence. With our current
formulation, this means we want <img src="svgs/9e9496d0ffc5185cd5b9bcc1e7c382d2.svg" align=middle width=50.59956pt height=24.6576pt/> such that
<p align="center"><img src="svgs/205448bf2f73c4287bbdc8bb12183698.svg" align=middle width=305.4975pt height=20.867715pt/></p>
There is a reason that the assymmetric KL-divergence is given in this order, but
that's a discussion for another time. Our optimization problem is intrinsically
linked to a bound on the "loglihood" <img src="svgs/3c3548d924a303d251d143d84c1cb70f.svg" align=middle width=56.935065pt height=24.6576pt/> known as the
*variational lower bound* or the *Evidence Lower BOund (ELBO)*: for any <img src="svgs/355eb374b828b93a3fef8ba0de851004.svg" align=middle width=41.44404pt height=22.46574pt/>, we have
<p align="center"><img src="svgs/04c4d0c9d29cb7752776b7a8dec1f6e2.svg" align=middle width=575.73285pt height=38.834895pt/></p>
Here, Jensen's inequality has been applied to get the inequality in the middle.
You may have seen this bound before in the derivation of the EM algorithm.

Now, a simple manipulation of this bound using the identity
<img src="svgs/4263cb775cb879d02b374a523da36484.svg" align=middle width=141.878055pt height=24.6576pt/> shows that
<p align="center"><img src="svgs/dfd40b3f917fc30b0cdafffd2f9f2263.svg" align=middle width=632.6232pt height=38.834895pt/></p>
Note that we are able to remove the conditional expectation from <img src="svgs/633c13ca38d32e43cda5a4f0ba152277.svg" align=middle width=56.935065pt height=24.6576pt/> as it does not depend on <img src="svgs/f93ce33e511096ed626b4719d50f17d2.svg" align=middle width=8.367645pt height=14.15535pt/>. Our final expression shows that with <img src="svgs/c9ea84eb1460d2895e0cf5125bd7f7b5.svg" align=middle width=30.45108pt height=24.6576pt/>
held constant, maximizing the ELBO is equivalent to minimizing the same
KL divergence <img src="svgs/65542e7b65e9c10e228249d63fbef9b8.svg" align=middle width=120.584805pt height=24.6576pt/>. Thus, variational inference is typically
expressed in terms of maximizing the ELBO.

## Variational Autoencoders

### Density Estimation and the ELBO

Up until now, we have been thinking in terms of posterior inference, the
traditional setting for variational Bayes. We are now going to take this one
step further. Let's say we want to maximize the log-likelihood term <img src="svgs/633c13ca38d32e43cda5a4f0ba152277.svg" align=middle width=56.935065pt height=24.6576pt/>. We do not necessarily know <img src="svgs/2ec6e630f199f589a2402fdf3e0289d5.svg" align=middle width=8.270625pt height=14.15535pt/> in advance, so that this becomes a density
estimation problem. Direct density estimation problems are difficult, so what we
are going to do is instead maximize the ELBO in an attempt to  maximize
<img src="svgs/3c3548d924a303d251d143d84c1cb70f.svg" align=middle width=56.935065pt height=24.6576pt/>. Let's reexamine the ELBO
<p align="center"><img src="svgs/2ede90c28affac2fb4d01abebde86f08.svg" align=middle width=133.43121pt height=38.834895pt/></p>
Because the marginal <img src="svgs/b35b34f37de5bb9c8e9fc14f867c464d.svg" align=middle width=46.124595pt height=24.6576pt/> decomposes into <img src="svgs/b8f2ff8b7ed842d58238aaf6d2e494ce.svg" align=middle width=72.80856pt height=24.6576pt/>, we can rewrite
the ELBO as
<p align="center"><img src="svgs/2b9b1e95ac4a79b70853afc5e8ba1199.svg" align=middle width=160.115175pt height=38.834895pt/></p>
We can attach a natural interpretation to the term <img src="svgs/aaff0e7036c2f8a19148f5882bd71690.svg" align=middle width=43.384935pt height=24.6576pt/>. This conditional
probability can be thought of as being part of the generative part of the model:
it explains what to do when given <img src="svgs/332cc365a4987aacce0ead01b8bdcc0b.svg" align=middle width=9.3951pt height=14.15535pt/> in the generative process. Moreover,  as
we have explained in the previous section, the term <img src="svgs/9f45fd52b9d8d97faecf71ec539b1abb.svg" align=middle width=43.042395pt height=24.6576pt/> is used to perform
inference on the posterior <img src="svgs/da8961dfc8c62af166cdb05872d53bc2.svg" align=middle width=43.384935pt height=24.6576pt/>. The variational autoencoder is a technique
based around optimizing the ELBO over difference choices of <img src="svgs/9f45fd52b9d8d97faecf71ec539b1abb.svg" align=middle width=43.042395pt height=24.6576pt/> and
<img src="svgs/da8961dfc8c62af166cdb05872d53bc2.svg" align=middle width=43.384935pt height=24.6576pt/>. That is, our objective is to find
<p align="center"><img src="svgs/103b822176ebd667b56ccbad9b169de3.svg" align=middle width=309.6588pt height=38.834895pt/></p>

### The Road Towards Gradient Descent

We are going to maximize the ELBO by using a combination of Monte-Carlo
integration and gradient descent, a technique known as *Black Box Variational
Inference*. Accordingly, let's begin to place the problem in a parametric
setting. We will let <img src="svgs/7705975c5c1f3b11c9711681eba34f1d.svg" align=middle width=76.261515pt height=24.6576pt/> by indexed by <img src="svgs/27e556cf3caa0673ac49a8f0de3c73ca.svg" align=middle width=8.1735885pt height=22.83138pt/> in <img src="svgs/b35e24d8a08c0ab01195f2ad2a78fab7.svg" align=middle width=12.78552pt height=22.46574pt/>,
and let <img src="svgs/b41da2d91d9ba88a1b494b9c228c8bec.svg" align=middle width=76.55835pt height=24.6576pt/> be indexed by <img src="svgs/e5ad2206bf033175531dabe81495deaa.svg" align=middle width=41.09589pt height=22.83138pt/>.  Our
problem is now to find
<p align="center"><img src="svgs/cbd8254000d43d391817c95365472fd8.svg" align=middle width=261.4029pt height=38.834895pt/></p>
We will also assume some regularity of the ELBO in <img src="svgs/ab9ef7e838b4bae61f5f67e59d99269e.svg" align=middle width=37.85397pt height=24.6576pt/>, so that
we can compute gradients and interchange integrals/expectations and derivatives.
To perform gradient descent, we of course need to be able to compute the gradient
<p align="center"><img src="svgs/1d0a956df568f12fb8dfe8561288841f.svg" align=middle width=226.88325pt height=38.834895pt/></p>
However, it turns out that this not so easy to compute. Let's split this into
two parts:
<p align="center"><img src="svgs/99ff44012b888f584fff4fe943a53c07.svg" align=middle width=682.8525pt height=38.834895pt/></p>
With very mild regularity assumptions (for Leibniz's rule), we can just push the
gradient into the expectation for the first part:
<p align="center"><img src="svgs/648139e0faf1583a3507322ca410cef5.svg" align=middle width=441.4806pt height=19.81749pt/></p>
and then this term can be approximated via Monte-Carlo integration. It's the
second term that gives us trouble. The quantity
<p align="center"><img src="svgs/78b8c3d4a5652a1a38d1f1908640b493.svg" align=middle width=195.58935pt height=19.81749pt/></p>
has the expectation taken depending on <img src="svgs/fd8be73b54f5436a5cd2e73ba9b6bfa9.svg" align=middle width=9.58914pt height=22.83138pt/>, so that we can't push the
gradient inside the expectation.

A way we can attempt to get this around this is with a so-called "score
function estimator", named after the same score function used in Fisher
information. By evaluating the gradient term
<p align="center"><img src="svgs/2edbcaffae20dec32379e90254fd73f8.svg" align=middle width=202.63155pt height=38.834895pt/></p>
one can show that
<p align="center"><img src="svgs/7064e0a37e30e820cb0b964a0d2717c7.svg" align=middle width=590.3898pt height=19.81749pt/></p>
which we can now use Monte Carlo integration to take estimates of. We are going
spare the reader the full derivation of this identity because as it turns out,
the Monte Carlo estimates of this quantity have been shown to have very high
variance, too high to reasonably use in many cases. It seems that we are back
at square one with the issue of computing the gradient.

### Reparametrization Trick

We need to get an reasonable estimate of the gradient of the ELBO. To do so, we
rely on a small trick known as the *reparametrization trick*. We attempt to
represent the family of distributions <img src="svgs/6a9d8a6a427f6ba46cc6a55a2031303d.svg" align=middle width=13.42473pt height=22.46574pt/> in terms of a deterministic
transformation <img src="svgs/6153df4e8cae34166079612e6a523e1c.svg" align=middle width=54.38367pt height=24.6576pt/> of a fixed distribution <img src="svgs/7ccca27b5ccc533a2dd72dc6fa28ed84.svg" align=middle width=6.6724515pt height=14.15535pt/>. This
sounds more complicated than is really is. For example, if <img src="svgs/6a9d8a6a427f6ba46cc6a55a2031303d.svg" align=middle width=13.42473pt height=22.46574pt/> is the
family of <img src="svgs/de9cf4ec8bd06ab8cdd2ec01980ac258.svg" align=middle width=54.46914pt height=24.6576pt/> distributions, we can let <img src="svgs/7ccca27b5ccc533a2dd72dc6fa28ed84.svg" align=middle width=6.6724515pt height=14.15535pt/> be a standard
<img src="svgs/f706189f7c542a8078a8b5dc271260ce.svg" align=middle width=51.52983pt height=24.6576pt/> distribution. If <img src="svgs/43a87dd040a1c1ff7ad701195db62c69.svg" align=middle width=65.734185pt height=24.6576pt/> is distributed as <img src="svgs/aa9b09350f9bdefe746304210657eb1e.svg" align=middle width=69.58347pt height=24.6576pt/>, we write the distribution in terms of <img src="svgs/7ccca27b5ccc533a2dd72dc6fa28ed84.svg" align=middle width=6.6724515pt height=14.15535pt/> as <img src="svgs/a90f774c56edd7e86c9ed527d9147202.svg" align=middle width=61.255755pt height=22.63866pt/>. Many families of probability distributions (such as
location-scale families) can be represented this way.

Why do we do this? Recall that earlier we could not push in the gradient to
compute
<p align="center"><img src="svgs/78b8c3d4a5652a1a38d1f1908640b493.svg" align=middle width=195.58935pt height=19.81749pt/></p>
because the expectation was taken against <img src="svgs/8e2089cd886d7052bdbcd0f45ebcc0d7.svg" align=middle width=51.07146pt height=24.6576pt/>. But with the
reparametrization trick, we can now do
<p align="center"><img src="svgs/aa0e6e7c5919d4c1f477c137fc967521.svg" align=middle width=635.84565pt height=19.81749pt/></p>
Now, we can take Monte-Carlo estimates of this quantity. It turns out that the
Monte-Carlo estimates of the gradient expressed as
<p align="center"><img src="svgs/5adf8ff010cf3cce618b9ea1535619f8.svg" align=middle width=413.77545pt height=19.81749pt/></p>
have much lower variance than the score function estimator, allowing us to
reasonably perform gradient descent. Finally, the hard part is out of the way!
With this being done, we can now optimize the ELBO through standard gradient
descent methods.

### Where Neural Nets Tie In

Let's go back a little bit and recall that our overall goal was to find
<p align="center"><img src="svgs/cbd8254000d43d391817c95365472fd8.svg" align=middle width=261.4029pt height=38.834895pt/></p>
We remarked earlier that <img src="svgs/e9d1028d22578c27756873e1dee493ee.svg" align=middle width=50.822145pt height=24.6576pt/> can be thought of as related to the
generative part of the model and learning <img src="svgs/46e4fefbdd911b4eacaaa4c2c8e17688.svg" align=middle width=49.88973pt height=24.6576pt/> can be thought of
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
we can think <img src="svgs/97399607f552d41be52d66286121e23c.svg" align=middle width=51.07146pt height=24.6576pt/> as being a "stochastic encoder", <img src="svgs/5b51bd2e6f329245d425b8002d7cf942.svg" align=middle width=12.397275pt height=22.46574pt/> as a
stochastic encoding, and <img src="svgs/e508b1fa3da5ad18be9900f0c47d4541.svg" align=middle width=50.822145pt height=24.6576pt/> as a "stochastic decoder". We can
exploit this analogy by parametrizing <img src="svgs/e9d1028d22578c27756873e1dee493ee.svg" align=middle width=50.822145pt height=24.6576pt/> and <img src="svgs/97399607f552d41be52d66286121e23c.svg" align=middle width=51.07146pt height=24.6576pt/>
using layers of a neural network. That is, the weights in the encoding layer of
a neural network will form the parameters <img src="svgs/27e556cf3caa0673ac49a8f0de3c73ca.svg" align=middle width=8.1735885pt height=22.83138pt/>, and the weights in decoding
layers will contain the parameters <img src="svgs/fd8be73b54f5436a5cd2e73ba9b6bfa9.svg" align=middle width=9.58914pt height=22.83138pt/>.

<figure align="center">
<img width=500 src="https://jaan.io/images/encoder-decoder.png">
<figcaption>Diagram of variational autoencoder. Taken from the Jaan Altosaar's
blog. Note that I use different symbols for the parameters.
</figcaption>
</figure>

For example, we might choose <img src="svgs/e9d1028d22578c27756873e1dee493ee.svg" align=middle width=50.822145pt height=24.6576pt/> and <img src="svgs/8e2089cd886d7052bdbcd0f45ebcc0d7.svg" align=middle width=51.07146pt height=24.6576pt/> to be both
Gaussian (as often is the case), and parametrize them as
<p align="center"><img src="svgs/932fc7bd541d80fcdd6a18d2908ad71f.svg" align=middle width=700.27485pt height=16.438356pt/></p>
A typical prior on <img src="svgs/5b51bd2e6f329245d425b8002d7cf942.svg" align=middle width=12.397275pt height=22.46574pt/> might simply be a standard multivariate normal <img src="svgs/3f6b15bd58b0ec9ae330588aacd172db.svg" align=middle width=103.167735pt height=24.6576pt/>. Here, the point of using neural networks is exploit their power as
function appromixators, so that we can learn complex configurations in the
parameter space for the distributions.

For the variational autoencoder with our current setup, the overall process can
be thought of like this:

* We input some data <img src="svgs/9fc20fb1d3825674c6a279cb0d5ca636.svg" align=middle width=14.045955pt height=14.15535pt/>
* The encoder layers output some means and covariances for a multivariate normal
conditional on <img src="svgs/9fc20fb1d3825674c6a279cb0d5ca636.svg" align=middle width=14.045955pt height=14.15535pt/>
* We can sample from a <img src="svgs/293f83379fc5b19156c43f82bf751b4d.svg" align=middle width=51.8265pt height=24.6576pt/> random variable and convert them into a sample
from <img src="svgs/5b51bd2e6f329245d425b8002d7cf942.svg" align=middle width=12.397275pt height=22.46574pt/> using the output of the encoder layers and the reparametrization
trick.
* The sample is now run through the decoder to get more means and covariances:
this is a "stochastic decoding".


## Recommended Reading

* [Rui Shu's blog post on density estimation](http://ruishu.io/2018/03/14/vae/)
* [Jaan Altosaar's writeup](https://jaan.io/what-is-variational-autoencoder-vae-tutorial/)
* [Performing some ELBO surgery](http://approximateinference.org/accepted/HoffmanJohnson2016.pdf)
* [Towards a deeper understanding](https://arxiv.org/pdf/1702.08658.pdf)
