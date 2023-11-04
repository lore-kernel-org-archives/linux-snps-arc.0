Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403A9C4332F
	for <linux-snps-arc@archiver.kernel.org>; Sat,  4 Nov 2023 09:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SNjg+j1VVPSQ5vXvRkeBzVIcWBGaL3UotoIQ9nfYhRE=; b=4nMtD9kejxbZXS
	cxOtGbOC7dyJwbIgPX0u6nY0a5Zl+Dq5Iq14t5ffBSE1bg9JVL/R0RvU3iuNQRhBptj4MI79pcgUc
	++G+Y+4NPynffNy1khIbvLwPD1kz8mJitN4T8FPPm6WD9LZ5cZU2vSpjW+a+fEgYXI2xEe/ECZa3x
	/CLcRNCCvaBlxeVeC5fRzsGDtkiJEr2FZu9w+4dldLqGWAZGh89i2DL3CzIJH3vi/wwxlY+klQuuX
	92Q3jcCNrGE/EAz2Qj8wEq87mUe9E30wnKmnpe96XZh7pmnaHv6Jnw4o55B2iYGrtTwN133b41aSz
	Hh+f6FkQnMaEFLEdc+0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzClw-00CxmJ-1d;
	Sat, 04 Nov 2023 09:16:52 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzClt-00CxlP-1h
	for linux-snps-arc@lists.infradead.org;
	Sat, 04 Nov 2023 09:16:50 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1cc68c1fac2so25816945ad.0
        for <linux-snps-arc@lists.infradead.org>; Sat, 04 Nov 2023 02:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1699089408; x=1699694208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u81VqdenU6rFeGWkxk+k7NmV751uBEWgkJJ/j9Mn6BA=;
        b=W5JVk7O58tPFT0HcvDZQ1i9L+xcx+iQm+ftNDSfdMWwxPPbEhe9znssur10nuGpOVv
         A/cnUFuNUGLISwgcpsWjUEs99iznZ9iT+1eRa+gajGtd6t8MsjXdh5kPL1pnf0BT5Pyw
         kntc+HGMjxbJ79AG41FPC+1eTZUTQkX2CnYgjGRWBHefWqX+TDMbK5jKa6B78NlK/Ym1
         4yD6jN8TCt2h7qU8lcPMiM3k4KS3dHmFn/nzliDFS5x0nGd4XW6upx12THyRkcAMBdwt
         zkRIHdUNMXOtogumCqrHvFVqTOhbgD5PjD4/CdV2GXqZv2iduk6nh3dJgGDZEEeCNn7K
         WhGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699089408; x=1699694208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u81VqdenU6rFeGWkxk+k7NmV751uBEWgkJJ/j9Mn6BA=;
        b=CNHDNvUq2WzCflF899Ev2wjyqWEQBfeqph5GLPthHbTxL4oHvYAlnmN+RWumWa55nX
         4CjIdBPo+OjskuS4E6y2SauiFv3dFSycdtWY6p40qODC0sIsFzjHfIJ1RPr8TTbl7raz
         GN+ffMItzVyQus06LSw3dI6coHjD/8EWlSUGPvOHmcsLbyDLDlKD6kPPIS+ucTWQNfmp
         Ni3S9KANARgSnJHk7XMQUMOy933KuHLVKm9XpE1Q6juTE/t4hF6CL1WcjIwBuUBjiodl
         0vAsaWuwFZWzLVAaaLqqasoxNPaYNFYGPhEPdKQCOUB39r8BisKjD4S8cKQJStqN7zpa
         2n+g==
X-Gm-Message-State: AOJu0YzzLMk8Aog6cNK7oGrVyGZ8Q/1Y3xDCzbNaxjApIscfcEieqbWi
	XZBElMvZ9R1P8yaL8yqjKZ7eeA==
X-Google-Smtp-Source: AGHT+IGyFGHSId75XF/2M3hYNYvMSIwS/0Bo7S7DMpr1Hxge/taB1vX6bB3CXc+D3ltngIbF+e1EcA==
X-Received: by 2002:a17:902:ea0d:b0:1cc:4f55:db72 with SMTP id s13-20020a170902ea0d00b001cc4f55db72mr20756805plg.0.1699089408468;
        Sat, 04 Nov 2023 02:16:48 -0700 (PDT)
Received: from devz1.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d4-20020a170903230400b001cc54202429sm2585127plh.288.2023.11.04.02.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 02:16:48 -0700 (PDT)
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
Subject: [PATCH v2 3/4] locking/atomic: openrisc: arch_cmpxchg[64]_local undefined
Date: Sat,  4 Nov 2023 17:16:14 +0800
Message-Id: <20231104091615.4884-4-wuqiang.matt@bytedance.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231104091615.4884-1-wuqiang.matt@bytedance.com>
References: <20231104091615.4884-1-wuqiang.matt@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231104_021649_567048_29F0D999 
X-CRM114-Status: UNSURE (   7.94  )
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

For architectures that support native cmpxchg, we'd like to
implement arch_cmpxchg[64]_local with the native variants of
supported data size. If not, the generci_cmpxchg[64]_local
will be used.

Signed-off-by: wuqiang.matt <wuqiang.matt@bytedance.com>
---
 arch/openrisc/include/asm/cmpxchg.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/openrisc/include/asm/cmpxchg.h b/arch/openrisc/include/asm/cmpxchg.h
index 8ee151c072e4..f1ffe8b6f5ef 100644
--- a/arch/openrisc/include/asm/cmpxchg.h
+++ b/arch/openrisc/include/asm/cmpxchg.h
@@ -139,6 +139,12 @@ static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
 					       (unsigned long)(n),	\
 					       sizeof(*(ptr)));		\
 	})
+#define arch_cmpxchg_local arch_cmpxchg
+
+/* always make arch_cmpxchg64_local available for openrisc */
+#include <asm-generic/cmpxchg-local.h>
+
+#define arch_cmpxchg64_local(ptr, o, n) __generic_cmpxchg64_local((ptr), (o), (n))
 
 /*
  * This function doesn't exist, so you'll get a linker error if
-- 
2.40.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
