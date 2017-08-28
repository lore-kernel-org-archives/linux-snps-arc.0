From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 28 Aug 2017 19:58:06 +0300
Subject: [PATCH v2 1/2] OF: move extern declarations of of_stdout inside ifdef
In-Reply-To: <20170828165807.8408-1-Eugeniy.Paltsev@synopsys.com>
References: <20170828165807.8408-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170828165807.8408-2-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Move extern declarations of "of_stdout" pointer inside "CONFIG_OF"
ifdef to be able to get rid of "CONFIG_OF" ifdef in its usage places.

Acked-by: Rob Herring <robh at kernel.org>
Suggested-by: Steven Rostedt <rostedt at goodmis.org>
Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 include/linux/of.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index cfc3411..be28cb9 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -135,7 +135,6 @@ static inline void of_node_put(struct device_node *node) { }
 extern struct device_node *of_root;
 extern struct device_node *of_chosen;
 extern struct device_node *of_aliases;
-extern struct device_node *of_stdout;
 extern raw_spinlock_t devtree_lock;
 
 /* flag descriptions (need to be visible even when !CONFIG_OF) */
@@ -147,6 +146,8 @@ extern raw_spinlock_t devtree_lock;
 #define OF_BAD_ADDR	((u64)-1)
 
 #ifdef CONFIG_OF
+extern struct device_node *of_stdout;
+
 void of_core_init(void);
 
 static inline bool is_of_node(const struct fwnode_handle *fwnode)
@@ -539,6 +540,7 @@ const char *of_prop_next_string(struct property *prop, const char *cur);
 bool of_console_check(struct device_node *dn, char *name, int index);
 
 #else /* CONFIG_OF */
+#define of_stdout	NULL
 
 static inline void of_core_init(void)
 {
-- 
2.9.3
