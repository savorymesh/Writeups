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
P( X =  x \ | \ T=t, \theta)
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

While it was not too much work to prove sufficiency in the previous example,
proving sufficiency using the definition can be daunting for more complicated
estimation problems. The *Fisher-Neyman factorization theorem* simplifies this
task by providing an alternative method to characterize sufficiency: if the
distribution $X$ has density $f(x \ | \ \theta)$, we have that $T(X)$ is
sufficient if and only if we can find $h(x)$ and $g(T(x), \theta)$ such that
$f(x \ | \ \theta) = g(T(x), \theta) h(x)$. In other words, a statistic is
sufficient if and only we can factor the density of the sample into two parts :
one that depends on the parameters and on $x$ only through the statistic $T(X)$
and the other that can more freely depend on the data $x$. For example, with our
simple example with the Bernoulli distribution, we could alternatively prove
that $T = \sum_{i=1}^n X_i$ is sufficient by noting
$$
f(x \ | \ \theta) = P(X = x \ | \ \theta)
= \prod_{i=1}^n p^{x_i} (1-p)^{1 - x_i}
\\
= p^{\sum_{i=1}^n x_i} (1-p)^{n - \sum_{i=1}^n x_i}
= p^{t} (1-p)^{n - t} \times 1
$$
so that we have $g(T(x), p) = p^{t} (1-p)^{n - t}$ and $h(x) = 1$.

### Minimal Sufficiency and Completeness

Sufficiency is inherently tied to the concept of data reduction. As remarked
before, sufficient statistics capture all the information the sample contains
for estimation of appropriate parameters. As there can be multiple sufficient
statistics for given parameters, we naturally would like to find one that
summarizes the data as efficiently as possible. This brings us to the concept of
minimal sufficient statistics. A *minimal sufficient statistic* for the
parameter(s) $\theta$ is a sufficient statistic that is a function of every
other sufficient statistic for $\theta$. Because taking a function  

## Exponential Families of Distributions
