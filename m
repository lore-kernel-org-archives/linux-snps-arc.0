Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D84C001DE
	for <linux-snps-arc@archiver.kernel.org>; Thu, 10 Aug 2023 07:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bbK5WjNGweMS8pt6l6hXo0IUazwd02EPIj+AYjWLwaw=; b=QBPbnS0gPww7Dp
	Rb9LBPdPa2hEXJ+iU9+mdT32z0j/mYDOw9sqMCmeRx813Hr7P/YnjPjzxi5ikZKIjxT4pD7GwO1hR
	I+wCYsOXrRlQPxT+tixIts3M9W3E+igS6VHfHz+JZM6wRsBiC4Cxb1izYYngP3SqzvtOzeKBUuQRS
	BfdCnOMFplOcnN+YY3N8gSAknaDRPO3fCmf7vBOHf1W6Oc/Oa5aqaVQ48TxAlClhZNoZmB4mZU0bn
	a9gYKXcgmnoFruRoAeT4xXiIUew6WvJ/hPUs1KcKpWFwcHWpQaELMPvwE1z/8HM02V66jritwpCbo
	tcLo0XISlKslWUHkyIlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0Hd-006lkE-1W;
	Thu, 10 Aug 2023 07:40:37 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0Ha-006lj4-1M
	for linux-snps-arc@lists.infradead.org;
	Thu, 10 Aug 2023 07:40:35 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b9bf52cd08so8734661fa.2
        for <linux-snps-arc@lists.infradead.org>; Thu, 10 Aug 2023 00:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691653232; x=1692258032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPNuwr8BV2crYdR1HSxa9CVFwtJ2x4ORzKRyFk7VJAs=;
        b=jZlUe8GqXYZExHEJdIjbkYCeW5NeDHITr/Fgx1X6BQQzH+TcMTfY7zWzrjCM5fXdGG
         wVTk7Z5VEteWvnFlpVciGAaQ3AQPV68SaDecR70MGUuyh/CB0I1+a2Mh3OtXhPNg0PG8
         k5PuUUHO1Fg4SrMYMiHFsQGRvDsoGXZm3Tj3q/1+SN8ScI9aXbBqbBLCcNi+PkazlbNR
         P2A1myCEQ5zkOwT+1JU6wOcWKJyO7jH0tkOIrRv12LrcEycE1LfXKlqizKt38zylaseU
         FYKYufBLCbLw9IqxbCM54RVW4cddZ6HRGUECzkzvFmiw4Rt5CZNMG6pmOx0ZiDyih0Q9
         YVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691653232; x=1692258032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPNuwr8BV2crYdR1HSxa9CVFwtJ2x4ORzKRyFk7VJAs=;
        b=e93wFY2Iek7PAEv4g2VI5Wtp40oSQjkJ6/bJpNuLT45fyBlzfu7Z/jP5gTxGrdGXlB
         1iNBLkx0Ikl1ZPn1VMB/TPlZobMAUpBngVp3HuEHpngbPcMBH5z1DW8YIgugJdBNsC4q
         HdbC2py+aNCrcMnObI6pnB0FpGdSY/lsTfbtNA4zhx1hLRD1YDd+0CFdZRnQ23PEwVxX
         Ez94XVhtNqX4BCUeB6l7Sd/hVw/2nYAFH36ktRgQsPQKnFApLWojdf+lmeUO5INZuwxe
         LDGC2UR9MAdlhK/ySrjsRmgk2IWVxo8zfZ9+f+y8kwvIWByz5q2EGOEPwjiYeCOuf/BK
         SVkQ==
X-Gm-Message-State: AOJu0Yy6F8thH6bB8hfgUDtgvkwaY36LtlClWaDw2fsNjVvQ/+QtN8zB
	a8wf26xIq8FKEXctg2w3qJA80g==
X-Google-Smtp-Source: AGHT+IFlkZYCIiwaDGHbE/zE7M2+pApQbVX+Ao8fS2UH3Jodv3XH3X3vJgnTEUPCTvmpoObHgQzlIA==
X-Received: by 2002:a2e:9b43:0:b0:2b9:b904:74d7 with SMTP id o3-20020a2e9b43000000b002b9b90474d7mr1221973ljj.18.1691653231817;
        Thu, 10 Aug 2023 00:40:31 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id e4-20020a2e9844000000b002b9ff8450aesm234500ljj.91.2023.08.10.00.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 00:40:31 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Aug 2023 09:40:30 +0200
Subject: [PATCH v3 1/2] csky: Cast argument to virt_to_pfn() to (void *)
MIME-Version: 1.0
Message-Id: <20230810-csky-virt-to-phys-v3-1-f443cd2fc050@linaro.org>
References: <20230810-csky-virt-to-phys-v3-0-f443cd2fc050@linaro.org>
In-Reply-To: <20230810-csky-virt-to-phys-v3-0-f443cd2fc050@linaro.org>
To: Vineet Gupta <vgupta@kernel.org>, Guo Ren <guoren@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-csky@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_004034_458176_C50CF830 
X-CRM114-Status: GOOD (  10.92  )
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

The virt_to_pfn() function takes a (void *) as argument, fix
this up to avoid exploiting the unintended polymorphism of
virt_to_pfn.

Acked-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arc/include/asm/page.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
index e43fe27ec54d..02b53ad811fb 100644
--- a/arch/arc/include/asm/page.h
+++ b/arch/arc/include/asm/page.h
@@ -108,7 +108,7 @@ extern int pfn_valid(unsigned long pfn);
 
 #else /* CONFIG_HIGHMEM */
 
-#define ARCH_PFN_OFFSET		virt_to_pfn(CONFIG_LINUX_RAM_BASE)
+#define ARCH_PFN_OFFSET		virt_to_pfn((void *)CONFIG_LINUX_RAM_BASE)
 
 #endif /* CONFIG_HIGHMEM */
 

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
