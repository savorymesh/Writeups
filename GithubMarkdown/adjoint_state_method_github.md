---
title: The Adjoint State Method
---

## Problem Setup

Some remarks on notation first: we'll use <img src="svgs/2bb1939351eed795d60ecf00c446a614.svg" align=middle width=15.30837pt height=22.83138pt/> to denote a total derivative
and <img src="svgs/6be9e38056a6e4fa5aa9e7e46348a46a.svg" align=middle width=15.47964pt height=22.83138pt/> to denote a partial. We'll also use f_x to denote a partial or
total derivative when it's contextually clear.

The adjoint state method is a trick to facilitate faster gradient computations
in a number of problems with a very specific structure. The general setup is
this: let <img src="svgs/4c887bf574ad97c7faf6374587e427e5.svg" align=middle width=55.991265pt height=22.64856pt/> and <img src="svgs/c35bcdf5eebf67892bb1f103bc5d1397.svg" align=middle width=54.43977pt height=22.64856pt/>. Here,
<img src="svgs/332cc365a4987aacce0ead01b8bdcc0b.svg" align=middle width=9.3951pt height=14.15535pt/> is typically used to represent some state and <img src="svgs/2ec6e630f199f589a2402fdf3e0289d5.svg" align=middle width=8.270625pt height=14.15535pt/> typically represents some
parameters such as design parameters in an engineering application. We have a
constraint equation
<p align="center"><img src="svgs/d9a0d110e15c2234850966b4720219e0.svg" align=middle width=76.32405pt height=16.438356pt/></p>
<p align="center"><img src="svgs/2d7abf7a392433a73ea5c0221cc06aef.svg" align=middle width=150.1665pt height=14.9379615pt/></p>
that ties together <img src="svgs/332cc365a4987aacce0ead01b8bdcc0b.svg" align=middle width=9.3951pt height=14.15535pt/> and <img src="svgs/2ec6e630f199f589a2402fdf3e0289d5.svg" align=middle width=8.270625pt height=14.15535pt/>. We'll assume here that <img src="svgs/4f3cc694f7c25082daf2dd67dfd14c24.svg" align=middle width=25.262655pt height=22.83138pt/> exists and is
everywhere nonsingular. We also have some objective function
<p align="center"><img src="svgs/33bbb5205ed9dd80285cf245317294dd.svg" align=middle width=47.574285pt height=16.438356pt/></p>
<p align="center"><img src="svgs/b1c6ea03c769dd3f5431b2595cb45e1b.svg" align=middle width=135.533475pt height=14.9379615pt/></p>
and our ultimate goal is to compute <img src="svgs/87a8f3a310fd48728c3454c575746bf0.svg" align=middle width=25.971825pt height=22.83138pt/>. We may be interest in using <img src="svgs/87a8f3a310fd48728c3454c575746bf0.svg" align=middle width=25.971825pt height=22.83138pt/>
for minimizing <img src="svgs/190083ef7a1625fbc75f243cffb9c96d.svg" align=middle width=9.8175pt height=22.83138pt/> (gradient descent) or we may just want to look at the
sensitivities.

The solving of the equation <img src="svgs/2b5b7e54d50d8deecf7108065ddcf87b.svg" align=middle width=76.324215pt height=24.6576pt/> is typically called solving the
 *forward problem*, whereas minimizing <img src="svgs/190083ef7a1625fbc75f243cffb9c96d.svg" align=middle width=9.8175pt height=22.83138pt/> is known as the inverse problem.

## Setup 1: when <img src="svgs/190083ef7a1625fbc75f243cffb9c96d.svg" align=middle width=9.8175pt height=22.83138pt/> doesn't actually depend on <img src="svgs/2ec6e630f199f589a2402fdf3e0289d5.svg" align=middle width=8.270625pt height=14.15535pt/>

We'll start with easy examples first. Suppose <img src="svgs/ef609181e22d5b2bd8665198bb3227e7.svg" align=middle width=101.48985pt height=24.6576pt/> for all <img src="svgs/2ec6e630f199f589a2402fdf3e0289d5.svg" align=middle width=8.270625pt height=14.15535pt/>,
that is, <img src="svgs/190083ef7a1625fbc75f243cffb9c96d.svg" align=middle width=9.8175pt height=22.83138pt/> doesn't actually depend on <img src="svgs/2ec6e630f199f589a2402fdf3e0289d5.svg" align=middle width=8.270625pt height=14.15535pt/>. Note that
<p align="center"><img src="svgs/25f1cf25adb053d07f5df0a44a61be03.svg" align=middle width=208.73655pt height=17.03196pt/></p>
Since we have that <img src="svgs/2b5b7e54d50d8deecf7108065ddcf87b.svg" align=middle width=76.324215pt height=24.6576pt/> everywhere, we have than <img src="svgs/b6b9ce06fac64d40be3a0bb3e2c5781e.svg" align=middle width=54.72159pt height=22.83138pt/>
everywhere. 
