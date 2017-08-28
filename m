From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 28 Aug 2017 19:58:07 +0300
Subject: [PATCH v2 2/2] console: don't select first registered console if
 stdout-path used
In-Reply-To: <20170828165807.8408-1-Eugeniy.Paltsev@synopsys.com>
References: <20170828165807.8408-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170828165807.8408-3-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

In the current implementation we take the first console that
registers if we didn't select one.

But if we specify console via "stdout-path" property in device tree
we don't want first console that registers here to be selected.
Otherwise we may choose wrong console - for example if some console
is registered earlier than console is pointed in "stdout-path"
property because console pointed in "stdout-path" property can be add as
preferred quite late - when it's driver is probed.

We retain previous behavior for tty0 console (if "stdout-path" used)
as a special case:
tty0 will be registered even if it was specified neither
in "bootargs" nor in "stdout-path".
We had to retain this behavior because a lot of ARM boards (and some
powerpc) rely on it.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
Changes v1->v2:
 * Add exception for "tty0" console as current behavior is widely used
   by ARM and powerpc boards.

 kernel/printk/printk.c | 84 +++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 69 insertions(+), 15 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 512f7c2..be40f57 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -26,6 +26,7 @@
 #include <linux/nmi.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
+#include <linux/of.h>
 #include <linux/delay.h>
 #include <linux/smp.h>
 #include <linux/security.h>
@@ -2376,6 +2377,55 @@ static int __init keep_bootcon_setup(char *str)
 
 early_param("keep_bootcon", keep_bootcon_setup);
 
+static bool console_selected_by_of(void)
+{
+	return !!of_stdout;
+}
+
+static bool can_be_tty0(struct console *newcon)
+{
+	struct console *con = NULL;
+
+	if (newcon->index > 0)
+		return false;
+
+	if (strcmp(newcon->name, "tty") != 0)
+		return false;
+
+	if (newcon->index == 0)
+		return true;
+
+	/* do we have "tty" console already registered? */
+	for_each_console(con) {
+		if (strcmp(con->name, "tty") != 0)
+			continue;
+
+		if (con->index >= 0)
+			return false;
+	}
+
+	return true;
+}
+
+static bool take_console_noopts(struct console *newcon)
+{
+	if (newcon->index < 0)
+		newcon->index = 0;
+
+	if ((newcon->setup != NULL) && (newcon->setup(newcon, NULL) != 0))
+		return false;
+
+	newcon->flags |= CON_ENABLED;
+
+	if (newcon->device && !can_be_tty0(newcon))
+		newcon->flags |= CON_CONSDEV;
+
+	if (newcon->device)
+		return true;
+
+	return false;
+}
+
 /*
  * The console driver calls this routine during kernel initialization
  * to register the console printing procedure with printk() and to
@@ -2432,22 +2482,26 @@ void register_console(struct console *newcon)
 		has_preferred = preferred_console >= 0;
 
 	/*
-	 *	See if we want to use this console driver. If we
-	 *	didn't select a console we take the first one
-	 *	that registers here.
+	 * If we specify console via "stdout-path" property in device tree
+	 * we don't want first console that registers here to be selected.
 	 */
-	if (!has_preferred) {
-		if (newcon->index < 0)
-			newcon->index = 0;
-		if (newcon->setup == NULL ||
-		    newcon->setup(newcon, NULL) == 0) {
-			newcon->flags |= CON_ENABLED;
-			if (newcon->device) {
-				newcon->flags |= CON_CONSDEV;
-				has_preferred = true;
-			}
-		}
-	}
+	if (console_selected_by_of())
+		has_preferred = true;
+
+	/*
+	 * See if we want to use this console driver. If we didn't select
+	 * a console we take the first one that registers here.
+	 */
+	if (!has_preferred)
+		has_preferred |= take_console_noopts(newcon);
+
+	/*
+	 * Treat "tty0" (in case of "stdout-path" using) as a special case:
+	 * "tty0" will be registered even if it was specified neither in
+	 * "bootargs" nor in "stdout-path".
+	 */
+	if (console_selected_by_of() && can_be_tty0(newcon))
+		has_preferred |= take_console_noopts(newcon);
 
 	/*
 	 *	See if this console matches one we selected on
-- 
2.9.3
