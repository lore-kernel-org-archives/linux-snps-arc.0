Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CF2C433EF
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Dec 2021 21:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jX5z7dG+BVmlm2qJu9eJBBCNBNlOMtYMiwpaNfS1nQw=; b=fZUwllGkS0DZ0e
	z0QdVXOWTgrfq57te9oT4wawknLtMByGAwq4N+xo8zd7CQ5igNEvwewDsgm1lW/LQdbJYLEH04Ek6
	cdR5qZjqoyN7M0Uu7CfjYiA9Vp0/4iW3QOxzfWfZQ4UNGvTBmohyCJjcVXt2KrTCLBQNrvGCTS7/q
	euBBQ4mD8JmSTEMdYoI3tf/CRW1QxVaMNh5WktMMPcR/su1YITGXJOnOwvBAzyeeyckYaYAT8QpLZ
	7Fm1iTZYwbgt3Yjni80k+rd8pB1gBjZiwSxomFbzAFoAn/evPQkIE9rtG3aF5vpP8rjbEX3iH+z7D
	Xqakj71ZrubD+MMHx+3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myh9a-00EkqZ-Co; Sat, 18 Dec 2021 21:22:06 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myh8W-00Ejyu-93; Sat, 18 Dec 2021 21:21:02 +0000
Received: by mail-ot1-x333.google.com with SMTP id
 a23-20020a9d4717000000b0056c15d6d0caso7434881otf.12; 
 Sat, 18 Dec 2021 13:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TtB4s+TeH5Hsx4aMsA8zovfLkC56GGSxZAM2kKc/k+s=;
 b=JpKKkwINU8Ydvnyx9TIa0uTEfLIEeORqwMjlt2cBKjHjbDtmjXYoAYcpkHvWOACNZ+
 JClsTJjPz351JiBL5YkKHmfgQb6Bs9RYm3XbiLNQpBXdxk6fSPpeP/UdvMr1JZgJmzOO
 3zd+x9XrwW0Ta4OedkblF2OTR3HDwbCAnWpcgXnJtqaKYqgdIUsODPw8Wp+KaP/4tQcA
 9zIa24wEaUYy2nK+3lrBCplwLyxuKdWlNpxyOXXoiOONLC5fupt6hpsq3NiXG/6pQoSG
 wtOhHaiB3EGda/k0PB3OUJtDVXKKoy2mUG5TqWrYE76xWrWSeHaSuRq4yt4Mp1WKWa5j
 aevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TtB4s+TeH5Hsx4aMsA8zovfLkC56GGSxZAM2kKc/k+s=;
 b=u8KsG2LWIqfjO9JL6/vE+WgLulCmDht4kwo0945uFt3GV7Bme5SMpuxk8TlgN2TagP
 p+HCkDfUZo9NsGALElQkC7DTQJgzuCU9Aj2KovvMQgrQ3eZ/RFWne4rPbC23hxGvQrJ1
 WK2XQMjVrkqLbX1DLLUtLs1l6ApUamaa7/OGQAgrT1YJvpnKbvZJPvVzCQkp2WmqrMJs
 o/kt2Ag0368Ogyl/aZWGXtq8jNVPjZpEIYIJWD8i/sCTMNGxKTKWn5AT0ze1rSqWqGEQ
 x0+sm17QbOu0nOriJu31AZnWCt/8b2f7yixSrCrsl8b49V9R8HkPA3tioa9EfuJnICIy
 fi9w==
X-Gm-Message-State: AOAM530etmhOd02m97ia4c8aB0a193uGUbukCA92ldupMD2kXJOvBiFi
 zbP39J7IK41uff00SMrpftc=
X-Google-Smtp-Source: ABdhPJz65aswwCqCKcm3NSepL1No7Bu916BAt7YX/+A7MjCUNmyZSZaKJNIPfs9JYRO4CobDyeY4pQ==
X-Received: by 2002:a05:6830:10:: with SMTP id
 c16mr6492562otp.79.1639862459100; 
 Sat, 18 Dec 2021 13:20:59 -0800 (PST)
Received: from localhost (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id e21sm2358431ote.72.2021.12.18.13.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 13:20:58 -0800 (PST)
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
Subject: [PATCH 13/17] kernel/cpu: add num_possible_cpus counter
Date: Sat, 18 Dec 2021 13:20:09 -0800
Message-Id: <20211218212014.1315894-14-yury.norov@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211218212014.1315894-1-yury.norov@gmail.com>
References: <20211218212014.1315894-1-yury.norov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_132100_388236_F437D5C2 
X-CRM114-Status: GOOD (  21.21  )
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

Similarly to the online cpus, the cpu_possible_mask is actively used
in the kernel. This patch adds a counter for possible cpus, so that
users that call num_possible_cpus() would know the result immediately,
instead of calling the bitmap_weight for the mask underlying.

Suggested-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 include/linux/cpumask.h | 30 ++++++++++++++++--------------
 kernel/cpu.c            | 22 ++++++++++++++++++++++
 2 files changed, 38 insertions(+), 14 deletions(-)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index 1906e3225737..0be2504d8e4c 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -99,6 +99,7 @@ extern struct cpumask __cpu_dying_mask;
 #define cpu_dying_mask    ((const struct cpumask *)&__cpu_dying_mask)
 
 extern atomic_t __num_online_cpus;
+extern atomic_t __num_possible_cpus;
 
 extern cpumask_t cpus_booted_once_mask;
 
@@ -870,19 +871,8 @@ void init_cpu_present(const struct cpumask *src);
 void init_cpu_possible(const struct cpumask *src);
 void init_cpu_online(const struct cpumask *src);
 
-static inline void reset_cpu_possible_mask(void)
-{
-	bitmap_zero(cpumask_bits(&__cpu_possible_mask), NR_CPUS);
-}
-
-static inline void
-set_cpu_possible(unsigned int cpu, bool possible)
-{
-	if (possible)
-		cpumask_set_cpu(cpu, &__cpu_possible_mask);
-	else
-		cpumask_clear_cpu(cpu, &__cpu_possible_mask);
-}
+void set_cpu_possible(unsigned int cpu, bool possible);
+void reset_cpu_possible_mask(void);
 
 static inline void
 set_cpu_present(unsigned int cpu, bool present)
@@ -962,7 +952,19 @@ static inline unsigned int num_online_cpus(void)
 {
 	return atomic_read(&__num_online_cpus);
 }
-#define num_possible_cpus()	cpumask_weight(cpu_possible_mask)
+
+/**
+ * num_possible_cpus() - Read the number of possible CPUs
+ *
+ * Despite the fact that __num_possible_cpus is of type atomic_t, this
+ * interface gives only a momentary snapshot and is not protected against
+ * concurrent CPU hotplug operations unless invoked from a cpuhp_lock held
+ * region.
+ */
+static inline unsigned int num_possible_cpus(void)
+{
+	return atomic_read(&__num_possible_cpus);
+}
 #define num_present_cpus()	cpumask_weight(cpu_present_mask)
 #define num_active_cpus()	cpumask_weight(cpu_active_mask)
 
diff --git a/kernel/cpu.c b/kernel/cpu.c
index cd7605204d4d..a0a815911173 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -2583,10 +2583,13 @@ EXPORT_SYMBOL(cpu_all_bits);
 #ifdef CONFIG_INIT_ALL_POSSIBLE
 struct cpumask __cpu_possible_mask __read_mostly
 	= {CPU_BITS_ALL};
+atomic_t __num_possible_cpus __read_mostly = ATOMIC_INIT(NR_CPUS);
 #else
 struct cpumask __cpu_possible_mask __read_mostly;
+atomic_t __num_possible_cpus __read_mostly;
 #endif
 EXPORT_SYMBOL(__cpu_possible_mask);
+EXPORT_SYMBOL(__num_possible_cpus);
 
 struct cpumask __cpu_online_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_online_mask);
@@ -2611,6 +2614,7 @@ void init_cpu_present(const struct cpumask *src)
 void init_cpu_possible(const struct cpumask *src)
 {
 	cpumask_copy(&__cpu_possible_mask, src);
+	atomic_set(&__num_possible_cpus, cpumask_weight(cpu_possible_mask));
 }
 
 void init_cpu_online(const struct cpumask *src)
@@ -2640,6 +2644,24 @@ void set_cpu_online(unsigned int cpu, bool online)
 	}
 }
 
+void reset_cpu_possible_mask(void)
+{
+	bitmap_zero(cpumask_bits(&__cpu_possible_mask), NR_CPUS);
+	atomic_set(&__num_possible_cpus, 0);
+}
+
+void set_cpu_possible(unsigned int cpu, bool possible)
+{
+	if (possible) {
+		if (!cpumask_test_and_set_cpu(cpu, &__cpu_possible_mask))
+			atomic_inc(&__num_possible_cpus);
+	} else {
+		if (cpumask_test_and_clear_cpu(cpu, &__cpu_possible_mask))
+			atomic_dec(&__num_possible_cpus);
+	}
+}
+EXPORT_SYMBOL(set_cpu_possible);
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
