Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D23C433F5
	for <linux-snps-arc@archiver.kernel.org>; Sun, 28 Nov 2021 03:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JiTLd0sgyORU+gVjc8oUsYhSxzUq4dluZBgsrF9zJvk=; b=RO8s+aPF7NHA9e
	55ODyUHl2uZG06ZrgBqmIVfLSfky5DRsMJAeB+QbAxPI5rgpFrhdPFQ0w+gbEWBhQIazjtaTYDAzV
	5rCZHInSNWmkalGxOXy1KiYv8VTICJ4EkNQAYHYkhUS5L3/Qzm5l+WstDbdVCMen7dgrsd1NucCmQ
	24pZXt4m++QjD2d8Dq4nlWpDJwpgZSjzPuDD9y/V2J/7fOETQN8i2oSNk7MB1W6+FY3jynP1lK4Zx
	DWiaRX/QDhXozUnKtl6+/4ceAAbY8X+Xq8vUA5IUoDFy3RrASdXUO7D+7O5IlUSMSkcWgEV3jOdpd
	iRMZYKjgmNc3dkAUi4yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrBK7-00Exyg-Hp; Sun, 28 Nov 2021 03:57:55 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrBJb-00ExbZ-TZ; Sun, 28 Nov 2021 03:57:31 +0000
Received: by mail-qt1-x835.google.com with SMTP id t34so12906804qtc.7;
 Sat, 27 Nov 2021 19:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=233QcxxJpVsvwdAL71A0o6E8P9a0fPiFh3UgjrFlGJ0=;
 b=KkNq74uLi6kOf8pEr8DG98/abjM7uLh7+GECvfSeLoEuajiH9DIy0sW44xrjIjypLN
 8Mv9T5QuV1fbsS/shbnr41T65dYJVBAFqsEEBUaXUGRnJGCi0sM//bSWwuEuBQr+tIS2
 3wceXjtFBHV5eP+FK911ZtcoYOP9pkOQJm8mVkPx3ngUMkuxLtUBTErX/VOaKFj6rA5D
 KfQvE2oEDagWRfZWA4DNs+F/Ue4NQgP4MieHvaOOyyCO7gUq0fWrFpqxLzsVuRSYXAhx
 VbLwESubwEwWJOqwh9/LzV9ZaLM2tajrvj0OKk6cYIU1mArvG8SMDlNXs8NU8IlQAOjA
 Dg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=233QcxxJpVsvwdAL71A0o6E8P9a0fPiFh3UgjrFlGJ0=;
 b=ZJFwk5W8ysoKAKnts7h/V6nBtZV9DLcb7ynPjolywa1tIarv8MpmhJ46IPsyX3qu3v
 rFPBIdv1E1RCSJ/ZWRmrCNIjVfoua2Zvbg1Z9arziunxhib4ZCSdncmhG60ekDFmsW0w
 rRDCLiX5dWLz8Iz6vCw5agpSeBBtSiaxs8+3ceMM1mvObBD3fUv+Hxm/NuQsrJ116RdU
 oX/Vokq/lTD5bHAW9n5M8P37a0Dv3OTzU0imzhptJyodYAp90JsSOEVQPdDOP869/Bb6
 +aFsPd1dD2+QEfFLPajlp44MSu3uH4va8K0LJVFOZFuRduZHx7MMJvcEVQQoj/3Y/cDn
 CbxA==
X-Gm-Message-State: AOAM5303DnlhJbDmuVJLLK15WdxsK3fRLUn17r/zCViKdr2WmbD1Sz4f
 QK/9g5UW8GSD+w7XtZ+HsIU=
X-Google-Smtp-Source: ABdhPJxsQdnJHvssLKKi4t7ZQWlUj6IfBjUA+FHPAg6cyFpRPgTUM5nkSD/z388U9c3QtVTPq7Zptw==
X-Received: by 2002:a05:622a:2d0:: with SMTP id
 a16mr26433334qtx.520.1638071843082; 
 Sat, 27 Nov 2021 19:57:23 -0800 (PST)
Received: from localhost ([66.216.211.25])
 by smtp.gmail.com with ESMTPSA id x25sm4914036qkf.91.2021.11.27.19.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 19:57:22 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
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
 Dennis Zhou <dennis@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geetha sowjanya <gakula@marvell.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guo Ren <guoren@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Ian Rogers <irogers@google.com>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, Jens Axboe <axboe@fb.com>,
 Jiri Olsa <jolsa@redhat.com>, Jonathan Cameron <jic23@kernel.org>,
 Juri Lelli <juri.lelli@redhat.com>, Kalle Valo <kvalo@codeaurora.org>,
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
 Roy Pledge <Roy.Pledge@nxp.com>, Russell King <linux@armlinux.org.uk>,
 Saeed Mahameed <saeedm@nvidia.com>, Sagi Grimberg <sagi@grimberg.me>,
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
Subject: [PATCH 9/9] MAINTAINERS: add cpumask and nodemask files to BITMAP_API
Date: Sat, 27 Nov 2021 19:57:04 -0800
Message-Id: <20211128035704.270739-10-yury.norov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211128035704.270739-1-yury.norov@gmail.com>
References: <20211128035704.270739-1-yury.norov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211127_195724_033788_C68E16E2 
X-CRM114-Status: GOOD (  14.78  )
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
index 00ad0cb5cb05..ceeffcd81fa4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3375,10 +3375,14 @@ R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
