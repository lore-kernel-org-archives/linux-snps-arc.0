From: st5pub@yandex.ru (Andrey Abramov)
Date: Sat, 30 Mar 2019 19:37:41 +0300
Subject: [PATCH 0/5] simple sort swap function usage improvements
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <18626931553963861@sas1-b3ec53dbc12b.qloud-c.yandex.net>
To: linux-snps-arc@lists.infradead.org

This is the logical continuation of sort improvements by George Spelvin
"lib/sort & lib/list_sort: faster and smaller" series
(added to the linux-next really recently).

Patches from 1 to 4 replace simple swap functions with the built-in
(which is now much faster) and grouped by subsystem (after that only
3 files implement custom swap - arch/x86/kernel/unwind_orc.c,
kernel/jump_label.c and lib/extable.c).

Patch #5 replaces the int type with the size_t type of the size argument
in the swap function.

Andrey Abramov (5):
  arch/arc: unwind.c: replace swap function with built-in one
  powerpc: module_[32|64].c: replace swap function with built-in one
  ocfs2: dir,refcounttree,xattr: replace swap functions with built-in
    one
  ubifs: find.c: replace swap function with built-in one
  Lib: sort.h: replace int size with size_t size in the swap function

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
 lib/sort.c                      |  6 +++---
 12 files changed, 19 insertions(+), 99 deletions(-)

-- 
2.21.0
