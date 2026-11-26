# Letter to the authors of AxiomMath/MMP (Q-03, Q-07)

Subject: an audit of AxiomMath/MMP at commit 1f9ade3670, and two questions

Dear authors of AxiomMath/MMP,

We are the maintainers of mmp, a public project that states the minimal model program in Lean 4 on Mathlib. The project is at https://github.com/tamnd/mmp and the site is at https://mmp.tamnd.com.

Your repository claims the termination of the minimal model program for projective lc 4-folds with a rational boundary. This is the largest fresh claim of the field, and we think that the field gains from an independent reading. So we plan an audit of your repository at commit 1f9ade3670. The plan has eight steps:

1. A1: an inventory of the files, the lines, the declarations and the pins.
2. A2: a build at the pin and a scan for `sorry`, new axioms and other escape hatches.
3. A3: a replay of the build in two kernels, leanchecker and lean4lean or nanoda.
4. A4: an index of the definitions that the main theorems use.
5. A5: a reading of the ranked definitions by two people each, against the textbook definitions.
6. A6: a reading of the main statements against the published statements.
7. A7: a bridge in Lean from your statements to the statements of our project, where both apply.
8. A8: a report.

We follow these rules:

1. We send each finding to you first. A finding becomes public 30 days after we send it, or when you answer, whichever comes first.
2. A finding is a neutral statement of what we found. We do not keep a fork with fixes. If you fix a defect, we audit the new commit.
3. For a finding that changes the meaning of a main theorem, we make no public statement about that theorem in the 30 days, in either direction.
4. We publish a confirmation with your names only if you agree.

We have two questions:

1. Our statements use Mathlib alone. Mathlib does not have some of the objects that AxiomMath/Stacks has, for example Cartier divisors and projective morphisms. We want to use the same shapes as your definitions, so that the bridge is short. Which definitions of AxiomMath/Stacks do you think are stable?
2. Our statements are universe polymorphic. If your main statements are in `Scheme.{0}`, the bridge specializes our statements to the universe 0. Do you plan universe polymorphic versions of the main statements?

The audit starts with steps A1 and A2 now. The plan and the records are public in the repository. We are glad to hear any comment on the plan before A5 starts.

With best regards,

The maintainers of mmp
