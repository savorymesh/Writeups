---
title: Laplace-Beltrami and Heat Kernel on Manifolds
---

### The Metric Tensor

Let $M$ be a smooth manifold. A *Riemannian metric* on $M$ is a
symmetric, positive definite 2-tensor field $g \in T^2(M)$. For
$x \in M$, on the tangent space $T_x(M)$ we have that $g$ defines an
inner product $\langle X, Y \rangle = g_{|T_X}(X, Y)$. Using the inner
product, notions of length and distance are defined using the usual
conventions.

Given local coordinates $\{x^i\}$, the metric tensor can be locally
represented as $g = g_{ij} dx^i dx^j$, where $dx^i dx^j$ stands for the
symmetric product of two 1-forms. The functions $g_{ij}$ are referred to
as the *components* of the metric tensor $g$ in $\{x^i\}$. Put together,
the components form a symmetric positive definite matrix smooth in the
sense that the component functions themselves are smooth where the
representation holds.

Through the *musical isomorphisms* $\flat$ and $\sharp$, $g$ provides a
canonical way of identifying the tangent space $T_x(M)$ with the
corresponding dual space ${T_x^*(M)}$. Given a vector $X$, we send $X$
to a covector $X^\flat$ by defining
$$X^\flat (Y) := \langle X, Y \rangle$$ This mapping is invertible: the
inverse is, of course, $\sharp$. We will denote the application of
$\sharp$ by superscripting, as with $\flat$.

The musical isomorphisms will prove to be useful tools, particularly in
terms of establishing operations. For example, we will generalize the
classical concept of the gradient thusly: for a smooth, real valued
function $f$ on $M$, define $$\text{grad} f := df^\sharp$$ The musical
isomorphisms also allow us to convert covariant, contravariant, or mixed
tensors to tensors of other forms, operations frequently referred to as
*raising or lowering indices*. When a tensor has no more than one upper
or lower index, the method of applying $\flat$ or $\sharp$ respectively
should be obvious. In ambiguous cases, however, we will explicitly
describe how to apply the operation instead of adding another entry to
the bestiary of notation.

### Connections and Geodesics

We would like to consider *geodesics* on $M$, the generalization
of straight lines to a smooth manifold. Before doing so, it is necessary
to establish a new type of differential operator. Let $(M, E, \pi)$ be a
vector bundle over $M$. We will let $\mathcal{E}(M)$ denote the space of
smooth sections of $E$. We will represent the space of smooth vector
fields over $M$ as $\mathcal{X}(M)$. A *connection* in $E$ is a
mapping
$$\nabla: \mathcal{X}(M) \times \mathcal{E}(M) \rightarrow \mathcal{E}(M)$$
$$(X, Y) \mapsto  
\nabla_{X}{Y}$$

where $\nabla$ is linear over $C^\infty(M)$ in the first argument,
linear over $\mathbb{R}$ in the second argument, and satisfies the
corresponding Leibniz rule: $$
\nabla_{X}{(fY)}
 = f
\nabla_{X}{Y}
 + (Xf)Y$$

We refer to $\nabla_{X}{(}Y)$ as the covariant derivative of $Y$ in the
direction of the vector field $X$.

An *affine connection* on $M$ is a connection where $E = T(M)$. In the
case of an affine connection, the covariant derivative provides a method
of differentiating a vector field over $M$ by another such vector field.
The infamous *Christoffel symbols* $\Gamma_{ij}^k$ are used to represent an
affine connection in terms of a local frame $\{E_i\}$, where
$$
\nabla_{E_i}{E_j}
 = \Gamma_{ij}^k E_k.$$ Collectively, the Christoffel symbols form a set of
$n^3$ smooth functions where $\{E_i\}$ is defined. Using partitions of
unity, one can easily show that there exists an affine connection on any
smooth manifold.

Any affine connection gives rise to a unique connection over any other
tensor bundle over $M$ satisfying the following conditions

1.  On $T^0(M) = C^\infty(M),  
    \nabla_{X}{F}
     = Xf$

2.  On $T(M), \nabla$ is the affine connection

3.  $\nabla_{X}{(Y \otimes Z)} = ( \nabla_{X}{Y}) \otimes Z + Y \otimes
(\nabla_{X}{Z})$

4.  $\nabla_{X}{(\text{tr}(Y))} = \text{tr}(\nabla_{X}{Y})$

where tr denotes tensor contraction.

An affine connection also allows us to differentiate vector fields along
curves. For a arbitrary smooth curve[^1] $\gamma: I \to M$ where we
allow for $I$ to be possibly closed or unbounded, a vector field along
$\gamma$ is a smooth map $V: I \to T(M)$ where
$V(t) \in T_{\gamma(t)}(M)$ for all $t \in I$. We will denote the space
of vector fields along $\gamma$ as $\mathcal{X}(\gamma)$. For any smooth
curve $\gamma$, the affine connection $\nabla$ induces a mapping
$$D_\text{t}
: \mathcal{X}(\gamma) \to \mathcal{X}(\gamma)$$ fulfilling the following
conditions

1.  $D_\text{t}$ is linear over $\mathbb{R}$
2.  $D_\text{t}
    (fV) = \dot{f}V + f  
    D_\text{t}
    V$
3.  If $\tilde{V}$ is a vector field on $M$ with $\tilde{V}|_{\gamma}$ =
    $V$, $D_\text{t}
    V(t) =  
    \nabla_{\dot{\gamma}(t)}{\tilde{V}}$

Using local coordinates, the map is given by $$D_\text{t}
V(t_0) = \big( \dot{V}^k(t_0) + V^j(t_0)\dot{\gamma}^i(t_0) \Gamma_{ij}^k (\gamma(t_0))\big)\partial_k$$
For a vector field $V$ along a curve $\gamma$, we refer to $D_\text{t}
V$ as the covariant derivative of $V$ along $\gamma$.

Having constructed the machinery of covariant differentation of vector field
along curves, we are now able to generalize 'straight lines' to our manifold in
a straightforward manner. We define the *acceleration of a curve* $\gamma$ to be
$D_\text{t} \dot{\gamma}$. A *geodesic*, then, is a curve with acceleration
identically equal to zero, i.e. $D_\text{t} (\dot{\gamma}) \equiv 0$. For any $x
\in M$, any $V \in T_p(M)$, and any $t_0 \in \mathbb{R}$, there exists an open
interval $I_{t_0}$ around $t_0$ and a geodesic $\gamma : I_{t_0} \to M$ such
that $\gamma (t_0) = x$ and $\dot{\gamma} (t_0) = V$. Furthermore, if $\gamma$
and $\tilde{\gamma}$ are two geodesics satisfying the aforementioned conditions,
then they agree on their mutual domain. This guarantee of uniqueness allows for
the realization of a unique *maximal geodesic*: given $x \in M$ and $V \in
T_x(M)$, there exists a geodesic $\gamma^\prime : I_{t_0}^\prime \to M$ where
the domain $I_{t_0}^\prime$ is maximal in the sense that it cannot be extended
to any larger open interval.

Note that the geodesics on a smooth manifold depend on the choice of
affine connection. On a Riemannian manifold, there exists a nearly
canonical choice. Before giving this connection a proper introduction,
we first introduce the *torsion tensor* of a connection, a vector-valued
two-form:
$$\tau : \mathcal{X}(M) \times \mathcal{X}(M) \to \mathcal{X}(M)$$
$$\tau(X,Y) :=  \nabla_{X}{Y} -  \nabla_{Y}{X} - [X, Y]$$

where $[\cdot, \cdot]$ is the usual Lie bracket. Using the canonical
isomorphism between multilinear maps from
$T_x(M) \times T_x(M) \to T_x(M)$ to the space of $2 \choose 1$-tensors
on $T_x(M)$, we also view $\tau$ as a $2 \choose 1$-tensor field. If the
torsion tensor associated to a connection $\nabla$ is identically equal
to zero, we say that $\nabla$ is *symmetric* or *torsion-free*.

Next, we introduce the property of compatibility with a metric. Given a
Riemannian manifold $(M, g)$ with affine connection, $\nabla$ we say
that $\nabla$ is *compatible with the metric* $g$ if for all
$X, Y, Z \in \mathcal{X}(M)$,

$$
\nabla_{X}{g(Y,Z)}
 = g(
\nabla_{X}{Y}
,Z) + g(Y,  
\nabla_{X}{Z}
)$$

Our favored connection, the *Levi-Civita connection*, is a unique
connection that exists on any Riemannian manifold which is both
symmetric and compatible with the metric. Henceforth, we will always
assume the given affine connection is the Levi-Civita connection when
stated without further qualifications.

Given a geodesic $\gamma : I \to M$ in a Riemannian manifold, we will
define the speed of $\gamma$ at time $t$ as $|\dot{\gamma}(t)|$. It is
satisfying to know that under the Levi-Civita connection, all geodesics
are of constant speed.

### The Exponential Map

The *Riemannian exponential map*, exp, is an object of critical
importance in Riemannian geometry. Intuitively, the exponential map
generalizes nothing less than the action in an Euclidean space of moving
a single unit in a direction! Given $x \in M$ and $V \in T_x(M)$, let
$\gamma_V$ be the unique maximal geodesic associated to $x$ and $V$. Let
${\Upsilon} = \{V \in T(M)$: the domain of $\gamma_V$ contains $[0,1]$},
an open subset of $T(M)$. Define

$$\text{exp} : {\Upsilon} \to M$$
$$\text{exp}(V) := \gamma_V(1)$$

Briefly, we will list some key properties of the exponential map.

1.  The Riemannian exponential map is smooth.

2.  We have that $\gamma_V(t) = \text{exp}(tV)$ where either side of the
    equality exists.

3.  For any $x \in M$, there exists an neighborhood $U$ around $x$ and a
    neighborhood $\tilde{U}$ around the origin in $T_x(M)$ such that
    $\text{exp}_{|\tilde{U}}$ maps diffeomorphically onto $U$.

One final piece of terminology in this section: if every maximal
geodesic on a Riemannian manifold $(M, g)$ is defined for all
$t \in \mathbb{R}$, or, equivalently, the domain of the exponential map
$\Upsilon$ is the entire tangent bundle $T(M)$, we say that the manifold
is *geodesically complete* or simply *complete*.

### Lengths and Geodesic Distance

Let $I$ be an interval (possibly unbounded) with endpoints $a, b,$ where
$a < b$. For a smooth curve $\gamma : I \to M$, define the *length of
the curve* $\gamma$ by
$$\mathcal{L}(\gamma) = \int_a^b |\dot{\gamma}(t)|dt.$$ If $I$ is
bounded and $\gamma$ can be extended to a curve on cl$(I)$, then
$\mathcal{L}(\gamma)$ is finite. Note that so long as $\gamma$ is not a
trivial curve, we can always reparametrize $\gamma$ to be a unit-speed
curve without changing its length.

A *curve segment* will be a curve whose domain is a closed, bounded
interval $[a, b]$. If $\gamma$ is a curve segment where $\gamma(a) = x$
and $\gamma(b) = y$, then we will say $\gamma$ *connects* $x$ and $y$.
We now have enough machinery to define the *geodesic distance* $d(x,y)$
between two points on a Riemannian manifold $(M, g)$: $$\label{gdist}
d(x,y) := \underset{\gamma}{\inf} \ \mathcal{L}(\gamma)$$ where we
consider the infimum over all curve segments connecting $x$ and $y$. It
may very well be that $x$ and $y$ are not connected by any curve
segment: in that case we use the convention that the infimum returns a
value of $+\infty$. If $\tilde{\gamma}$ is a curve segment such that the
infimum is attained on $\tilde{\gamma}$ and $\tilde{\gamma}$ has a unit-speed
parametrization, we say $\tilde{\gamma}$ is a *minimizing geodesic*. Naturally,
$\tilde{\gamma}$ turns out to be a geodesic in the sense that $D_\text{t}
\tilde{\gamma} \equiv 0$ as well.

Remarkably, the geodesic distance forms a metric[^2] on a Riemannian
manifold, where we are flexible with our definition of a metric in
allowing the metric to take the value $+\infty$. Moreover, the topology
$d$ induces on $M$ agrees with the original manifold topology of $M$. If
$M$ is a connected (and therefore path-connected) Riemannian manifold,
$d$ is a finite metric.

From here on out, we will restrict ourselves to the setting of connected
Riemannian manifolds. Here, the famed Hopf-Rinow theorem reveals
motivation for using the term 'geodesically complete'. We state its
conclusions without proof.

___

###### Hopf-Rinow:
On a connected Riemannian manifold $(M, g)$, the following statements
are equivalent:

1.  $M$ is complete as a metric space under the geodesic distance
    function $d$.

2.  $(M, g)$ is geodesically complete.

3.  The closed and bounded subsets of $M$ are compact (Heine-Borel
    Property).

___

If $(M, g)$ is a complete Riemannian manifold, for any $x, y \in M$,
there is always a minimizing geodesic $\tilde{\gamma}$ that connects $x$
and $y$. We assert that a compact Riemannian manifold is always
complete.

### More on Geodesic Distance and the Cut Locus

The material in this section will be more advanced and less generally
well known than the previous material. To guarantee the veracity of our
results, all manifolds mentioned in this section will be assumed to be
complete and connected[^3]. For our problem at hand, we would like to
study the distance between a source point and all other points in the
Riemannian manifold. Additionally, we will also want to consider the
distance between a compact subset of a manifold to the remaining points.
Let us then define
$$\phi_y(x) := d(x, y)$$
and
$$\phi_K(x) := \underset{y \in K}{\inf} d(x,y)$$
where $K$ is a compact
subset of $M$. These are the main objects of consideration in this thesis. We
will find it proves useful to recognize that for $x \in M$ where $x \notin K$,
there exists a (not necessarily unique) geodesic $\tilde{\gamma}$ such that the
distance from $K$ to $x$ is minimized with $\tilde{\gamma}$; just take a
sequence of elements $\{y_n\} \in K$ converging to the minimum distance, observe
that $K$ is compact and closed so that a subsequence must converge to another
element $y \in K$, and remember that there is always a minimizing geodesic
connecting any two points in a complete Riemannian manifold. This leads us to
the following propositions:

___

1. Let $K$ be a compact subset of a Riemannian manifold $(M, g)$, and
$\phi_K$ the distance function to the subset $K$. If $\phi_K$ is smooth
at $x \in M$, $\phi$ satisfies the Eikonal equation
$$|\text{grad} \ \phi_K| = 1$$ and there is a unique minimizing geodesic
from $K$ to $x$.

2. Let $y$ be a point in a Riemannian manifold $(M, g)$, and $\phi_y$ the
distance function to the point $y$. For all points for $x \in (M, g)$,
$x \neq y$ for which there are unique minimizing geodesics connecting
$y$ to $x$, $\phi_y$ is smooth at x.

___

Given a source point $y$, we will let $Cut_o(y)$ denote the *ordinary
cut locus of* $y$[^4]. Elements of $Cut_o(y)$ are the set of points in
$M$ for which there are multiple minimizing geodesics connecting them to
$y$. Away from $y$ itself and $Cut_o(y)$, $\phi_y$ must be smooth.

To see how $\phi_y$ can fail to be smooth at $y$ itself and $Cut_o(y)$,
let us consider a simple example. Let $x$ and $y$ be two antipodal
points on the sphere $S^2$. Then $x \in Cut_o(y)$, and $\phi_y$ is
respectively maximized and minimized at $x$ and $y$. However, $\phi_y$
must also satisfy the Eikonal equation where $\phi_y$ is smooth, and
thus, if $\phi_y$ were smooth at $x$ or $y$, the gradient could not have
vanished at those points, a contradiction. Thus, elements in the
ordinary cut locus may function as critical points, causing the failure
for the distance function to be smooth.

Some geometers like to deal with the squared distance function
$\phi_x^2$ rather than $\phi_x$ as $\phi_x^2$ will be smooth at the
source point $x$. There exists an enlightening result that a complete,
connected Riemannian manifold $(M,g)$ of dimension $n$ must be
diffeomorphic to $\mathbb{R}^n$ if there exists $z \in M$ such that the
squared distance function $\phi_z^2$ is everywhere smooth. Thus, $\mathbb{R}^n$
forms a special case in that the associated distance functions are especially
well-behaved.

### Riemannian Measure, Divergence, and Laplace-Beltrami Operator

Let $(M, g)$ be a Riemannian manifold of dimension $N$. Let $B(M)$
denote the Borel sets on $M$, i.e. the smallest $\sigma$-algebra
containing the collection of open sets in $M$. We will say a set
$S \subseteq M$ is measurable if for any chart $(U, \rho)$,
$\rho(S \cap U)$ is Lebesgue measurable. We will let $\Lambda(M)$ denote
the $\sigma$-algebra of all measurable sets in $M$. Clearly,
$B(M) \subseteq \Lambda(M)$.

There is a canonical measure $\nu$ defined on $\Lambda(M)$, which we
will unceremoniously name the *Riemannian measure*. The measure $\nu$
can be constructed using the defining property that for any measurable
set in a chart $(U, \rho)$
$$\nu(S) = \int_{\rho (S)} \sqrt{\text{det }g}d\lambda$$ where $\lambda$
denotes the Lebesque measure, and $g$ is the Riemannian metric.

The existence of the Riemannian measure makes it straightforward to
consider integration on Riemannian manifolds. We will immediately use
this to define a divergence operator. Let $C^\infty_0(M)$ denote the
subspace of $C^\infty(M)$ consisting of functions with compact support.
Then we will define the divergence
$$\text{div} : \mathcal{X}(M) \to C^\infty(M)$$ by setting div $X$ to be
the unique smooth function such that for all $u \in C^\infty_0(M)$ the
following identity holds
$$\int_{M} (\text{div } X) u \ d\nu = \int_{M} \langle X, \text{ grad } u
\rangle \ d\nu$$

In local coordinates, one can obtain using integration by parts that
$$\text{div } X = \frac{1}{\sqrt{\text{det }g}} \  \partial_i \
({\sqrt{\text{det }g} \ X^i)}$$

As we have a gradient and divergence, it is now simple to generalize a
version of a Laplacian to our Riemannian manifold. We define the
*Laplace-Beltrami operator* as $$\Delta: C^\infty(M) \to C^\infty(M)$$
$$\Delta := \text{div} \circ \text{grad }$$

In local coordinates, this becomes
$$\Delta = \frac{1}{\sqrt{\text{det }g}} \  \partial_i \  ({\sqrt{\text{det }g}
\ g^{ij} \ \partial_j)}$$

### Heat Kernels and Varadhan's Formula

Given a connected Riemannian manifold $(M, g)$, the heat kernel on $(M, g)$ is a
mapping $K(t, x, y)$ where $$K : (0, \infty) \times (M, g) \times (M, g)  \to
\mathbb{R}$$ that is the smallest positive *fundamental solution* to the heat
equation posed on $(0, \infty) \times (M, g)$. By a fundamental solution we mean
that $K(t, x, y)$ satisfies

$$\frac{d}{dt} K= \Delta_x K \\$$

$$K(t, \cdot, y) \to \delta_y(x) \text{ as } t \to 0$$

where $\Delta_x$ is used to denote that we let the Laplacian act on the second
variable $x$, and $\delta_y(x)$ is a Dirac delta distribution centered at $y$.
We say $K(t, x, y)$ is smallest in the sense that if $N(t, x, y)$ is another
positive fundamental solution, $K(t, x, y) \leq N(t, x, y)$ on $(0, \infty)
\times (M, g) \times (M, g)$. The existence of the heat kernel on the entire
manifold $(M, g)$ can be shown by considering the limit of similarly motivated
heat kernels on an exhausting sequence of precompact sets with smooth boundary.

In the simple setting of $\mathbb{R}^n$, the heat kernel can be given by
the explicitly as

$$K(t, x, y) = (4\pi t)^{-n/2} \text{exp}\left( {-\frac{1}{4t} |x - y|^2}\right).$$

where exp is the standard exponential function on $\mathbb{R}$. We can
apply a simple transformation and see immediately that
$$-4 t \text{ log } K(t, x, y) \to |x - y|^2 \text{ as } t \to 0$$ The
function $|x - y|^2$ is the squared distance function on $\mathbb{R}^n$.
This behavior actually holds in the setting of all complete, connected
Riemannian manifolds with bounded distance functions:

___

###### Varadhan's Formula:
Let $(M, g)$ be a complete, connected Riemannian manifold whose distance
function $d$ is bounded. Let $K(t, x, y)$ be the associated heat kernel.
Then $$-4 t \text{ log } K(t, x, y) \to d(x,y)^2 \text{ as } t \to 0.$$

[^1]: Smooth curves will always be $C^\infty$ smooth.

[^2]: In the sense of a distance function between pairs of elements of a
    set, not a Riemannian metric.

[^3]: One may certainly consider complete manifolds that are not
    connected, but the connected setting is more standard and authors
    are sometimes ambivalent regarding the assumption of connectedness.
    The analysis certainly becomes more complicated when considering
    manifolds that are not connected.

[^4]: We use the term *ordinary cut locus* as this is the set of
    ordinary cut points. The standard definition of cut locus is the
    closure of this set.
