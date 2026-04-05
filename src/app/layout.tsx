import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Project Beddie — AI Virtual Creator Playbook",
  description:
    "The ultimate playbook for building an AI-generated virtual creator on Instagram. From ABG creation to 1K followers in 5 days.",
  openGraph: {
    title: "Project Beddie — AI Virtual Creator Playbook",
    description:
      "0 → 1K followers in 5 days with an AI-generated ABG. Full breakdown inside.",
    type: "website",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="ko" className="h-full antialiased">
      <body className="min-h-full flex flex-col">{children}</body>
    </html>
  );
}
