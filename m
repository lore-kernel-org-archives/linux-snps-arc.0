From: arnd@arndb.de (Arnd Bergmann)
Date: Thu, 10 Nov 2016 17:44:51 +0100
Subject: [PATCH v2 08/11] crypto: aesni: shut up -Wmaybe-uninitialized warning
In-Reply-To: <20161110164454.293477-1-arnd@arndb.de>
References: <20161110164454.293477-1-arnd@arndb.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161110164454.293477-9-arnd@arndb.de>
To: linux-snps-arc@lists.infradead.org

The rfc4106 encrypy/decrypt helper functions cause an annoying
false-positive warning in allmodconfig if we turn on
-Wmaybe-uninitialized warnings again:

arch/x86/crypto/aesni-intel_glue.c: In function ?helper_rfc4106_decrypt?:
include/linux/scatterlist.h:67:31: warning: ?dst_sg_walk.sg? may be used uninitialized in this function [-Wmaybe-uninitialized]

The problem seems to be that the compiler doesn't track the state of the
'one_entry_in_sg' variable across the kernel_fpu_begin/kernel_fpu_end
section.

This takes the easy way out by adding a bogus initialization, which
should be harmless enough to get the patch into v4.9 so we can turn
on this warning again by default without producing useless output.
A follow-up patch for v4.10 rearranges the code to make the warning
go away.

Signed-off-by: Arnd Bergmann <arnd at arndb.de>
---
 arch/x86/crypto/aesni-intel_glue.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/crypto/aesni-intel_glue.c b/arch/x86/crypto/aesni-intel_glue.c
index 0ab5ee1..aa8b067 100644
--- a/arch/x86/crypto/aesni-intel_glue.c
+++ b/arch/x86/crypto/aesni-intel_glue.c
@@ -888,7 +888,7 @@ static int helper_rfc4106_encrypt(struct aead_request *req)
 	unsigned long auth_tag_len = crypto_aead_authsize(tfm);
 	u8 iv[16] __attribute__ ((__aligned__(AESNI_ALIGN)));
 	struct scatter_walk src_sg_walk;
-	struct scatter_walk dst_sg_walk;
+	struct scatter_walk dst_sg_walk = {};
 	unsigned int i;
 
 	/* Assuming we are supporting rfc4106 64-bit extended */
@@ -968,7 +968,7 @@ static int helper_rfc4106_decrypt(struct aead_request *req)
 	u8 iv[16] __attribute__ ((__aligned__(AESNI_ALIGN)));
 	u8 authTag[16];
 	struct scatter_walk src_sg_walk;
-	struct scatter_walk dst_sg_walk;
+	struct scatter_walk dst_sg_walk = {};
 	unsigned int i;
 
 	if (unlikely(req->assoclen != 16 && req->assoclen != 20))
-- 
2.9.0
