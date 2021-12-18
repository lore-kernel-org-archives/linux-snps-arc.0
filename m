Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CECC433F5
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Dec 2021 21:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lLZMovvZWH/LmxpfsiU7E2dPCTSoJX7q2i75vxJnmHI=; b=fSRaa8GKzyCkRJ
	/4k8MaMcBx4t4y+nJ1IFyhAZQIFQ6F8Zasz+shmjYahRH4xBX/sD3Rs5U7eStIaD/d1D9DoOjt9/V
	JIrE1vb/7/pwg3YTPyulvZd5j0hJa/JsvEbqeIZnUowhds3LQXIDYkZJDM20FDL0C9xKpPnS3GGo4
	GFut0PnYNgxPsCMR8Oh4Tz+W8dzn8rh18lZ2LJqo8EUNjWpfM7IZtFX4dE/8LRFIEwmU0DxxzwK1H
	y/XnVlDnY+CK14hu5JD6VB+WbNi93Wby0vqsn587hWApwgBRG6Tp64jwotbG8b0Hqcs6HZZvRtv6w
	wp2lfhFeVbqUtJv7fwzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myh9v-00El4i-27; Sat, 18 Dec 2021 21:22:27 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myh8c-00Ek4I-Bk; Sat, 18 Dec 2021 21:21:08 +0000
Received: by mail-oi1-x232.google.com with SMTP id bk14so9355078oib.7;
 Sat, 18 Dec 2021 13:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4RN3kEyYZIUbVI8zbTA6/50Tm8Aie4ofxliWXaj5zzI=;
 b=YQxoC6k8cQ7kYClCwpVsfWWkBeb0lNCqOp+9jiaYb/x+5POwS9ABXWLPczVNlPCEzM
 iIHk+DzsjobRVCOlcC5XIikxxNxu5X/zaitga1umEIZCudyfpgSlCL7IQ38S7I467MHo
 pPRd3mGKnvvRiH7Kt5Sy8bEpLpHHxMLS79H6P18S/OWezxc8Qwp2CHDYEydPIFnIv0x5
 VcXpAYuGmxjUSgIfiyTeTuXnJrVXxQbs3XD4EhmGr5lZt2cuYbt1zrSxB7wNMUdtcoFY
 RjhzErjDlzWwlTmVjAk+PBKifp+nLo5LNJz73PCLWdF08B6e3IpAf6fIRMZDIp6xjPQz
 h1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4RN3kEyYZIUbVI8zbTA6/50Tm8Aie4ofxliWXaj5zzI=;
 b=DtO2pydXBcCT2pf/drvuyp6Qs2GjdyMF8bRg9jmnZXaYs2Fp7UiXDoBYhL1PyekgRI
 5LKKovjRiYFg9XobY1ipU6v20g3q0EBd6HUeAO29uLqIUjNWVumcBj0oZby6FzsUk6K1
 9FWnZH6rifiLyOtllBzNp1zGM32ZjqxDNr/ZESQr71VC5wz5Py2U7hu6RJ3dijqPIaJL
 x295rEC6PxaMQEBsQ8b9hFx/tPMmtmIwsAkZH7vZIj10gCp60HyOKFR3gJMI+9EMuR6r
 8pJ8cL+au47BPnZ3xrM3+JFvRlS1vRtOhb3zILP8Wm0m8XNRoKEXI4xRqcTdvcc/j82+
 7gFw==
X-Gm-Message-State: AOAM532hXBrtNna1PmWqHadw96HYj6R6jqT9q7qNVjtdx1pIUOqTtCgl
 L1RMtpa6Wwj4t5/9/Fw3f3M=
X-Google-Smtp-Source: ABdhPJyJ7o57fml/hco056UTSNVqP6S+b5PlRmb4MutSKjwWJkbs3cpttoLjNt0j+pq04ePN93Dndw==
X-Received: by 2002:aca:674a:: with SMTP id b10mr7011112oiy.66.1639862465447; 
 Sat, 18 Dec 2021 13:21:05 -0800 (PST)
Received: from localhost (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id n26sm2374672ooc.48.2021.12.18.13.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 13:21:05 -0800 (PST)
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
Subject: [PATCH 15/17] kernel/cpu: add num_active_cpu counter
Date: Sat, 18 Dec 2021 13:20:11 -0800
Message-Id: <20211218212014.1315894-16-yury.norov@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211218212014.1315894-1-yury.norov@gmail.com>
References: <20211218212014.1315894-1-yury.norov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_132106_511912_546C566E 
X-CRM114-Status: GOOD (  20.67  )
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

Similarly to the online cpus, the cpu_active_mask is actively used
in the kernel. This patch adds a counter for active cpus, so that
users that call num_active_cpus() would know the result immediately,
instead of calling the bitmap_weight for the mask.

Suggested-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 include/linux/cpumask.h | 26 +++++++++++++++-----------
 kernel/cpu.c            | 15 +++++++++++++++
 2 files changed, 30 insertions(+), 11 deletions(-)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index c2a9d15e2cbd..0add872898f8 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -101,6 +101,7 @@ extern struct cpumask __cpu_dying_mask;
 extern atomic_t __num_online_cpus;
 extern atomic_t __num_possible_cpus;
 extern atomic_t __num_present_cpus;
+extern atomic_t __num_active_cpus;
 
 extern cpumask_t cpus_booted_once_mask;
 
@@ -875,17 +876,8 @@ void init_cpu_online(const struct cpumask *src);
 void set_cpu_possible(unsigned int cpu, bool possible);
 void reset_cpu_possible_mask(void);
 void set_cpu_present(unsigned int cpu, bool present);
-
 void set_cpu_online(unsigned int cpu, bool online);
-
-static inline void
-set_cpu_active(unsigned int cpu, bool active)
-{
-	if (active)
-		cpumask_set_cpu(cpu, &__cpu_active_mask);
-	else
-		cpumask_clear_cpu(cpu, &__cpu_active_mask);
-}
+void set_cpu_active(unsigned int cpu, bool active);
 
 static inline void
 set_cpu_dying(unsigned int cpu, bool dying)
@@ -971,7 +963,19 @@ static inline unsigned int num_present_cpus(void)
 {
 	return atomic_read(&__num_present_cpus);
 }
-#define num_active_cpus()	cpumask_weight(cpu_active_mask)
+
+/**
+ * num_active_cpus() - Read the number of active CPUs
+ *
+ * Despite the fact that __num_active_cpus is of type atomic_t, this
+ * interface gives only a momentary snapshot and is not protected against
+ * concurrent CPU hotplug operations unless invoked from a cpuhp_lock held
+ * region.
+ */
+static inline unsigned int num_active_cpus(void)
+{
+	return atomic_read(&__num_active_cpus);
+}
 
 static inline bool cpu_online(unsigned int cpu)
 {
diff --git a/kernel/cpu.c b/kernel/cpu.c
index 1f7ea1bdde1a..62b411d88810 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -2603,6 +2603,9 @@ EXPORT_SYMBOL(__num_present_cpus);
 struct cpumask __cpu_active_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_active_mask);
 
+atomic_t __num_active_cpus __read_mostly;
+EXPORT_SYMBOL(__num_active_cpus);
+
 struct cpumask __cpu_dying_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_dying_mask);
 
@@ -2678,6 +2681,18 @@ void set_cpu_present(unsigned int cpu, bool present)
 }
 EXPORT_SYMBOL(set_cpu_present);
 
+void set_cpu_active(unsigned int cpu, bool active)
+{
+	if (active) {
+		if (!cpumask_test_and_set_cpu(cpu, &__cpu_active_mask))
+			atomic_inc(&__num_active_cpus);
+	} else {
+		if (cpumask_test_and_clear_cpu(cpu, &__cpu_active_mask))
+			atomic_dec(&__num_active_cpus);
+	}
+}
+EXPORT_SYMBOL(set_cpu_active);
+
 /*
  * Activate the first processor.
  */
-- 
2.30.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
