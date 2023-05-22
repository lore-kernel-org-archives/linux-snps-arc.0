Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC40C7EE26
	for <linux-snps-arc@archiver.kernel.org>; Mon, 22 May 2023 07:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ed8Xgc2bZZL/iKgoyxZ6D60joCbdRwnzFo0ADNNmJzc=; b=LyMlId2OGndO1H
	DJg5XGs6A0tAAcKjnqBFgwNNPpIgA5bBgNZNZEUAIrOH2xzeHwgPfD+p0HKB/jZ2ZcDBVUxAHUKdE
	HfanXVvaNvqOtSj+vozXYNTp2zfOTr6e4uu0Vzw1gncwuzP1Qy41YWA/qaGRisgcNpAGUexQnONzA
	R43p9XDwNHVevT1/P0dVp5TU0ChSSPOC9fLa7O/050u4DyJl2kg6goqi90ZQvPghxqg1joFnR/8Nh
	chkt2pd8gfpGk1xaGNvPuewxFwrbWtlmUaQ/d8cTI+EhqEohgKTBT3h40pgeJlWxKv7vLsnraF+0g
	nzKcq0J4AZtOf14KWnuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0zXV-005ZR5-0L;
	Mon, 22 May 2023 07:01:05 +0000
Received: from mail-lj1-f172.google.com ([209.85.208.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0zXC-005ZEb-1B
	for linux-snps-arc@lists.infradead.org;
	Mon, 22 May 2023 07:00:47 +0000
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2af2e908163so21148841fa.2
        for <linux-snps-arc@lists.infradead.org>; Mon, 22 May 2023 00:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684738843; x=1687330843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b/3885L94lN4KFkmIG4KL0Z1VLtyVywWWWjhcZ8AdCI=;
        b=msJmmXilknfX0gustXHQKSFGoGGpP7zNrDPXSF8hGlzB+iOnAsG/9I6PNDaTC7tpuP
         LHrjj4nADiOaY1JF8IDevtTJnrfZzdlukdM5EjxmOQMluBLXF00uxSCrlJ7fF0ejN4JD
         Q4LwkNUmpBY3r0XYmP3BaT5xUCGJ3H0IrrWD/2ui8jqMelbfiq8VPrnWpZSMsASEmnHp
         U8ckmtBg7/nb/4CIadFGBoWiB71MX9sNNtt3ZXZuNUZ4nD1NSR0DTjKbTfHDFJKiWu3S
         oI2KEw+qKpXMHbdxZKQDP3RSyQcxiJeCdJJD4p+woUWbiPjn42x6zslxWBMZPoVgpmY0
         MXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684738843; x=1687330843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/3885L94lN4KFkmIG4KL0Z1VLtyVywWWWjhcZ8AdCI=;
        b=dTj7SDxS5RcYpowDWYAIkaOtW6UMs2cLTKFfBGrMCa7+P178AY/SKuETZ9GokKT7iM
         kOaO6+e3hatkr+AJsWvrevkSTJ+BPVLD17SL0Ti8dgn3y0OoDkjW2oiTCuZgohYli1Su
         0WLwxf0gHRAz/6ccNaAIfvcwa/syNGSZhwfSHGZdyit4H7HdelZ9yQ2XemKy7tU+N8cI
         jmpSONlkE4D4MNgAiSXQfWwBSJacU6MBqFAtjCNpJnSPueOxpEqJyRLb+ha0OodRB0Wd
         woZGaNj24Tx0zkXHB5fLizVrE4AaRh/a7N7O4SOcxh9jZlsCyxzhsECimf3JGneNnHjQ
         /N5g==
X-Gm-Message-State: AC+VfDw9jjfPMm0p5OoCdowVj9pzSp1n0QiYVQsdg31klmPrRUktUAly
	YmsAN/T7tZBTpw4iDjPZXOkEsQ==
X-Google-Smtp-Source: ACHHUZ5h73hBaOd7t5s+aJ2lUS5QT6SygNvWWhdVE3CS8JGYJhqyww8xpReCDW9EkuzhCaG9HMhk0A==
X-Received: by 2002:a2e:9081:0:b0:2ac:8486:e318 with SMTP id l1-20020a2e9081000000b002ac8486e318mr3451294ljg.35.1684738843518;
        Mon, 22 May 2023 00:00:43 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id q4-20020a2e8744000000b002adb98fdf81sm1010187ljj.7.2023.05.22.00.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 00:00:43 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 22 May 2023 09:00:40 +0200
Subject: [PATCH v2 05/12] cifs: Pass a pointer to virt_to_page()
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v2-5-0948d38bddab@linaro.org>
References: <20230503-virt-to-pfn-v6-4-rc1-v2-0-0948d38bddab@linaro.org>
In-Reply-To: <20230503-virt-to-pfn-v6-4-rc1-v2-0-0948d38bddab@linaro.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
 Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-mm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, linux-snps-arc@lists.infradead.org, 
 linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org, 
 samba-technical@lists.samba.org, linux-arm-kernel@lists.infradead.org, 
 linux-arch@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Tom Talpey <tom@talpey.com>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_000046_421048_FE39E13B 
X-CRM114-Status: GOOD (  12.34  )
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

Like the other calls in this function virt_to_page() expects
a pointer, not an integer.

However since many architectures implement virt_to_pfn() as
a macro, this function becomes polymorphic and accepts both a
(unsigned long) and a (void *).

Fix this up with an explicit cast.

Acked-by: Tom Talpey <tom@talpey.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 fs/cifs/smbdirect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/smbdirect.c b/fs/cifs/smbdirect.c
index 0362ebd4fa0f..964f07375a8d 100644
--- a/fs/cifs/smbdirect.c
+++ b/fs/cifs/smbdirect.c
@@ -2500,7 +2500,7 @@ static ssize_t smb_extract_kvec_to_rdma(struct iov_iter *iter,
 			if (is_vmalloc_or_module_addr((void *)kaddr))
 				page = vmalloc_to_page((void *)kaddr);
 			else
-				page = virt_to_page(kaddr);
+				page = virt_to_page((void *)kaddr);
 
 			if (!smb_set_sge(rdma, page, off, seg))
 				return -EIO;

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
