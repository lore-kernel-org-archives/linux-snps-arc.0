From: arnd@arndb.de (Arnd Bergmann)
Date: Thu, 10 Nov 2016 17:44:46 +0100
Subject: [PATCH v2 03/11] x86: apm: avoid uninitialized data
In-Reply-To: <20161110164454.293477-1-arnd@arndb.de>
References: <20161110164454.293477-1-arnd@arndb.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161110164454.293477-4-arnd@arndb.de>
To: linux-snps-arc@lists.infradead.org

apm_bios_call() can fail, and return a status in its argument
structure. If that status however is zero during a call from
apm_get_power_status(), we end up using data that may have
never been set, as reported by "gcc -Wmaybe-uninitialized":

arch/x86/kernel/apm_32.c: In function ?apm?:
arch/x86/kernel/apm_32.c:1729:17: error: ?bx? may be used uninitialized in this function [-Werror=maybe-uninitialized]
arch/x86/kernel/apm_32.c:1835:5: error: ?cx? may be used uninitialized in this function [-Werror=maybe-uninitialized]
arch/x86/kernel/apm_32.c:1730:17: note: ?cx? was declared here
arch/x86/kernel/apm_32.c:1842:27: error: ?dx? may be used uninitialized in this function [-Werror=maybe-uninitialized]
arch/x86/kernel/apm_32.c:1731:17: note: ?dx? was declared here

This changes the function to return "APM_NO_ERROR" here, which
makes the code more robust to broken BIOS versions, and avoids
the warning.

Signed-off-by: Arnd Bergmann <arnd at arndb.de>
Reviewed-by: Jiri Kosina <jkosina at suse.cz>
Reviewed-by: Luis R. Rodriguez <mcgrof at kernel.org>
---
 arch/x86/kernel/apm_32.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/apm_32.c b/arch/x86/kernel/apm_32.c
index c7364bd..51287cd 100644
--- a/arch/x86/kernel/apm_32.c
+++ b/arch/x86/kernel/apm_32.c
@@ -1042,8 +1042,11 @@ static int apm_get_power_status(u_short *status, u_short *bat, u_short *life)
 
 	if (apm_info.get_power_status_broken)
 		return APM_32_UNSUPPORTED;
-	if (apm_bios_call(&call))
+	if (apm_bios_call(&call)) {
+		if (!call.err)
+			return APM_NO_ERROR;
 		return call.err;
+	}
 	*status = call.ebx;
 	*bat = call.ecx;
 	if (apm_info.get_power_status_swabinminutes) {
-- 
2.9.0
