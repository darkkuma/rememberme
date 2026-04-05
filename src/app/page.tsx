import Hero from "@/components/Hero";
import Overview from "@/components/Overview";
import StepCard from "@/components/StepCard";
import CTA from "@/components/CTA";
import Footer from "@/components/Footer";
import { steps } from "@/lib/steps";

export default function Home() {
  return (
    <div className="flex min-h-screen flex-col bg-background">
      <Hero />
      <Overview />

      {/* Steps */}
      <main className="mx-auto flex w-full max-w-3xl flex-col gap-8 px-6 py-12 sm:px-10">
        {steps.map((step) => (
          <StepCard key={step.number} step={step} />
        ))}
      </main>

      <CTA />
      <Footer />
    </div>
  );
}
