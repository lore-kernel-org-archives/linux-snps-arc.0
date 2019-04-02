From: st5pub@yandex.ru (Andrey Abramov)
Date: Tue, 02 Apr 2019 23:41:51 +0300
Subject: [PATCH v3 0/5] simple sort swap function improvements
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <824481554237711@sas1-23a37bc8251c.qloud-c.yandex.net>
To: linux-snps-arc@lists.infradead.org

This is the logical continuation of the "lib/sort & lib/list_sort:
faster and smaller" series by George Spelvin (added to linux-next
recently).

Since Spectre mitigations have made indirect function calls more
expensive, and the previous patch series implements the default
simple byte copies without them, an "optimized" custom swap
function is now a waste of time as well as code.

Patches 1 to 4 replace trivial swap functions with the built-in
(which is now much faster) and are grouped by subsystem.
Being pure code deletion patches, they are sure to bring joy to
Linus's heart.

Having reviewed all call sites, only three non-trivial swap
functions remain:  arch/x86/kernel/unwind_orc.c,
kernel/jump_label.c and lib/extable.c.

Patch #5 removes size argument from the swap function because:
	1) It wasn't used.
	2) Custom swap function knows what kind of objects it swaps,
		so it already knows their sizes.

v1->v2: Only commit messages have changed to better explain
		the purpose of commits. (Thanks to George Spelvin and Greg KH)
v2->v3: Patch #5 now completely removes the size argument

Andrey Abramov (5):
  arch/arc: unwind.c: replace swap function with built-in one
  powerpc: module_[32|64].c: replace swap function with built-in one
  ocfs2: dir,refcounttree,xattr: replace swap functions with built-in
    one
  ubifs: find.c: replace swap function with built-in one
  Lib: sort.h: remove the size argument from the swap function

 arch/arc/kernel/unwind.c        | 20 ++------------------
 arch/powerpc/kernel/module_32.c | 17 +----------------
 arch/powerpc/kernel/module_64.c | 17 +----------------
 arch/x86/kernel/unwind_orc.c    |  2 +-
 fs/ocfs2/dir.c                  | 13 +------------
 fs/ocfs2/refcounttree.c         | 13 +++----------
 fs/ocfs2/xattr.c                | 15 +++------------
 fs/ubifs/find.c                 |  9 +--------
 include/linux/sort.h            |  2 +-
 kernel/jump_label.c             |  2 +-
 lib/extable.c                   |  2 +-
 lib/sort.c                      |  7 +++----
 12 files changed, 19 insertions(+), 100 deletions(-)

-- 
2.21.0
