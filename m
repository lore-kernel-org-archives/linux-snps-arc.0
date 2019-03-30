From: st5pub@yandex.ru (Andrey Abramov)
Date: Sat, 30 Mar 2019 19:43:53 +0300
Subject: [PATCH 5/5] Lib: sort.h: replace int size with size_t size in the
 swap function
In-Reply-To: <18626931553963861@sas1-b3ec53dbc12b.qloud-c.yandex.net>
References: <18626931553963861@sas1-b3ec53dbc12b.qloud-c.yandex.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20467491553964233@myt4-c0b480c282c8.qloud-c.yandex.net>
To: linux-snps-arc@lists.infradead.org

Replace int type with size_t type of the size argument
in the swap function, also affect all its dependencies.

Signed-off-by: Andrey Abramov <st5pub at yandex.ru>
---
 arch/x86/kernel/unwind_orc.c | 2 +-
 include/linux/sort.h         | 2 +-
 kernel/jump_label.c          | 2 +-
 lib/extable.c                | 2 +-
 lib/sort.c                   | 6 +++---
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/unwind_orc.c b/arch/x86/kernel/unwind_orc.c
index 89be1be1790c..1078c287198c 100644
--- a/arch/x86/kernel/unwind_orc.c
+++ b/arch/x86/kernel/unwind_orc.c
@@ -176,7 +176,7 @@ static struct orc_entry *orc_find(unsigned long ip)
 	return orc_ftrace_find(ip);
 }
 
-static void orc_sort_swap(void *_a, void *_b, int size)
+static void orc_sort_swap(void *_a, void *_b, size_t size)
 {
 	struct orc_entry *orc_a, *orc_b;
 	struct orc_entry orc_tmp;
diff --git a/include/linux/sort.h b/include/linux/sort.h
index 2b99a5dd073d..aea39d552ff7 100644
--- a/include/linux/sort.h
+++ b/include/linux/sort.h
@@ -6,6 +6,6 @@
 
 void sort(void *base, size_t num, size_t size,
 	  int (*cmp)(const void *, const void *),
-	  void (*swap)(void *, void *, int));
+	  void (*swap)(void *, void *, size_t));
 
 #endif
diff --git a/kernel/jump_label.c b/kernel/jump_label.c
index bad96b476eb6..340b788571fb 100644
--- a/kernel/jump_label.c
+++ b/kernel/jump_label.c
@@ -45,7 +45,7 @@ static int jump_label_cmp(const void *a, const void *b)
 	return 0;
 }
 
-static void jump_label_swap(void *a, void *b, int size)
+static void jump_label_swap(void *a, void *b, size_t size)
 {
 	long delta = (unsigned long)a - (unsigned long)b;
 	struct jump_entry *jea = a;
diff --git a/lib/extable.c b/lib/extable.c
index f54996fdd0b8..db2888342cd7 100644
--- a/lib/extable.c
+++ b/lib/extable.c
@@ -28,7 +28,7 @@ static inline unsigned long ex_to_insn(const struct exception_table_entry *x)
 #ifndef ARCH_HAS_RELATIVE_EXTABLE
 #define swap_ex		NULL
 #else
-static void swap_ex(void *a, void *b, int size)
+static void swap_ex(void *a, void *b, size_t size)
 {
 	struct exception_table_entry *x = a, *y = b, tmp;
 	int delta = b - a;
diff --git a/lib/sort.c b/lib/sort.c
index 50855ea8c262..60fbbc29104a 100644
--- a/lib/sort.c
+++ b/lib/sort.c
@@ -114,7 +114,7 @@ static void swap_bytes(void *a, void *b, size_t n)
 	} while (n);
 }
 
-typedef void (*swap_func_t)(void *a, void *b, int size);
+typedef void (*swap_func_t)(void *a, void *b, size_t size);
 
 /*
  * The values are arbitrary as long as they can't be confused with
@@ -138,7 +138,7 @@ static void do_swap(void *a, void *b, size_t size, swap_func_t swap_func)
 	else if (swap_func == SWAP_BYTES)
 		swap_bytes(a, b, size);
 	else
-		swap_func(a, b, (int)size);
+		swap_func(a, b, size);
 }
 
 /**
@@ -187,7 +187,7 @@ static size_t parent(size_t i, unsigned int lsbit, size_t size)
  */
 void sort(void *base, size_t num, size_t size,
 	  int (*cmp_func)(const void *, const void *),
-	  void (*swap_func)(void *, void *, int size))
+	  void (*swap_func)(void *, void *, size_t size))
 {
 	/* pre-scale counters for performance */
 	size_t n = num * size, a = (num/2) * size;
-- 
2.21.0
