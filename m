From: st5pub@yandex.ru (Andrey Abramov)
Date: Tue, 02 Apr 2019 23:55:25 +0300
Subject: [PATCH v3 5/5] Lib: sort.h: remove the size argument from the swap
 function
In-Reply-To: <824481554237711@sas1-23a37bc8251c.qloud-c.yandex.net>
References: <824481554237711@sas1-23a37bc8251c.qloud-c.yandex.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <793311554238525@sas1-87f9feb8d943.qloud-c.yandex.net>
To: linux-snps-arc@lists.infradead.org

Removes size argument from the swap function because:
	1) It wasn't used.
	2) Custom swap function knows what kind of objects it swaps,
		so it already knows their sizes.

Signed-off-by: Andrey Abramov <st5pub at yandex.ru>
Reviewed by: George Spelvin <lkml at sdf.org>
---
 arch/x86/kernel/unwind_orc.c | 2 +-
 include/linux/sort.h         | 2 +-
 kernel/jump_label.c          | 2 +-
 lib/extable.c                | 2 +-
 lib/sort.c                   | 7 +++----
 5 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/unwind_orc.c b/arch/x86/kernel/unwind_orc.c
index 89be1be1790c..dc410b567189 100644
--- a/arch/x86/kernel/unwind_orc.c
+++ b/arch/x86/kernel/unwind_orc.c
@@ -176,7 +176,7 @@ static struct orc_entry *orc_find(unsigned long ip)
 	return orc_ftrace_find(ip);
 }
 
-static void orc_sort_swap(void *_a, void *_b, int size)
+static void orc_sort_swap(void *_a, void *_b)
 {
 	struct orc_entry *orc_a, *orc_b;
 	struct orc_entry orc_tmp;
diff --git a/include/linux/sort.h b/include/linux/sort.h
index 2b99a5dd073d..13bb4635b5f1 100644
--- a/include/linux/sort.h
+++ b/include/linux/sort.h
@@ -6,6 +6,6 @@
 
 void sort(void *base, size_t num, size_t size,
 	  int (*cmp)(const void *, const void *),
-	  void (*swap)(void *, void *, int));
+	  void (*swap)(void *, void *));
 
 #endif
diff --git a/kernel/jump_label.c b/kernel/jump_label.c
index bad96b476eb6..6b1187b8a060 100644
--- a/kernel/jump_label.c
+++ b/kernel/jump_label.c
@@ -45,7 +45,7 @@ static int jump_label_cmp(const void *a, const void *b)
 	return 0;
 }
 
-static void jump_label_swap(void *a, void *b, int size)
+static void jump_label_swap(void *a, void *b)
 {
 	long delta = (unsigned long)a - (unsigned long)b;
 	struct jump_entry *jea = a;
diff --git a/lib/extable.c b/lib/extable.c
index f54996fdd0b8..0515a94538ca 100644
--- a/lib/extable.c
+++ b/lib/extable.c
@@ -28,7 +28,7 @@ static inline unsigned long ex_to_insn(const struct exception_table_entry *x)
 #ifndef ARCH_HAS_RELATIVE_EXTABLE
 #define swap_ex		NULL
 #else
-static void swap_ex(void *a, void *b, int size)
+static void swap_ex(void *a, void *b)
 {
 	struct exception_table_entry *x = a, *y = b, tmp;
 	int delta = b - a;
diff --git a/lib/sort.c b/lib/sort.c
index 50855ea8c262..8704750e6bde 100644
--- a/lib/sort.c
+++ b/lib/sort.c
@@ -114,7 +114,7 @@ static void swap_bytes(void *a, void *b, size_t n)
 	} while (n);
 }
 
-typedef void (*swap_func_t)(void *a, void *b, int size);
+typedef void (*swap_func_t)(void *a, void *b);
 
 /*
  * The values are arbitrary as long as they can't be confused with
@@ -138,7 +138,7 @@ static void do_swap(void *a, void *b, size_t size, swap_func_t swap_func)
 	else if (swap_func == SWAP_BYTES)
 		swap_bytes(a, b, size);
 	else
-		swap_func(a, b, (int)size);
+		swap_func(a, b);
 }
 
 /**
@@ -186,8 +186,7 @@ static size_t parent(size_t i, unsigned int lsbit, size_t size)
  * it less suitable for kernel use.
  */
 void sort(void *base, size_t num, size_t size,
-	  int (*cmp_func)(const void *, const void *),
-	  void (*swap_func)(void *, void *, int size))
+	  int (*cmp_func)(const void *, const void *), swap_func_t swap_func)
 {
 	/* pre-scale counters for performance */
 	size_t n = num * size, a = (num/2) * size;
-- 
2.21.0
