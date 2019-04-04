---
title: The Laplacian
---

In this section we will introduce the Laplacian, an operator of distinguished
importance in the theory of partial differential equations, probability theory,
inverse problems, and the characterization of particular domains. We will
define the Laplacian in terms of the gradient and the divergence: this is the
definition most frequently used to generalize the Laplacian to other domains.

### Grad

Let us first consider continuously differentiable
real-valued functions on <img src="svgs/8a86f4a11e2fbfc03de61d587ba826de.svg" align=middle width=19.99833pt height=22.64856pt/>. Let <img src="svgs/190083ef7a1625fbc75f243cffb9c96d.svg" align=middle width=9.8175pt height=22.83138pt/> be such a function.
The well-known *gradient* of <img src="svgs/190083ef7a1625fbc75f243cffb9c96d.svg" align=middle width=9.8175pt height=22.83138pt/> is the vector-valued function denoted by
grad <img src="svgs/190083ef7a1625fbc75f243cffb9c96d.svg" align=middle width=9.8175pt height=22.83138pt/> (alternatively <img src="svgs/5eb3506cf8721a78598195593be1aa9b.svg" align=middle width=23.51613pt height=22.83138pt/>) and is given by the formula
<p align="center"><img src="svgs/0927a9046b94edab22e30c4c1bca492d.svg" align=middle width=227.61585pt height=36.27789pt/></p>
The gradient is a natural generalization of the derivative of a function of a
single variable. It possesses numerous interpretations and usages: perhaps the
most ubiquitous of these is the fact that the gradient provides the direction
of steepest ascent for <img src="svgs/190083ef7a1625fbc75f243cffb9c96d.svg" align=middle width=9.8175pt height=22.83138pt/>. This makes the gradient of a function a tool
frequently used for mathematical optimization, but we won't be discussing that
further here. If <img src="svgs/b8bc815b5e9d5177af01fd4d3d3c2f10.svg" align=middle width=12.853995pt height=22.46574pt/> is a vector field on <img src="svgs/8a86f4a11e2fbfc03de61d587ba826de.svg" align=middle width=19.99833pt height=22.64856pt/> and grad
<img src="svgs/0541c593805e9242a28eb8c5c338a6e4.svg" align=middle width=44.589105pt height=22.83138pt/>, we will refer to <img src="svgs/190083ef7a1625fbc75f243cffb9c96d.svg" align=middle width=9.8175pt height=22.83138pt/> as a *potential function* for <img src="svgs/b8bc815b5e9d5177af01fd4d3d3c2f10.svg" align=middle width=12.853995pt height=22.46574pt/>.

### Div

Now let <img src="svgs/8905d83084847b3aaad35e7d37b7e815.svg" align=middle width=146.801655pt height=24.6576pt/> be a continuously differentiable vector
field defined on <img src="svgs/8a86f4a11e2fbfc03de61d587ba826de.svg" align=middle width=19.99833pt height=22.64856pt/>  (or a suitable subset thereof). The
*divergence* of <img src="svgs/b8bc815b5e9d5177af01fd4d3d3c2f10.svg" align=middle width=12.853995pt height=22.46574pt/> is a measure of whether our vector field tends to act as a
source or a sink. We define the divergence of <img src="svgs/b8bc815b5e9d5177af01fd4d3d3c2f10.svg" align=middle width=12.853995pt height=22.46574pt/> as
<p align="center"><img src="svgs/a48951825efcb4b5eb395ff5209bcd9f.svg" align=middle width=247.37625pt height=36.27789pt/></p>
Much like the gradient, the divergence is another generalization of the
derivative of a function of a single variable. For example, the
*divergence theorem* says that under certain regularity conditions,
<p align="center"><img src="svgs/a2427a723a42056cf1606b9f95bfe2f3.svg" align=middle width=199.6962pt height=37.35204pt/></p>
where <img src="svgs/9432d83304c1eb0dcb05f092d30a767f.svg" align=middle width=11.872245pt height=22.46574pt/> is a bounded open subset of <img src="svgs/8a86f4a11e2fbfc03de61d587ba826de.svg" align=middle width=19.99833pt height=22.64856pt/>, <img src="svgs/e856bc3c05b254c24bba78419c8b1e9a.svg" align=middle width=21.5127pt height=22.83138pt/> its
boundary, <img src="svgs/8cda31ed38c6d59d14ebefa440099572.svg" align=middle width=9.982995pt height=14.15535pt/> is the boundary area on <img src="svgs/e856bc3c05b254c24bba78419c8b1e9a.svg" align=middle width=21.5127pt height=22.83138pt/>, and <img src="svgs/b49211c7e49541e500c32b4d56d354dc.svg" align=middle width=9.16674pt height=14.15535pt/> is the
outward pointing normal vector field on <img src="svgs/e856bc3c05b254c24bba78419c8b1e9a.svg" align=middle width=21.5127pt height=22.83138pt/>. After some
inspection, one can recognize this theorem as but a generalization of the
fundamental theorem of calculus from single-variable calculus, thereby tying in
the divergence with the single-variable derivative.

Below we present the plot of the divergence of a simply defined vector field on
<img src="svgs/433badc501d4f8a183b14684b47f305e.svg" align=middle width=18.424725pt height=26.76201pt/>. Note that the divergence decreases near the points of attraction
(the sinks) and increases near the areas of repulsion (the sources).

<p align="center">
<img width=500 src="Images/divergence.png">
<p>

### The Laplace operator

Suppose now that <img src="svgs/190083ef7a1625fbc75f243cffb9c96d.svg" align=middle width=9.8175pt height=22.83138pt/> is a twice continuously differentiable function defined
now on <img src="svgs/8a86f4a11e2fbfc03de61d587ba826de.svg" align=middle width=19.99833pt height=22.64856pt/>. We define the *Laplacian* of <img src="svgs/190083ef7a1625fbc75f243cffb9c96d.svg" align=middle width=9.8175pt height=22.83138pt/> as the real-valued
function given by
<p align="center"><img src="svgs/c285806d3d62fe0428e457fbc338600d.svg" align=middle width=159.86322pt height=16.438356pt/></p>
After working through the definition, one can see quickly that this is
equivalent to defining the Laplacian as
<p align="center"><img src="svgs/0574960dd37f18cef66e0e2d20bc3119.svg" align=middle width=120.30942pt height=44.897325pt/></p>
It is clear that the Laplacian serves as a form of a second order differential
operator, albeit one in which no mixed partial derivatives are involved.
Moreover, due to the definition as the composition of grad with div, the
Laplacian comes built in with a ready interpretation: it measures the outward
flux of the gradient vector field of <img src="svgs/190083ef7a1625fbc75f243cffb9c96d.svg" align=middle width=9.8175pt height=22.83138pt/>.

### Remarks on partial differential equations

The Laplacian is intricately tied to the definition and behavior of the second
order linear  partial differential equations. For example, the prototypical
parabolic partial differential equation is the *heat equation*. Let <img src="svgs/9432d83304c1eb0dcb05f092d30a767f.svg" align=middle width=11.872245pt height=22.46574pt/> be
some subset of <img src="svgs/30f424666de12e1954957c9f1d3e789e.svg" align=middle width=22.30404pt height=22.55715pt/>, not necessarily bounded in this case. We wish
to discover <img src="svgs/b431bc57db5f6838a858c7fda79a89a9.svg" align=middle width=44.83281pt height=24.6576pt/> defined on
<img src="svgs/fb69b9194e178ebf3c4eff5bdda377a2.svg" align=middle width=53.92695pt height=26.17758pt/> such that

<p align="center"><img src="svgs/8b63ea72b63095817a06776421fe09a9.svg" align=middle width=103.167405pt height=33.81213pt/></p>
with <img src="svgs/c745b9b57c145ec5577b82542b2df546.svg" align=middle width=10.5765pt height=14.15535pt/> defined as some positive constant and <img src="svgs/d823a03369fc6603a75719f2a8890c7b.svg" align=middle width=21.153165pt height=22.46574pt/> being used to
represent that the Laplacian is acting through the spatial dimensions
<img src="svgs/8a86f4a11e2fbfc03de61d587ba826de.svg" align=middle width=19.99833pt height=22.64856pt/>  rather than the temporal dimension <img src="svgs/4bc7111034c1f5078f8272b7d4f341e5.svg" align=middle width=21.963645pt height=26.17758pt/>. The heat
equation, as evidenced by the name, is used to model the evolution of the
distribution of heat in a given region over time. Solutions to the heat equation
have very strong tendencies to smooth out over time; in fact, one finds that
initial discontinuities specified through initial value conditions will
instantly smooth out.

Now, with the heat equation, one can imagine the heat in the region eventually
settling into a steady state, so that <img src="svgs/9d83078632c8be89e1844ce7754d2f6c.svg" align=middle width=47.60943pt height=28.92648pt/>. This
leads us to the prototypical elliptic partial differential equation,
*Laplace's equation*. We now seek a function <img src="svgs/6dbb78540bd76da3f1625782d42d6d16.svg" align=middle width=9.41028pt height=14.15535pt/> defined on <img src="svgs/7ea703e6ec54754e4a24abb3c5ca7e80.svg" align=middle width=53.78802pt height=22.64856pt/> such
that
<p align="center"><img src="svgs/c875304deac7454b902e8df30a5371fc.svg" align=middle width=57.81204pt height=11.23287pt/></p>
Solutions to Laplace's equation are given the name *harmonic functions*. They
are known to possess a number of particularly nice properties: one remarkable
one is that all harmonic functions are analytic. In other words, they have at
all points a local convergent power series representation, a smoothness
condition even stronger than <img src="svgs/b18c43fc2c8361465b7a7d6dc0768c85.svg" align=middle width=26.02974pt height=22.46574pt/> differentiability. Laplace's equation
has ties to complex analysis: solutions to the Cauchy-Riemann equations
will individually satisfy Laplace's equation. There are ties to probability
theory as well. For example, the expected hitting time of a random walk on a
regular lattice generates a solution to a discretized version of Laplace's
equation with Dirichlet boundary conditions. The inhomogeneous version of
Laplace's equation is important enough to deserve a mention of its own: for
*Poisson's equation*, we seek <img src="svgs/6dbb78540bd76da3f1625782d42d6d16.svg" align=middle width=9.41028pt height=14.15535pt/> such that
<p align="center"><img src="svgs/003c039d1991e688b952d4eeef73b6eb.svg" align=middle width=54.84402pt height=14.611872pt/></p>
where <img src="svgs/190083ef7a1625fbc75f243cffb9c96d.svg" align=middle width=9.8175pt height=22.83138pt/> is some provided function. Besides having applications in modeling
physical processes, Poisson's equation is utilized in inverse problems where one
seeks to find the closest candidate scalar potential function for a given vector
field.


The final partial differential equation we will mention is the *wave equation*,
the prototypical hyperbolic partial differential equation. The wave equation has
a similar setup to the heat equation. Let <img src="svgs/db2c1c77cd374bb29eb9af32e1444df9.svg" align=middle width=56.093895pt height=22.55715pt/>. We
would like to find <img src="svgs/b431bc57db5f6838a858c7fda79a89a9.svg" align=middle width=44.83281pt height=24.6576pt/> defined on
<img src="svgs/fb69b9194e178ebf3c4eff5bdda377a2.svg" align=middle width=53.92695pt height=26.17758pt/> such that
<p align="center"><img src="svgs/6fa2d1ea155f513291be44f761ffa90b.svg" align=middle width=114.453735pt height=35.777445pt/></p>
where <img src="svgs/3e18a4a28fdee1744e5e3f79d13b9ff6.svg" align=middle width=7.113876pt height=14.15535pt/> is a constant governing the speed of travelling displacements.
Shockingly, the wave equation is mainly used to model wave-like phenomena.
Initial discontinuities persist with solutions to the wave equation as time
moves forward, giving a sharp contrast with solutions to the heat equation.

### Eigenfunctions of the Laplacian: Can you hear the shape of a drum?

To do later. Talk about characterizing a planar domain through the spectrum of
the Laplacian. Tie in to graph isomorphism problem.

### Remarks on generalization

The Laplacian that we have been discussing is not technically the one that is
generalized to discrete settings. The one that is actually generalized is the
*Laplace-Beltrami operator*, informally known as the manifold Laplacian.
The Laplace-Beltrami operator allows us to define a Laplacian on a Riemannian
manifold without any reference to an ambient space the manifold is embedded in.
Thus, it is an intrinsic operator to the manifold. The Laplacian that we have
been discussing in Euclidean space does not hold that property, i.e. computing
the Laplacian of a function on a subspace of <img src="svgs/8a86f4a11e2fbfc03de61d587ba826de.svg" align=middle width=19.99833pt height=22.64856pt/> cannot be done
without reference to <img src="svgs/8a86f4a11e2fbfc03de61d587ba826de.svg" align=middle width=19.99833pt height=22.64856pt/>.
