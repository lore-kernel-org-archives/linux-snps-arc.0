From: valentin.schneider@arm.com (Valentin Schneider)
Date: Mon, 11 Mar 2019 22:47:38 +0000
Subject: [PATCH 00/14] entry: preempt_schedule_irq() callers scrub
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190311224752.8337-1-valentin.schneider@arm.com>
To: linux-snps-arc@lists.infradead.org

Hi,

This is the continuation of [1] where I'm hunting down
preempt_schedule_irq() callers because of [2].

I told myself the best way to get this moving forward wouldn't be to write
doc about it, but to go write some fixes and get some discussions going,
which is what this patch-set is about.

I've looked at users of preempt_schedule_irq(), and made sure they didn't
have one of those useless loops. The list of offenders is:

$ grep -r -I "preempt_schedule_irq" arch/ | cut -d/ -f2 | sort | uniq

  arc
  arm
  arm64
  c6x
  csky
  h8300
  ia64
  m68k
  microblaze
  mips
  nds32
  nios2
  parisc
  powerpc
  riscv
  s390
  sh
  sparc
  x86
  xtensa

Regarding that loop, archs seem to fall in 3 categories:
A) Those that don't have the loop
B) Those that have a small need_resched() loop around the
   preempt_schedule_irq() callsite
C) Those that branch to some more generic code further up the entry code
   and eventually branch back to preempt_schedule_irq()

arc, m68k, nios2 fall in A)
sparc, ia64, s390 fall in C)
all the others fall in B)

I've written patches for B) and C) EXCEPT for ia64 and s390 because I
haven't been able to tell if it's actually fine to kill that "long jump"
(and maybe I'm wrong on sparc). Hopefully folks who understand what goes on
in there might be able to shed some light.

Also, since I sent patches for arm & arm64 in [1] I'm not including them
here.

Boot-tested on:
- x86

Build-tested on:
- h8300
- c6x
- powerpc
- mips
- nds32
- microblaze
- sparc
- xtensa

Thanks,
Valentin

[1]: https://lore.kernel.org/lkml/20190131182339.9835-1-valentin.schneider at arm.com/
[2]: https://lore.kernel.org/lkml/cc989920-a13b-d53b-db83-1584a7f53edc at arm.com/

Valentin Schneider (14):
  sched/core: Fix preempt_schedule() interrupt return comment
  c6x: entry: Remove unneeded need_resched() loop
  csky: entry: Remove unneeded need_resched() loop
  h8300: entry: Remove unneeded need_resched() loop
  microblaze: entry: Remove unneeded need_resched() loop
  MIPS: entry: Remove unneeded need_resched() loop
  nds32: ex-exit: Remove unneeded need_resched() loop
  powerpc: entry: Remove unneeded need_resched() loop
  RISC-V: entry: Remove unneeded need_resched() loop
  sh: entry: Remove unneeded need_resched() loop
  sh64: entry: Remove unneeded need_resched() loop
  sparc64: rtrap: Remove unneeded need_resched() loop
  x86/entry: Remove unneeded need_resched() loop
  xtensa: entry: Remove unneeded need_resched() loop

 arch/c6x/kernel/entry.S        | 3 +--
 arch/csky/kernel/entry.S       | 4 ----
 arch/h8300/kernel/entry.S      | 3 +--
 arch/microblaze/kernel/entry.S | 5 -----
 arch/mips/kernel/entry.S       | 3 +--
 arch/nds32/kernel/ex-exit.S    | 4 ++--
 arch/powerpc/kernel/entry_32.S | 6 +-----
 arch/powerpc/kernel/entry_64.S | 8 +-------
 arch/riscv/kernel/entry.S      | 3 +--
 arch/sh/kernel/cpu/sh5/entry.S | 5 +----
 arch/sh/kernel/entry-common.S  | 4 +---
 arch/sparc/kernel/rtrap_64.S   | 1 -
 arch/x86/entry/entry_32.S      | 3 +--
 arch/x86/entry/entry_64.S      | 3 +--
 arch/xtensa/kernel/entry.S     | 2 +-
 kernel/sched/core.c            | 7 +++----
 16 files changed, 16 insertions(+), 48 deletions(-)

--
2.20.1
