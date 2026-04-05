export default function CTA() {
  return (
    <section className="mx-auto w-full max-w-3xl px-6 py-16 sm:px-10">
      <div className="relative overflow-hidden rounded-2xl border border-accent-dim/30 bg-gradient-to-br from-accent-dim/20 to-card-bg p-8 text-center sm:p-12">
        <div className="pointer-events-none absolute inset-0 -z-10">
          <div className="absolute right-0 top-0 h-64 w-64 rounded-full bg-accent-dim/10 blur-[80px]" />
        </div>

        <h2 className="text-2xl font-bold sm:text-3xl">
          플레이북을 계속 업데이트합니다
        </h2>
        <p className="mx-auto mt-4 max-w-md text-zinc-400">
          AI 모델이 바뀔 때마다 디테일도 바뀝니다. 이 플레이북은 실시간으로
          최신 워크플로우를 반영합니다.
        </p>
        <div className="mt-8 inline-flex items-center gap-3 rounded-full border border-accent-dim/40 bg-accent-dim/10 px-6 py-3 text-sm text-accent">
          <span>팔로우 + 리포스트 + 댓글</span>
          <span className="text-zinc-500">→</span>
          <span className="font-semibold text-foreground">
            플레이북 링크 DM 발송
          </span>
        </div>
      </div>
    </section>
  );
}
