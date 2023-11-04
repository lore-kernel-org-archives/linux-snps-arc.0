Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B474C4167D
	for <linux-snps-arc@archiver.kernel.org>; Sat,  4 Nov 2023 09:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nw4P5Vo653Xp6oDiCA+R24gqKb+1nPeosqQivFqGrA8=; b=w4QVTPAsMnyHuW
	M7LK4rrD2G1wi/QLtN0zDwrWqzWGCjO5E/Ioc76uhDI2i4xPfVbPy76SU47OKzRwRn0cf4b0RDwun
	PtQc1nx4fZFjNGzVTJRiNEgu35UsuwZW8imZnATMhg6oy6fpDNwJuaSQyfNoYi7EFvnK4UPRUhK38
	QLx7gEIK1kYrtDpseBppnFF7LqqPiWQL/IyxLtga/jAOK+JS22UdFckzWllbW2V6Sb5oANE9izaDD
	77FjVxBy6oLgMftA9Tki/BMHHeQNpCYhENluggFUM2o8Inhkf/d1ljP2zyd3ZBLe7Ewa2k/qHKf5u
	tOb/AF+kdUMSGo/hQl7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzCm2-00Cxna-3D;
	Sat, 04 Nov 2023 09:16:58 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzCm0-00Cxmr-0o
	for linux-snps-arc@lists.infradead.org;
	Sat, 04 Nov 2023 09:16:57 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1c9b7c234a7so25799975ad.3
        for <linux-snps-arc@lists.infradead.org>; Sat, 04 Nov 2023 02:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1699089416; x=1699694216; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ca5+RMX27tK8Pble5rnmjXYY/wcc9M5C/f3DXh2ZNs0=;
        b=bGELYESDUEvUpa/1ePGawapvOaCmx2sIuqhrnKQ9Rf81uLJquHih/l5sb+6AMFGJxh
         ClwumOHTbWmZYLiOftIVd/no2xuDp9jvVN21gaZOIQwgnoGM/nXKpvSNJpUStDp+GmV+
         +9BlP0dSuXkmKHQZrxe2HoBmrWPl8Iid1QTxpXqudDqEubg3jGB0AquXnOaZaPkOmGg8
         5YnC+Tcm8UPpEXXVl3yFPn/DCjbs3sOWM0APILCYzL3o5DYhoTuchdjKezb62MXUcVnH
         PfLfPxdQ5TO4S398PtxRkDhJZEAnlALlXivfFNCPeJf2qD3he77yWvu+PIccq+C5WAwh
         WzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699089416; x=1699694216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ca5+RMX27tK8Pble5rnmjXYY/wcc9M5C/f3DXh2ZNs0=;
        b=R6CPWjW2PjIT8tY3iMHBneBihlEhFJ7uNHlrTi0O4WR9moMg6jPmy1l6FuE7B0S+c4
         0P9zrRD/WrYyg8n5BkK70uk3yI3uvzHFYEVMLy4fmUf68Di7olZjedhEH+mrVoGobEWC
         C+21i8oKPnKkYi933Zk1FPAte2QiAhi0zgVsvlJ9h4DoNDkgBkJ88eHAw481XyotJEoZ
         8+TI432KleYVazUpwhwxQY0TpSnzsj4a6iNjXBPqEAEGCjH2c3RiCV5sWIq6NVag+6y5
         iJ7uDAIdhdDxiKT1dvvpBxue0uAPJWULjY04HcGmHhZK15X9MbshQWOAVA2BdVwjGU9A
         e7cQ==
X-Gm-Message-State: AOJu0Yz4NJoBrBH7Qn1z6/FuIucrEVI69c1XbAchiKuqJuemOqTwaUE7
	lj8ODMYcLjHGRYvXlMHRowQrPQ==
X-Google-Smtp-Source: AGHT+IHU3BXym51NNkU7o64tWd3Rm0m4CMV06Kghzo1NlAS/cJ7uQGkFro/CIvwdK6Bs6cg+zccvjA==
X-Received: by 2002:a17:902:e88f:b0:1cc:5b5a:62a5 with SMTP id w15-20020a170902e88f00b001cc5b5a62a5mr18228857plg.9.1699089415812;
        Sat, 04 Nov 2023 02:16:55 -0700 (PDT)
Received: from devz1.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d4-20020a170903230400b001cc54202429sm2585127plh.288.2023.11.04.02.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 02:16:55 -0700 (PDT)
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
	"wuqiang.matt" <wuqiang.matt@bytedance.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2 4/4] locking/atomic: hexagon: arch_cmpxchg[64]_local undefined
Date: Sat,  4 Nov 2023 17:16:15 +0800
Message-Id: <20231104091615.4884-5-wuqiang.matt@bytedance.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231104091615.4884-1-wuqiang.matt@bytedance.com>
References: <20231104091615.4884-1-wuqiang.matt@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231104_021656_288854_C03BE51E 
X-CRM114-Status: GOOD (  10.67  )
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

For architectures that support native cmpxchg, we'd like to
implement arch_cmpxchg[64]_local with the native variants of
supported data size. If not, the generci_cmpxchg[64]_local
will be used.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202310272207.tLPflya4-lkp@intel.com/

Signed-off-by: wuqiang.matt <wuqiang.matt@bytedance.com>
---
 arch/hexagon/include/asm/cmpxchg.h | 51 +++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/arch/hexagon/include/asm/cmpxchg.h b/arch/hexagon/include/asm/cmpxchg.h
index bf6cf5579cf4..2b5e5bbaf807 100644
--- a/arch/hexagon/include/asm/cmpxchg.h
+++ b/arch/hexagon/include/asm/cmpxchg.h
@@ -8,6 +8,8 @@
 #ifndef _ASM_CMPXCHG_H
 #define _ASM_CMPXCHG_H
 
+#include <linux/build_bug.h>
+
 /*
  * __arch_xchg - atomically exchange a register and a memory location
  * @x: value to swap
@@ -51,13 +53,15 @@ __arch_xchg(unsigned long x, volatile void *ptr, int size)
  *  variable casting.
  */
 
-#define arch_cmpxchg(ptr, old, new)				\
+#define __cmpxchg_32(ptr, old, new)				\
 ({								\
 	__typeof__(ptr) __ptr = (ptr);				\
 	__typeof__(*(ptr)) __old = (old);			\
 	__typeof__(*(ptr)) __new = (new);			\
 	__typeof__(*(ptr)) __oldval = 0;			\
 								\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 4);			\
+								\
 	asm volatile(						\
 		"1:	%0 = memw_locked(%1);\n"		\
 		"	{ P0 = cmp.eq(%0,%2);\n"		\
@@ -72,4 +76,49 @@ __arch_xchg(unsigned long x, volatile void *ptr, int size)
 	__oldval;						\
 })
 
+#define __cmpxchg(ptr, old, val, size)				\
+({								\
+	__typeof__(*(ptr)) oldval;				\
+								\
+	switch (size) {						\
+	case 4:							\
+		oldval = __cmpxchg_32(ptr, old, val);		\
+		break;						\
+	default:						\
+		BUILD_BUG();					\
+		oldval = val;					\
+		break;						\
+	}							\
+								\
+	oldval;							\
+})
+
+#define arch_cmpxchg(ptr, o, n)	__cmpxchg((ptr), (o), (n), sizeof(*(ptr)))
+
+/*
+ * always make arch_cmpxchg[64]_local available, native cmpxchg
+ * will be used if available, then generic_cmpxchg[64]_local
+ */
+#include <asm-generic/cmpxchg-local.h>
+
+#define arch_cmpxchg_local(ptr, old, val)			\
+({								\
+	__typeof__(*(ptr)) retval;				\
+	int size = sizeof(*(ptr));				\
+								\
+	switch (size) {						\
+	case 4:							\
+		retval = __cmpxchg_32(ptr, old, val);		\
+		break;						\
+	default:						\
+		retval = __generic_cmpxchg_local(ptr, old,	\
+						 val, size);	\
+		break;						\
+	}							\
+								\
+	retval;							\
+})
+
+#define arch_cmpxchg64_local(ptr, o, n) __generic_cmpxchg64_local((ptr), (o), (n))
+
 #endif /* _ASM_CMPXCHG_H */
-- 
2.40.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
