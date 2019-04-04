---
title: The Adjoint State Method
---

## Problem Setup

Some remarks on notation first: we'll use $d_z$ to denote a total derivative
and $\partial_z$ to denote a partial. We'll also use f_x to denote a partial or
total derivative when it's contextually clear.

The adjoint state method is a trick to facilitate faster gradient computations
in a number of problems with a very specific structure. The general setup is
this: let $x \in \mathbb{R}^{n_x}$ and $p \in \mathbb{R}^{n_p}$. Here,
$x$ is typically used to represent some state and $p$ typically represents some
parameters such as design parameters in an engineering application. We have a
constraint equation
$$ g(x, p) = 0 $$
$$ g : \mathbb{R}^{n_x} \times \mathbb{R}^{n_p} \to \mathbb{R}^{n_x} $$
that ties together $x$ and $p$. We'll assume here that $d_x g$ exists and is
everywhere nonsingular. We also have some objective function
$$ f(x, p) $$
$$ g : \mathbb{R}^{n_x} \times \mathbb{R}^{n_p} \to \mathbb{R} $$
and our ultimate goal is to compute $d_p f$. We may be interest in using $d_p f$
for minimizing $f$ (gradient descent) or we may just want to look at the
sensitivities.

The solving of the equation $g(x, p) = 0$ is typically called solving the
 *forward problem*, whereas minimizing $f$ is known as the inverse problem.

## Setup 1: when $f$ doesn't actually depend on $p$

We'll start with easy examples first. Suppose $f(x, p) = f(x)$ for all $p$,
that is, $f$ doesn't actually depend on $p$. Note that
$$
d_p f = d_p (f(x(p))) = \partial_x f d_p x.
$$
Since we have that $g(x, p) = 0$ everywhere, we have than $d_p g = 0$
everywhere. 
