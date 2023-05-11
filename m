Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54835C7EE23
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 May 2023 17:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3bmZO5Y+U0UT8EXG0hbeYOJWrD3GHFal3Hv18si2oGI=; b=2gpU4ULHAcjKfz
	2tsoHrLEsWIUFZL9CGfMeenYy42zxHn94SLNWidtVRbNbK94uUCB6Q34T8Nq03PUz7im3z1zvt4Uh
	LrI5JE/fC/+tDDyI0odiJLIdbjJbPn64Sv0JHbxSZCgwupy4r1bOakvcZYDf5Gdnf4QyzVJmjHdJU
	7FbFp8Ky9iMeX5NXluTSWvNwNmchs69Xf9IUFp701OnvA9nxrVKC4UMlaH5tIu1R1ItL+IU4Ejc2t
	l2MSFlWKxrqPLly3HSViBT/oLfL6ODDPPT9VNUf6XjVTwuX638T7vibZlrOT6s8mQYeLx2VdPqKGl
	7hBrgRxCOeZQwln+nfPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px9fr-009Sbu-39;
	Thu, 11 May 2023 17:01:51 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px9fp-009Sa6-1f
	for linux-snps-arc@lists.infradead.org;
	Thu, 11 May 2023 17:01:50 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1aad6f2be8eso82329955ad.3
        for <linux-snps-arc@lists.infradead.org>; Thu, 11 May 2023 10:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683824506; x=1686416506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kiNPfQZ2SsTlTZ73Scqtrooa5dsdeP/h86336+fdM1I=;
        b=btXNXw42KXxaiNsJfsqp5Wn/dVNYLwALdAKbsBkh72TWh49seYq5HQC2VAXmesyVIq
         RQizzGe1z14+Elg2CtqSOHZSGJ2O/8ajGCUK/97zqwP8TWERhC7H5GtimBpTHCvrI1az
         NoiTUVsB6QX1uN/Y5a09s7En+QHiE3dROXxFmtZsa+sMrH5E8tPFrfdQCKGufOGpVy2e
         ZMxAyNOZs7D9JLraOVC9YAFr0/iGCM+ZTfBp/Lgb4GG7CfEhlCfwakIMYtTY0rfuCeAY
         gL6FUvDP5Uz8T8e0yWRXaNhO3w4RPcgUTiyuM21VVDATl5mP29FwEu7srA9YPtk1AknF
         G/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683824506; x=1686416506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kiNPfQZ2SsTlTZ73Scqtrooa5dsdeP/h86336+fdM1I=;
        b=js3gx1zm4cgcq3j4Cn2B6WDbE8y6FPUsB+iJgLdQUMY5qCz7B6hDZAVkFbBx+wXuVV
         bb1LBJMDjvVTGvH4gdIxGg6m2Aeg8z5fvzt8UApaT3R4q6AJOaQx0iqCICOa4wN/RViU
         v1Wsc6Y5DJDBgCVMQGm7GVEEkTfLLAyaVtHICZkBMLNV9VIcxWeaam9FVbYlzIjd+6fR
         d/qZcU4MkWR1P9TpxTlCE642xPAfsFxpJiYpGYiHv9W9gLj0tFjcsbtqzky7Es9J/CHI
         tA8OPcEP1B/bYcu2O4HrjCcZBycMgPO7+DgLTrwlcsmGyrXZ1HzZJB4bDi7v6OzN7/tl
         kJTg==
X-Gm-Message-State: AC+VfDzX+UMUWhp+bgxVhWP6rRrBF6uSq4JSVe5EXuuDiARiBC0gK9mK
	P9fErLBqtINnXyt1ME32+Do=
X-Google-Smtp-Source: ACHHUZ4o0Bf3QbfPBXc9XNpV2pcC/+8tTbPve3WNz79HOKvxqC66aXpXZ2bTOl5FJ50kdm9rHhXDoA==
X-Received: by 2002:a17:902:f7d3:b0:1a6:dfb3:5f4b with SMTP id h19-20020a170902f7d300b001a6dfb35f4bmr20711948plw.55.1683824505778;
        Thu, 11 May 2023 10:01:45 -0700 (PDT)
Received: from ubuntu777.domain.name (36-228-94-72.dynamic-ip.hinet.net. [36.228.94.72])
        by smtp.gmail.com with ESMTPSA id r7-20020a170902be0700b001ab0083c6c9sm6156240pls.261.2023.05.11.10.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 10:01:45 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: Vineet Gupta <vgupta@kernel.org>
Cc: Min-Hua Chen <minhuadotchen@gmail.com>,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARC: fix incorrect THREAD_SHIFT definition
Date: Fri, 12 May 2023 01:01:38 +0800
Message-Id: <20230511170139.343434-2-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511170139.343434-1-minhuadotchen@gmail.com>
References: <20230511170139.343434-1-minhuadotchen@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_100149_549843_1A465808 
X-CRM114-Status: UNSURE (   9.92  )
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

Current definition of THREAD_SHIFT is (PAGE_SHIFT << THREAD_SIZE_ORDER)
look incorrect. It should be (PAGE_SHIFT + THREAD_SIZE_ORDER) because
the following equation should hold:

Say PAGE_SHIFT == 13 (as the default value in ARC)
THREAD_SIZE_ORDER == 1 (as CONFIG_16KSTACKS=y)

THREAD_SIZE == (1 << THREAD_SHIFT)
            == (1 << (PAGE_SHIFT + THREAD_SIZE_ORDER))
	    == (1 << 14)
	    == 16KB

Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>
---
 arch/arc/include/asm/thread_info.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/include/asm/thread_info.h b/arch/arc/include/asm/thread_info.h
index 6ba7fe417095..9f9dd021501c 100644
--- a/arch/arc/include/asm/thread_info.h
+++ b/arch/arc/include/asm/thread_info.h
@@ -22,7 +22,7 @@
 #endif
 
 #define THREAD_SIZE     (PAGE_SIZE << THREAD_SIZE_ORDER)
-#define THREAD_SHIFT	(PAGE_SHIFT << THREAD_SIZE_ORDER)
+#define THREAD_SHIFT	(PAGE_SHIFT + THREAD_SIZE_ORDER)
 
 #ifndef __ASSEMBLY__
 
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
