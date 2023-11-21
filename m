Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4006AC61D92
	for <linux-snps-arc@archiver.kernel.org>; Tue, 21 Nov 2023 14:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iEj3gTHtLZxutqdZh4ZK0PULNqtyhK99iiplPL4mweM=; b=zf2e9a3wzq3HgZ
	Df85W/zRqgiknArW6SohVioSjUd945zIb+7AhFOvUQfWMKz9uq+Tzpa5HXQKY0eGaj6g76etYRsyC
	A9zRDxTALNYE8xGeIfwqyBxHFVDcbLlzTa6fS9CcmUx9OiD9ufU6elaHeP0MzoGj8G1OPUUh1wyKs
	pIueZEwCyPze38KTWJP7pm+lmzzWLF40mRyHCngn5kmz2Eccl0Av07K4fBU5SUIlqRb34+9D7VFuS
	v1BdORlpHx5wUuXNzz6olsfrVFAnQfVgtOu+psSnxTCVBofXwqZt0mp1zmXKn49bqPR7VGSdcjaV8
	QVMjRu4rDJ4kN5xXk76Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5RgO-00H0pA-21;
	Tue, 21 Nov 2023 14:24:56 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5RgM-00H0oO-0u
	for linux-snps-arc@lists.infradead.org;
	Tue, 21 Nov 2023 14:24:55 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6cb66fbc63dso1968472b3a.0
        for <linux-snps-arc@lists.infradead.org>; Tue, 21 Nov 2023 06:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1700576694; x=1701181494; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQzQ3hctuM1DrYXT+jmSwlcI1w3CAnf53zL9eOZco7c=;
        b=iSCJwT6yEmLvc5l3ZvZ3avCX1HuqfNBkHNEcjrlswfJWt/KKOzHVJ092krR7pwhOR7
         OflVM9KYdRa50klNZU0+nFldgicBfeCwtKpCoLrtUL2y0sRxK8qTKYmZqsUq+A747aug
         qynX5bu1CYuC2e5bYpVsaH/o2UIC8rQ5Oj1L4Nw+3Fku+QVd1R9gPbfzQZUTtdggAJVQ
         MDc0rI/tpDoNaUn5GYUmOuLt53UtA7fEedr5LnRD3Llpvu4BncHgllpEegVvuckBQs3r
         il+s4+wWEPU2fKDmXM2FHL1Nc/Ur27L3GyCDxdUuaP9YEbCNd3P4i323kTtoMXPGnSy7
         B0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700576694; x=1701181494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQzQ3hctuM1DrYXT+jmSwlcI1w3CAnf53zL9eOZco7c=;
        b=VtBRGPMGkdvvm1eMAFvMe3+41YwPrW0EsV8ZvNEGCrFwbNrO8JxMo5wlNhILETvl0w
         XTNAy1Sd8Hy30uIue3ry0ADsdMe5yd1xgiWT+cJJeYbeRqLD0YDUucNzhKN12my0Ohx/
         hyuWrON5dnDE63B8yVGBZxkVcsP+KCS4a7yXyN1OmyGXtEG2G/Igw90UiRiKktTbgbJH
         7HEXCrDnYn/tAOEdl+ka4ap7eB+s55N41Rkwga/oSZ9oDkSfHT/yk3fb+7gh7+khXzfu
         F9Ok2W/J/R9Qpq5mws/316ie55ez5llx0xbgU7j0u8FlMgAyTq6eH0l4PXD3GVu4z4d6
         h/5A==
X-Gm-Message-State: AOJu0YyClaO6b7LQb4XrENoJ0aUWE+uOfsEAGmW8rcqAE5lhOIfp21wL
	Iu6VYMuUgPv4tz2xpHH8AN70aw==
X-Google-Smtp-Source: AGHT+IHbYu2jqbF7t8/wu/0pojkQUebMfIzAqIQeTS1oR0oKU5ESn/XV9iR5u5ULhgBjAJ/tpgr/hw==
X-Received: by 2002:a05:6a00:228f:b0:6cb:8abd:39b5 with SMTP id f15-20020a056a00228f00b006cb8abd39b5mr4000172pfe.1.1700576693727;
        Tue, 21 Nov 2023 06:24:53 -0800 (PST)
Received: from devz1.bytedance.net ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id d13-20020a056a00244d00b0068842ebfd10sm7923193pfj.160.2023.11.21.06.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 06:24:53 -0800 (PST)
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
	"wuqiang.matt" <wuqiang.matt@bytedance.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3 2/5] arch,locking/atomic: arc: add arch_cmpxchg[64]_local
Date: Tue, 21 Nov 2023 22:23:44 +0800
Message-Id: <20231121142347.241356-3-wuqiang.matt@bytedance.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231121142347.241356-1-wuqiang.matt@bytedance.com>
References: <20231121142347.241356-1-wuqiang.matt@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_062454_316457_EA89D9F7 
X-CRM114-Status: GOOD (  10.41  )
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

arc doesn't have arch_cmpxhg_local implemented, which causes
building failures for any references of try_cmpxchg_local,
reported by the kernel test robot.

This patch implements arch_cmpxchg[64]_local with the native
cmpxchg variant if the corresponding data size is supported,
otherwise generci_cmpxchg[64]_local is to be used.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202310272207.tLPflya4-lkp@intel.com/

Signed-off-by: wuqiang.matt <wuqiang.matt@bytedance.com>
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 arch/arc/include/asm/cmpxchg.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index bf46514f6f12..91429f2350df 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -80,6 +80,34 @@
 
 #endif
 
+/*
+ * always make arch_cmpxchg[64]_local available, native cmpxchg
+ * will be used if available, then generic_cmpxchg[64]_local
+ */
+#include <asm-generic/cmpxchg-local.h>
+static inline unsigned long __cmpxchg_local(volatile void *ptr,
+				      unsigned long old,
+				      unsigned long new, int size)
+{
+	switch (size) {
+#ifdef CONFIG_ARC_HAS_LLSC
+	case 4:
+		return __cmpxchg_32((int32_t *)ptr, old, new);
+#endif
+	default:
+		return __generic_cmpxchg_local(ptr, old, new, size);
+	}
+
+	return old;
+}
+#define arch_cmpxchg_local(ptr, o, n) ({				\
+	(__typeof__(*ptr))__cmpxchg_local((ptr),			\
+					(unsigned long)(o),		\
+					(unsigned long)(n),		\
+					sizeof(*(ptr)));		\
+})
+#define arch_cmpxchg64_local(ptr, o, n) __generic_cmpxchg64_local((ptr), (o), (n))
+
 /*
  * xchg
  */
-- 
2.40.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
