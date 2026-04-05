const overviewSteps = [
  { num: 1, label: "ABG 만들기", icon: "🎨" },
  { num: 2, label: "계정 세팅", icon: "📱" },
  { num: 3, label: "워밍업", icon: "🔥" },
  { num: 4, label: "콘텐츠 기획", icon: "📋" },
  { num: 5, label: "콘텐츠 제작", icon: "🎬" },
  { num: 6, label: "포스팅 전략", icon: "📅" },
  { num: 7, label: "분석 & 성장", icon: "📈" },
];

export default function Overview() {
  return (
    <section id="overview" className="mx-auto w-full max-w-3xl px-6 py-12 sm:px-10">
      <h2 className="mb-8 text-center text-2xl font-bold">
        7-Step Workflow
      </h2>
      <div className="grid grid-cols-2 gap-3 sm:grid-cols-4 lg:grid-cols-7">
        {overviewSteps.map((s) => (
          <a
            key={s.num}
            href={`#step-${s.num}`}
            className="group flex flex-col items-center gap-2 rounded-xl border border-card-border bg-card-bg p-4 transition-all hover:border-accent-dim hover:bg-accent-dim/5"
          >
            <span className="text-2xl">{s.icon}</span>
            <span className="text-xs font-semibold text-accent">
              Step {s.num}
            </span>
            <span className="text-center text-xs text-zinc-400 group-hover:text-foreground">
              {s.label}
            </span>
          </a>
        ))}
      </div>
    </section>
  );
}
