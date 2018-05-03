---
title: Exponential Random Graph Models
---

## Brief Remarks

This is a writeup to help me better understand EGRMs. I am a bit dubious about
this method of modelling right now.

To understand the exponential random graph model, I think it's important to
first conduct a review of sufficient statistics as well as exponential families
of distributions.

A brief remark about notation: to better illustrate the concept of sufficiency,
I will often use the notation $P(X = x \ | \ \theta)$ in lieu of $P_{\theta} (X =
x)$. In general, I have always found probability notation to be quite awkward to
work with.

Mathematical correctness obliges me to remark that all discussion is done
excluding non-measurable functions, etc.

## Sufficiency

We'll first discuss the concept of sufficiency, a fundamental concept in the
theory of statistics. At a high level, sufficient statistics are those which are
able to summarize all relevant information  held in a sample regarding specific
parameters. 'Good' estimators are typically functions of sufficient statistics.
Indeed, estimators which don't depend on sufficient statistics can often be
improved through conditioning on sufficient statistics, a process known as
*Rao-Blackwellizing an estimator*.

Let $X  = (X_1, X_2, \ldots, X_n)$ be an i.i.d. sample from a probability
distribution parameterized by finite-dimensional $\theta$. We say the statistic
$T( X ) = \big (T_1 (X), \ T_2 (X), \ \ldots, T_k (X) \big )$ is *sufficient*
for $\theta$ if conditioning on $T$ removes the dependency of $X$ on $\theta$.
That is
$$
P( X =  x \ | \ T = t, \ \theta)
= P( X = x \ | \ T = t)
$$
is valid for all $x$ and $t$. This is typically given the interpretation that
the sufficient statistic 'captures' all the information about $\theta$ in the
sample. To illustrate this concept, we'll do an obligatory example with the
Bernoulli distribution.

Suppose $X$ is drawn from a Bernoulli($p$) distribution. Let's show
that $T = \sum_{i=1}^n X_i$ is sufficient for $p$. Of course, $T \sim$
Binomial($n, \ p$). In general, when proving suffiency, we can note that
$$
P( X =  x \ | \ T=t, \ \theta)
= \frac{P( X =  x, \ T = t \ | \ \theta)}{P(T = t \ | \ \theta)}
= \frac{P( X =  x \ | \ \theta)}{P(T = t \ | \theta)}
$$
since the event $\{T = t\} \subseteq \{X = x\}$. So, for our case, we have
$$
P( X =  x \ | \ T=t, \ p)
= \frac{\prod_{i=1}^n p^{x_i} (1-p)^{1 - x_i}}{\binom{n}{t} p^t(1-p)^{n-t}}
= \frac{p^{\sum_{i=1}^n x_i} (1-p)^{n - \sum_{i=1}^n x_i}} {\binom{n}{t} p^t(1-p)^{n-t}}
\\
= \frac{p^t(1-p)^t}{\binom{n}{t} p^t(1-p)^{n-t}}
= \frac{1}{\binom{n}{t}}.
$$

Since the final expression does not contain $p$, we have that $T$ is sufficient
for $p$. NB that while the sample $X$ is of arbitrary dimension $n$, this shows
the information it contains about $p$ can be captured in a single value $T(X)$.
Moreover, it can be shown that injective functions of sufficient statistics are
themselves sufficient statistics. It follows then that the natural estimator of
$p$, the sample mean $\bar X = \frac{T}{n}$ is also sufficient for $p$.

While it was not too much work to prove sufficiency in the previous example,
proving sufficiency using the definition can be daunting for more complicated
estimation problems. The *Fisher-Neyman factorization theorem* simplifies this
task by providing an alternative method to characterize sufficiency: if the
distribution for $X$ has density $f(x \ | \ \theta)$, we have that $T(X)$ is
sufficient if and only if we can find $h(x)$ and $g(T(x), \theta)$ such that
$f(x \ | \ \theta) = g(T(x), \theta) h(x)$. In other words, a statistic is
sufficient if and only we can factor the joint density of the sample into two
parts : one that depends on the parameters and on $x$ only through the statistic
$T(X)$ and the other that can more freely depend on the data $x$. For example,
with our simple example with the Bernoulli distribution, we could alternatively
prove that $T = \sum_{i=1}^n X_i$ is sufficient by noting
$$
f(x \ | \ \theta) = P(X = x \ | \ \theta)
= \prod_{i=1}^n p^{x_i} (1-p)^{1 - x_i}
\\
= p^{\sum_{i=1}^n x_i} (1-p)^{n - \sum_{i=1}^n x_i}
= p^{t} (1-p)^{n - t} \times 1
$$
so that we have $g(T(x), p) = p^{t} (1-p)^{n - t}$ and $h(x) = 1$.

As an additional note, we remark that sufficient statistics always exist as,
amusingly, we can consider the sample $X$ itself as a statistic.

### Minimal Sufficiency and Completeness

Sufficiency is inherently tied to the concept of data reduction. As remarked
before, sufficient statistics capture all the information the sample contains
for estimation of appropriate parameters. As there can be multiple sufficient
statistics for given parameters, we naturally would like to find one that
summarizes the data as efficiently as possible. This brings us to the concept
of minimal sufficient statistics. A *minimal sufficient statistic* for the
parameter(s) $\theta$ is a sufficient statistic that is a function of every
other sufficient statistic for $\theta$. Because functions can only map values
in their domain to one value in the codomain, but a value in the codomain may
have many values mapped to it, minimal sufficient statistics provide the most
data reduction among sufficient statistics. Outside of rare pathological cases,
minimal sufficient statistics always exist outside. Any injective function of a
minimal sufficient statistic is another minimal sufficient statistic. Modulo
injective mappings, however, minimal sufficient statistics are unique.

Sufficient statistics seem to be quite distinguished statistics. Historically,
statisticians tried to prove several results about sufficient statistics.
However, they found they needed an additional condition to hold to complete the
proofs. This might be the reason behind the name for *complete statistics*.
(Just kidding). We say a statistic $T(X)$ is *complete* if for every real-valued
function $g$ we have that for all values of $\theta$
$$
E_\theta(g(T)) = 0 \implies P_\theta (g(T)) = 0.
$$
Completeness is a notoriously confusing property to interpret on first glance.
While there are some belabored attempts to interpret completeness such as [this one](http://www2.math.ou.edu/~cremling/teaching/lecturenotes/stat/ln5.pdf),
it is often simply regarded as being an extra technical condition to check to
obtain results for sufficient statistics. If a minimal sufficient statistic
exists, any complete sufficient statistic is automatically minimal sufficient
for $\theta$.

### Results Concerning Sufficient Statistics

In the beginning of this section, we remarked that 'good' estimators are
typically functions of sufficient statistics. We will clarify that statement
in this subsection. Our first result is probably the easiest to see yet also
one of the most important: the maximum likelihood estimator of a parameter must
be a function of a sufficient statistics.

- UMVUEs link to sufficient statistics


## Exponential Families of Distributions
