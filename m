Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DBBC4167B
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Dec 2021 21:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RHQFQROof23rWU+56TQpFo2gtiuBcGJGMCjiAVgxFPw=; b=MvVtDyRPVO81cf
	+Yw5BvyAJYsy641dNqx/KMquL+iryQqnRv7LPkcOT3DPIkmoeg7/oo1okNJgF6DgTojI1ESLhBA8C
	PviH7OU7mZvHQpBGSO4LTyk85zIb1iROhsC17XD/n6Yob3ANmKt42uXb0Gx1m4Fp58NJEbvcePubE
	q1FqdipSoxsAAKjn43V7qp8M48rSGBukKMVl9J7aBdlp454sQd/I/JbHiM0SySAct2OHhj+LEh+q6
	Wyd1pd1buPgTGNKFZoKCpClor0Nbs+hPwuhZ+vx38icPMWk5izVJRbo3cn8KZjScz2vnrTCdmIdIb
	zEYH98xwrtX4n28/NTPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myh83-00EjbJ-AA; Sat, 18 Dec 2021 21:20:31 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myh7t-00EjTy-LV; Sat, 18 Dec 2021 21:20:24 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id
 g11-20020a4a754b000000b002c679a02b18so1851539oof.3; 
 Sat, 18 Dec 2021 13:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Z2tvdbF6REb1vBF1soXoDEIHAExTZD83ljtvXFSjKwo=;
 b=emXGoF/rqz2kZ1ppkVCvpVwnlzRGfpHvB6fCjdgXgq4mWi4taNltzT/8wcLQq66dbk
 MD2zDykqS6XJaQ5PU2HVINr4Hy6yCA5bYv6gpPBvg9v3XheXHY+8l+yeCmhX2tga4gVQ
 sTew+4Ce+CJk3e/yVOV0JvK+IRua38r6JmY0W0m2iG7AvTEFJPzEdJgJthm8SUSs/HSu
 +2y2hMZR9kLSjfG1dQSz0Un8nNh3r481BC0sqINll4Wfg/BF12V/L2oAmdDVwhPToLvH
 OP+x58qnTe8/1kAkfYhKXTLFTwToKojcYG+btHtZE0qvbhco3tOTmSCXQ29ee1Ng0z1Y
 3GQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z2tvdbF6REb1vBF1soXoDEIHAExTZD83ljtvXFSjKwo=;
 b=6grPfm1vKDCcfrSQSqozII8iaFKEYWbzrOeaoW0dkNycoilY+jvJlfiq44CglFukD7
 qE7LE9w4oQSt0UIPn0IUGyBEjR6tJru4qPPZ+YNkaiqBYiWhytPrJf49nQT+fuMpJsqp
 N2YO3QKlyg0ewZil/X/uSrAQnmZezBTUje/Y8jgAa7VJi3Cah4WFnko5y2fdHf42UH8Q
 c3pTu2xmr/RKBSAbB856v0ud3DRsK+0AX0SDu52ArhLluzJ9/vHg82x9dePP1/MmSUfx
 jnnb73d/x+UCqNcFONwXa53vEio85ytNPUl8YfdIogqSjQVzTz7Dg/eOudEEURjvT9PE
 UjQA==
X-Gm-Message-State: AOAM533e+/vNVmasAz2ig40i8B6ZeLeQ6ta+DuRsRgb8VXhwEcNgMl4K
 Sh9EPtNn8ZypNIh6soTUlhg=
X-Google-Smtp-Source: ABdhPJwPbo0K0G4ak9o4in4lTp9662eXAkNuBO+m2YfWhJBYOSEs8AJNY3EOrOHmvQuk+mj1mPzKcQ==
X-Received: by 2002:a4a:8701:: with SMTP id z1mr6056463ooh.68.1639862420605;
 Sat, 18 Dec 2021 13:20:20 -0800 (PST)
Received: from localhost (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id x13sm2332785otr.58.2021.12.18.13.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 13:20:20 -0800 (PST)
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
Subject: [PATCH 01/17] all: don't use bitmap_weight() where possible
Date: Sat, 18 Dec 2021 13:19:57 -0800
Message-Id: <20211218212014.1315894-2-yury.norov@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211218212014.1315894-1-yury.norov@gmail.com>
References: <20211218212014.1315894-1-yury.norov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_132021_745925_D75DA5FC 
X-CRM114-Status: GOOD (  19.08  )
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

Don't call bitmap_weight() if the following code can get by
without it.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 drivers/net/dsa/b53/b53_common.c           | 6 +-----
 drivers/net/ethernet/broadcom/bcmsysport.c | 6 +-----
 drivers/thermal/intel/intel_powerclamp.c   | 9 +++------
 3 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 3867f3d4545f..9a10d80125d9 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -1620,12 +1620,8 @@ static int b53_arl_read(struct b53_device *dev, u64 mac,
 		return 0;
 	}
 
-	if (bitmap_weight(free_bins, dev->num_arl_bins) == 0)
-		return -ENOSPC;
-
 	*idx = find_first_bit(free_bins, dev->num_arl_bins);
-
-	return -ENOENT;
+	return *idx >= dev->num_arl_bins ? -ENOSPC : -ENOENT;
 }
 
 static int b53_arl_op(struct b53_device *dev, int op, int port,
diff --git a/drivers/net/ethernet/broadcom/bcmsysport.c b/drivers/net/ethernet/broadcom/bcmsysport.c
index 40933bf5a710..241696fdc6c7 100644
--- a/drivers/net/ethernet/broadcom/bcmsysport.c
+++ b/drivers/net/ethernet/broadcom/bcmsysport.c
@@ -2177,13 +2177,9 @@ static int bcm_sysport_rule_set(struct bcm_sysport_priv *priv,
 	if (nfc->fs.ring_cookie != RX_CLS_FLOW_WAKE)
 		return -EOPNOTSUPP;
 
-	/* All filters are already in use, we cannot match more rules */
-	if (bitmap_weight(priv->filters, RXCHK_BRCM_TAG_MAX) ==
-	    RXCHK_BRCM_TAG_MAX)
-		return -ENOSPC;
-
 	index = find_first_zero_bit(priv->filters, RXCHK_BRCM_TAG_MAX);
 	if (index >= RXCHK_BRCM_TAG_MAX)
+		/* All filters are already in use, we cannot match more rules */
 		return -ENOSPC;
 
 	/* Location is the classification ID, and index is the position
diff --git a/drivers/thermal/intel/intel_powerclamp.c b/drivers/thermal/intel/intel_powerclamp.c
index 14256421d98c..c841ab37e7c6 100644
--- a/drivers/thermal/intel/intel_powerclamp.c
+++ b/drivers/thermal/intel/intel_powerclamp.c
@@ -556,12 +556,9 @@ static void end_power_clamp(void)
 	 * stop faster.
 	 */
 	clamping = false;
-	if (bitmap_weight(cpu_clamping_mask, num_possible_cpus())) {
-		for_each_set_bit(i, cpu_clamping_mask, num_possible_cpus()) {
-			pr_debug("clamping worker for cpu %d alive, destroy\n",
-				 i);
-			stop_power_clamp_worker(i);
-		}
+	for_each_set_bit(i, cpu_clamping_mask, num_possible_cpus()) {
+		pr_debug("clamping worker for cpu %d alive, destroy\n", i);
+		stop_power_clamp_worker(i);
 	}
 }
 
-- 
2.30.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
