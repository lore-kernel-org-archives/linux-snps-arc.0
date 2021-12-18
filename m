Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA18C433EF
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Dec 2021 21:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QTtrXKebom1nsjYV16+VL9BDuoCNPT/qZ1DtvHd1Bt0=; b=BkUY9P8jxaqQ35
	V3EpDDFn9JwR4m5bQlBMSLyIGGosc7w7coWmVlwT1HMo0cnk/zGlrofDigKMdW9/yLKANk4bylSMJ
	fOw1YinSFtuvwXwVmaie32/clJOJU3Xpw+gdjceVk5HlbPzSVclEbTbSgfAR6DFcf28J18fKVZ3mC
	gee7FNaeBULrE5NPGvR1KRwAnaYkZDFToKg8++sQnm2rGMN2CCtlfSD/I2FwZWv+9FpRK8z0BJ5D9
	G//UzGDqc/tw2ZTewOMe7cKlGxo2mIfXe8jMl7kIl98E2fqGX3JhSRMI24ogOdP2yZN58kHDR4NcD
	TQbYUXT0J4/NhzKUHM/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myh9G-00EkbM-Ps; Sat, 18 Dec 2021 21:21:46 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myh8M-00Ejqy-J0; Sat, 18 Dec 2021 21:20:52 +0000
Received: by mail-ot1-x32d.google.com with SMTP id
 x3-20020a05683000c300b0057a5318c517so7411800oto.13; 
 Sat, 18 Dec 2021 13:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CEg5Pz3jzK+yQWJ1b0gYNPIQm++ujg7tBpTQAFfsgrU=;
 b=eHOpKLINiZVw1U8UFLmv4Z4orUsxMHu+htgZlUDET11qp6Xd7CyNXR8JJgc+Do9AtO
 3GiFTQq1k3gdmq11sXaXRequzZr5JLiN1ST8SltutFMt0Ut4vjnWsFkLx5x/LH+J7CgT
 9yorXhsUWIRB06dk0K6v5eIPVRBqMJY2Fuz1xiOJvI/LXDTuQVNjNlbnagLP/dEwkxQr
 og7VA+7k41dDowSRrQm1WJKv9RiBZnFc7NtVisoEJRIhXLga9sDmCfszVXjyJtpvXsLX
 jb68zUDuR+zJaayYQ4raYutAZdhAFVDWfd717kmQBxY79TgsQLCen1fY3ep1+UZrNOrO
 LWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CEg5Pz3jzK+yQWJ1b0gYNPIQm++ujg7tBpTQAFfsgrU=;
 b=m2HqMU15B/Bv8HW+Z2bk2BhW4Pvdq6VIWWSiiJw5lnUYt8niJTG7d/qeEWul2iuw2i
 WLrg2aow35KMOcVu3nOu3tryw22mbQElLcl6duvvW1yjla/Jgg96Lhdqy/rE4SVpcA0K
 bjLID28Bi945H8df6fvZZAWMy7c819bHEWabFBx3mVzIFeqCkDKGamiw3YEusNMhXEqH
 pNx2YBKGerj5nzH68eVZT2smZsitQPSLsxzzgUaeTBuW4eyajgoiE03ImWQqN4jEHUkV
 i+8LIMmiXA/tIs0Elcb8TFAqKXIhJ1vpFaA6XUq5iaLOWpmaKDA+Jqom4ItCxo3eCVkz
 YEIA==
X-Gm-Message-State: AOAM532K7ulZtvoRl7PZ+y4zUMmodyIHlDQx32Ya+bX4nbMRaGuITGm7
 Mtd1ONyHh2xfju2FWejig6s=
X-Google-Smtp-Source: ABdhPJxK9/VC1gNfbEAhH6vL5zb84CKz67Dt+OzQwcZipUXmYca9+mYr83AwXXf3kCJEYp4+46HVHA==
X-Received: by 2002:a05:6830:1d87:: with SMTP id
 y7mr6391393oti.269.1639862449472; 
 Sat, 18 Dec 2021 13:20:49 -0800 (PST)
Received: from localhost (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id bj8sm2621211oib.51.2021.12.18.13.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 13:20:49 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexey Klimov <aklimov@redhat.com>,
 Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christoph Hellwig <hch@lst.de>, Christoph Lameter <cl@linux.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Airlie <airlied@linux.ie>, David Laight <David.Laight@ACULAB.COM>,
 Dennis Zhou <dennis@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Geetha sowjanya <gakula@marvell.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guo Ren <guoren@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Ian Rogers <irogers@google.com>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, Jens Axboe <axboe@fb.com>,
 Jiri Olsa <jolsa@redhat.com>, Joe Perches <joe@perches.com>,
 Jonathan Cameron <jic23@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
 Kees Cook <keescook@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Lee Jones <lee.jones@linaro.org>, Marc Zyngier <maz@kernel.org>,
 Marcin Wojtas <mw@semihalf.com>, Mark Gross <markgross@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Mel Gorman <mgorman@suse.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Zijlstra <peterz@infradead.org>, Petr Mladek <pmladek@suse.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Russell King <linux@armlinux.org.uk>, Saeed Mahameed <saeedm@nvidia.com>,
 Sagi Grimberg <sagi@grimberg.me>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Solomon Peachy <pizza@shaftnet.org>, Stephen Boyd <sboyd@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Steven Rostedt <rostedt@goodmis.org>,
 Subbaraya Sundeep <sbhatta@marvell.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Sunil Goutham <sgoutham@marvell.com>,
 Tariq Toukan <tariqt@nvidia.com>, Tejun Heo <tj@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Vineet Gupta <vgupta@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, kvm@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 10/17] lib/nodemask: add nodemask_weight_{eq,gt,ge,lt,le}
Date: Sat, 18 Dec 2021 13:20:06 -0800
Message-Id: <20211218212014.1315894-11-yury.norov@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211218212014.1315894-1-yury.norov@gmail.com>
References: <20211218212014.1315894-1-yury.norov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_132050_673555_39FBCA4A 
X-CRM114-Status: GOOD (  16.96  )
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

Kernel code calls nodes_weight() to compare the weight of nodemask with
a given number. We can do it more efficiently with nodes_weight_{eq, ...}
because conditional nodes_weight may stop traversing the nodemask earlier,
as soon as condition is met.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 drivers/acpi/numa/srat.c |  2 +-
 include/linux/nodemask.h | 35 +++++++++++++++++++++++++++++++++++
 mm/mempolicy.c           |  2 +-
 3 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/numa/srat.c b/drivers/acpi/numa/srat.c
index 66a0142dc78c..484b9307f8cc 100644
--- a/drivers/acpi/numa/srat.c
+++ b/drivers/acpi/numa/srat.c
@@ -67,7 +67,7 @@ int acpi_map_pxm_to_node(int pxm)
 	node = pxm_to_node_map[pxm];
 
 	if (node == NUMA_NO_NODE) {
-		if (nodes_weight(nodes_found_map) >= MAX_NUMNODES)
+		if (nodes_weight_ge(nodes_found_map, MAX_NUMNODES))
 			return NUMA_NO_NODE;
 		node = first_unset_node(nodes_found_map);
 		__acpi_map_pxm_to_node(pxm, node);
diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
index 567c3ddba2c4..197598e075e9 100644
--- a/include/linux/nodemask.h
+++ b/include/linux/nodemask.h
@@ -38,6 +38,11 @@
  * int nodes_empty(mask)		Is mask empty (no bits sets)?
  * int nodes_full(mask)			Is mask full (all bits sets)?
  * int nodes_weight(mask)		Hamming weight - number of set bits
+ * bool nodes_weight_eq(src, nbits, num) Hamming Weight is equal to num
+ * bool nodes_weight_gt(src, nbits, num) Hamming Weight is greater than num
+ * bool nodes_weight_ge(src, nbits, num) Hamming Weight is greater than or equal to num
+ * bool nodes_weight_lt(src, nbits, num) Hamming Weight is less than num
+ * bool nodes_weight_le(src, nbits, num) Hamming Weight is less than or equal to num
  *
  * void nodes_shift_right(dst, src, n)	Shift right
  * void nodes_shift_left(dst, src, n)	Shift left
@@ -240,6 +245,36 @@ static inline int __nodes_weight(const nodemask_t *srcp, unsigned int nbits)
 	return bitmap_weight(srcp->bits, nbits);
 }
 
+#define nodes_weight_eq(nodemask, num) __nodes_weight_eq(&(nodemask), MAX_NUMNODES, (num))
+static inline int __nodes_weight_eq(const nodemask_t *srcp, unsigned int nbits, int num)
+{
+	return bitmap_weight_eq(srcp->bits, nbits, num);
+}
+
+#define nodes_weight_gt(nodemask, num) __nodes_weight_gt(&(nodemask), MAX_NUMNODES, (num))
+static inline int __nodes_weight_gt(const nodemask_t *srcp, unsigned int nbits, int num)
+{
+	return bitmap_weight_gt(srcp->bits, nbits, num);
+}
+
+#define nodes_weight_ge(nodemask, num) __nodes_weight_ge(&(nodemask), MAX_NUMNODES, (num))
+static inline int __nodes_weight_ge(const nodemask_t *srcp, unsigned int nbits, int num)
+{
+	return bitmap_weight_ge(srcp->bits, nbits, num);
+}
+
+#define nodes_weight_lt(nodemask, num) __nodes_weight_lt(&(nodemask), MAX_NUMNODES, (num))
+static inline int __nodes_weight_lt(const nodemask_t *srcp, unsigned int nbits, int num)
+{
+	return bitmap_weight_lt(srcp->bits, nbits, num);
+}
+
+#define nodes_weight_le(nodemask, num) __nodes_weight_le(&(nodemask), MAX_NUMNODES, (num))
+static inline int __nodes_weight_le(const nodemask_t *srcp, unsigned int nbits, int num)
+{
+	return bitmap_weight_le(srcp->bits, nbits, num);
+}
+
 #define nodes_shift_right(dst, src, n) \
 			__nodes_shift_right(&(dst), &(src), (n), MAX_NUMNODES)
 static inline void __nodes_shift_right(nodemask_t *dstp,
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index a86590b2507d..27817cf2f2a0 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -1157,7 +1157,7 @@ int do_migrate_pages(struct mm_struct *mm, const nodemask_t *from,
 			 *          [0-7] - > [3,4,5] moves only 0,1,2,6,7.
 			 */
 
-			if ((nodes_weight(*from) != nodes_weight(*to)) &&
+			if (!nodes_weight_eq(*from, nodes_weight(*to)) &&
 						(node_isset(s, *to)))
 				continue;
 
-- 
2.30.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
