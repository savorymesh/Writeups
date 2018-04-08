
# Exponential Random Graph Models (ERGM)

This is a writeup to help me better understand EGRMs. I am a bit dubious about
their specification as of right now.

To understand the exponential random graph model, I think it's important to
first conduct a review of sufficient statistics as well as exponential families
of distributions.

A brief remark about notation: to better illustrate the concept of sufficiency, I will often use the notation $P(X = x \ | \ \theta)$ in lieu of
$P_{\theta} (X = x)$. In general, I have always found probability notation to be
quite awkward to work with.

### Sufficiency

We'll first discuss the concept of sufficiency, a fundamental concept in the
theory of statistics.

Let $\mathbf X  = (X_1, X_2, \ldots, X_n)$ be an i.i.d. sample from a
probability distribution parameterized by $\theta$. We say the statistic
$\mathbf T(\mathbf X ) = \big (T_1 \mathbf (X), \ T_2  \mathbf (X), \ \ldots,
T_n \mathbf (X) \big )$ is *sufficient* for $\theta$ if conditioning on
$\mathbf T$ removes the dependency of $\mathbf{X}$ on $\theta$. That is
$$
P(\mathbf X = \mathbf x \ | \ \mathbf T = \mathbf t, \theta) =
P(\mathbf X =\mathbf x \ | \ \mathbf T = \mathbf t)
$$
is valid for all $\mathbf x$ and $\mathbf t$. Often, this is interpreted as that
the sufficient statistic 'captures' all the information about $\theta$ in the
sample. To illustrate this concept, we'll do an obligatory example with the
Bernoulli distribution.

Suppose $\mathbf{X}$ is drawn from a Bernoulli($p$) distribution. Let's show
that $T = \sum_{i=1}^n X_i$ is sufficient for $p$. Of course, $T \sim$
Binomial($n, \ p$). Then
$$
P(\mathbf X = \mathbf x \ | \ T=t, \theta) =
\frac{P(\mathbf X = \mathbf x, \ T = t \ | \ \theta)}{P(T = t \ | \ \theta)}
\\
= \frac{P(\mathbf X = \mathbf x \ | \ \theta)}{P(T = t \ | \ \theta)}.
$$
since the event $\{T = t\} \subset \{X = x\}$.
