Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6419C7EE31
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 Aug 2024 07:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Al0cwYFsp8j2tDiE9NgbVR6nxJhpI4UXZ2IVx/Ujua4=; b=cQxJbtU5UhZky3
	kMvIVHPgoE8Siq5Kt8ML+qcwyD6z+lvOvrKsLp0Fkb0SLWkkXDGUb3IJpktTKW8H8u4Yj0ESrZA4e
	CQbAYMDs4cmzjuSw7mSDEjlRAmgJvrGHcAneuPWQqxquoxlAvAgVWqcrrQl7z2Wf+iw+T++NP8cPp
	VRLELd35RhGkhRfjT4uqx2ixxKEgpQN5dJ1y3EEC6CwBFQraX2U94gEA+3YRGqgCYLBzKEXL/nWXn
	V8bKEtIHVkxjFas+JBfKzAvUtsf9jZig1YDCuQdpHwFv0ZpM74EGRMCgA0GnanvitHDtC9UjDmPX6
	FxvmS5msVmIiaY6SBJ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjZOS-00000000uOT-11jP;
	Thu, 29 Aug 2024 07:16:32 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjZON-00000000uKE-3vyY
	for linux-snps-arc@lists.infradead.org;
	Thu, 29 Aug 2024 07:16:29 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7ae3d7222d4so204922a12.3
        for <linux-snps-arc@lists.infradead.org>; Thu, 29 Aug 2024 00:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724915787; x=1725520587; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9klKwS2bfsiGNUk5X0TeI2il7xQjjU59nEcVHrUHGMg=;
        b=Rr5v86wTd3s/E7SPv+FfAaX51KMgbLbhq0O2nrdTsLWV1FmY4WYqe0Vs/S45pXCsZ4
         T026z1LQ0uO1xQJugKphegG7qKWf9BcB5I6mfQnStwjaqE+lW1Ra4BJT6tJtV9H6Adp6
         Jn0kmRwIDPoUSzYsha9fNh86hDWEQX003t6JQWhvuabERXqmgKQlIINPtZbKU7aH8p2s
         qooD5dkGmR05UeSmagmOsWbvqPBn4YAEOI/nfxH8P/pxSlDFQN2OaPW2NLy2v1C1nTtL
         LbTPqyKlOl8ciIaa0/deL4PwXgTKSD6Oho5t4la7G0SsvKrNeOgLidjS86iDG2B1U4iY
         nUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724915787; x=1725520587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9klKwS2bfsiGNUk5X0TeI2il7xQjjU59nEcVHrUHGMg=;
        b=k3pHPoAWFj3Ws0iwPVmefUKJKEWWSYY12jUwfq2W7Yyg5X1oq2wDCRSUh3/rI++jXS
         KCIwZo1CLCQ9OF88lLrOHSF81lv0I/Z4vKgW5fAUrhkFqooSU4ExAo4u3OUGf7OsxFMG
         VznVJ0oE+/nHUwBbqYkw9lpOWGT6RIT/Y+YYalmiPVmQj2cwE975Jm997Oz8xlkyUA4D
         TtYxLX+QGto6K/Rp9VmMFBwmlCYRkSc22FzQmlT+DCX7+2QgaG1euYE3ifCCn3Yza/+y
         /JFRueolqDRvBM6Lebn+QaXeKGgKTNKgcVIFXD6yuRI2UFEJZh2oO0LesGzqN+Nww1bj
         T+rw==
X-Forwarded-Encrypted: i=1; AJvYcCWkde4DBfYNEy4ECPcQ1ahpGf/glNZwaMqsSsxWpwxpJM1jQM3u2aZfK8H2QtJo9KxCzY6pbB/I+7h7LsI2WA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwfrpL17STwnXhCTFq+8zcoX7/CPtUb2Fqu4WVlC9GribXuYS1
	CaNIvOp/IqCM9PZ8LEPQGCF4EFeGpqaEUMfkTth/Tx0QIR83vMgKWVCB0mRVk1Q=
X-Google-Smtp-Source: AGHT+IF3t2cjexZNLvhhEG5lVGM8VXbW+pDj1JAzDu87zeFwskGcSX3PJG32Vb5o0zHIzYY5Gmbt2A==
X-Received: by 2002:a05:6a20:e196:b0:1be:c4bb:6f31 with SMTP id adf61e73a8af0-1cce1011dd6mr2308343637.18.1724915786799;
        Thu, 29 Aug 2024 00:16:26 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e9bef08sm581976a12.58.2024.08.29.00.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 00:16:26 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 29 Aug 2024 00:16:01 -0700
Subject: [PATCH RFC v2 4/4] selftests/mm: Create MAP_BELOW_HINT test
MIME-Version: 1.0
Message-Id: <20240829-patches-below_hint_mmap-v2-4-638a28d9eae0@rivosinc.com>
References: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
In-Reply-To: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1995; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=s/V5Z34t4dT0xkb/r9QmO4zmTWyR+OmvwZt8Wf5I9yo=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9oFBcsP6+L/Tm5SuNTuoL5vd1CHFePmle9+1/Le0d5Yp
 3hVY8XNjlIWBjEOBlkxRRaeaw3MrXf0y46Klk2AmcPKBDKEgYtTACYikcjwz6bDSmrzHWPjp6+e
 zUhZGF3tGZgzRbFMebrXzej5O9YXpDH8j7Z7ceLNKc+79Xs9s7LbGbZefbF4gvgksf23zjP3/b/
 +jhkA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_001628_028874_840482CD 
X-CRM114-Status: GOOD (  14.46  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Add a selftest for MAP_BELOW_HINT that maps until it runs out of space
below the hint address.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/testing/selftests/mm/Makefile         |  1 +
 tools/testing/selftests/mm/map_below_hint.c | 32 +++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index cfad627e8d94..4e2de85267b5 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -50,6 +50,7 @@ TEST_GEN_FILES += hugepage-shm
 TEST_GEN_FILES += hugepage-vmemmap
 TEST_GEN_FILES += khugepaged
 TEST_GEN_FILES += madv_populate
+TEST_GEN_FILES += map_below_hint
 TEST_GEN_FILES += map_fixed_noreplace
 TEST_GEN_FILES += map_hugetlb
 TEST_GEN_FILES += map_populate
diff --git a/tools/testing/selftests/mm/map_below_hint.c b/tools/testing/selftests/mm/map_below_hint.c
new file mode 100644
index 000000000000..55d6cbf90645
--- /dev/null
+++ b/tools/testing/selftests/mm/map_below_hint.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test the MAP_BELOW_HINT mmap flag.
+ */
+#include <sys/mman.h>
+#include <errno.h>
+#include "../kselftest.h"
+
+#define ADDR (1 << 20)
+#define LENGTH (ADDR / 10000)
+
+#define MAP_BELOW_HINT	  0x8000000	/* Not defined in all libc */
+
+/*
+ * Map memory with MAP_BELOW_HINT until no memory left. Ensure that all returned
+ * addresses are below the hint.
+ */
+int main(int argc, char **argv)
+{
+	void *addr;
+
+	do {
+		addr = mmap((void *)ADDR, LENGTH, PROT_READ | PROT_WRITE,
+			    MAP_PRIVATE | MAP_ANONYMOUS | MAP_BELOW_HINT, -1, 0);
+	} while (addr != MAP_FAILED && (unsigned long)addr <= ADDR);
+
+	if (errno == ENOMEM)
+		ksft_test_result_pass("MAP_BELOW_HINT works\n");
+	else
+		ksft_test_result_fail("mmap returned address above hint with MAP_BELOW_HINT with error: %s\n",
+				      strerror(errno));
+}

-- 
2.45.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
