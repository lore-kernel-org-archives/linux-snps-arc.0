From: nicolas.dichtel@6wind.com (Nicolas Dichtel)
Date: Fri, 13 Jan 2017 11:46:42 +0100
Subject: [PATCH v3 4/8] x86: stop exporting msr-index.h to userland
In-Reply-To: <1484304406-10820-1-git-send-email-nicolas.dichtel@6wind.com>
References: <3131144.4Ej3KFWRbz@wuerfel>
 <1484304406-10820-1-git-send-email-nicolas.dichtel@6wind.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1484304406-10820-5-git-send-email-nicolas.dichtel@6wind.com>
To: linux-snps-arc@lists.infradead.org

Suggested-by: Borislav Petkov <bp at alien8.de>
Signed-off-by: Nicolas Dichtel <nicolas.dichtel at 6wind.com>
---
 arch/x86/include/uapi/asm/Kbuild | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/include/uapi/asm/Kbuild b/arch/x86/include/uapi/asm/Kbuild
index 3dec769cadf7..1c532b3f18ea 100644
--- a/arch/x86/include/uapi/asm/Kbuild
+++ b/arch/x86/include/uapi/asm/Kbuild
@@ -27,7 +27,6 @@ header-y += ldt.h
 header-y += mce.h
 header-y += mman.h
 header-y += msgbuf.h
-header-y += msr-index.h
 header-y += msr.h
 header-y += mtrr.h
 header-y += param.h
-- 
2.8.1
