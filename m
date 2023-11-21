Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3903C61D94
	for <linux-snps-arc@archiver.kernel.org>; Tue, 21 Nov 2023 14:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B87sCmmEfeKtxeys8d7tfkFXxFZMe0o6EFlZUb0m5ps=; b=ekQcys6R3PA7/r
	aNYa7piSLW1uC4Zo5sFBci8car48ZR7RN1saVeEU8z+UZhJkbkW1bA7tiAgGKfAHs1r8M/0qVfWev
	gmFrSFPGGQqJP8iMb1J7SwIJXeI2G+zrRe0Di3NIZsBsdvaJRadyFH6XthDk96rcv8aXs7JFUsyuA
	6TXrU1czcv1hz7SVfK90xgRPhPIXy1wq84yg9GegrbdLJmSR0bTr7c6jkI0m9//GiqxUi3TdR2RzN
	eysIpEHDI1eKygtdvNEiKkqNTiTG1lcHnHgzdkmxl+uQhyLLQ92FOnsTQh4dZSN0zzYx+g0CV7hFP
	T77AmavvQ9GxsFqKnbaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5RgI-00H0nm-0T;
	Tue, 21 Nov 2023 14:24:50 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5RgE-00H0ml-36
	for linux-snps-arc@lists.infradead.org;
	Tue, 21 Nov 2023 14:24:48 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6b1d1099a84so5310858b3a.1
        for <linux-snps-arc@lists.infradead.org>; Tue, 21 Nov 2023 06:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1700576685; x=1701181485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQYwJQjKhySUG7SsmpVBnxUpf+Jrz1ajgA6palaWrFM=;
        b=Bri9MOfHy13vPmx+fct15Zgz86SvGyu/WRapcXNJ5ljTmCUyhC8VhoWwEprQKKEwYI
         BQbYi8Hr9RwGnrR6wZODKQ630K04Swd0ClvPM7slIARfQgqGCfOmRij9hnAWz7HH3/nc
         2Q0+QI08qOk6z3Gfs6BT+CkHjQw9HbRc/1D3MgKOr9OWBsg8bFwEdGeHVCnlp1tpq81X
         tro43aLtA90orRRGumf47TcURz9BXM7PIxTq8yWCfJuHNGt1ehghkGwhxytrZLFyt8Uk
         hXXqWric0drNbgyDpMhCEntTqhFWY+RC7EX62RpF+1/c5a+efbGLxojjJzHJWFxcCF2+
         YtVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700576685; x=1701181485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQYwJQjKhySUG7SsmpVBnxUpf+Jrz1ajgA6palaWrFM=;
        b=VS1EoVs4AuYEHK+4IZ2nVM/rCsVJpiO4pJ2IgJbylbtvNI4UTwoHdgKYebjHTeXAZM
         s1oQA3f/sgD7PBneTBSvSEK6oxmMk1aZCLIfXE8C55rYtKu9VVdlR0iHfciBQgfZ5J79
         tWOYmStq1E1ULrEbjbpst+Sgv12rNd/22k42SZGwHlKHOxkTjl/Q6hOmyZjNQjoqW/Sp
         DFOCzkouBCoDqqiWBjTZWvhuEZ/+SLBucMpyihTu39D/wTaVNBSY+xmfPhTMK9ShQ/iK
         0fpuJIvaPWnZo+OLjL0qR3hv8dJ/D8fYnRXGDVPsCPeFwu4xQkOog+JXDTs+6jWVT/lt
         XzLw==
X-Gm-Message-State: AOJu0Yy0qolCBGBS0RA5n/8Ghn1yq4lofe0Kbq7w5qiXhLRWdvgGChEQ
	RrYejZoGLFjZDivSz22z4P0loQ==
X-Google-Smtp-Source: AGHT+IEIjroP416LXBt6XlPHirqpf89r1vmzg9nVdVzS5F8PL+ZcqkvogWm5yXbuGxjX92apejfh4w==
X-Received: by 2002:a05:6a00:80a:b0:6cb:a18b:2182 with SMTP id m10-20020a056a00080a00b006cba18b2182mr8114491pfk.1.1700576685502;
        Tue, 21 Nov 2023 06:24:45 -0800 (PST)
Received: from devz1.bytedance.net ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id d13-20020a056a00244d00b0068842ebfd10sm7923193pfj.160.2023.11.21.06.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 06:24:45 -0800 (PST)
From: "wuqiang.matt" <wuqiang.matt@bytedance.com>
To: ubizjak@gmail.com,
	mark.rutland@arm.com,
	vgupta@kernel.org,
	bcain@quicinc.com,
	jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi,
	shorne@gmail.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	geert@linux-m68k.org,
	andi.shyti@linux.intel.com,
	mingo@kernel.org,
	palmer@rivosinc.com,
	andrzej.hajda@intel.com,
	arnd@arndb.de,
	peterz@infradead.org,
	mhiramat@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	mattwu@163.com,
	linux@roeck-us.net,
	"wuqiang.matt" <wuqiang.matt@bytedance.com>
Subject: [PATCH v3 1/5] arch,locking/atomic: arc: arch_cmpxchg should check data size
Date: Tue, 21 Nov 2023 22:23:43 +0800
Message-Id: <20231121142347.241356-2-wuqiang.matt@bytedance.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231121142347.241356-1-wuqiang.matt@bytedance.com>
References: <20231121142347.241356-1-wuqiang.matt@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_062446_999151_BB23B082 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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

arch_cmpxchg() should check data size rather than pointer size in case
CONFIG_ARC_HAS_LLSC is defined. So rename __cmpxchg to __cmpxchg_32 to
emphasize it's explicit support of 32bit data size with BUILD_BUG_ON()
added to avoid any possible misuses with unsupported data types.

In case CONFIG_ARC_HAS_LLSC is undefined, arch_cmpxchg() uses spinlock
to accomplish SMP-safety, so the BUILD_BUG_ON checking is uncecessary.

v2 -> v3:
  - Patches regrouped and has the improvement for xtensa included
  - Comments refined to address why these changes are needed

v1 -> v2:
  - Try using native cmpxchg variants if avaialble, as Arnd advised

Signed-off-by: wuqiang.matt <wuqiang.matt@bytedance.com>
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 arch/arc/include/asm/cmpxchg.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index e138fde067de..bf46514f6f12 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -18,14 +18,16 @@
  * if (*ptr == @old)
  *      *ptr = @new
  */
-#define __cmpxchg(ptr, old, new)					\
+#define __cmpxchg_32(ptr, old, new)					\
 ({									\
 	__typeof__(*(ptr)) _prev;					\
 									\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 4);				\
+									\
 	__asm__ __volatile__(						\
-	"1:	llock  %0, [%1]	\n"					\
+	"1:	llock  %0, [%1]		\n"				\
 	"	brne   %0, %2, 2f	\n"				\
-	"	scond  %3, [%1]	\n"					\
+	"	scond  %3, [%1]		\n"				\
 	"	bnz     1b		\n"				\
 	"2:				\n"				\
 	: "=&r"(_prev)	/* Early clobber prevent reg reuse */		\
@@ -47,7 +49,7 @@
 									\
 	switch(sizeof((_p_))) {						\
 	case 4:								\
-		_prev_ = __cmpxchg(_p_, _o_, _n_);			\
+		_prev_ = __cmpxchg_32(_p_, _o_, _n_);			\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -65,8 +67,6 @@
 	__typeof__(*(ptr)) _prev_;					\
 	unsigned long __flags;						\
 									\
-	BUILD_BUG_ON(sizeof(_p_) != 4);					\
-									\
 	/*								\
 	 * spin lock/unlock provide the needed smp_mb() before/after	\
 	 */								\
-- 
2.40.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
