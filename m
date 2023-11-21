Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A01C61D96
	for <linux-snps-arc@archiver.kernel.org>; Tue, 21 Nov 2023 14:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FM8PcrjNwlieEOQ3loAxysi47V6QUSmgoV31cTJMPLA=; b=n/XlMmtdI182I5
	PGw/A40jSDht64zavYGWzd/aTqz1VvgsgafLwwtK8gHYtfNLo9TM7OpMoZ1JA2ycagO6OMDYV4gpb
	hgr8Z/OETRpL0ljMV6T/5UFodl9SFCcJytZpccrRjluhPGtjWulWcWI47FhSe0XgBM/wRUgjenSoi
	GmAJgCvaIJdikCG07SVoTG6UyKZe16l/U3a6DhweWBZ6P6Ryno4mQhp8MydXWe4QWz8uOFkzVuCkn
	YZaMNBAAAFRaxgzcReUYwFNG1PR9uo7ZZSMRlGd6yKiZ6garb0DPah/KUIfzT/XuSBV9tafWlw5Vu
	30ZNo+nUeQy2jMWDcTPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Rgn-00H0vc-2F;
	Tue, 21 Nov 2023 14:25:21 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Rgl-00H0uC-2Q
	for linux-snps-arc@lists.infradead.org;
	Tue, 21 Nov 2023 14:25:20 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6b5cac99cfdso4864148b3a.2
        for <linux-snps-arc@lists.infradead.org>; Tue, 21 Nov 2023 06:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1700576718; x=1701181518; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IeriZn2HB3faAf90rsoEJC630QNkZ7QDKTlPQoSO5Cg=;
        b=jSx/b6U8PU+zFVs6TIBuZjGGfdMdhBJEzBy/b48q1hxtOA3tF82Z5FbxSV/gc8hjYz
         EwO5CtdWItR3Ooz+QRqlZlTBEALzPt7tjCKRau9PHnYd7fBr5kp2HJFz7L0IR8CzqLA7
         ZyuQ6+6siE6AEnWcROQsGE/PDCA1FgaIOv/9F7LT7eTTttS4cZHfVBezCO95Srogtuqf
         2Et4mdrdXLFDCxeL+vmm/xa4B1Dmfq14DwSPfdJoLKr840qLP00zAu/BWc/9Kn0Pk29x
         W+VoFpZJ2PXrJyt/6uSr4iZsGoDFX988yubkLbzUhuE3DIoBBWNOf74m7BzzWXwbPhkS
         Txpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700576718; x=1701181518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IeriZn2HB3faAf90rsoEJC630QNkZ7QDKTlPQoSO5Cg=;
        b=DYRnazAlabm7svuY5j8FCqpYLqQB08QPvk0fLINAsoUoT37ZZVp4/BL6pSvK+k8wDZ
         W0ooXrhb9yTgoxuNyrFcie0F32rd0ZyOLBxiylIKTWV679a5LzyMlz9vPvsoo/87jnVU
         N0AlZIY9Q8vIq1nXbuMxa6OR6LTWCQ4+cAe55ZT/yK70nuzH2Zz76XC/8rQ6yzm85MRB
         g7Z6KgI86fKJwt3SelEL/PTlTbqkpQCzd1pQJnkhq/o7TUJ437etMto2+ARBK8CkDoC4
         nP3fkg7gqyR42+EtFJGg1VdTXA9LIZUFdnBAmfLSufGpL2z/vVeNVQfrv2VecyZnazU4
         OQ9A==
X-Gm-Message-State: AOJu0Yy0luN7IBwzUTcWk4YulI5W4vjwR1q08vsiUZQPeT2Whf+UgFgn
	077FECosludlyqEB9p9qy3mkXw==
X-Google-Smtp-Source: AGHT+IE9vXr4RgqaSgCijzdvIxGnYYLFWxRa46XZgScWeMammtbE3X5UDSfvdft/8HJ3WbLcZEd/qg==
X-Received: by 2002:a05:6a00:9a1:b0:6cb:8c70:4790 with SMTP id u33-20020a056a0009a100b006cb8c704790mr6739253pfg.1.1700576718381;
        Tue, 21 Nov 2023 06:25:18 -0800 (PST)
Received: from devz1.bytedance.net ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id d13-20020a056a00244d00b0068842ebfd10sm7923193pfj.160.2023.11.21.06.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 06:25:18 -0800 (PST)
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
Subject: [PATCH v3 5/5] arch,locking/atomic: xtensa: define arch_cmpxchg_local as __cmpxchg_local
Date: Tue, 21 Nov 2023 22:23:47 +0800
Message-Id: <20231121142347.241356-6-wuqiang.matt@bytedance.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231121142347.241356-1-wuqiang.matt@bytedance.com>
References: <20231121142347.241356-1-wuqiang.matt@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_062519_796604_DE71F2EA 
X-CRM114-Status: UNSURE (   9.35  )
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

The xtensa architecture already has __cmpxchg_local defined but not used.
The purpose of __cmpxchg_local() is solely for arch_cmpxchg_local(), just
as the definition of arch_cmpxchg_local() for other architectures like x86,
arm and powerpc.

Signed-off-by: wuqiang.matt <wuqiang.matt@bytedance.com>
---
 arch/xtensa/include/asm/cmpxchg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/xtensa/include/asm/cmpxchg.h b/arch/xtensa/include/asm/cmpxchg.h
index 675a11ea8de7..956c9925df1c 100644
--- a/arch/xtensa/include/asm/cmpxchg.h
+++ b/arch/xtensa/include/asm/cmpxchg.h
@@ -108,7 +108,7 @@ static inline unsigned long __cmpxchg_local(volatile void *ptr,
  * them available.
  */
 #define arch_cmpxchg_local(ptr, o, n)				  	       \
-	((__typeof__(*(ptr)))__generic_cmpxchg_local((ptr), (unsigned long)(o),\
+	((__typeof__(*(ptr)))__cmpxchg_local((ptr), (unsigned long)(o),        \
 			(unsigned long)(n), sizeof(*(ptr))))
 #define arch_cmpxchg64_local(ptr, o, n) __generic_cmpxchg64_local((ptr), (o), (n))
 #define arch_cmpxchg64(ptr, o, n)    arch_cmpxchg64_local((ptr), (o), (n))
-- 
2.40.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
