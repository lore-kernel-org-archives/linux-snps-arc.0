Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9C9C433EF
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Dec 2021 21:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ycA5VgnqSTESi+v+g/hysFAWpSLPnEZFLCeuVwiZGpY=; b=NCAQhiwmzjp1/S
	+U33AgaEVCi37gX0dEavxsQi4gUiz2XtcqsfOQeRcg8tlVE5Ua1Nfh71XlTNubZ1QtmgzLtIlZYfn
	XCSCvXRPWvREfGERxi3yYzaGwO1zIMUN4BLxhCx8gPQL8CK9kEsecnW9MKfmUwBg1PadJMOHa0vTu
	QD+biQYdwiPsi9Y7TASqEDa2hhXd7z1XjmSXs5aG8ekyHu1Ho9EVqd4HdJWg5SOrb5Y9+KVscjj5m
	kGtuchbX69/1dzxIIpO3G6eD+1+T9KAN36gi/mXQH7n8ayuX1NEZOUcYS3oebVB08E8XItnqOKl6y
	cT/9dGdLs9dIRGJM/FlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myh9N-00Ekgg-Hc; Sat, 18 Dec 2021 21:21:53 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myh8Q-00Ejtp-12; Sat, 18 Dec 2021 21:20:55 +0000
Received: by mail-oo1-xc35.google.com with SMTP id
 w15-20020a4a9d0f000000b002c5cfa80e84so1843914ooj.5; 
 Sat, 18 Dec 2021 13:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8sQyawONQ80DXJHmSDH3px/iwXnd508qWqR9G9S67zc=;
 b=Y7D3jg2nDdCluAFdaTzJ62WKeS2c+dtTaPmJUlV/zLE1aSF//0E3P38R+G4jEFET14
 xlE85wW7isyGuED/jOFVFQvwYzXv8BywpI00ruh0C9/BSkGpvfRpAFWq2F7h9v3+T5Il
 nblHP1zg9vVDXpyvwm44ndVFUUN5IjDhNlidNZbD5SDaUDw8vepg+0zNLqjNDTZ/05Nb
 X9u9YW1l3M1V6kBMEhcffptynzQERZgT84KYgY25ZHoJxBBze+XJLuZ0xAF092dd7tRz
 6Y9FD4MNstMB4NsMQkO+4hI6cQ1T/LuAF9uOZ/g+OPTNQBpwcWpSAFUUj7M8IYKHH6om
 iwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8sQyawONQ80DXJHmSDH3px/iwXnd508qWqR9G9S67zc=;
 b=Zb1iDbf84KxCVp8S3HusOnqaIy+IZDXUiZqwjJQ1B8lXuCCgEb3FScTlG5FNONUtjH
 2OSG8ZiJG+xFnqankgJp6rXoz1t/4EjELtW+VsOVIvrcLKaJW4U5HUtA/znPfLJDBeM0
 3kfK5iKQY3u6FySAm+yUxr61HWPRgHMdPhvakSBiFoZwYfAMBbO6NUSiAV9YQpX2Adsz
 IGN7ic0LvkJLwscPtCQxr+eAozSP8mByxKj2i5D+lIIGGPNXerD9i7Dpqu6/EZtZJuKZ
 hxACnX+abXJE3FXjbxzzuGf9Aoy4n08nJhtp56ijIzguJiY7ncHRtQO6m6Q8k3acq+4I
 NWFA==
X-Gm-Message-State: AOAM53321fxLTAhHSol0n/iyPxuAuXsELOuI3NQpgCoahnAcI9slW8lG
 ckPHsNdjwRkzIIjP7RqVaFo=
X-Google-Smtp-Source: ABdhPJzvMncW7wCzGcCD5Uph699Rv7l1timnKLBDwWV9dbECCxOkiUPt5sqsHR2cKsTF/R/b2ELz2Q==
X-Received: by 2002:a4a:acca:: with SMTP id c10mr5895528oon.1.1639862452856;
 Sat, 18 Dec 2021 13:20:52 -0800 (PST)
Received: from localhost (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id q10sm2488824oiw.17.2021.12.18.13.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 13:20:52 -0800 (PST)
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
Subject: [PATCH 11/17] lib/nodemask: add num_node_state_eq()
Date: Sat, 18 Dec 2021 13:20:07 -0800
Message-Id: <20211218212014.1315894-12-yury.norov@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211218212014.1315894-1-yury.norov@gmail.com>
References: <20211218212014.1315894-1-yury.norov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_132054_226030_EF8F7A07 
X-CRM114-Status: GOOD (  17.13  )
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

Kernel code calls num_node_state() to compare number of nodes with a given
number. The underlying code calls bitmap_weight(), and we can do it more
efficiently with num_node_state_eq because conditional nodes_weight may
stop traversing the nodemask earlier, as soon as condition is met.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 include/linux/nodemask.h | 5 +++++
 mm/page_alloc.c          | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
index 197598e075e9..c5014dbf3cce 100644
--- a/include/linux/nodemask.h
+++ b/include/linux/nodemask.h
@@ -466,6 +466,11 @@ static inline int num_node_state(enum node_states state)
 	return nodes_weight(node_states[state]);
 }
 
+static inline int num_node_state_eq(enum node_states state, int num)
+{
+	return nodes_weight_eq(node_states[state], num);
+}
+
 #define for_each_node_state(__node, __state) \
 	for_each_node_mask((__node), node_states[__state])
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index edfd6c81af82..71f5652828b8 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -8323,7 +8323,7 @@ void __init page_alloc_init(void)
 	int ret;
 
 #ifdef CONFIG_NUMA
-	if (num_node_state(N_MEMORY) == 1)
+	if (num_node_state_eq(N_MEMORY, 1))
 		hashdist = 0;
 #endif
 
-- 
2.30.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
