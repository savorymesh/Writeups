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
I will often use the notation <img src="svgs/385a0ae3a73babff3d67ef548b7b773d.svg" align=middle width=95.54226pt height=24.6576pt/> in lieu of <img src="svgs/064b011181128fcedc429fbba3795961.svg" align=middle width=76.99758pt height=24.6576pt/>. In general, I have always found probability notation to be quite awkward to
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

Let <img src="svgs/5e5ee1b65e387b16cafa4a0e789f3ee6.svg" align=middle width=158.000205pt height=24.6576pt/> be an i.i.d. sample from a probability
distribution parameterized by finite-dimensional <img src="svgs/27e556cf3caa0673ac49a8f0de3c73ca.svg" align=middle width=8.1735885pt height=22.83138pt/>. We say the statistic
<img src="svgs/e5a5f2c805f68765dd981ba838632516.svg" align=middle width=266.101605pt height=27.94572pt/> is *sufficient*
for <img src="svgs/27e556cf3caa0673ac49a8f0de3c73ca.svg" align=middle width=8.1735885pt height=22.83138pt/> if conditioning on <img src="svgs/2f118ee06d05f3c2d98361d9c30e38ce.svg" align=middle width=11.889405pt height=22.46574pt/> removes the dependency of <img src="svgs/cbfb1b2a33b28eab8a3e59464768e810.svg" align=middle width=14.90874pt height=22.46574pt/> on <img src="svgs/27e556cf3caa0673ac49a8f0de3c73ca.svg" align=middle width=8.1735885pt height=22.83138pt/>.
That is
<p align="center"><img src="svgs/c0d162b9a2dc6b15b3de6509e6c645fa.svg" align=middle width=297.099pt height=16.438356pt/></p>
is valid for all <img src="svgs/332cc365a4987aacce0ead01b8bdcc0b.svg" align=middle width=9.3951pt height=14.15535pt/> and <img src="svgs/4f4f4e395762a3af4575de74c019ebb5.svg" align=middle width=5.9361555pt height=20.22207pt/>. This is typically given the interpretation that
the sufficient statistic 'captures' all the information about <img src="svgs/27e556cf3caa0673ac49a8f0de3c73ca.svg" align=middle width=8.1735885pt height=22.83138pt/> in the
sample. To illustrate this concept, we'll do an obligatory example with the
Bernoulli distribution.

Suppose <img src="svgs/cbfb1b2a33b28eab8a3e59464768e810.svg" align=middle width=14.90874pt height=22.46574pt/> is drawn from a Bernoulli(<img src="svgs/2ec6e630f199f589a2402fdf3e0289d5.svg" align=middle width=8.270625pt height=14.15535pt/>) distribution. Let's show
that <img src="svgs/eb477fe7863a415ebdf9bab2252e2d70.svg" align=middle width=94.28463pt height=26.43894pt/> is sufficient for <img src="svgs/2ec6e630f199f589a2402fdf3e0289d5.svg" align=middle width=8.270625pt height=14.15535pt/>. Of course, <img src="svgs/e807d6d3c764e3d3d5057cc2d7bfa80e.svg" align=middle width=29.24097pt height=22.46574pt/>
Binomial(<img src="svgs/03d3901552fbc67a441499dc87e8bd92.svg" align=middle width=30.922815pt height=14.15535pt/>). In general, when proving suffiency, we can note that
<p align="center"><img src="svgs/7bf5575fc815da07c1f0d80daceaced7.svg" align=middle width=441.43605pt height=38.834895pt/></p>
since the event <img src="svgs/44b42ba4a6dc3b47dfa234fe288219f3.svg" align=middle width=140.75886pt height=24.6576pt/>. So, for our case, we have
<p align="center"><img src="svgs/c8824a4c42b538528b1b4763b9ca2327.svg" align=middle width=700.27485pt height=43.634085pt/></p>

Since the final expression does not contain <img src="svgs/2ec6e630f199f589a2402fdf3e0289d5.svg" align=middle width=8.270625pt height=14.15535pt/>, we have that <img src="svgs/2f118ee06d05f3c2d98361d9c30e38ce.svg" align=middle width=11.889405pt height=22.46574pt/> is sufficient
for <img src="svgs/2ec6e630f199f589a2402fdf3e0289d5.svg" align=middle width=8.270625pt height=14.15535pt/>. NB that while the sample <img src="svgs/cbfb1b2a33b28eab8a3e59464768e810.svg" align=middle width=14.90874pt height=22.46574pt/> is of arbitrary dimension <img src="svgs/55a049b8f161ae7cfeb0197d75aff967.svg" align=middle width=9.867pt height=14.15535pt/>, this shows
the information it contains about <img src="svgs/2ec6e630f199f589a2402fdf3e0289d5.svg" align=middle width=8.270625pt height=14.15535pt/> can be captured in a single value <img src="svgs/9b7523e3b58d8856baaae29791d46dc2.svg" align=middle width=39.5835pt height=24.6576pt/>.
Moreover, it can be shown that injective functions of sufficient statistics are
themselves sufficient statistics. It follows then that the natural estimator of
<img src="svgs/2ec6e630f199f589a2402fdf3e0289d5.svg" align=middle width=8.270625pt height=14.15535pt/>, the sample mean <img src="svgs/d85e493275c8a774e4b98e1aa0e92a4b.svg" align=middle width=48.332625pt height=28.67073pt/> is also sufficient for <img src="svgs/2ec6e630f199f589a2402fdf3e0289d5.svg" align=middle width=8.270625pt height=14.15535pt/>.

While it was not too much work to prove sufficiency in the previous example,
proving sufficiency using the definition can be daunting for more complicated
estimation problems. The *Fisher-Neyman factorization theorem* simplifies this
task by providing an alternative method to characterize sufficiency: if the
distribution for <img src="svgs/cbfb1b2a33b28eab8a3e59464768e810.svg" align=middle width=14.90874pt height=22.46574pt/> has density <img src="svgs/e6fe2434e1aa57441073379e9242b783.svg" align=middle width=55.696575pt height=24.6576pt/>, we have that <img src="svgs/9b7523e3b58d8856baaae29791d46dc2.svg" align=middle width=39.5835pt height=24.6576pt/> is
sufficient if and only if we can find <img src="svgs/82b61730744eb40135709391ec01cbdb.svg" align=middle width=31.65162pt height=24.6576pt/> and <img src="svgs/c945757e573b34a6afc071c5061420f9.svg" align=middle width=70.765035pt height=24.6576pt/> such that
<img src="svgs/bb8ea71ec6f4826f4664315a3eeef951.svg" align=middle width=180.031005pt height=24.6576pt/>. In other words, a statistic is
sufficient if and only we can factor the joint density of the sample into two
parts : one that depends on the parameters and on <img src="svgs/332cc365a4987aacce0ead01b8bdcc0b.svg" align=middle width=9.3951pt height=14.15535pt/> only through the statistic
<img src="svgs/9b7523e3b58d8856baaae29791d46dc2.svg" align=middle width=39.5835pt height=24.6576pt/> and the other that can more freely depend on the data <img src="svgs/332cc365a4987aacce0ead01b8bdcc0b.svg" align=middle width=9.3951pt height=14.15535pt/>. For example,
with our simple example with the Bernoulli distribution, we could alternatively
prove that <img src="svgs/eb477fe7863a415ebdf9bab2252e2d70.svg" align=middle width=94.28463pt height=26.43894pt/> is sufficient by noting
<p align="center"><img src="svgs/e35978bd46a1cf97f0c302541c6844e0.svg" align=middle width=653.9148pt height=44.897325pt/></p>
so that we have <img src="svgs/9f0fafb3ef661682acb3415544d71044.svg" align=middle width=179.570655pt height=26.17758pt/> and <img src="svgs/04329356611cf140d17b647a549d5b72.svg" align=middle width=61.788375pt height=24.6576pt/>.

As an additional note, we remark that sufficient statistics always exist as,
amusingly, we can consider the sample <img src="svgs/cbfb1b2a33b28eab8a3e59464768e810.svg" align=middle width=14.90874pt height=22.46574pt/> itself as a statistic.

### Minimal Sufficiency and Completeness

Sufficiency is inherently tied to the concept of data reduction. As remarked
before, sufficient statistics capture all the information the sample contains
for estimation of appropriate parameters. As there can be multiple sufficient
statistics for given parameters, we naturally would like to find one that
summarizes the data as efficiently as possible. This brings us to the concept
of minimal sufficient statistics. A *minimal sufficient statistic* for the
parameter(s) <img src="svgs/27e556cf3caa0673ac49a8f0de3c73ca.svg" align=middle width=8.1735885pt height=22.83138pt/> is a sufficient statistic that is a function of every
other sufficient statistic for <img src="svgs/27e556cf3caa0673ac49a8f0de3c73ca.svg" align=middle width=8.1735885pt height=22.83138pt/>. Because functions can only map values
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
(Just kidding). We say a statistic <img src="svgs/9b7523e3b58d8856baaae29791d46dc2.svg" align=middle width=39.5835pt height=24.6576pt/> is *complete* if for every real-valued
function <img src="svgs/3cf4fbd05970446973fc3d9fa3fe3c41.svg" align=middle width=8.43051pt height=14.15535pt/> we have that for all values of <img src="svgs/27e556cf3caa0673ac49a8f0de3c73ca.svg" align=middle width=8.1735885pt height=22.83138pt/>
<p align="center"><img src="svgs/fae6e4b562232a85472e4a80e312ded2.svg" align=middle width=238.93155pt height=16.438356pt/></p>
Completeness is a notoriously confusing property to interpret on first glance.
While there are some belabored attempts to interpret completeness such as [this one](http://www2.math.ou.edu/~cremling/teaching/lecturenotes/stat/ln5.pdf),
it is often simply regarded as being an extra technical condition to check to
obtain results for sufficient statistics. If a minimal sufficient statistic
exists, any complete sufficient statistic is automatically minimal sufficient
for <img src="svgs/27e556cf3caa0673ac49a8f0de3c73ca.svg" align=middle width=8.1735885pt height=22.83138pt/>.

### Results Concerning Sufficient Statistics

In the beginning of this section, we remarked that 'good' estimators are
typically functions of sufficient statistics. We will clarify that statement
in this subsection. Our first result is probably the easiest to see yet also
one of the most important: the maximum likelihood estimator of a parameter must
be a function of a sufficient statistics.

- UMVUEs link to sufficient statistics


## Exponential Families of Distributions
