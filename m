Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58E0C4167D
	for <linux-snps-arc@archiver.kernel.org>; Sat,  4 Nov 2023 09:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GvIl7gOmW/S/Yv2LQvKRmifo71pP49eJ1N0bjkv96z8=; b=UJ8fOepbl+LK8o
	ZtXgUjBP/KfGdAh8t4EU77ZVRAXxyfU4WMnZsIoe6d65o/+jAjcfT+w5mNK8WeH/qKeTLYsJODxgo
	CkWxfnPeaX6XmgJCbeQYvouJIA94R1JqgyEvroFs0ZffgVRIb5z08GP4XiUaVPMOOHF+AcByt5bTv
	3OOflXVRsi7FVgD3oSExUTINI5K+e7V+LIQxvDxI3Zv3a8NTdAWtxuI1dc6OXAyzQt6cwG3G0SjSV
	zbiT3REKo1tVKjH9P+n1FmyNy9fsYKiqY0e+MVtdjbbKf5O3U+x5pZFhriUpu0VQDYHYHfLeAWfTX
	K5nHgd+3CsPtZXJUbmHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzClj-00Cxjk-0w;
	Sat, 04 Nov 2023 09:16:39 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzClg-00CxjC-0g
	for linux-snps-arc@lists.infradead.org;
	Sat, 04 Nov 2023 09:16:37 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-778a20df8c3so185416985a.3
        for <linux-snps-arc@lists.infradead.org>; Sat, 04 Nov 2023 02:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1699089394; x=1699694194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZsOGiaArG1gPfWJWYyqQWKmeMDqaJOsSKH43M0pjNo=;
        b=X8+WHlVfknko0ZDd26vq3PhvW7lRRjtdE5hs8az9T7vIXnJlmYUV0Eyqc4mRF7ubPq
         bvNKcVavXwMK7xXSgoB7U+91SWnLj4qI2WMaTyvY1D5XKeGQLeyQieQt0rfBcQy4Gri4
         EX6RPPyZFnhAVZ2yeBoE3wHJHDc92+KUuvS0ipdxN36nTg7WQk8tOn4QKep/8gPWNf6C
         lo6+gAp8ZdV0NmwPN31rDfXcc+aK3s6Su/YztwxbD8OUi5wyArZKyXMU/hXBcVKqgVU/
         +dU2xWlL7AT2jWIRYNwhiUg/gPmZQe3HoHVgecQ2kuvSteU5r5+IO79s51oPYbkjgKlp
         fBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699089394; x=1699694194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZsOGiaArG1gPfWJWYyqQWKmeMDqaJOsSKH43M0pjNo=;
        b=CCJKQfeAnqAdTQ2A7OqeE2XHuLKwRYkwYs8bWnPF5LMq+xEykGBV3lcnarcXq6OSq5
         PfPEk1tcsO4sH9epSZBfk4hP0B1hcEylLScOLI54DEhytSVA+83jdZPIYrGgScU9ynUz
         LU2mZ5bfD9B7f5g7Hnk78ekecRMFXwc6lpA4S069dsctMquW2YEppbnzyu+xZNa0JUMJ
         6IOr6+cmiN8wh2Ax0SsdTPcPrJ1nytG/urfPcxjlSEfw70RRwKsluhKoICraTZFfxLLF
         OvIT9tThcr+1C75d+D005vsyRafYphHKX5inSJQOMhXqD/aUKsIYfYmIKxxMSiIM3/vk
         Qs6A==
X-Gm-Message-State: AOJu0YzfDkIIFioF1waQTdp4fJ5MitxsmaivtWVoGnaHn5VClumnrwrR
	Q4DMghmphPWl4TdEjsEoK1CHzQ==
X-Google-Smtp-Source: AGHT+IGjAYKMZlAfEP3ECe1n3sw6IIECunrstOALu+CAcSUP9EdkfONAQy3WGvW0OrN94BxZJnCbWg==
X-Received: by 2002:a05:620a:2588:b0:777:2767:6465 with SMTP id x8-20020a05620a258800b0077727676465mr27504451qko.40.1699089394700;
        Sat, 04 Nov 2023 02:16:34 -0700 (PDT)
Received: from devz1.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d4-20020a170903230400b001cc54202429sm2585127plh.288.2023.11.04.02.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 02:16:34 -0700 (PDT)
From: "wuqiang.matt" <wuqiang.matt@bytedance.com>
To: vgupta@kernel.org,
	bcain@quicinc.com,
	jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi,
	shorne@gmail.com,
	geert@linux-m68k.org,
	andi.shyti@linux.intel.com,
	mingo@kernel.org,
	palmer@rivosinc.com,
	andrzej.hajda@intel.com,
	arnd@arndb.de,
	peterz@infradead.orgm,
	mhiramat@kernel.org
Cc: linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	mattwu@163.com,
	linux@roeck-us.ne,
	"wuqiang.matt" <wuqiang.matt@bytedance.com>
Subject: [PATCH v2 1/4] locking/atomic: arc: data size checking in arch_cmpxchg
Date: Sat,  4 Nov 2023 17:16:12 +0800
Message-Id: <20231104091615.4884-2-wuqiang.matt@bytedance.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231104091615.4884-1-wuqiang.matt@bytedance.com>
References: <20231104091615.4884-1-wuqiang.matt@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231104_021636_296562_DFB263E7 
X-CRM114-Status: UNSURE (   9.02  )
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

Macro __cmpxchg() renamed to __cmpxchg_32() to emphasize it's explicit
support of 32bit data size, BUILD_BUG_ON() added to avoid any possible
misuses with unsupported data types.

In case CONFIG_ARC_HAS_LLSC is undefined, arch_cmpxchg() uses spinlock
to accomplish SMP-safety, so the BUILD_BUG_ON checking is uncecessary.

Signed-off-by: wuqiang.matt <wuqiang.matt@bytedance.com>
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
