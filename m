Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561BAC433F5
	for <linux-snps-arc@archiver.kernel.org>; Sun, 28 Nov 2021 03:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QEW7YxgfzFy7QjpEVhFTirX2uO62nSb2cG2Yn2VRcMA=; b=4Ed7BOYsDeKZSl
	lNjmI536CFFVoxKnuOCSf9fha1m5pG1CPtFsmGNCogtsDrYy+++9MH9a7rqT9a4IbSF0zCs6rS9oM
	O3fpbG4h4J9VHVOJhFDYrGagsOEuwKs7JDoPxXzF88DIAjWE9SEjzQcYAyBM0KYJcYMcxNaWhZwXR
	C3DTLTiV/Ke0tK0BR7+f4N5IVvfcHTWHOJhrPDAeKILemBKGCiYzbY3+NlSU29zy/pk838uEUvDxX
	baueysydiNc5luJVok2B01Xp42tIQTNWXLccgt/VeH0nsSV4jDTxGRPeyvVyHEoa+wg+yF6RzepUk
	Uh/vbtPRXtJJF8pjuS7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrBJa-00ExaD-Tn; Sun, 28 Nov 2021 03:57:22 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrBJP-00ExRW-MG; Sun, 28 Nov 2021 03:57:14 +0000
Received: by mail-qt1-x82d.google.com with SMTP id z9so12897969qtj.9;
 Sat, 27 Nov 2021 19:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YFV+i9qtOAvvG/eHCEjEWYh2+rKTUYToGFh2vpYai2U=;
 b=chiNDciN+mw9g7Ak1NHLuh8JPanlDYqkr1Pqo9eXdqgWZ0s7k4fLNVOVPgZUy6fkjm
 kaMyVzCokAqk119GQ8bzMKTD05UnC2FTd2NOgUZAuBVJtU7OP6dPqa5dQADPwgyWsto1
 Qv1eYll6UW8OHMmGkZcKU7HQROuuQpM5PrHzE0PCqYInI5DE0pZxTqf6wqpbepCFwaYA
 7371+oA9ttpW8PTeiT4qmfRXFL7wexA7P+pfduuTdwQnWhGwAzwYwRUFFxeLfik+qWvy
 kjSjMD+0Dx+qa8H1ARTwTRP8Y3AdRV2VBfJsjVegnLilYyAezvNXn/8F0Y7/ZQsYb6VK
 yFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YFV+i9qtOAvvG/eHCEjEWYh2+rKTUYToGFh2vpYai2U=;
 b=rAQffGz5SYg4Ck4Pc40YYkYbKpp9wAtjdeg9M+J/oHw8/yXGGNr9jmOwuTbPWDR4Rv
 ssxR1s4ffoESMk2QebuBwuIF7Z+ebkUZBs3mqJF9plauHCONB/JdUoZBWhpaPM2MMbqb
 eQGjUMwASgZtVRL4cByMIC5NSEqvL2xsTHbZbrHcb6KTmioEEmsUFmoIpShWyCfgHHiI
 PCFhqIO3XjirHTRpzrOCumDpWDWv7x6j/nxnmgVuCM3o41NHz5fYY9QVC7hPZrhUNHYL
 fporlDOH1bjeaNHEE6OMsqaN57JxxfAYAhIv2rKAJ1ru2K7DBhfjyap8auHbdnRIYrNL
 fMkQ==
X-Gm-Message-State: AOAM533yQps8uVnjbVm+66XQEQiEiN6kHfHYMNb5RuasXme3aBrVmxoX
 9pRkZFyBIKhDMnIvOHl1NHw=
X-Google-Smtp-Source: ABdhPJx6di3732tCAyUxsq9O1g2QIq9JweBndJPZX/iKhmJAAwkV4ErxZy2apf/gFLKoKAQwTFkjag==
X-Received: by 2002:a05:622a:1191:: with SMTP id
 m17mr26072570qtk.595.1638071830496; 
 Sat, 27 Nov 2021 19:57:10 -0800 (PST)
Received: from localhost ([66.216.211.25])
 by smtp.gmail.com with ESMTPSA id h19sm6555265qth.63.2021.11.27.19.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 19:57:10 -0800 (PST)
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
Subject: [PATCH 2/9] lib/bitmap: implement bitmap_{empty,
 full} with bitmap_weight_eq()
Date: Sat, 27 Nov 2021 19:56:57 -0800
Message-Id: <20211128035704.270739-3-yury.norov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211128035704.270739-1-yury.norov@gmail.com>
References: <20211128035704.270739-1-yury.norov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211127_195711_802365_E6789D10 
X-CRM114-Status: GOOD (  13.74  )
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

Now as we have bitmap_weight_eq(), switch bitmap_full() and
bitmap_empty() to using it.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 include/linux/bitmap.h | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index 996041f771c8..2d951e4dc814 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -386,22 +386,6 @@ static inline int bitmap_subset(const unsigned long *src1,
 		return __bitmap_subset(src1, src2, nbits);
 }
 
-static inline bool bitmap_empty(const unsigned long *src, unsigned nbits)
-{
-	if (small_const_nbits(nbits))
-		return ! (*src & BITMAP_LAST_WORD_MASK(nbits));
-
-	return find_first_bit(src, nbits) == nbits;
-}
-
-static inline bool bitmap_full(const unsigned long *src, unsigned int nbits)
-{
-	if (small_const_nbits(nbits))
-		return ! (~(*src) & BITMAP_LAST_WORD_MASK(nbits));
-
-	return find_first_zero_bit(src, nbits) == nbits;
-}
-
 static __always_inline int bitmap_weight(const unsigned long *src, unsigned int nbits)
 {
 	if (small_const_nbits(nbits))
@@ -436,6 +420,16 @@ static __always_inline bool bitmap_weight_le(const unsigned long *src,
 	return __bitmap_weight_le(src, nbits, num);
 }
 
+static __always_inline bool bitmap_empty(const unsigned long *src, unsigned int nbits)
+{
+	return bitmap_weight_eq(src, nbits, 0);
+}
+
+static __always_inline bool bitmap_full(const unsigned long *src, unsigned int nbits)
+{
+	return bitmap_weight_eq(src, nbits, nbits);
+}
+
 static __always_inline void bitmap_set(unsigned long *map, unsigned int start,
 		unsigned int nbits)
 {
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
