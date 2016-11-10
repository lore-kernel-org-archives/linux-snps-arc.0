From: arnd@arndb.de (Arnd Bergmann)
Date: Thu, 10 Nov 2016 17:44:47 +0100
Subject: [PATCH v2 04/11] nios2: fix timer initcall return value
In-Reply-To: <20161110164454.293477-1-arnd@arndb.de>
References: <20161110164454.293477-1-arnd@arndb.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161110164454.293477-5-arnd@arndb.de>
To: linux-snps-arc@lists.infradead.org

When called more than twice, the nios2_time_init() function
return an uninitialized value, as detected by gcc -Wmaybe-uninitialized

arch/nios2/kernel/time.c: warning: 'ret' may be used uninitialized in this function

This makes it return '0' here, matching the comment above the
function.

Acked-by: Ley Foon Tan <lftan at altera.com>
Signed-off-by: Arnd Bergmann <arnd at arndb.de>
---
 arch/nios2/kernel/time.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/nios2/kernel/time.c b/arch/nios2/kernel/time.c
index d9563dd..746bf5c 100644
--- a/arch/nios2/kernel/time.c
+++ b/arch/nios2/kernel/time.c
@@ -324,6 +324,7 @@ static int __init nios2_time_init(struct device_node *timer)
 		ret = nios2_clocksource_init(timer);
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-- 
2.9.0
