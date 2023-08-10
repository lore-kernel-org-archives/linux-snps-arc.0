Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2646FC04A94
	for <linux-snps-arc@archiver.kernel.org>; Thu, 10 Aug 2023 07:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g4wRNhzrSmi4YO/Qz03RZfZrxHGS1G/SE2SHPts8/38=; b=aTLfFCzIiKsmhe
	bKTZm/nBbdutxo7j7XeQN73CiDizlcrXSWYnKCjWBU2FXcs4bd8HDo0MnkCAzzjOWv/g9XPJ4DKAa
	/Iq6lLdzLGJVB6g/DsY+CEatXzTATjiAaurjR5ssE6yABioZP2EwYCDIM0NnTATfBVVC7jRGc47MR
	UOYiClfXrnR8K78btZq/rhCl4/qGXevnTrYAiAc5As5H62RtP5klpl1P33vZtwa3K+KRnPrxI/Ux5
	9HDQV23n5rk4CYDdmLjq2ThVe+RWcYtBvWIjhiBkSrwmx9gMa4rLaYJGCNI3QI1OjNv5Sbk4oYOni
	BCTvacGUm2RNk7B6496g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0Hc-006ljr-0R;
	Thu, 10 Aug 2023 07:40:36 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0HZ-006lj3-06
	for linux-snps-arc@lists.infradead.org;
	Thu, 10 Aug 2023 07:40:34 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b9d3dacb33so9108821fa.1
        for <linux-snps-arc@lists.infradead.org>; Thu, 10 Aug 2023 00:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691653231; x=1692258031;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JofiBfwzy3kjUFhKUXLWtoVye53MuyuBLLBCjo+WoM4=;
        b=hVft4joyMLn4SOCV/gtcK0uGplfoX/ab/N0cUYfJMXp0BuUvhnB+C7Es+DxTERT8YM
         sTab+94QLh4XkVOPFt9+WZcH3GSTvaafD/UTR/XdqyXdp7ouQMxcdlMxafmNE7yC+veY
         eYZjZ495+Ebk7od3VMGnHXe0V99K1WAGHKBKYYxDGsoBx2QpHVyN5XoUQo07xv7CfN4F
         z1AA0a947XMRdz+iXTM2I2W6J4sop9DIEI0mhpAA8qRXWz7/qd7GceCKzn0o33K1f9pW
         qYFzHuvTXx9dChjEZyHpAJTcRidkPDl5tnY+TEWjo5vsSI8eZExn3/tjNjXYPUP7StVS
         TPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691653231; x=1692258031;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JofiBfwzy3kjUFhKUXLWtoVye53MuyuBLLBCjo+WoM4=;
        b=HqN1TPaazwQrdb8BFuUFRVbunAN5PzrO7dPBHWwrzX4lGmhXED/hNBIojaIfnkVVQj
         sHCa/E0CysQDoi27IcZE1XcUFJHIat76NOdryhCYpwmJY1Vz/z5IMDEsZwRx3Uytnrrf
         fYOnHplqJ2quRpLxftmVx457hzevKa+KFQ7mjKDSqLp0a1vC5/99whAovh3ThfkfLaTd
         hN3HfbADQ8AggJMlysxT9eSq4L0F0lmQH+8IvP3WqQp5QjRnMd3IC2Zzc8k1Ef5pfmQA
         MHVdapHYOw23ZkATgFW69IoJniUQfoTow6KCXczVL6tEzJNX/ODKxJ9BUu1ytg+6ADM9
         DLBw==
X-Gm-Message-State: AOJu0YxGe6F8YS+ieV4NSxGHsvFbU21inbu2JZHr9FQik9NZcPzC7uNI
	obcLJ51WTZNUI12yU2GhLh3+xA==
X-Google-Smtp-Source: AGHT+IHhuZtE2A2+8TNudV6c2QBTvCPnsZWQI9CBK0LmA4TtloLakTlHFgWjUJXu6Nbo4q2taImjKQ==
X-Received: by 2002:a2e:9b16:0:b0:2b6:9afe:191c with SMTP id u22-20020a2e9b16000000b002b69afe191cmr1386270lji.7.1691653231072;
        Thu, 10 Aug 2023 00:40:31 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id e4-20020a2e9844000000b002b9ff8450aesm234500ljj.91.2023.08.10.00.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 00:40:30 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 0/2] csky: Convert memory accessors to static inlines
Date: Thu, 10 Aug 2023 09:40:29 +0200
Message-Id: <20230810-csky-virt-to-phys-v3-0-f443cd2fc050@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAG2U1GQC/33NQQrDIBCF4asE152iI0TtqvcoXQSjydASg4o0h
 Ny9JqsWSpf/g/lmZclFcoldmpVFVyhRmGrIU8Ps2E2DA+prM+QoueYabHosUChmyAHmcUkge82
 tUCiEN6zezdF5eh3m7V57pJRDXI4XRezrP60I4NBZhcrr3nn01ydNXQznEAe2cwU/CfOLwEpga
 5Q10rfcfhPbtr0BEUIZXPYAAAA=
To: Vineet Gupta <vgupta@kernel.org>, Guo Ren <guoren@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-csky@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_004033_088125_1190732B 
X-CRM114-Status: UNSURE (   8.35  )
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

This converts the virt_to_pfn and pfn_to_virt macros
into static inlines so we get proper type checking on
the pointers passed in.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v3:
- Do not return const void * from pfn_to_virt(), return
  void * so we don't case a mess.
- Link to v2: https://lore.kernel.org/r/20230809-csky-virt-to-phys-v2-0-2697c93f60cf@linaro.org

Changes in v2:
- Fix compilation error on pfn_to_virt() by more casting.
- Return const void * rather than just void * from pfn_to_virt()
- Link to v1: https://lore.kernel.org/r/20230808-csky-virt-to-phys-v1-0-ac727f8def2f@linaro.org

---
Linus Walleij (2):
      csky: Cast argument to virt_to_pfn() to (void *)
      csky: Make pfn accessors static inlines

 arch/arc/include/asm/page.h  |  2 +-
 arch/csky/include/asm/page.h | 13 ++++++++++---
 2 files changed, 11 insertions(+), 4 deletions(-)
---
base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
change-id: 20230808-csky-virt-to-phys-3d80c17211f9

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
