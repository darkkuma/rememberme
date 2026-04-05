export default function Hero() {
  return (
    <header className="relative overflow-hidden px-6 pb-16 pt-24 sm:px-10 sm:pt-32">
      {/* Gradient background glow */}
      <div className="pointer-events-none absolute inset-0 -z-10">
        <div className="absolute left-1/2 top-0 h-[600px] w-[800px] -translate-x-1/2 rounded-full bg-accent-dim/10 blur-[120px]" />
      </div>

      <div className="mx-auto max-w-3xl text-center">
        <div className="mb-6 inline-block rounded-full border border-accent-dim/30 bg-accent-dim/10 px-4 py-1.5 text-sm font-medium text-accent">
          Project Beddie
        </div>

        <h1 className="text-4xl font-bold leading-tight tracking-tight sm:text-5xl lg:text-6xl">
          AI Virtual Creator
          <br />
          <span className="bg-gradient-to-r from-accent to-purple-400 bg-clip-text text-transparent">
            Playbook
          </span>
        </h1>

        <p className="mx-auto mt-6 max-w-xl text-lg leading-relaxed text-zinc-400">
          AI로 생성한 ABG 가상 크리에이터로 인스타그램을{" "}
          <span className="text-foreground font-semibold">5일 만에 팔로워 1,000명</span>까지
          성장시킨 전체 워크플로우.
          <br />
          팔로워 구매 없음. 기존 오디언스 없음. 순수 전략.
        </p>

        <div className="mt-8 flex flex-col items-center gap-3 sm:flex-row sm:justify-center">
          <a
            href="#step-1"
            className="glow-pulse inline-flex h-12 items-center rounded-full bg-accent-dim px-8 font-semibold text-white transition-all hover:bg-accent"
          >
            플레이북 시작하기
          </a>
          <a
            href="#overview"
            className="inline-flex h-12 items-center rounded-full border border-card-border px-8 text-sm text-zinc-400 transition-colors hover:border-accent-dim hover:text-foreground"
          >
            7단계 Overview
          </a>
        </div>
      </div>
    </header>
  );
}
