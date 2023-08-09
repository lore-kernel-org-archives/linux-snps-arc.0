Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C942C04A94
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Aug 2023 08:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XEry3QzXvy3VDoVQPb14/BP8EFFStEALhONN2TN/cF4=; b=axE8m6nxnu6ewt
	Xb9s67zOxs9IDgyQcr45euU22+gxdP8+86fijTr1+sjlKpI4e7tPhm0K6d0mfEwAN1/BGQnRNYEH2
	KoOfldmVNPWSC1PFUGdYr4iE5dRVGvUGn59Wtwb1t83+07gEL8UMSnEj4natwJ1hpRe4UrZwE0yyP
	/6Jpg5UMbJTpAva5OE6DPEbT0HRQR+qcprrSEXtaecPp0M03ZHxgyD0UOfiISIv/bZUu7sghwp+8d
	y6WuUrJqSIIM0A+K0Mj+aIh871VmXpIIC0x3Ikys4/EyDLAUJam+kdQCecTkjZB28b5uy6QU+gFVN
	YscWWCtLg/SQJ7ARxXzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTeKZ-004LC4-08;
	Wed, 09 Aug 2023 08:14:11 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTeKW-004LA7-1p
	for linux-snps-arc@lists.infradead.org;
	Wed, 09 Aug 2023 08:14:09 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fe48a2801bso10762486e87.1
        for <linux-snps-arc@lists.infradead.org>; Wed, 09 Aug 2023 01:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691568843; x=1692173643;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/POtGoXxFGh/QREkHtBMWRDqd8iLqkrUnCKRL9clRsw=;
        b=fdKionpMUm0u6uiYhFl9Oc3nrINpFaoTuD+h0OSD2iXv1RbP3YpyCgehFgaLu4IcA4
         JDdhdgU2NLXuazckybostbzHkabIgdce5zuAWvu32iZpC0Hn3Zgd2VKG7Ew9ls/nus6d
         MFfPT1Qg48u6jK1AQAavOa3739LDp2lCBXRbVunA5ZQIDL9N7hkUAlHq1+W5I5hxbXQQ
         23re7bob1P6YXH/HuLbTU87z58ohetX6FJp1LPl3KZuk6fGpB5ksa1CeqiVaNvAw2qED
         RuXLuZ7zsS8cr3ZhJfXxhZcHIgM1eTC0/JVYfxezEVvkPIt6HDNdpwky6H8Iz5HCovW9
         KyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691568843; x=1692173643;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/POtGoXxFGh/QREkHtBMWRDqd8iLqkrUnCKRL9clRsw=;
        b=BYyQBvNqjo6acirFhtwJzZQvqWPVGWjuMiUcJ4GKd/bkHlBdTBBH+FR2rfhjOCfjnF
         rLceB+Lcojhjwo9PRSPpaetaQD5JKCKKj4CR+eLMgUiADQSDcXMyehRNn8T6j9+iZMbk
         SuuyPrD9hVWX1KS4zm04gbfRaBLCMa5Wsqt69ZIGyfckb/oOCJoiw3IJ+HQ/MN9Fdb0P
         vLJ9dQ8K5QselzQzO8APWBIi/qFfZJzOkl/w4IHuU/mfS+28ODZ2jNyP7XX4Pp2PedT1
         u0il85MI4PKZP3xCJggB/NaGpNpHvQpWxfynp+5kpSkXgaU2E2x8azTYjgV/ZnE+x747
         Cnaw==
X-Gm-Message-State: AOJu0YzNzrefR4MhQq+LxVCZYOfHpd5q1LQe5bBNFC+p+2PaB/+vvNBL
	4MURFnYIIogLx/eRnkTWmVY0Bw==
X-Google-Smtp-Source: AGHT+IGZecM6CbCsqF2dOwZiTNvsFmMX7R5/gF1JznmKyf1zitouJ85JqS7YhVKBTHEbwh8NPeTlDQ==
X-Received: by 2002:a19:6457:0:b0:4fb:81f2:422b with SMTP id b23-20020a196457000000b004fb81f2422bmr1300289lfj.54.1691568843022;
        Wed, 09 Aug 2023 01:14:03 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id w12-20020ac25d4c000000b004f84a92ba75sm2196916lfd.65.2023.08.09.01.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 01:14:02 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/2] csky: Convert memory accessors to static inlines
Date: Wed, 09 Aug 2023 10:14:00 +0200
Message-Id: <20230809-csky-virt-to-phys-v2-0-2697c93f60cf@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMhK02QC/32NTQrDIBBGrxJm3SlqFtqueo+SRfAnDi0xjCINw
 bvX5gBdvgff+w7InslnuA8HsK+UKa0d1GUAG+d18UiuMyihRmGEQZtfO1bigiXhFveMozPCSq2
 kDDfou419oM/ZfE6dI+WSeD8vqvzZf7UqUeBstdLBOB9UeLxpnTldEy8wtda+K4neDrMAAAA=
To: Vineet Gupta <vgupta@kernel.org>, Guo Ren <guoren@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-csky@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_011408_645328_D55C7F4D 
X-CRM114-Status: UNSURE (   7.80  )
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
