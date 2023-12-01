import Game.Levels.Algorithm.L02add_algo1

World "Algorithm"
Level 3
Title "making life simple"

LemmaTab "+"

namespace MyNat

TacticDoc simp "
# Overview

Lean's simplifier, `simp`, will rewrite every lemma
tagged with `simp` and every lemma fed to it by the user, as much as it can.
Furthermore, it will attempt to order variables into an internal order if fed
lemmas such as `add_comm`, so that it does not go into an infinite loop.
"

NewTactic simp

Introduction
"
Lean's simplifier, `simp`, is \"`rw` on steroids\". It will rewrite every lemma
tagged with `simp` and every lemma fed to it by the user, as much as it can.

This level is not a level which you want to solve by hand.
Get the simplifier to solve it for you.
"

--macro_rules | `(tactic| ac_rfl) => `(tactic| simp only [add_assoc, add_left_comm, add_comm])

/-- If $a, b,\ldots h$ are arbitrary natural numbers, we have
$(d + f) + (h + (a + c)) + (g + e + b) = a + b + c + d + e + f + g + h$. -/
Statement (a b c d e f g h : ℕ) :
    (d + f) + (h + (a + c)) + (g + e + b) = a + b + c + d + e + f + g + h := by
  Hint "Solve this level in one line with `simp only [add_assoc, add_left_comm, add_comm]`"
  simp only [add_assoc, add_left_comm, add_comm]

Conclusion
"
Let's now make our own tactic to do this.
"
