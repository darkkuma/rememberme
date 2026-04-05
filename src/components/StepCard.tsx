import { Step } from "@/lib/steps";

function ToolBadge({ name }: { name: string }) {
  return (
    <span className="inline-block rounded-full bg-accent-dim/20 px-3 py-1 text-xs font-medium text-accent">
      {name}
    </span>
  );
}

export default function StepCard({ step }: { step: Step }) {
  return (
    <section
      id={`step-${step.number}`}
      className="scroll-mt-24 rounded-2xl border border-card-border bg-card-bg p-6 sm:p-10"
    >
      {/* Header */}
      <div className="mb-6 flex items-start gap-4">
        <div className="flex h-12 w-12 shrink-0 items-center justify-center rounded-xl bg-accent-dim/20 text-lg font-bold text-accent">
          {step.number}
        </div>
        <div>
          <h2 className="text-xl font-bold sm:text-2xl">{step.title}</h2>
          <p className="mt-1 text-sm text-muted">{step.subtitle}</p>
        </div>
      </div>

      {/* Description */}
      <p className="mb-6 leading-relaxed text-zinc-300">{step.description}</p>

      {/* Warning */}
      {step.warning && (
        <div className="mb-6 rounded-lg border border-red-500/30 bg-red-500/10 p-4 text-sm text-red-300">
          <span className="mr-2 font-bold">⚠</span>
          {step.warning}
        </div>
      )}

      {/* Details */}
      <div className="mb-6 space-y-3">
        {step.details.map((detail, i) => (
          <div key={i} className="flex gap-3 text-sm leading-relaxed text-zinc-400">
            <span className="mt-1 h-1.5 w-1.5 shrink-0 rounded-full bg-accent" />
            <span>{detail}</span>
          </div>
        ))}
      </div>

      {/* Tools */}
      {step.tools && step.tools.length > 0 && (
        <div className="mb-6">
          <p className="mb-2 text-xs font-semibold uppercase tracking-wider text-muted">
            Tools
          </p>
          <div className="flex flex-wrap gap-2">
            {step.tools.map((tool) => (
              <ToolBadge key={tool} name={tool} />
            ))}
          </div>
        </div>
      )}

      {/* Tips */}
      <div className="rounded-lg bg-accent-dim/5 p-4">
        <p className="mb-2 text-xs font-semibold uppercase tracking-wider text-accent">
          Tips
        </p>
        <ul className="space-y-2">
          {step.tips.map((tip, i) => (
            <li key={i} className="flex gap-2 text-sm text-zinc-400">
              <span className="text-accent">→</span>
              <span>{tip}</span>
            </li>
          ))}
        </ul>
      </div>
    </section>
  );
}
