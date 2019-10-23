---
title: "Parallel Computer Architecture Projects - Chalmers University"
date: 2019-02-19
permalink: /parallel-computer-architecture-chalmers/
tags: [programmation concurrente, c++, chalmers, architecture]
header:
    image: "/images/perceptron/percept.jpg"
excerpt: "Projets de Parallel Computer Architecture"
mathjax: true
---

# Parallel Computer Architecture

## Lab1

In this lab we will learn how to parallelize programs with pthreads and openmp. You will do a series of instructive exercises for each programming model and then use what you have learned to study Amdahl's law in practice.

* PThread
* OpenMP


## Lab2

The purpose of this lab exercise is to acquaint you performance monitoring and understanding parallel program performance. For this you will be using the same code as in the previous lab. By now you should have available three versions of the life game program. 1. The serial version provided to you 2. The parallel version using threads 3. The OpenMP version you made for the lab.
For this lab we are goind to use perf  to get some insight into the runtime characteristics of each version of your programs. For a deeper tutorial on perf look ta (https://perf.wiki.kernel.org/index.php/Tutorial).
Go through the steps in this lab one by one and answer all questions in your lab report

* cache misses
* last level cache
* l1 cache

## Lab3

The purpose of this lab exercise is to acquaint you with synchronization primitives.
For this lab we are going to use perf  to get some insight into the runtime characteristics of each version of your programs. 
Go through the steps in this lab one by one and answer all questions in your lab report.

Mutual exclusion 
Acquire, release, waiting schemes. 
Barrier Synchronization 

## Project
* Goal: reason about trade-offs in the design of parallel computers 
* How: assume the role of computer architect and propose a design for a computationally-intensive application given a set of constraints (=scenario) 
* How: assume the role of manager and review/assess a proposed solution for a particular scenario

Write a design proposal consisting of: 
1. Description of problem: algorithms, problem size, why is it complex... 
2. Survey: existing solutions 
3. Proposal: most appropriate solution given a set of constraints 
4. Discussion: how effective is the solution considering: 
* Energy Efficiency 
* Programmability / Maintainability 
* Technological trends: 
    * Moore’s Law 
    * Processor technology 
    * Memory technology

---

The goal of this assignment is to research and reason about trade-offs in the design of parallel computer systems (including functional, performance and cost requirements) when addressing a particular computationally-intensive problem (called "scenario"). To this end you will form designer teams composed of two "architects", perform bibliographic research and discuss potential solutions for a given computationally intensive problem. Given the time constraints of the project (< 2 months), the work is limited to bibliography research, and the researched solutions should only be discussed qualitatively. During the development of this project you will take alternatively the role of computer architects and reviewers (managers). 
Below the roles and scenarios are described in more detail: 

Designer team​​: Your task is to write a survey describing parallel computer designs that address a computationally-intensive problem (scenario). You are expected to perform bibliographic research and select and discuss a few relevant articles proposing solutions ranging from general purpose hardware to special purpose designs. The discussion should focus on the trade-offs between functional, performance and cost. Finally, you should also analyze the solutions considering technological trends, flexibility (i.e. how easily can it be adapted to changes in the application) and energy efficiency, and select which is -in your opinion- the most promising solution for the the near future (0-5 years).  

Reviewer (Manager)​​: You are in charge of ensuring the quality of the written survey and discussion. You will obtain the survey written by one of the design teams and provide feedback on the discussion. The designer team will then address the identified problems and submit an updated survey, that you will then evaluate again according to a score sheet. The process of evaluation and scoring will be conducted under the supervision of the course examiner and the teaching assistant. 

Scenario​​: A scenario is a particular computationally intensive problem of high relevance that requires a high performance computer system. Instead of describing the scenario, we provide a paper that proposes a solution for the particular problem. Thus each scenario is implicitly identified by a paper. The set of scenarios is distributed such that no participant acts as an designer and reviewer for the same scenario. 
 
 
