---
title: "Stochastic Optimization Algorithms Projects - Chalmers University"
date: 2019-02-19
permalink: /stochastic-optimization-algorithms-chalmers/
tags: [matlab, optimization, chalmers, métaheuristiques]
header:
    image: "/images/perceptron/percept.jpg"
excerpt: "Projets de Stochastic Optimization Algorithms"
mathjax: true
---

# Stochastic Optimization Algorithms

## HP1

Penalty method (Mandatory): we shall use the penalty method (see pp. 30-33 in the course book) to ﬁnd the minimum of a function 
Write a Matlab program for solving the unconstrained problem of ﬁnding the minimum of fp(x;µ) using the method of gradient descent.

Write a standard genetic algorithm (GA) using (some of) the components described in Sect. 3.2.1 of the course book.

## HP2

The traveling salesman problem (TSP) :
* Write a GA (named GA21b.m) that can search for the shortest path between N cities
* Ant colony optimization (ACO) 
* make a long run with each of the two algorithms (GA and ACO) described above. 

Particle swarm optimization :
* You will implement and use particle swarm optimization (PSO), which is a stochastic optimization method based on the properties of swarms, such as bird ﬂocks, ﬁsh schools etc. 
* Next, use your PSO (named PSO22.m) to ﬁnd the exact location of all the local minima.

Function ﬁtting using LGP :
Start by writing a general LGP program (called LGP24.m), with M variable registers, N constant registers, and the operator set {+,−,×,/}. The program should evolve linear chromosomes using tournament selection, two-point crossover (see pp. 76-77 in the book), and mutations. 