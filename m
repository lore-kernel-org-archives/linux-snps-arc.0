Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E97C77B75
	for <linux-snps-arc@archiver.kernel.org>; Tue, 23 May 2023 14:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f4ufsj5FOyA/Fv1jLVAaLysvuYzYKyRPPVquoTl1MfA=; b=tvn/trZiD4MzU7
	02knkGBxrqNHbbVDwkXy2tyQ0VX9BuYTYZNgUtr3/Wl4jrl4pYlxuycE9iJUcX2cCoL/lb81tZRlG
	q4V8ilSJpttHV6LpffzMm40gIYtg5ayo1Zh+8FRpDUJ8awd3MZyqN7QHVTlVB7kHFEyVtdDtkfz2o
	V+p2iMLnbvMA8khzO9m/ik2mRRMyYlilkC5Ok3GA278JJ7ZMpY9bPdLlnw5DV/S4lFkGl+xPjGXog
	Jx1AdZlpTjR1ezWVARIuKxbPKXMWLCSj2lICKrOynCkLdOW3QrNPIGuWnQh1mOOqujLOOCDQGCPox
	XY4q2LKrpFnUaGLOVrRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1TDa-00AWsb-0Z;
	Tue, 23 May 2023 14:42:30 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1TDY-00AWqr-0F
	for linux-snps-arc@bombadil.infradead.org;
	Tue, 23 May 2023 14:42:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=XXvb5TDUzvESWFR9QC/PoBRtJqf1+F8aU7D/u9pREy0=; b=LweITxfP9ysXUIICt8DtCmSNdx
	OC5SzrRzOwCObNpDEz9bgk11r5IDQnWRWfIKsldjZr2WXJJZ2COH728RY45Qq2bfuTJ5hDLpvwpPT
	PAeQTUC/uOdfakU8Inb23rxJ3EA82C4YPreEwuoujRJOJQv3Kg8xlWx5T/+Xa9p+QPQq7zzArUp2s
	MHD2vF8C/s4jSO0S0jM77lVdcIj8R7nddq2N8AyLcaUIEXO+xVzVNG8iqIh3OriOcZ9jUDG4qNVCF
	5RGufe/skqwIQcZVnZL5z2TSjg2IXHdZs0aeO3+NREJ7DFVhl4MWXnMyHk9juugzadEl0ZY5lj9KX
	Ba48gWmQ==;
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1SfC-003XzB-0q
	for linux-snps-arc@lists.infradead.org;
	Tue, 23 May 2023 14:07:02 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f4bdcde899so907805e87.0
        for <linux-snps-arc@lists.infradead.org>; Tue, 23 May 2023 07:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684850757; x=1687442757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXvb5TDUzvESWFR9QC/PoBRtJqf1+F8aU7D/u9pREy0=;
        b=jUf/xLDRQeFWkvJxlE7DG8k/g9Kaq7kmU356lCnEcTPt7HRH9mF3yYSSKYy3AjdmMb
         PNJoXmxSr7xwdkekuAGpi31DkWD2cnBbwWlnwniyL4NTEq8RWhSGAm7lNJ56nBi7lYUz
         E0oj4UfEebq9LsjfphS/f/Zp9PIP/3JLeguL6Pe8UJJWKt8dQFmYwMpDNb6cjxHzVKmh
         7fNHGbzoBbZ9dqlk8I/Mn0uG+EBCCvXw2LyD39z4Mh8nQI8yIzYFz+e/GOxUL2Yxfk6e
         uOTevK/Gu1QvFq1s1cju6TkuunqswAEzPfBN+ZKrRoq9EFkn/phqnUa5oOger2h3AlhE
         3yJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684850757; x=1687442757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXvb5TDUzvESWFR9QC/PoBRtJqf1+F8aU7D/u9pREy0=;
        b=XV+sh7J0hVjQ+OVzXqSzpBCQFelXtJW3n8VbNjvVpgxikjOUKZfsOYLs0AzXH/0R09
         z6/yPGUMPNjKe0K1vRAo/ffxIUQp5uQAIVn7xHsSGXCf3bweQve3Mp/AYlY5Qc/c2TC8
         cB6Y4s+rVc8bqU+VzjuGZKhC8g/LgFrk2pjtBKNVYgIROc1fupXu5vuVRDMrFGGJar62
         XMBHSCoZ1e+22iC4nGsMxZ0Rlx+pNjiIalDq9QnUTdtiHUdrc4Ch6mHBphDxSMZpOhkS
         B9fd4Dec6Fb1AtarrQWdEDYKi5KfAqiIkZMF1kZerR6Zhs16HMb/rkZndxJYXBaRk6/v
         grJA==
X-Gm-Message-State: AC+VfDwoA2Kq/K1OZcMEts5JmAV6LjqB6im7Lxq+n83oWeaT0DMwywwM
	9J50w615EIJpVxupoH94pR4mZg==
X-Google-Smtp-Source: ACHHUZ4aZ/AZ/8gxQE/YnF0VxlckPQW0Tv4gMGhkdHXNXCrF6Daph5XoYtZlIIicwXM9NPHyzPIGpA==
X-Received: by 2002:ac2:43ba:0:b0:4f4:aea9:2a2d with SMTP id t26-20020ac243ba000000b004f4aea92a2dmr2010283lfl.43.1684850757405;
        Tue, 23 May 2023 07:05:57 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id h28-20020ac2597c000000b004e9bf853c27sm1346562lfp.70.2023.05.23.07.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 07:05:57 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 May 2023 16:05:36 +0200
Subject: [PATCH v3 12/12] m68k/mm: Make pfn accessors static inlines
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v3-12-a16c19c03583@linaro.org>
References: <20230503-virt-to-pfn-v6-4-rc1-v3-0-a16c19c03583@linaro.org>
In-Reply-To: <20230503-virt-to-pfn-v6-4-rc1-v3-0-a16c19c03583@linaro.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
 Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-mm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, linux-snps-arc@lists.infradead.org, 
 linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_150658_476390_94586CF4 
X-CRM114-Status: GOOD (  10.47  )
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

Making virt_to_pfn() a static inline taking a strongly typed
(const void *) makes the contract of a passing a pointer of that
type to the function explicit and exposes any misuse of the
macro virt_to_pfn() acting polymorphic and accepting many types
such as (void *), (unitptr_t) or (unsigned long) as arguments
without warnings.

For symmetry, do the same with pfn_to_virt().

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/m68k/include/asm/page_mm.h | 11 +++++++++--
 arch/m68k/include/asm/page_no.h | 11 +++++++++--
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/include/asm/page_mm.h b/arch/m68k/include/asm/page_mm.h
index 3903db2e8da7..363aa0f9ba8a 100644
--- a/arch/m68k/include/asm/page_mm.h
+++ b/arch/m68k/include/asm/page_mm.h
@@ -121,8 +121,15 @@ static inline void *__va(unsigned long x)
  * TODO: implement (fast) pfn<->pgdat_idx conversion functions, this makes lots
  * of the shifts unnecessary.
  */
-#define virt_to_pfn(kaddr)	(__pa(kaddr) >> PAGE_SHIFT)
-#define pfn_to_virt(pfn)	__va((pfn) << PAGE_SHIFT)
+static inline unsigned long virt_to_pfn(const void *kaddr)
+{
+	return __pa(kaddr) >> PAGE_SHIFT;
+}
+
+static inline void *pfn_to_virt(unsigned long pfn)
+{
+	return __va(pfn << PAGE_SHIFT);
+}
 
 extern int m68k_virt_to_node_shift;
 
diff --git a/arch/m68k/include/asm/page_no.h b/arch/m68k/include/asm/page_no.h
index 060e4c0e7605..af3a10973233 100644
--- a/arch/m68k/include/asm/page_no.h
+++ b/arch/m68k/include/asm/page_no.h
@@ -19,8 +19,15 @@ extern unsigned long memory_end;
 #define __pa(vaddr)		((unsigned long)(vaddr))
 #define __va(paddr)		((void *)((unsigned long)(paddr)))
 
-#define virt_to_pfn(kaddr)	(__pa(kaddr) >> PAGE_SHIFT)
-#define pfn_to_virt(pfn)	__va((pfn) << PAGE_SHIFT)
+static inline unsigned long virt_to_pfn(const void *kaddr)
+{
+	return __pa(kaddr) >> PAGE_SHIFT;
+}
+
+static inline void *pfn_to_virt(unsigned long pfn)
+{
+	return __va(pfn << PAGE_SHIFT);
+}
 
 #define virt_to_page(addr)	(mem_map + (((unsigned long)(addr)-PAGE_OFFSET) >> PAGE_SHIFT))
 #define page_to_virt(page)	__va(((((page) - mem_map) << PAGE_SHIFT) + PAGE_OFFSET))

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
