---
title: ERGMs
---

This is a writeup to help me better understand EGRMs. I am a bit dubious about
this method of modelling right now.

To understand the exponential random graph model, I think it's important to
first conduct a review of sufficient statistics as well as exponential families
of distributions.

A brief remark about notation: to better illustrate the concept of sufficiency, I will often use the notation $P(X = x \ | \ \theta)$ in lieu of
$P_{\theta} (X = x)$. In general, I have always found probability notation to be
quite awkward to work with.

### Sufficiency

We'll first discuss the concept of sufficiency, a fundamental concept in the
theory of statistics.

Let $X  = (X_1, X_2, \ldots, X_n)$ be an i.i.d. sample from a probability
distribution parameterized by finite-dimensional $\theta$. We say the statistic
$T( X ) = \big (T_1 (X), \ T_2 (X), \ \ldots, T_k (X) \big )$ is *sufficient*
for $\theta$ if conditioning on $T$ removes the dependency of $X$ on $\theta$.
That is
$$
P( X =  x \ | \ T = t, \ \theta)
= P( X = x \ | \ T = t)
$$
is valid for all $x$ and $t$. Often, this is interpreted as that
the sufficient statistic 'captures' all the information about $\theta$ in the
sample. To illustrate this concept, we'll do an obligatory example with the
Bernoulli distribution.

Suppose $X$ is drawn from a Bernoulli($p$) distribution. Let's show
that $T = \sum_{i=1}^n X_i$ is sufficient for $p$. Of course, $T \sim$
Binomial($n, \ p$). In general, when proving suffiency, we can note that
$$
P( X =  x \ | \ T=t, \theta)
= \frac{P( X =  x, \ T = t \ | \ \theta)}{P(T = t \ | \ \theta)}
= \frac{P( X =  x \ | \ \theta)}{P(T = t \ | \theta)}.
$$
since the event $\{T = t\} \subseteq \{X = x\}$. So, for our case, we have
$$
P( X =  x \ | \ T=t, \ p)
= \frac{\prod_{i=1}^n p^{x_i} (1-p)^{1 - x_i}}{\binom{n}{t} p^t(1-p)^t}
= \frac{p^{\sum_{i=1}^n x_i} (1-p)^{n - \sum_{i=1}^n x_i}} {\binom{n}{t} p^t(1-p)^t}
\\
= \frac{p^t(1-p)^t}{\binom{n}{t} p^t(1-p)^t}
= \frac{1}{\binom{n}{t}}.
$$
Since the final expression does not contain $p$, we have that $T$ is sufficient
for $p$.
