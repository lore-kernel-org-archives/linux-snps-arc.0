Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F702C7EE26
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 May 2023 13:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rqt4u/WfAhB+aL4WuMczHbIcjkNipDy6jT6pRcvaHAU=; b=HTDvjl/2aUAjX0
	P4QqJkGe4hA73FueAOd5UCwm1XAztBveGKhEyVqcGo/546MvTnaRRO2p0jodq9MCdFnKT1UClkOhk
	81kVeiFOiHPbmPP9CXgEEuMPB6HD5LZLN8IYcL7O/5WTBo16ZKOg57Wu0F+fSkjrZOUEm96BasUXG
	gJPPc3Ac90pESSukK3O6yUYYUK8Lpsonlm6CGt2TgsQxQBC2r7ka+eG1R0sBdRF4cBNA6DAtlPg1o
	lOyKp0VIqffXdcf1UylwjUB7WuXw62IJtkMr4FhzhhAlN9Bl6CaPMsyZYHJJp7rcPx24wvFVC91U8
	MPQQDZ4W1y+6oUkQribQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px5uy-008nNp-07;
	Thu, 11 May 2023 13:01:12 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px4xg-008hA2-1g
	for linux-snps-arc@lists.infradead.org;
	Thu, 11 May 2023 11:59:57 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2ad1ba5dff7so64799221fa.3
        for <linux-snps-arc@lists.infradead.org>; Thu, 11 May 2023 04:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683806392; x=1686398392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zblD5qwa4O4tbk0UyG8/FxNMnBSv353Htd3W/ogLXhE=;
        b=wyPzOAzNl7rmMFYBpuSvqF8bhrq6s9qC3HUK0XdF1bjiigB5tF7/avNAx4obqKnEQ1
         5XDdVWTgJzXsRWcpD0IeKxuCUkF11nwjWijBb+G6T5OPprRNKDhkDqc9xd5QVgMzyrYY
         L4pIzqOjfuQxI7o931I1eoHt0E6G0OHcTKzBzLCxA+U45bYiMjQdWdAzAsrvS2ny+0vb
         k7hlG5IBE0zSUhp1t5xXUTTwH3SO9y19gebdMieRe9lXFfVvvxSdJSGDOae/gEYPgSY9
         RwLKQo1r9DKn1ZNPuZYIw5CEheKyIccgqvPNEdgrxsVlTPsrWGQMtl/h5sx8pPqkpO6r
         g93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683806392; x=1686398392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zblD5qwa4O4tbk0UyG8/FxNMnBSv353Htd3W/ogLXhE=;
        b=S3EsT2+NcAHEdwqG0QFC6NQevNU1GYBUmA036IOOhEedu+imnpvljgXH55cwW0ZGfB
         jx0Tt/yrqTqUDBRxmPgkABZ4zUQQGxOstXd357pnIzisagiw9f4iqC5wGZTPJAgxPlkx
         btHLme0qNceAgHaXkdK2E4FyRwneoOGb8wMgwJvymrnQvb4aVDcex7FLonHYvLk0RpC+
         +RLiQQ9TwlJWNTiB5hf2tzSiOxfd6PXqQB5TnzMKT1ASyeB4J/yMdKorq6SQVEYKYegN
         p9v0PXscuh0x4oiz9Fw227XeaUg/U9NQeEKQwmYtsSiLVwmvVYS1cuuJcr0GyB16LDHn
         19tg==
X-Gm-Message-State: AC+VfDxvnK+ImHbI3UK4BGy0PkLX/VCqzg4OPD/KOLZh77uoZE4qDNV+
	xrZPvGlivkp4S3rH4xkB9GQ+7w==
X-Google-Smtp-Source: ACHHUZ59KkD2PbSzrX68GhVPYYRxuWgdwfVNkMLT9EHS/L7M9SxIxBIJEQpBkI5jMhVr75d7lMVL9w==
X-Received: by 2002:a19:f605:0:b0:4f2:53fb:187 with SMTP id x5-20020a19f605000000b004f253fb0187mr2361851lfe.68.1683806392694;
        Thu, 11 May 2023 04:59:52 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id f16-20020ac25090000000b004cb23904bd9sm1100841lfm.144.2023.05.11.04.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 04:59:52 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 May 2023 13:59:23 +0200
Subject: [PATCH 06/12] cifs: Pass a pointer to virt_to_page() in cifsglob
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v1-6-6c4698dcf9c8@linaro.org>
References: <20230503-virt-to-pfn-v6-4-rc1-v1-0-6c4698dcf9c8@linaro.org>
In-Reply-To: <20230503-virt-to-pfn-v6-4-rc1-v1-0-6c4698dcf9c8@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Vineet Gupta <vgupta@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Russell King <linux@armlinux.org.uk>, Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-snps-arc@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
 linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_045956_562195_55054D98 
X-CRM114-Status: GOOD (  11.21  )
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

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 fs/cifs/cifsglob.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/cifsglob.h b/fs/cifs/cifsglob.h
index 414685c5d530..3d29a4bbbc40 100644
--- a/fs/cifs/cifsglob.h
+++ b/fs/cifs/cifsglob.h
@@ -2218,7 +2218,7 @@ static inline void cifs_sg_set_buf(struct sg_table *sgtable,
 		} while (buflen);
 	} else {
 		sg_set_page(&sgtable->sgl[sgtable->nents++],
-			    virt_to_page(addr), buflen, off);
+			    virt_to_page((void *)addr), buflen, off);
 	}
 }
 

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
