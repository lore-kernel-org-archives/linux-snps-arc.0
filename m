Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AE8C433F5
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Dec 2021 21:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mgG88F52Csnb3OK50B9wV8kI1RqKu+T4PR4EhPSMEsI=; b=icWasyn0oaHTlo
	ML4ld7AORWD5/Sr8VU0VZLM12Q+i37j9VSt/VuvFZAUF8cOuAyV+5hgZjB25yNN3ZXJWEQv5IHA/l
	s5Gh/7J38aPkmo1IFup0K94Jr147WkWcLe9LNJbdE2K5EEfQVFI7HeHHA1P/EGpFse34nrgPwneIG
	bYXBsOIQmqqHoXnvyFq4a0QrIFwHr12uNHU83oAmYfqk6PugTIPODqLtE8CFkBq57QBQa1gbiBo2m
	kUZB8CWRjJqxHV76fhr6HmugNLO8aOAmDZG6sutlLRWqh/IHxS2weLURc6F54C2c2BANxbw4w+kHq
	t/Q5b3WJ6/fidMTL2yfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myh9S-00Ekjy-KJ; Sat, 18 Dec 2021 21:21:58 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myh8T-00EjwT-0G; Sat, 18 Dec 2021 21:21:00 +0000
Received: by mail-ot1-x32e.google.com with SMTP id
 u18-20020a9d7212000000b00560cb1dc10bso7424353otj.11; 
 Sat, 18 Dec 2021 13:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Hec35lasK9ZA9Al4lVu2VLAlB7ZGIYc9EtAwCKNTlw8=;
 b=fBftgt78xMj1xKG5HZZwIKhKCaPNvVnrKaDadtsATTpbsWGFVP5e7HSashlaWMcwqO
 LGw9PZb24tpFErLVXHUlIglhlIamlRCnbPR5OsIzGuKEIH1AURNfV/dBdfTBQoYJvzuO
 vJHwptAoNFqOBC8BK+K0vkVFi+BHhxI0ibPZCe0ZoMw3oErF2aHMJ2Qi5YW1XoA/0FmX
 DvxauUzfNVo2yGxIRxf4OdPGCp1xAi9orXiOGorjkgyc4oijxQ3LsGsYHHg9DqrmgOxo
 d9gh/VCFcHiQ0ntVUwmhI9B1jfed7aIsK1FoKUVaewVhnEosQJQvZUV3oMwwmTiQqF/E
 EGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hec35lasK9ZA9Al4lVu2VLAlB7ZGIYc9EtAwCKNTlw8=;
 b=FUqmogpOjVMTBbHpL3dX0mxEi2vV4cbYN9BMhXsanlxp8vd+jWWakA9kXY2CD2ePib
 K1El3I5kGEl9C4rvuI1peLfCJYcEvwgvk3CF0VFLHQLSj26UM30FnqyWxGhYx7iV3Fsk
 FkOYbrWynWFkXbG4VfqQDNgfBUiR7iRTY8AgzKL8pnWsTh+wxQeOF48vvSGWL/+za9d7
 sim8auNMpEhVWqwuWlYBZmyHH7n2RQZKL7S6ZlodjxuFd1Es+kwHmaDRKZj/0szLve2k
 HaYdeBJOsqYAmFkkaa2CDbdMESBEnPiIq8QWSRVaLuXlefIO/Qz03BcpR57D8Q8ZozfN
 05Nw==
X-Gm-Message-State: AOAM533UXsPzz5ysaQeQwZkAs0R6rYXt0g4BhMi5+kABAV7i80Q2hbre
 1Yr30t5pxV9bAv9tPhUx+rY=
X-Google-Smtp-Source: ABdhPJyF3ZGCXzeXjVp/KVuej2Lro/GR2ZMmRe4CsBC/6he5KNwSmag2n9ENl7goEuOdRGP79z0Maw==
X-Received: by 2002:a9d:2d81:: with SMTP id g1mr6637050otb.25.1639862455926;
 Sat, 18 Dec 2021 13:20:55 -0800 (PST)
Received: from localhost (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id n23sm2383616oic.26.2021.12.18.13.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 13:20:55 -0800 (PST)
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
Subject: [PATCH 12/17] kernel/cpu.c: fix init_cpu_online
Date: Sat, 18 Dec 2021 13:20:08 -0800
Message-Id: <20211218212014.1315894-13-yury.norov@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211218212014.1315894-1-yury.norov@gmail.com>
References: <20211218212014.1315894-1-yury.norov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_132057_101091_05D48E00 
X-CRM114-Status: GOOD (  14.17  )
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

cpu_online_mask has an associate counter of online cpus, which should be
initialized in init_cpu_online()

Fixes: 0c09ab96fc82010 (cpu/hotplug: Cache number of online CPUs)
Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 kernel/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 407a2568f35e..cd7605204d4d 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -2616,6 +2616,7 @@ void init_cpu_possible(const struct cpumask *src)
 void init_cpu_online(const struct cpumask *src)
 {
 	cpumask_copy(&__cpu_online_mask, src);
+	atomic_set(&__num_online_cpus, cpumask_weight(cpu_online_mask));
 }
 
 void set_cpu_online(unsigned int cpu, bool online)
-- 
2.30.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
