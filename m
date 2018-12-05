From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed,  5 Dec 2018 20:06:08 +0300
Subject: [PATCH 4/5] ARC: perf: fix description comment
In-Reply-To: <20181205170609.18690-1-Eugeniy.Paltsev@synopsys.com>
References: <20181205170609.18690-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181205170609.18690-5-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Fix description comment as this code doesn't belong only to
ARC700 anymore.

Also while I'm at it, use SPDX License Identifier.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/kernel/perf_event.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/arc/kernel/perf_event.c b/arch/arc/kernel/perf_event.c
index 8c88837fcd83..b6207090aaa7 100644
--- a/arch/arc/kernel/perf_event.c
+++ b/arch/arc/kernel/perf_event.c
@@ -1,15 +1,10 @@
-/*
- * Linux performance counter support for ARC700 series
- *
- * Copyright (C) 2013-2015 Synopsys, Inc. (www.synopsys.com)
- *
- * This code is inspired by the perf support of various other architectures.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Linux performance counter support for ARC CPUs.
+// This code is inspired by the perf support of various other architectures.
+//
+// Copyright (C) 2013-2018 Synopsys, Inc. (www.synopsys.com)
+
 #include <linux/errno.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
-- 
2.14.5
