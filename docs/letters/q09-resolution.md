# Letter to the owner of spec 2161 (Q-09)

Subject: one shared statement of log resolution

Dear owner of spec 2161,

The mmp project needs the existence of log resolutions as a hypothesis in characteristic 0. Your project states resolution of singularities. We propose that the two projects use one `Prop`, `HasLogResolution`, in a small shared package.

The proposal is this:

1. The package has the statement `HasLogResolution` and nothing else. It depends on Mathlib only.
2. A change to the statement needs the agreement of both owners.
3. Until the package exists, each project keeps a copy with the same text, and a bridge lemma shows that the copies agree.

The current text of the statement is in `MinimalModel/Statements/Basic.lean` of tamnd/mmp-lean. It says: there is a proper birational morphism $f : Y \to X$ from a smooth variety, such that the exceptional divisors and the strict transforms of the components of $\Delta$ have simple normal crossings at each point of $Y$, and $f$ is an isomorphism outside the images of the exceptional divisors.

Please tell us if this text is acceptable, or which changes you need.

With best regards,

The maintainers of mmp
