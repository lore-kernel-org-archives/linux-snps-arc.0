Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41B3C433EF
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Dec 2021 21:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bQwYet9Z1kJvOtp5LJmhKr9MtcokKPX8HHUUZ3M1GeI=; b=iEIPIq569nVOSD
	N+X8zJ6pCYBMhz0/Gw6UYgjR2+SR19BjZMcaQYePVCw0VrKMNUwlXo+jjbUveNPwunWYz1Pp4L/Q8
	7JMHkLHQhNTDs1mWoHBL9vN4wzCrV7VXjAXNDZUkWdxt9Yzp3pxPKWHHvk9FTjoIh7p8js5sQT5qI
	w8X0/FGsE3pUCuAjugc2I2q/KJIjIAtR9IwcUnXuVb3LLNygwRRwnorunQcJK0NAjnVdE2FxBdapp
	FDi+w8804v/kS9zYWlWnvxyDVMAdi1Ub9Ot22GVJ6VdMD8QR1I0LkMm0RLwrRVi/pHZMajUGfYSFO
	11QNTgpvsaPd8BrmPeaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myh8A-00EjgI-3y; Sat, 18 Dec 2021 21:20:38 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myh7x-00EjWB-6y; Sat, 18 Dec 2021 21:20:27 +0000
Received: by mail-oi1-x229.google.com with SMTP id bj13so9342142oib.4;
 Sat, 18 Dec 2021 13:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZRDbXQndZB+h1W3grije4oLm88mhsLSCo0DvJeL0oOc=;
 b=RbLh966dNM6Q9dumAKT/s67Li0XDMiqpqy9QDRjKZ7xykviae8HUZGbBK4++gzts9+
 4HWimSnZbbp981RdIy4mUiEPi5KNC27XZMzAqhbLAbSCXpzsa6pdkKTooARlGNlTUTY6
 JoyuKChgIL/vGpnEuqm73H3imSDYRcmkvOW7G88lNj2P4DJILBf/LhHA1ZwruMX1IzE2
 L/mAlIYrOkdOM5wMkeJ8+xwn6+2dLufPFudFw0L+ol31R0QIHi6gU0asPbGQ0WpcgUYF
 TKKLWiuHi4Ipvj4eEi1DnTT9o6ibI9n5SLfH6H9ye6clD987ERDreQoQOmClSh/YKHYJ
 9wZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZRDbXQndZB+h1W3grije4oLm88mhsLSCo0DvJeL0oOc=;
 b=isq5JFdjzc6dhfEikJnGRhcPhtFJu9srk5gRSEqEPteK89lBr8DqXh0R6Zz0yDwvi8
 TKuF64+DjqRLhXfzXzKLSP0s/dt+ykSppCC60hTj+VWMRyf1YlEDCOydoXdilVHBi0ED
 8F9MJgTxdhjzkTD3hHQ1ckvtcn0Nunshm4ca8KDH/lFrhpcbvAKVTpfqcBwVikhcIXcF
 vnpgHLKeFgOdXn6SXq8oKJrEC/1HwaKIxCfJ9JBBSxsFf9QCWUwPf6+YbSnNMCBvIV+/
 bi1rt9/2SwMez30ycMnrzovTMrt8zL0o+gb4TMmosvrRhyQuKZOZC3PxT9GKZO038/4H
 VPeg==
X-Gm-Message-State: AOAM5327TA6Fsr7XQdeq86DSdFE8Jahu3DCyp9Y9UCqrTbZpcrx7pDzN
 tvsZo9r/qPcsDSA6pGlNhwM=
X-Google-Smtp-Source: ABdhPJxshh8wZNTv7Y9Ku4jyb7QQxFrS/1r/onV0bhXisp6AJbbov2WJDwCGNF7Hkx62Pk9+Bq0Ozw==
X-Received: by 2002:a05:6808:159a:: with SMTP id
 t26mr13219038oiw.106.1639862424104; 
 Sat, 18 Dec 2021 13:20:24 -0800 (PST)
Received: from localhost (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id 186sm2409379oig.28.2021.12.18.13.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 13:20:23 -0800 (PST)
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
Subject: [PATCH 02/17] drivers: rename num_*_cpus variables
Date: Sat, 18 Dec 2021 13:19:58 -0800
Message-Id: <20211218212014.1315894-3-yury.norov@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211218212014.1315894-1-yury.norov@gmail.com>
References: <20211218212014.1315894-1-yury.norov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_132025_272287_A72DB566 
X-CRM114-Status: GOOD (  20.36  )
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

Some drivers declare num_active_cpus and num_present_cpus,
despite that kernel has macros with corresponding names in
linux/cpumask.h, and the drivers include cpumask.h

The following patches switch num_*_cpus() to real functions,
which causes build failures for the drivers.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 drivers/leds/trigger/ledtrig-cpu.c | 6 +++---
 drivers/scsi/storvsc_drv.c         | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-cpu.c b/drivers/leds/trigger/ledtrig-cpu.c
index 8af4f9bb9cde..767e9749ca41 100644
--- a/drivers/leds/trigger/ledtrig-cpu.c
+++ b/drivers/leds/trigger/ledtrig-cpu.c
@@ -39,7 +39,7 @@ struct led_trigger_cpu {
 static DEFINE_PER_CPU(struct led_trigger_cpu, cpu_trig);
 
 static struct led_trigger *trig_cpu_all;
-static atomic_t num_active_cpus = ATOMIC_INIT(0);
+static atomic_t _active_cpus = ATOMIC_INIT(0);
 
 /**
  * ledtrig_cpu - emit a CPU event as a trigger
@@ -79,8 +79,8 @@ void ledtrig_cpu(enum cpu_led_event ledevt)
 
 		/* Update trigger state */
 		trig->is_active = is_active;
-		atomic_add(is_active ? 1 : -1, &num_active_cpus);
-		active_cpus = atomic_read(&num_active_cpus);
+		atomic_add(is_active ? 1 : -1, &_active_cpus);
+		active_cpus = atomic_read(&_active_cpus);
 		total_cpus = num_present_cpus();
 
 		led_trigger_event(trig->_trig,
diff --git a/drivers/scsi/storvsc_drv.c b/drivers/scsi/storvsc_drv.c
index 20595c0ba0ae..705dd4ebde98 100644
--- a/drivers/scsi/storvsc_drv.c
+++ b/drivers/scsi/storvsc_drv.c
@@ -1950,7 +1950,7 @@ static int storvsc_probe(struct hv_device *device,
 {
 	int ret;
 	int num_cpus = num_online_cpus();
-	int num_present_cpus = num_present_cpus();
+	int present_cpus = num_present_cpus();
 	struct Scsi_Host *host;
 	struct hv_host_device *host_dev;
 	bool dev_is_ide = ((dev_id->driver_data == IDE_GUID) ? true : false);
@@ -2060,7 +2060,7 @@ static int storvsc_probe(struct hv_device *device,
 	 * Set the number of HW queues we are supporting.
 	 */
 	if (!dev_is_ide) {
-		if (storvsc_max_hw_queues > num_present_cpus) {
+		if (storvsc_max_hw_queues > present_cpus) {
 			storvsc_max_hw_queues = 0;
 			storvsc_log(device, STORVSC_LOGGING_WARN,
 				"Resetting invalid storvsc_max_hw_queues value to default.\n");
@@ -2068,7 +2068,7 @@ static int storvsc_probe(struct hv_device *device,
 		if (storvsc_max_hw_queues)
 			host->nr_hw_queues = storvsc_max_hw_queues;
 		else
-			host->nr_hw_queues = num_present_cpus;
+			host->nr_hw_queues = present_cpus;
 	}
 
 	/*
-- 
2.30.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
