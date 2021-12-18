Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F94C433F5
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Dec 2021 21:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eYzpkiiZVP2QoqjbMsg6IU0PcJGH2VfC2QtdNSRg2Ls=; b=ioY821zl39STKQ
	YjDME+BZoqmlZqQCj81T0IpwYUxsoTZoJ0R1YBVkdw6pn2Cd3EjDcGHXP8aatlInve0OjcgnsYNP3
	Ofs494Fa3Lk91dmX2qpoNkAX381A8WoesalZAzWZR4uqt633FIHBEVC/0vqZCKMYnuJwqsn573EBM
	tzxokTNYrB31ngvVcjS/K8psirx/yk7WUc+BXRK0nX1DIoXgF4hrjmHKVUh/K3BgX4cdw8sz/Nd84
	wcY/ltvHG85WBGse3aUXU4VFvW9SdJkwIOW3rWYUPpHWB3hjaylS05NNObPXp7P2QxN8xOKMZAALl
	psjohGX/hsRHD4MqHVUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myhAR-00ElPt-Sy; Sat, 18 Dec 2021 21:22:59 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myh8i-00EkAk-Tm; Sat, 18 Dec 2021 21:21:14 +0000
Received: by mail-ot1-x32d.google.com with SMTP id
 w6-20020a9d77c6000000b0055e804fa524so7493619otl.3; 
 Sat, 18 Dec 2021 13:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=V/7YV6PuikKJOpufvdQHaOC3eWjf6vds/A3UO3x9gwA=;
 b=V57np8F0LXhPyF31xZ/98vOSICHl4KXHpMtxMolGaerv0QV2DnMVUnnCvDjQoXdDXo
 rT1qtHlwGBuPWGVRNCqixnN8odHV5mxxXaYRnJZE3lAFoB3D1ap/tpQo+HN8ZXmqbSiD
 QIlZkCxHBkKbHcBQjbMxdSmxYOFoc1qPow8X/5CwC8N9sD0V27gZ/pusORn/HCgYlKRO
 4dCyLdZCSj6a6p1fhiCiQL21rXALTdc+Z1z5SDYBpicENwRWLWU4V7+P+Kd4ufK9GUr0
 SoIEC6LNYiFJiLfuFOcDYhiwtUBtAniHb+XKeX3F11JHzTtbiZ9Muu5cZPVqR5GCdbZQ
 WF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V/7YV6PuikKJOpufvdQHaOC3eWjf6vds/A3UO3x9gwA=;
 b=sv9yqGgZ+QLPWB691wUCPrbfJgBzRyTumgIypOQC01DnT6WOBQiFqoRS7egxmExQha
 eJaCosohu+kfpyZ3l7BVh0Jzgz6Z2u5vHLlYY6DpFJBztXruNJAuDaml48iOcHLiqiav
 k3vSZuUEWxSjGrgU4VktpdTFL9Lp0I437JCQwuQ1pRCvfvBUJpAzUKHREm14+N0UtFbO
 WYn2gpn486nR/WCPzQa/SSo4zg050nCKgCOyTafID7JXDEn9oAHEap8S1L1BDQMgIy0A
 9AN4kRXqbvrRJAtvRF3amh0fyyGre6xcdjnEPi3wXbIKf0BndN7fnO6/ZVK1WjpXepi5
 Mg6Q==
X-Gm-Message-State: AOAM5314o0ywPmUs0ngN4schuyhtRavgGCmDBDSPADaEw9T/wIZBN0k/
 EZ5AJYDncCenZbX/2SRrUWI=
X-Google-Smtp-Source: ABdhPJzH5A9A4hW9z3Dre/oQXlQB84e2qfNXrrBIp4gUt5IENY4KKyoFB1Xtm1XffBrgUFoESNT5tw==
X-Received: by 2002:a9d:6d11:: with SMTP id o17mr6686596otp.363.1639862472133; 
 Sat, 18 Dec 2021 13:21:12 -0800 (PST)
Received: from localhost (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id c3sm2614614oiw.8.2021.12.18.13.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 13:21:11 -0800 (PST)
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
Subject: [PATCH 17/17] MAINTAINERS: add cpumask and nodemask files to
 BITMAP_API
Date: Sat, 18 Dec 2021 13:20:13 -0800
Message-Id: <20211218212014.1315894-18-yury.norov@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211218212014.1315894-1-yury.norov@gmail.com>
References: <20211218212014.1315894-1-yury.norov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_132113_019744_18B3E6FE 
X-CRM114-Status: GOOD (  14.70  )
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

cpumask and nodemask APIs are thin wrappers around basic bitmap API, and
corresponding files are not formally maintained. This patch adds them to
BITMAP_API section, so that bitmap folks would have closer look at it.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5964e047bc04..ecd41988c871 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3392,10 +3392,14 @@ R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 R:	Rasmus Villemoes <linux@rasmusvillemoes.dk>
 S:	Maintained
 F:	include/linux/bitmap.h
+F:	include/linux/cpumask.h
 F:	include/linux/find.h
+F:	include/linux/nodemask.h
 F:	lib/bitmap.c
+F:	lib/cpumask.c
 F:	lib/find_bit.c
 F:	lib/find_bit_benchmark.c
+F:	lib/nodemask.c
 F:	lib/test_bitmap.c
 F:	tools/include/linux/bitmap.h
 F:	tools/include/linux/find.h
-- 
2.30.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
