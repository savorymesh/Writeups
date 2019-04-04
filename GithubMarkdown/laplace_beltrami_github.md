---
title: Laplace-Beltrami and Heat Kernel on Manifolds
---

### The Metric Tensor

Let <img src="svgs/fb97d38bcc19230b0acd442e17db879c.svg" align=middle width=17.73981pt height=22.46574pt/> be a smooth manifold. A *Riemannian metric* on <img src="svgs/fb97d38bcc19230b0acd442e17db879c.svg" align=middle width=17.73981pt height=22.46574pt/> is a
symmetric, positive definite 2-tensor field <img src="svgs/7874c783c7fdaa14681a4c415801d8b0.svg" align=middle width=78.310485pt height=26.76201pt/>. For
<img src="svgs/5b707b10fdb9e6f71f48c99bb6c7b947.svg" align=middle width=47.22597pt height=22.46574pt/>, on the tangent space <img src="svgs/9db8e54afccdb542014719c2be4b8a0c.svg" align=middle width=48.4077pt height=24.6576pt/> we have that <img src="svgs/3cf4fbd05970446973fc3d9fa3fe3c41.svg" align=middle width=8.43051pt height=14.15535pt/> defines an
inner product <img src="svgs/e7540035520572697172551c9a1aed47.svg" align=middle width=147.4143pt height=24.6576pt/>. Using the inner
product, notions of length and distance are defined using the usual
conventions.

Given local coordinates <img src="svgs/26944479908f34a72ef4bc9ff233ff71.svg" align=middle width=31.306275pt height=27.159pt/>, the metric tensor can be locally
represented as <img src="svgs/c6f9d374c322b428a9c19e491048fac2.svg" align=middle width=97.24506pt height=27.159pt/>, where <img src="svgs/f8a35191804f7188d224fcd8e2a6143e.svg" align=middle width=47.479245pt height=27.159pt/> stands for the
symmetric product of two 1-forms. The functions <img src="svgs/d86fb41119ab225fd12b5b57cc99fcc6.svg" align=middle width=18.595995pt height=14.15535pt/> are referred to
as the *components* of the metric tensor <img src="svgs/3cf4fbd05970446973fc3d9fa3fe3c41.svg" align=middle width=8.43051pt height=14.15535pt/> in <img src="svgs/26944479908f34a72ef4bc9ff233ff71.svg" align=middle width=31.306275pt height=27.159pt/>. Put together,
the components form a symmetric positive definite matrix smooth in the
sense that the component functions themselves are smooth where the
representation holds.

Through the *musical isomorphisms* <img src="svgs/e6754a30e92eac94d20ad98ce189ae4f.svg" align=middle width=6.3927765pt height=24.6576pt/> and <img src="svgs/4d4df141972556cfc7291ba6f84c78fa.svg" align=middle width=6.3927765pt height=22.83138pt/>, <img src="svgs/3cf4fbd05970446973fc3d9fa3fe3c41.svg" align=middle width=8.43051pt height=14.15535pt/> provides a
canonical way of identifying the tangent space <img src="svgs/9db8e54afccdb542014719c2be4b8a0c.svg" align=middle width=48.4077pt height=24.6576pt/> with the
corresponding dual space <img src="svgs/afd615ea9ef0c262420c159e29f0046d.svg" align=middle width=49.97157pt height=24.6576pt/>. Given a vector <img src="svgs/cbfb1b2a33b28eab8a3e59464768e810.svg" align=middle width=14.90874pt height=22.46574pt/>, we send <img src="svgs/cbfb1b2a33b28eab8a3e59464768e810.svg" align=middle width=14.90874pt height=22.46574pt/>
to a covector <img src="svgs/70d5ded24738acc20e493df7d8309582.svg" align=middle width=20.22834pt height=29.19114pt/> by defining
<p align="center"><img src="svgs/3c4bfa14fe423a91f47ef68f9501ab08.svg" align=middle width=120.798975pt height=19.526925pt/></p> This mapping is invertible: the
inverse is, of course, <img src="svgs/4d4df141972556cfc7291ba6f84c78fa.svg" align=middle width=6.3927765pt height=22.83138pt/>. We will denote the application of
<img src="svgs/4d4df141972556cfc7291ba6f84c78fa.svg" align=middle width=6.3927765pt height=22.83138pt/> by superscripting, as with <img src="svgs/e6754a30e92eac94d20ad98ce189ae4f.svg" align=middle width=6.3927765pt height=24.6576pt/>.

The musical isomorphisms will prove to be useful tools, particularly in
terms of establishing operations. For example, we will generalize the
classical concept of the gradient thusly: for a smooth, real valued
function <img src="svgs/190083ef7a1625fbc75f243cffb9c96d.svg" align=middle width=9.8175pt height=22.83138pt/> on <img src="svgs/fb97d38bcc19230b0acd442e17db879c.svg" align=middle width=17.73981pt height=22.46574pt/>, define <p align="center"><img src="svgs/b7e2095ba36c25f9c08525b1edf50cd7.svg" align=middle width=89.263845pt height=17.97444pt/></p> The musical
isomorphisms also allow us to convert covariant, contravariant, or mixed
tensors to tensors of other forms, operations frequently referred to as
*raising or lowering indices*. When a tensor has no more than one upper
or lower index, the method of applying <img src="svgs/e6754a30e92eac94d20ad98ce189ae4f.svg" align=middle width=6.3927765pt height=24.6576pt/> or <img src="svgs/4d4df141972556cfc7291ba6f84c78fa.svg" align=middle width=6.3927765pt height=22.83138pt/> respectively
should be obvious. In ambiguous cases, however, we will explicitly
describe how to apply the operation instead of adding another entry to
the bestiary of notation.

### Connections and Geodesics

We would like to consider *geodesics* on <img src="svgs/fb97d38bcc19230b0acd442e17db879c.svg" align=middle width=17.73981pt height=22.46574pt/>, the generalization
of straight lines to a smooth manifold. Before doing so, it is necessary
to establish a new type of differential operator. Let <img src="svgs/99ed86e97756a9fcf00e48ecdc2d272f.svg" align=middle width=67.266045pt height=24.6576pt/> be a
vector bundle over <img src="svgs/fb97d38bcc19230b0acd442e17db879c.svg" align=middle width=17.73981pt height=22.46574pt/>. We will let <img src="svgs/54d0efb4ea88bc06d7d7516e6cf513bf.svg" align=middle width=40.671345pt height=24.6576pt/> denote the space of
smooth sections of <img src="svgs/84df98c65d88c6adf15d4645ffa25e47.svg" align=middle width=13.08219pt height=22.46574pt/>. We will represent the space of smooth vector
fields over <img src="svgs/fb97d38bcc19230b0acd442e17db879c.svg" align=middle width=17.73981pt height=22.46574pt/> as <img src="svgs/a94d6213a4534a6d1b53e84cbb0cf07e.svg" align=middle width=44.657745pt height=24.6576pt/>. A *connection* in <img src="svgs/84df98c65d88c6adf15d4645ffa25e47.svg" align=middle width=13.08219pt height=22.46574pt/> is a
mapping
<p align="center"><img src="svgs/fd62654986f9ab2858bfa957199e1a29.svg" align=middle width=199.0593pt height=16.438356pt/></p>
<p align="center"><img src="svgs/eac198b6f25ef53fe1e004c3f924fd12.svg" align=middle width=112.245375pt height=16.438356pt/></p>

where <img src="svgs/47c28f1929c18f887420345e9225e08b.svg" align=middle width=13.698795pt height=22.46574pt/> is linear over <img src="svgs/11fcbe4a636f10aec095ae4a1b99f964.svg" align=middle width=57.37677pt height=24.6576pt/> in the first argument,
linear over <img src="svgs/f3e711926cecfed3003f9ae341f3d92b.svg" align=middle width=11.872245pt height=22.64856pt/> in the second argument, and satisfies the
corresponding Leibniz rule: <p align="center"><img src="svgs/632d6f107be4fc85252b023f58a29d3f.svg" align=middle width=203.9202pt height=16.438356pt/></p>

We refer to <img src="svgs/462e39c0c077429dfd3cf6c6d5062672.svg" align=middle width=52.177125pt height=24.6576pt/> as the covariant derivative of <img src="svgs/91aac9730317276af725abd8cef04ca9.svg" align=middle width=13.19637pt height=22.46574pt/> in the
direction of the vector field <img src="svgs/cbfb1b2a33b28eab8a3e59464768e810.svg" align=middle width=14.90874pt height=22.46574pt/>.

An *affine connection* on <img src="svgs/fb97d38bcc19230b0acd442e17db879c.svg" align=middle width=17.73981pt height=22.46574pt/> is a connection where <img src="svgs/5f804f3f5bdcf6af1e8d9fb4b75d99f7.svg" align=middle width=77.41437pt height=24.6576pt/>. In the
case of an affine connection, the covariant derivative provides a method
of differentiating a vector field over <img src="svgs/fb97d38bcc19230b0acd442e17db879c.svg" align=middle width=17.73981pt height=22.46574pt/> by another such vector field.
The infamous *Christoffel symbols* <img src="svgs/fe2327c930eb78e40e53e8c479e5fca1.svg" align=middle width=21.029415pt height=27.91272pt/> are used to represent an
affine connection in terms of a local frame <img src="svgs/7cdbd50196e6024c0e9c77d7a3ff6f56.svg" align=middle width=34.045935pt height=24.6576pt/>, where
<p align="center"><img src="svgs/f7b7e5cec35ea7a89fbaace22836ab2a.svg" align=middle width=116.997705pt height=21.07941pt/></p> Collectively, the Christoffel symbols form a set of
<img src="svgs/69b104384fb98e2ca8d49437b77c09a8.svg" align=middle width=16.41948pt height=26.76201pt/> smooth functions where <img src="svgs/7cdbd50196e6024c0e9c77d7a3ff6f56.svg" align=middle width=34.045935pt height=24.6576pt/> is defined. Using partitions of
unity, one can easily show that there exists an affine connection on any
smooth manifold.

Any affine connection gives rise to a unique connection over any other
tensor bundle over <img src="svgs/fb97d38bcc19230b0acd442e17db879c.svg" align=middle width=17.73981pt height=22.46574pt/> satisfying the following conditions

1.  On <img src="svgs/9d6becb8192400601929b3425c17d9f4.svg" align=middle width=222.082905pt height=26.76201pt/>

2.  On <img src="svgs/f5bca1057016f49194dc087ef8f3ea86.svg" align=middle width=63.41907pt height=24.6576pt/> is the affine connection

3.  <img src="svgs/91948bce0780652d417f7e7d0f9a58cd.svg" align=middle width=296.006205pt height=24.6576pt/>

4.  <img src="svgs/319f8db4b0e6b7b6f6b522c7b8875a82.svg" align=middle width=164.719005pt height=24.6576pt/>

where tr denotes tensor contraction.

An affine connection also allows us to differentiate vector fields along
curves. For a arbitrary smooth curve[^1] <img src="svgs/c790d0b6a146b4c7b06948fb10b64f5b.svg" align=middle width=74.94861pt height=22.46574pt/> where we
allow for <img src="svgs/21fd4e8eecd6bdf1a4d3d6bd1fb8d733.svg" align=middle width=8.51598pt height=22.46574pt/> to be possibly closed or unbounded, a vector field along
<img src="svgs/11c596de17c342edeed29f489aa4b274.svg" align=middle width=9.423975pt height=14.15535pt/> is a smooth map <img src="svgs/8c8da760f5cb9c68296015476ab4cc62.svg" align=middle width=103.44147pt height=24.6576pt/> where
<img src="svgs/4d14ade2bac8195da308d1b779ac3212.svg" align=middle width=115.860525pt height=24.6576pt/> for all <img src="svgs/ef95f231fad43b01c7c7fe7d4e356d06.svg" align=middle width=34.543245pt height=22.46574pt/>. We will denote the space
of vector fields along <img src="svgs/11c596de17c342edeed29f489aa4b274.svg" align=middle width=9.423975pt height=14.15535pt/> as <img src="svgs/433fb056890214d08c25000220d50af8.svg" align=middle width=36.341745pt height=24.6576pt/>. For any smooth
curve <img src="svgs/11c596de17c342edeed29f489aa4b274.svg" align=middle width=9.423975pt height=14.15535pt/>, the affine connection <img src="svgs/47c28f1929c18f887420345e9225e08b.svg" align=middle width=13.698795pt height=22.46574pt/> induces a mapping
<p align="center"><img src="svgs/fe0d35eab5ca7f8c98bf0f0241da17a8.svg" align=middle width=131.521005pt height=16.438356pt/></p> fulfilling the following
conditions

1.  <img src="svgs/c4fc4fa2673c978d0647b12795081c63.svg" align=middle width=18.74664pt height=22.46574pt/> is linear over <img src="svgs/f3e711926cecfed3003f9ae341f3d92b.svg" align=middle width=11.872245pt height=22.64856pt/>
2.  <img src="svgs/b8e7296e105f8052c1218ca2dcc7bf6a.svg" align=middle width=163.110255pt height=30.63291pt/>
3.  If <img src="svgs/a914ebe2a5b2112dcc4524fff52e75ac.svg" align=middle width=13.242075pt height=30.2676pt/> is a vector field on <img src="svgs/fb97d38bcc19230b0acd442e17db879c.svg" align=middle width=17.73981pt height=22.46574pt/> with <img src="svgs/c6f70914ae91841c9166835a8359e361.svg" align=middle width=25.421055pt height=30.2676pt/> =
    $V$, $D_\text{t}
    V(t) =  
    \nabla_{\dot{\gamma}(t)}{\tilde{V}}$

Using local coordinates, the map is given by <p align="center"><img src="svgs/ebc9692d03cae655138c61404e143474.svg" align=middle width=336.81615pt height=21.434985pt/></p>
For a vector field <img src="svgs/a9a3a4a202d80326bda413b5562d5cd1.svg" align=middle width=13.242075pt height=22.46574pt/> along a curve <img src="svgs/11c596de17c342edeed29f489aa4b274.svg" align=middle width=9.423975pt height=14.15535pt/>, we refer to <img src="svgs/82242fad8f4cd7c36a69a92b6fab8e27.svg" align=middle width=32.81058pt height=22.46574pt/> as the covariant derivative of <img src="svgs/a9a3a4a202d80326bda413b5562d5cd1.svg" align=middle width=13.242075pt height=22.46574pt/> along <img src="svgs/11c596de17c342edeed29f489aa4b274.svg" align=middle width=9.423975pt height=14.15535pt/>.

Having constructed the machinery of covariant differentation of vector field
along curves, we are now able to generalize 'straight lines' to our manifold in
a straightforward manner. We define the *acceleration of a curve* <img src="svgs/11c596de17c342edeed29f489aa4b274.svg" align=middle width=9.423975pt height=14.15535pt/> to be
<img src="svgs/2d5dce94caf625f3dcd54720d7890ed5.svg" align=middle width=28.99248pt height=22.46574pt/>. A *geodesic*, then, is a curve with acceleration
identically equal to zero, i.e. <img src="svgs/a50e5e473f081cf5c23cec517b37ad5e.svg" align=middle width=71.914755pt height=24.6576pt/>. For any <img src="svgs/224cddeb595f2c35493d2b6d8768a7db.svg" align=middle width=47.22597pt height=22.46574pt/>, any <img src="svgs/fee00979f3baee7dfd3ac8e44264924c.svg" align=middle width=81.063015pt height=24.6576pt/>, and any <img src="svgs/ca0311f023d2c47e70f3200fcf00c505.svg" align=middle width=45.27402pt height=22.64856pt/>, there exists an open
interval <img src="svgs/d0124822ff08e54387d8e620aef75296.svg" align=middle width=17.78568pt height=22.46574pt/> around <img src="svgs/6df6ddacc987bd7a5070beafef47fcc1.svg" align=middle width=12.488685pt height=20.22207pt/> and a geodesic <img src="svgs/57944e6ef34f066bc98ab972d6f8f4d7.svg" align=middle width=85.86204pt height=22.46574pt/> such
that <img src="svgs/9de5d3befea59164afdb1d6896019562.svg" align=middle width=66.83259pt height=24.6576pt/> and <img src="svgs/016c62dad3208ed5ae9a7053c86d86cf.svg" align=middle width=70.679565pt height=24.6576pt/>. Furthermore, if <img src="svgs/11c596de17c342edeed29f489aa4b274.svg" align=middle width=9.423975pt height=14.15535pt/>
and <img src="svgs/3b3b368dbedeebe83037448184594673.svg" align=middle width=9.423975pt height=21.95721pt/> are two geodesics satisfying the aforementioned conditions,
then they agree on their mutual domain. This guarantee of uniqueness allows for
the realization of a unique *maximal geodesic*: given <img src="svgs/5b707b10fdb9e6f71f48c99bb6c7b947.svg" align=middle width=47.22597pt height=22.46574pt/> and <img src="svgs/80c3289c1071f0478e7f70fbf2df2a49.svg" align=middle width=81.740835pt height=24.6576pt/>, there exists a geodesic <img src="svgs/de69933db56479ceeb913303d7ca0a64.svg" align=middle width=90.473955pt height=24.71634pt/> where
the domain <img src="svgs/98c818ce844a680f475693cdb957dfb1.svg" align=middle width=17.78568pt height=24.71634pt/> is maximal in the sense that it cannot be extended
to any larger open interval.

Note that the geodesics on a smooth manifold depend on the choice of
affine connection. On a Riemannian manifold, there exists a nearly
canonical choice. Before giving this connection a proper introduction,
we first introduce the *torsion tensor* of a connection, a vector-valued
two-form:
<p align="center"><img src="svgs/15a591b20e89411f82a04ac8392c917b.svg" align=middle width=202.3791pt height=16.438356pt/></p>
<p align="center"><img src="svgs/48d0a5c09123685b4afca734329a02be.svg" align=middle width=246.0051pt height=16.438356pt/></p>

where <img src="svgs/5c86ee5faf012f80ef6d20feebbfbf07.svg" align=middle width=25.570875pt height=24.6576pt/> is the usual Lie bracket. Using the canonical
isomorphism between multilinear maps from
<img src="svgs/c02750d595a061dec640fe7167953e86.svg" align=middle width=190.884705pt height=24.6576pt/> to the space of <img src="svgs/c80fb59edca5b67a717eef9e890fceec.svg" align=middle width=21.621105pt height=29.4195pt/>-tensors
on <img src="svgs/9db8e54afccdb542014719c2be4b8a0c.svg" align=middle width=48.4077pt height=24.6576pt/>, we also view <img src="svgs/0fe1677705e987cac4f589ed600aa6b3.svg" align=middle width=9.04695pt height=14.15535pt/> as a <img src="svgs/c80fb59edca5b67a717eef9e890fceec.svg" align=middle width=21.621105pt height=29.4195pt/>-tensor field. If the
torsion tensor associated to a connection <img src="svgs/47c28f1929c18f887420345e9225e08b.svg" align=middle width=13.698795pt height=22.46574pt/> is identically equal
to zero, we say that <img src="svgs/47c28f1929c18f887420345e9225e08b.svg" align=middle width=13.698795pt height=22.46574pt/> is *symmetric* or *torsion-free*.

Next, we introduce the property of compatibility with a metric. Given a
Riemannian manifold <img src="svgs/6e4f215c8a1c3b38f82319e2ce4d2b13.svg" align=middle width=45.34827pt height=24.6576pt/> with affine connection, <img src="svgs/47c28f1929c18f887420345e9225e08b.svg" align=middle width=13.698795pt height=22.46574pt/> we say
that <img src="svgs/47c28f1929c18f887420345e9225e08b.svg" align=middle width=13.698795pt height=22.46574pt/> is *compatible with the metric* <img src="svgs/3cf4fbd05970446973fc3d9fa3fe3c41.svg" align=middle width=8.43051pt height=14.15535pt/> if for all
<img src="svgs/8ab2524a284a8917f62f6e704f5dd446.svg" align=middle width=116.209995pt height=24.6576pt/>,

<p align="center"><img src="svgs/1735aad82279e3da6a6ee62fe3541bc8.svg" align=middle width=274.7217pt height=16.438356pt/></p>

Our favored connection, the *Levi-Civita connection*, is a unique
connection that exists on any Riemannian manifold which is both
symmetric and compatible with the metric. Henceforth, we will always
assume the given affine connection is the Levi-Civita connection when
stated without further qualifications.

Given a geodesic <img src="svgs/687d7149af792dd235e032a13d62e319.svg" align=middle width=74.94861pt height=22.46574pt/> in a Riemannian manifold, we will
define the speed of <img src="svgs/11c596de17c342edeed29f489aa4b274.svg" align=middle width=9.423975pt height=14.15535pt/> at time <img src="svgs/4f4f4e395762a3af4575de74c019ebb5.svg" align=middle width=5.9361555pt height=20.22207pt/> as <img src="svgs/0a1a0562103e57e9009eb708857a888c.svg" align=middle width=37.277955pt height=24.6576pt/>. It is
satisfying to know that under the Levi-Civita connection, all geodesics
are of constant speed.

### The Exponential Map

The *Riemannian exponential map*, exp, is an object of critical
importance in Riemannian geometry. Intuitively, the exponential map
generalizes nothing less than the action in an Euclidean space of moving
a single unit in a direction! Given <img src="svgs/5b707b10fdb9e6f71f48c99bb6c7b947.svg" align=middle width=47.22597pt height=22.46574pt/> and <img src="svgs/71727ef5e3740eb8cde8074e6e1b478d.svg" align=middle width=81.740835pt height=24.6576pt/>, let
<img src="svgs/d40df7d9065c08bddc6390d4edff9786.svg" align=middle width=19.10436pt height=14.15535pt/> be the unique maximal geodesic associated to <img src="svgs/332cc365a4987aacce0ead01b8bdcc0b.svg" align=middle width=9.3951pt height=14.15535pt/> and <img src="svgs/a9a3a4a202d80326bda413b5562d5cd1.svg" align=middle width=13.242075pt height=22.46574pt/>. Let
<img src="svgs/9be2cbd73f925171f80be87f54b52d69.svg" align=middle width=118.66998pt height=24.6576pt/>: the domain of <img src="svgs/d40df7d9065c08bddc6390d4edff9786.svg" align=middle width=19.10436pt height=14.15535pt/> contains <img src="svgs/acf5ce819219b95070be2dbeb8a671e9.svg" align=middle width=32.876745pt height=24.6576pt/>},
an open subset of <img src="svgs/a11c4f34a7edb37c8ca75fb93a5e9888.svg" align=middle width=42.41457pt height=24.6576pt/>. Define

<p align="center"><img src="svgs/b35c201abf98fb01d24df0dc1039dfe5.svg" align=middle width=94.90833pt height=14.429217pt/></p>
<p align="center"><img src="svgs/fc6fc5d0f28da95e9f4df58ea6932e10.svg" align=middle width=118.55646pt height=16.438356pt/></p>

Briefly, we will list some key properties of the exponential map.

1.  The Riemannian exponential map is smooth.

2.  We have that <img src="svgs/64078def2544604885ccee7ad7c4d21b.svg" align=middle width=117.643185pt height=24.6576pt/> where either side of the
    equality exists.

3.  For any <img src="svgs/5b707b10fdb9e6f71f48c99bb6c7b947.svg" align=middle width=47.22597pt height=22.46574pt/>, there exists an neighborhood <img src="svgs/6bac6ec50c01592407695ef84f457232.svg" align=middle width=13.016025pt height=22.46574pt/> around <img src="svgs/332cc365a4987aacce0ead01b8bdcc0b.svg" align=middle width=9.3951pt height=14.15535pt/> and a
    neighborhood $\tilde{U}$ around the origin in $T_x(M)$ such that
    $\text{exp}_{|\tilde{U}}$ maps diffeomorphically onto $U$.

One final piece of terminology in this section: if every maximal
geodesic on a Riemannian manifold <img src="svgs/6e4f215c8a1c3b38f82319e2ce4d2b13.svg" align=middle width=45.34827pt height=24.6576pt/> is defined for all
<img src="svgs/f11bc54fe42ee2c70993ae6495a161db.svg" align=middle width=37.89951pt height=22.64856pt/>, or, equivalently, the domain of the exponential map
<img src="svgs/d20454f75a133b87c6351eed3d4bccc2.svg" align=middle width=12.78552pt height=22.46574pt/> is the entire tangent bundle <img src="svgs/a11c4f34a7edb37c8ca75fb93a5e9888.svg" align=middle width=42.41457pt height=24.6576pt/>, we say that the manifold
is *geodesically complete* or simply *complete*.

### Lengths and Geodesic Distance

Let <img src="svgs/21fd4e8eecd6bdf1a4d3d6bd1fb8d733.svg" align=middle width=8.51598pt height=22.46574pt/> be an interval (possibly unbounded) with endpoints <img src="svgs/1d9fd5779b201a5c12822af206beeb57.svg" align=middle width=27.61605pt height=22.83138pt/> where
<img src="svgs/b7b966c92b159a767894580d1f2a5637.svg" align=middle width=37.66158pt height=22.83138pt/>. For a smooth curve <img src="svgs/687d7149af792dd235e032a13d62e319.svg" align=middle width=74.94861pt height=22.46574pt/>, define the *length of
the curve* <img src="svgs/11c596de17c342edeed29f489aa4b274.svg" align=middle width=9.423975pt height=14.15535pt/> by
<p align="center"><img src="svgs/2c7c8f79df98af1509a21b9c09d4d663.svg" align=middle width=137.581785pt height=41.278875pt/></p> If <img src="svgs/21fd4e8eecd6bdf1a4d3d6bd1fb8d733.svg" align=middle width=8.51598pt height=22.46574pt/> is
bounded and <img src="svgs/11c596de17c342edeed29f489aa4b274.svg" align=middle width=9.423975pt height=14.15535pt/> can be extended to a curve on cl<img src="svgs/35f32113ad2aea6110ac19404a896cdb.svg" align=middle width=21.3015pt height=24.6576pt/>, then
<img src="svgs/2a703f71fc0a63378a22e9faea9b1c24.svg" align=middle width=33.547305pt height=24.6576pt/> is finite. Note that so long as <img src="svgs/11c596de17c342edeed29f489aa4b274.svg" align=middle width=9.423975pt height=14.15535pt/> is not a
trivial curve, we can always reparametrize <img src="svgs/11c596de17c342edeed29f489aa4b274.svg" align=middle width=9.423975pt height=14.15535pt/> to be a unit-speed
curve without changing its length.

A *curve segment* will be a curve whose domain is a closed, bounded
interval <img src="svgs/bd4455e79810acc06e3d31c60fb8bfb2.svg" align=middle width=32.182425pt height=24.6576pt/>. If <img src="svgs/11c596de17c342edeed29f489aa4b274.svg" align=middle width=9.423975pt height=14.15535pt/> is a curve segment where <img src="svgs/60b85a02f5f5d961c3061537ed5c0125.svg" align=middle width=62.211105pt height=24.6576pt/>
and <img src="svgs/5d3e364c9094817de716fe2cae7f401d.svg" align=middle width=59.83098pt height=24.6576pt/>, then we will say <img src="svgs/11c596de17c342edeed29f489aa4b274.svg" align=middle width=9.423975pt height=14.15535pt/> *connects* <img src="svgs/332cc365a4987aacce0ead01b8bdcc0b.svg" align=middle width=9.3951pt height=14.15535pt/> and <img src="svgs/deceeaf6940a8c7a5a02373728002b0f.svg" align=middle width=8.6493pt height=14.15535pt/>.
We now have enough machinery to define the *geodesic distance* <img src="svgs/ee7d687d6c557363ea563e74049a0e89.svg" align=middle width=46.691535pt height=24.6576pt/>
between two points on a Riemannian manifold <img src="svgs/6e4f215c8a1c3b38f82319e2ce4d2b13.svg" align=middle width=45.34827pt height=24.6576pt/>: <p align="center"><img src="svgs/6829841aa33a69e818bde33de9b2ccef.svg" align=middle width=132.202125pt height=24.42924pt/></p> where we
consider the infimum over all curve segments connecting <img src="svgs/332cc365a4987aacce0ead01b8bdcc0b.svg" align=middle width=9.3951pt height=14.15535pt/> and <img src="svgs/deceeaf6940a8c7a5a02373728002b0f.svg" align=middle width=8.6493pt height=14.15535pt/>. It
may very well be that <img src="svgs/332cc365a4987aacce0ead01b8bdcc0b.svg" align=middle width=9.3951pt height=14.15535pt/> and <img src="svgs/deceeaf6940a8c7a5a02373728002b0f.svg" align=middle width=8.6493pt height=14.15535pt/> are not connected by any curve
segment: in that case we use the convention that the infimum returns a
value of <img src="svgs/701fa44621fd283e3f2c5468958859d8.svg" align=middle width=29.223975pt height=19.17828pt/>. If <img src="svgs/3b3b368dbedeebe83037448184594673.svg" align=middle width=9.423975pt height=21.95721pt/> is a curve segment such that the
infimum is attained on <img src="svgs/3b3b368dbedeebe83037448184594673.svg" align=middle width=9.423975pt height=21.95721pt/> and <img src="svgs/3b3b368dbedeebe83037448184594673.svg" align=middle width=9.423975pt height=21.95721pt/> has a unit-speed
parametrization, we say <img src="svgs/3b3b368dbedeebe83037448184594673.svg" align=middle width=9.423975pt height=21.95721pt/> is a *minimizing geodesic*. Naturally,
<img src="svgs/3b3b368dbedeebe83037448184594673.svg" align=middle width=9.423975pt height=21.95721pt/> turns out to be a geodesic in the sense that <img src="svgs/1dbea99de2ba33732dca99efd35ccf12.svg" align=middle width=59.129235pt height=22.46574pt/> as well.

Remarkably, the geodesic distance forms a metric[^2] on a Riemannian
manifold, where we are flexible with our definition of a metric in
allowing the metric to take the value <img src="svgs/701fa44621fd283e3f2c5468958859d8.svg" align=middle width=29.223975pt height=19.17828pt/>. Moreover, the topology
<img src="svgs/2103f85b8b1477f430fc407cad462224.svg" align=middle width=8.556075pt height=22.83138pt/> induces on <img src="svgs/fb97d38bcc19230b0acd442e17db879c.svg" align=middle width=17.73981pt height=22.46574pt/> agrees with the original manifold topology of <img src="svgs/fb97d38bcc19230b0acd442e17db879c.svg" align=middle width=17.73981pt height=22.46574pt/>. If
<img src="svgs/fb97d38bcc19230b0acd442e17db879c.svg" align=middle width=17.73981pt height=22.46574pt/> is a connected (and therefore path-connected) Riemannian manifold,
<img src="svgs/2103f85b8b1477f430fc407cad462224.svg" align=middle width=8.556075pt height=22.83138pt/> is a finite metric.

From here on out, we will restrict ourselves to the setting of connected
Riemannian manifolds. Here, the famed Hopf-Rinow theorem reveals
motivation for using the term 'geodesically complete'. We state its
conclusions without proof.

___

###### Hopf-Rinow:
On a connected Riemannian manifold <img src="svgs/6e4f215c8a1c3b38f82319e2ce4d2b13.svg" align=middle width=45.34827pt height=24.6576pt/>, the following statements
are equivalent:

1.  <img src="svgs/fb97d38bcc19230b0acd442e17db879c.svg" align=middle width=17.73981pt height=22.46574pt/> is complete as a metric space under the geodesic distance
    function $d$.

2.  <img src="svgs/6e4f215c8a1c3b38f82319e2ce4d2b13.svg" align=middle width=45.34827pt height=24.6576pt/> is geodesically complete.

3.  The closed and bounded subsets of <img src="svgs/fb97d38bcc19230b0acd442e17db879c.svg" align=middle width=17.73981pt height=22.46574pt/> are compact (Heine-Borel
    Property).

___

If <img src="svgs/6e4f215c8a1c3b38f82319e2ce4d2b13.svg" align=middle width=45.34827pt height=24.6576pt/> is a complete Riemannian manifold, for any <img src="svgs/60e3834cb24ad39934e312faa6595aeb.svg" align=middle width=63.180975pt height=22.46574pt/>,
there is always a minimizing geodesic <img src="svgs/3b3b368dbedeebe83037448184594673.svg" align=middle width=9.423975pt height=21.95721pt/> that connects <img src="svgs/332cc365a4987aacce0ead01b8bdcc0b.svg" align=middle width=9.3951pt height=14.15535pt/>
and <img src="svgs/deceeaf6940a8c7a5a02373728002b0f.svg" align=middle width=8.6493pt height=14.15535pt/>. We assert that a compact Riemannian manifold is always
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
<p align="center"><img src="svgs/91b76882fa98863dee885a3b83e66e26.svg" align=middle width=113.05173pt height=17.03196pt/></p>
and
<p align="center"><img src="svgs/c53c9ff6687a277eb68165ad0c41bf48.svg" align=middle width=145.613655pt height=25.168935pt/></p>
where <img src="svgs/d6328eaebbcd5c358f426dbea4bdbf70.svg" align=middle width=15.1371pt height=22.46574pt/> is a compact
subset of <img src="svgs/fb97d38bcc19230b0acd442e17db879c.svg" align=middle width=17.73981pt height=22.46574pt/>. These are the main objects of consideration in this thesis. We
will find it proves useful to recognize that for <img src="svgs/5b707b10fdb9e6f71f48c99bb6c7b947.svg" align=middle width=47.22597pt height=22.46574pt/> where <img src="svgs/b2a44428ecf9e526be9ae76a76a4c603.svg" align=middle width=44.62326pt height=24.6576pt/>,
there exists a (not necessarily unique) geodesic <img src="svgs/3b3b368dbedeebe83037448184594673.svg" align=middle width=9.423975pt height=21.95721pt/> such that the
distance from <img src="svgs/d6328eaebbcd5c358f426dbea4bdbf70.svg" align=middle width=15.1371pt height=22.46574pt/> to <img src="svgs/332cc365a4987aacce0ead01b8bdcc0b.svg" align=middle width=9.3951pt height=14.15535pt/> is minimized with <img src="svgs/3b3b368dbedeebe83037448184594673.svg" align=middle width=9.423975pt height=21.95721pt/>; just take a
sequence of elements <img src="svgs/f3bcc84cfa764fa2c2a2208ec64291b6.svg" align=middle width=68.67399pt height=24.6576pt/> converging to the minimum distance, observe
that <img src="svgs/d6328eaebbcd5c358f426dbea4bdbf70.svg" align=middle width=15.1371pt height=22.46574pt/> is compact and closed so that a subsequence must converge to another
element <img src="svgs/dd104608c72a5c6aa22444ea32c331be.svg" align=middle width=43.87746pt height=22.46574pt/>, and remember that there is always a minimizing geodesic
connecting any two points in a complete Riemannian manifold. This leads us to
the following propositions:

___

1. Let <img src="svgs/d6328eaebbcd5c358f426dbea4bdbf70.svg" align=middle width=15.1371pt height=22.46574pt/> be a compact subset of a Riemannian manifold <img src="svgs/6e4f215c8a1c3b38f82319e2ce4d2b13.svg" align=middle width=45.34827pt height=24.6576pt/>, and
<img src="svgs/2abece855d2150ae7c1002e9b628432c.svg" align=middle width=21.64635pt height=22.83138pt/> the distance function to the subset <img src="svgs/d6328eaebbcd5c358f426dbea4bdbf70.svg" align=middle width=15.1371pt height=22.46574pt/>. If <img src="svgs/2abece855d2150ae7c1002e9b628432c.svg" align=middle width=21.64635pt height=22.83138pt/> is smooth
at <img src="svgs/5b707b10fdb9e6f71f48c99bb6c7b947.svg" align=middle width=47.22597pt height=22.46574pt/>, <img src="svgs/f50853d41be7d55874e952eb0d80c53e.svg" align=middle width=9.794565pt height=22.83138pt/> satisfies the Eikonal equation
<p align="center"><img src="svgs/a4f29fb4b7e2149f4c40c5cc274b9c41.svg" align=middle width=99.22605pt height=16.438356pt/></p> and there is a unique minimizing geodesic
from <img src="svgs/d6328eaebbcd5c358f426dbea4bdbf70.svg" align=middle width=15.1371pt height=22.46574pt/> to <img src="svgs/332cc365a4987aacce0ead01b8bdcc0b.svg" align=middle width=9.3951pt height=14.15535pt/>.

2. Let <img src="svgs/deceeaf6940a8c7a5a02373728002b0f.svg" align=middle width=8.6493pt height=14.15535pt/> be a point in a Riemannian manifold <img src="svgs/6e4f215c8a1c3b38f82319e2ce4d2b13.svg" align=middle width=45.34827pt height=24.6576pt/>, and <img src="svgs/4ff4d31ddc8410cea8a0368c1fdb0fa3.svg" align=middle width=16.87422pt height=22.83138pt/> the
distance function to the point <img src="svgs/deceeaf6940a8c7a5a02373728002b0f.svg" align=middle width=8.6493pt height=14.15535pt/>. For all points for <img src="svgs/9f42f46ccfd7f8c6096f1a85cad8bb76.svg" align=middle width=74.834265pt height=24.6576pt/>,
<img src="svgs/9ea61e37441086e0279aa2ecd838eb01.svg" align=middle width=39.961845pt height=22.83138pt/> for which there are unique minimizing geodesics connecting
<img src="svgs/deceeaf6940a8c7a5a02373728002b0f.svg" align=middle width=8.6493pt height=14.15535pt/> to <img src="svgs/332cc365a4987aacce0ead01b8bdcc0b.svg" align=middle width=9.3951pt height=14.15535pt/>, <img src="svgs/4ff4d31ddc8410cea8a0368c1fdb0fa3.svg" align=middle width=16.87422pt height=22.83138pt/> is smooth at x.

___

Given a source point <img src="svgs/deceeaf6940a8c7a5a02373728002b0f.svg" align=middle width=8.6493pt height=14.15535pt/>, we will let <img src="svgs/d9f4faca760c0916c155935de1d509c6.svg" align=middle width=57.016245pt height=24.6576pt/> denote the *ordinary
cut locus of* <img src="svgs/deceeaf6940a8c7a5a02373728002b0f.svg" align=middle width=8.6493pt height=14.15535pt/>[^4]. Elements of <img src="svgs/d9f4faca760c0916c155935de1d509c6.svg" align=middle width=57.016245pt height=24.6576pt/> are the set of points in
<img src="svgs/fb97d38bcc19230b0acd442e17db879c.svg" align=middle width=17.73981pt height=22.46574pt/> for which there are multiple minimizing geodesics connecting them to
<img src="svgs/deceeaf6940a8c7a5a02373728002b0f.svg" align=middle width=8.6493pt height=14.15535pt/>. Away from <img src="svgs/deceeaf6940a8c7a5a02373728002b0f.svg" align=middle width=8.6493pt height=14.15535pt/> itself and <img src="svgs/d9f4faca760c0916c155935de1d509c6.svg" align=middle width=57.016245pt height=24.6576pt/>, <img src="svgs/4ff4d31ddc8410cea8a0368c1fdb0fa3.svg" align=middle width=16.87422pt height=22.83138pt/> must be smooth.

To see how <img src="svgs/4ff4d31ddc8410cea8a0368c1fdb0fa3.svg" align=middle width=16.87422pt height=22.83138pt/> can fail to be smooth at <img src="svgs/deceeaf6940a8c7a5a02373728002b0f.svg" align=middle width=8.6493pt height=14.15535pt/> itself and <img src="svgs/d9f4faca760c0916c155935de1d509c6.svg" align=middle width=57.016245pt height=24.6576pt/>,
let us consider a simple example. Let <img src="svgs/332cc365a4987aacce0ead01b8bdcc0b.svg" align=middle width=9.3951pt height=14.15535pt/> and <img src="svgs/deceeaf6940a8c7a5a02373728002b0f.svg" align=middle width=8.6493pt height=14.15535pt/> be two antipodal
points on the sphere <img src="svgs/89addb8e953cb14c01e0f8378ee046b8.svg" align=middle width=17.579925pt height=26.76201pt/>. Then <img src="svgs/e4b5698f58621c82a563852982efe7e5.svg" align=middle width=86.502405pt height=24.6576pt/>, and <img src="svgs/4ff4d31ddc8410cea8a0368c1fdb0fa3.svg" align=middle width=16.87422pt height=22.83138pt/> is
respectively maximized and minimized at <img src="svgs/332cc365a4987aacce0ead01b8bdcc0b.svg" align=middle width=9.3951pt height=14.15535pt/> and <img src="svgs/deceeaf6940a8c7a5a02373728002b0f.svg" align=middle width=8.6493pt height=14.15535pt/>. However, <img src="svgs/4ff4d31ddc8410cea8a0368c1fdb0fa3.svg" align=middle width=16.87422pt height=22.83138pt/>
must also satisfy the Eikonal equation where <img src="svgs/4ff4d31ddc8410cea8a0368c1fdb0fa3.svg" align=middle width=16.87422pt height=22.83138pt/> is smooth, and
thus, if <img src="svgs/4ff4d31ddc8410cea8a0368c1fdb0fa3.svg" align=middle width=16.87422pt height=22.83138pt/> were smooth at <img src="svgs/332cc365a4987aacce0ead01b8bdcc0b.svg" align=middle width=9.3951pt height=14.15535pt/> or <img src="svgs/deceeaf6940a8c7a5a02373728002b0f.svg" align=middle width=8.6493pt height=14.15535pt/>, the gradient could not have
vanished at those points, a contradiction. Thus, elements in the
ordinary cut locus may function as critical points, causing the failure
for the distance function to be smooth.

Some geometers like to deal with the squared distance function
<img src="svgs/48c721da2c0190132d88d41a2a2920ca.svg" align=middle width=17.248935pt height=26.76201pt/> rather than <img src="svgs/33d43857fdb3f8dc5dccea6f935af141.svg" align=middle width=17.248935pt height=22.83138pt/> as <img src="svgs/48c721da2c0190132d88d41a2a2920ca.svg" align=middle width=17.248935pt height=26.76201pt/> will be smooth at the
source point <img src="svgs/332cc365a4987aacce0ead01b8bdcc0b.svg" align=middle width=9.3951pt height=14.15535pt/>. There exists an enlightening result that a complete,
connected Riemannian manifold <img src="svgs/9cc44a045b8ba087128bfb2e100342a6.svg" align=middle width=45.34827pt height=24.6576pt/> of dimension <img src="svgs/55a049b8f161ae7cfeb0197d75aff967.svg" align=middle width=9.867pt height=14.15535pt/> must be
diffeomorphic to <img src="svgs/8a86f4a11e2fbfc03de61d587ba826de.svg" align=middle width=19.99833pt height=22.64856pt/> if there exists <img src="svgs/7ac71293a5b1cd9f5a70e68b6d1debef.svg" align=middle width=46.198515pt height=22.46574pt/> such that the
squared distance function <img src="svgs/d4df7d75bfb49890395ea330e080210c.svg" align=middle width=16.547025pt height=26.76201pt/> is everywhere smooth. Thus, <img src="svgs/8a86f4a11e2fbfc03de61d587ba826de.svg" align=middle width=19.99833pt height=22.64856pt/>
forms a special case in that the associated distance functions are especially
well-behaved.

### Riemannian Measure, Divergence, and Laplace-Beltrami Operator

Let <img src="svgs/6e4f215c8a1c3b38f82319e2ce4d2b13.svg" align=middle width=45.34827pt height=24.6576pt/> be a Riemannian manifold of dimension <img src="svgs/f9c4988898e7f532b9f826a75014ed3c.svg" align=middle width=14.999985pt height=22.46574pt/>. Let <img src="svgs/e82d897e900d64dc41950a6ac3376efb.svg" align=middle width=43.818555pt height=24.6576pt/>
denote the Borel sets on <img src="svgs/fb97d38bcc19230b0acd442e17db879c.svg" align=middle width=17.73981pt height=22.46574pt/>, i.e. the smallest <img src="svgs/8cda31ed38c6d59d14ebefa440099572.svg" align=middle width=9.982995pt height=14.15535pt/>-algebra
containing the collection of open sets in <img src="svgs/fb97d38bcc19230b0acd442e17db879c.svg" align=middle width=17.73981pt height=22.46574pt/>. We will say a set
<img src="svgs/3b4220d81513be1ca5be52c58786edea.svg" align=middle width=50.684865pt height=22.46574pt/> is measurable if for any chart <img src="svgs/72fead2a36a30f68aeb661de8e3e891c.svg" align=middle width=39.779685pt height=24.6576pt/>,
<img src="svgs/59d64805a146b3a983247ecf46863847.svg" align=middle width=63.59232pt height=24.6576pt/> is Lebesgue measurable. We will let <img src="svgs/a13a72f326d0ea5ace4ed914788fd0b1.svg" align=middle width=41.94069pt height=24.6576pt/> denote
the <img src="svgs/8cda31ed38c6d59d14ebefa440099572.svg" align=middle width=9.982995pt height=14.15535pt/>-algebra of all measurable sets in <img src="svgs/fb97d38bcc19230b0acd442e17db879c.svg" align=middle width=17.73981pt height=22.46574pt/>. Clearly,
<img src="svgs/481904e2ff775b86453373a8269c58fe.svg" align=middle width=107.67702pt height=24.6576pt/>.

There is a canonical measure <img src="svgs/b49211c7e49541e500c32b4d56d354dc.svg" align=middle width=9.16674pt height=14.15535pt/> defined on <img src="svgs/a13a72f326d0ea5ace4ed914788fd0b1.svg" align=middle width=41.94069pt height=24.6576pt/>, which we
will unceremoniously name the *Riemannian measure*. The measure <img src="svgs/b49211c7e49541e500c32b4d56d354dc.svg" align=middle width=9.16674pt height=14.15535pt/>
can be constructed using the defining property that for any measurable
set in a chart <img src="svgs/72fead2a36a30f68aeb661de8e3e891c.svg" align=middle width=39.779685pt height=24.6576pt/>
<p align="center"><img src="svgs/0f43511538242bfa273a6fcf6824f2df.svg" align=middle width=164.710755pt height=40.22865pt/></p> where <img src="svgs/fd8be73b54f5436a5cd2e73ba9b6bfa9.svg" align=middle width=9.58914pt height=22.83138pt/>
denotes the Lebesque measure, and <img src="svgs/3cf4fbd05970446973fc3d9fa3fe3c41.svg" align=middle width=8.43051pt height=14.15535pt/> is the Riemannian metric.

The existence of the Riemannian measure makes it straightforward to
consider integration on Riemannian manifolds. We will immediately use
this to define a divergence operator. Let <img src="svgs/6d40960a4e8839616001470d0a9ae425.svg" align=middle width=57.37677pt height=24.6576pt/> denote the
subspace of <img src="svgs/11fcbe4a636f10aec095ae4a1b99f964.svg" align=middle width=57.37677pt height=24.6576pt/> consisting of functions with compact support.
Then we will define the divergence
<p align="center"><img src="svgs/cd2ad80b712410cce2f35f4b858aadfc.svg" align=middle width=163.677855pt height=16.438356pt/></p> by setting div <img src="svgs/cbfb1b2a33b28eab8a3e59464768e810.svg" align=middle width=14.90874pt height=22.46574pt/> to be
the unique smooth function such that for all <img src="svgs/2eb42a4c84800390bf10e4530dbc321b.svg" align=middle width=86.878275pt height=24.6576pt/> the
following identity holds
<p align="center"><img src="svgs/caa234f66fb1f4ed8b4c478066bd0868.svg" align=middle width=267.19275pt height=37.35204pt/></p>

In local coordinates, one can obtain using integration by parts that
<p align="center"><img src="svgs/a0452e128fe578d0a24acac72f1c3eb2.svg" align=middle width=236.049pt height=37.001745pt/></p>

As we have a gradient and divergence, it is now simple to generalize a
version of a Laplacian to our Riemannian manifold. We define the
*Laplace-Beltrami operator* as <p align="center"><img src="svgs/998c675834dfdfc8933b528592304fd4.svg" align=middle width=167.72085pt height=16.438356pt/></p>
<p align="center"><img src="svgs/8332e5cdcca21ca44d007e4fb427e280.svg" align=middle width=110.0913pt height=14.611872pt/></p>

In local coordinates, this becomes
<p align="center"><img src="svgs/2f432f76502cc097b2ee8d186eb2fe31.svg" align=middle width=227.74455pt height=37.001745pt/></p>

### Heat Kernels and Varadhan's Formula

Given a connected Riemannian manifold <img src="svgs/6e4f215c8a1c3b38f82319e2ce4d2b13.svg" align=middle width=45.34827pt height=24.6576pt/>, the heat kernel on <img src="svgs/6e4f215c8a1c3b38f82319e2ce4d2b13.svg" align=middle width=45.34827pt height=24.6576pt/> is a
mapping <img src="svgs/00c372bc25e52a80157cc85411c9d6f6.svg" align=middle width=66.514635pt height=24.6576pt/> where <p align="center"><img src="svgs/70cffa681e93dd5c7986d63cdfb40936.svg" align=middle width=241.9065pt height=16.438356pt/></p> that is the smallest positive *fundamental solution* to the heat
equation posed on <img src="svgs/cc82fe49f6c92a63d507b777af1926a2.svg" align=middle width=110.18832pt height=24.6576pt/>. By a fundamental solution we mean
that <img src="svgs/00c372bc25e52a80157cc85411c9d6f6.svg" align=middle width=66.514635pt height=24.6576pt/> satisfies

<p align="center"><img src="svgs/a230247e899d63a87253296418895f2a.svg" align=middle width=90.6312pt height=33.81213pt/></p>

<p align="center"><img src="svgs/00772ad61e04ee20739041b15940f905.svg" align=middle width=190.03215pt height=17.03196pt/></p>

where <img src="svgs/d823a03369fc6603a75719f2a8890c7b.svg" align=middle width=21.153165pt height=22.46574pt/> is used to denote that we let the Laplacian act on the second
variable <img src="svgs/332cc365a4987aacce0ead01b8bdcc0b.svg" align=middle width=9.3951pt height=14.15535pt/>, and <img src="svgs/d06ac71193f4471847981d2fcd14f129.svg" align=middle width=37.38801pt height=24.6576pt/> is a Dirac delta distribution centered at <img src="svgs/deceeaf6940a8c7a5a02373728002b0f.svg" align=middle width=8.6493pt height=14.15535pt/>.
We say <img src="svgs/00c372bc25e52a80157cc85411c9d6f6.svg" align=middle width=66.514635pt height=24.6576pt/> is smallest in the sense that if <img src="svgs/d04d1b69bfeb8e35779ec1b0eda7334c.svg" align=middle width=66.37752pt height=24.6576pt/> is another
positive fundamental solution, <img src="svgs/d1c9d42fafe0e78f84598ed2e9edd2c2.svg" align=middle width=154.8096pt height=24.6576pt/> on <img src="svgs/9d8f11ff45e91e938552fda7e4c831b1.svg" align=middle width=175.627155pt height=24.6576pt/>. The existence of the heat kernel on the entire
manifold <img src="svgs/6e4f215c8a1c3b38f82319e2ce4d2b13.svg" align=middle width=45.34827pt height=24.6576pt/> can be shown by considering the limit of similarly motivated
heat kernels on an exhausting sequence of precompact sets with smooth boundary.

In the simple setting of <img src="svgs/8a86f4a11e2fbfc03de61d587ba826de.svg" align=middle width=19.99833pt height=22.64856pt/>, the heat kernel can be given by
the explicitly as

<p align="center"><img src="svgs/2cfb12a56799dfb4847f49cc392d2042.svg" align=middle width=302.7321pt height=39.45249pt/></p>

where exp is the standard exponential function on <img src="svgs/f3e711926cecfed3003f9ae341f3d92b.svg" align=middle width=11.872245pt height=22.64856pt/>. We can
apply a simple transformation and see immediately that
<p align="center"><img src="svgs/47c0e04139fd9437fd5cf3071d6cbdf2.svg" align=middle width=271.0191pt height=18.31236pt/></p> The
function <img src="svgs/cfc6e2f300eecd9db6da6c6fd0e7ba2d.svg" align=middle width=53.820525pt height=26.76201pt/> is the squared distance function on <img src="svgs/8a86f4a11e2fbfc03de61d587ba826de.svg" align=middle width=19.99833pt height=22.64856pt/>.
This behavior actually holds in the setting of all complete, connected
Riemannian manifolds with bounded distance functions:

___

###### Varadhan's Formula:
Let <img src="svgs/6e4f215c8a1c3b38f82319e2ce4d2b13.svg" align=middle width=45.34827pt height=24.6576pt/> be a complete, connected Riemannian manifold whose distance
function <img src="svgs/2103f85b8b1477f430fc407cad462224.svg" align=middle width=8.556075pt height=22.83138pt/> is bounded. Let <img src="svgs/00c372bc25e52a80157cc85411c9d6f6.svg" align=middle width=66.514635pt height=24.6576pt/> be the associated heat kernel.
Then <p align="center"><img src="svgs/5f2cdcd098c0c12145fabf81ef91a383.svg" align=middle width=275.0088pt height=18.31236pt/></p>

[^1]: Smooth curves will always be <img src="svgs/b18c43fc2c8361465b7a7d6dc0768c85.svg" align=middle width=26.02974pt height=22.46574pt/> smooth.

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
