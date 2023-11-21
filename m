Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B21C61D92
	for <linux-snps-arc@archiver.kernel.org>; Tue, 21 Nov 2023 14:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RXWHomsMpBW/QCFNI7Vp8hHXaU4E0Dl38aO48EAURho=; b=EhuIdqyyv4BLmL
	WbVkxmoX/8WlBF65wketVACw8icO8p9WsnGmDQrBNuVKMWdaGcCzh0iLEIRzsnx5C1A8sp+G6FOLh
	ifGHwaQXW66thhpgLh8Dxgroaecvak3ssEqipua5ubrSSKNazDwkOgje7Vr8Flf0Qsn9z6jQ3vjkM
	HNubf1IMiPszv31IK4mWaawkI7C292t/+a+Ey3Ub8mfNknJkJTwmjNfY5HPzLPJX829zhu1mx+/Nj
	92G2cOv3OALWVQhEsZDmIhHYzC7O4EZWkGPue04lveZ1mOpKt4xl9Hy2W+IDMQkk88XPKxkUxxZIE
	IdQdMu+KXPy3FFdC8RLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5RgY-00H0rE-1R;
	Tue, 21 Nov 2023 14:25:06 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5RgV-00H0qD-2z
	for linux-snps-arc@lists.infradead.org;
	Tue, 21 Nov 2023 14:25:05 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6c431b91b2aso4860083b3a.1
        for <linux-snps-arc@lists.infradead.org>; Tue, 21 Nov 2023 06:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1700576702; x=1701181502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ma7hrIwqvDM4lCpBvbnn1WZG4yWufWgrZRtOwNFwz5Q=;
        b=DnAvnbE9zLZzSRNBUtAxjjPxFdS+07IKOm1pDaCWgq2oUUlnDIWk2QpWGT8bDnVwWX
         OIm870BB2EOamC/Kp5Iv72lA+hr3d7qWUDlkFCg4iT6WFL3Gv8Mb0HAGKWbv1nFOaT9g
         ww+3XtsRMzORm7TZNi1alk1Pi8d5t6NCR1XmpODesKcWHn/znki5aXLzo8IuV3NSlDxL
         tqjZjJ6yQeG2BmR6/pE/YPvRCEw8436hmcQUP7UZlIVFESN4W7KrHMcUPpLk8kTKvVhx
         Avn2ylNu3inAziMAItYM+rK1mIgtK3zB25HS+4b40xKaDVONXJbPkEEu3iZWpGWz4nES
         VBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700576702; x=1701181502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ma7hrIwqvDM4lCpBvbnn1WZG4yWufWgrZRtOwNFwz5Q=;
        b=tf/E4dKBHFLYsO4YlM7smINpU7XrkcYu53n1pgxte7o2W3c4I79cPXe3s124xRyRYO
         gLyLiC1fwO6S9wUTXPoVTtAg3X3YZxcjLZxDx4Zfvn4WiDik2KB8BYoBmM+XVNsWwqxG
         ub60CqoI7tJnJ/V3188eJDsp18Q182SGQqG1Clkqz5WE6Ww1QqXN7kNAcAGM4jDAa5H4
         IKSaT9YUOW6dciU1wydSaGto+snF3gZu0f0EHLo0a9a5ggLM97i0AoHCblp6UZXs/gJR
         ggH/AB7mifcvaoEbnavEQiuaIf6P1BmSX5MtByXFiSBa3jev1EzwY9B5repOyDRwNNbf
         HeqQ==
X-Gm-Message-State: AOJu0Yw5kTGn0uaR3cC/e6ZLWo8Qpop0y960HyyhZPg6bdVRGVKOQnp9
	1KoiTo4U4KdBkV94G099SvVbpw==
X-Google-Smtp-Source: AGHT+IHISvT3HOK4Q8QdxNY25egV5B1w+H+S5nFIY6gWXptDkpevoMSwLQoow/dwb6Z7gSO9fV5N9w==
X-Received: by 2002:a05:6a00:3923:b0:68e:3eab:9e18 with SMTP id fh35-20020a056a00392300b0068e3eab9e18mr9207536pfb.12.1700576701929;
        Tue, 21 Nov 2023 06:25:01 -0800 (PST)
Received: from devz1.bytedance.net ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id d13-20020a056a00244d00b0068842ebfd10sm7923193pfj.160.2023.11.21.06.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 06:25:01 -0800 (PST)
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
Subject: [PATCH v3 3/5] arch,locking/atomic: openrisc: add arch_cmpxchg[64]_local
Date: Tue, 21 Nov 2023 22:23:45 +0800
Message-Id: <20231121142347.241356-4-wuqiang.matt@bytedance.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231121142347.241356-1-wuqiang.matt@bytedance.com>
References: <20231121142347.241356-1-wuqiang.matt@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_062503_965887_6D1C003C 
X-CRM114-Status: UNSURE (   8.89  )
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

openrisc hasn't arch_cmpxhg_local implemented, which causes
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
