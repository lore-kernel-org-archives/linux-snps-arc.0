Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81598C5DF70
	for <linux-snps-arc@archiver.kernel.org>; Sun, 16 Aug 2026 14:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iSS+Nhw86A4qRXr3E6XalAp5x9TPQARwaLkzq+bqSLU=; b=EreyNAynY6SoFk
	auDDKAcmIhMwTaPTRiZT5CZJ+cxMfzUztw0UF7wRCe8uXrizK/Ihzice/F3e34S9fQLXPP+vPkdnX
	OVpGj1lcqwmzfJ2kFPuEPCxLXlSPy+R0sicZRi1A30mLVMOfu2sv46mFS7MN84CzA0AkGGe4cRLaw
	evjI6wjdH2rDAx0tLESBlrXAHHvqtXGxiu9MnHkdutvk6zEI+cI1g/BNlRHd9MZ1whDkbrfd44KKQ
	pQJN1uWl85GYD0mRSgNtyqok9PCGyjZ1PrHeZ0qo58SAll92cgilYoTdpYRG+a/C1+S9cZFTydBJm
	4qePyQEpG8Rs5W2j5JAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvbkd-00000004pKm-0XQ8;
	Sun, 16 Aug 2026 14:22:15 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvbka-00000004pKR-1YYM
	for linux-snps-arc@lists.infradead.org;
	Sun, 16 Aug 2026 14:22:13 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-495437bb891so22122985e9.1
        for <linux-snps-arc@lists.infradead.org>; Sun, 16 Aug 2026 07:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786890130; x=1787494930; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4KMlwaAd8I5gc71MX6N5TV2im3iyNimd7J8XIlb6Aas=;
        b=QIrcmvOIe200OfM2buGED5BgnaoODSz+QHRRoVSKfDEFaAO7IMARpxdBmcYSF3LWG8
         XopCEX/z14bJM/j7DEFYzChbLf/Zmktm8K4PvLnyGURZm6EpxY8I9X/zltokoVhJaRaw
         r6GE/FBgNQJGrWTABFE13eWL6DwXt8gGtssbRBdTnuz0E03cLmDZc9GrmkFtwgeqZEI1
         upJQa7hgzT13vMmSWhjp7Ku51a2cB9jXG/bSWsUaKM3q9Zkx2HMx+llUcrXq87knTIEB
         NeuNsNQlupV7P1/YjEQEMDo/VuRAf6Oa0ysCXX70jSkWi15bshT82bOe3vCtxaS6k+mM
         ENAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786890130; x=1787494930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4KMlwaAd8I5gc71MX6N5TV2im3iyNimd7J8XIlb6Aas=;
        b=KZxZhmy3Vlg5+0H9pbBu9D4+m9frwJ6dRbAHWfY9bqVyx5dIHYYKvpC0b2tD8w/+bO
         TNau+AIMg2RzgVsR9yYUsuip656wXL55+FQhRIvXvU4/fU5dmQCXQke8zpcRBWSLv3JM
         5Sr7E3qJaV/DiOQxPEsmhqbn6Gy2DM83p0S9615pRx+xXRrwxFkcvDGsgRYz+5Humu+E
         NPp0YH6cTbpr364npGUhQi37Lcz+044jtrlY4laU5TUgVJPkL2OkG21FCT9gl1EwbDEc
         CwJYvhUb203GqvtxqbTWcv0jkcpgE+pf/2jhBp/836sygJ2Am728d5kDTYTwVDuIGFSG
         Shpw==
X-Forwarded-Encrypted: i=1; AHgh+RoWILnDFhfPkrWAlVgLnD+mOEIDolgSaFM2hHpMMJba+pkGz6NmBvkz50kvk/QeSJ0eLEvI1qAs7ywXRajHpA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc5uQQjo+TPluRVB6liC+iG+XQJJbtGNb11DvFaFvhCnKhxvoM
	IPkt84J6TrHqUkVNZaSs4qIhOF1JadNIAdeAtV3ZMZvhWeRCiIqpbsSD
X-Gm-Gg: AR+sD13dMPcIx0FJUMnKJE6S4khHoGyntWopt+nSKfjs9nLY8tZdP+ZMhnv7Fm8roSl
	obZNIRg9oOU2FFaH7MDUGIqfzxeQjvqXGOawWVbfoL9lCP0iy7ICLBboB/w9EYIputqFqiiI0Tu
	E8tqwmFIz+iC7SmmrO04ktMHaizfTo9QzjtIjT9VZu8BfNM0We1rEC9PzA1QLY6/XfL9m62ycWW
	ZaH+cVmZvOeyod3HCUsqPfau37rJJyAI16sfOxWhJUmUeaiGxEdndM6X7u2+RSfM+YbCIF25Rgk
	s3J1BzRpstDM8PK6mexmHY3qb/4d+ZES1PXzBQkWo0h4fXg4hUOkJU0CFudnj6QSyJ9uG3MNRFI
	vka8qnuncRIP2WLhv7O4a0FQAtuJQ6FRPfimLvRZZpmYtacA73ikVJUEulYy2vwOW9g8IV2rq7z
	cdY2jRptSyJ27Y1YNehf4RpOzqSmmVhHoke6kGbWVlpDKaGPy230nn2jRUOpyCxaTHWI6hTxDPN
	03UBXLaK4D272qIy5i5UWhQfd4UbG4dTv/H7eU04j+KwGeG53f9shaDU80tcrg=
X-Received: by 2002:a05:600c:3145:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-49987ab45famr258199375e9.6.1786890129769;
        Sun, 16 Aug 2026 07:22:09 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996176b95sm39575365e9.10.2026.08.16.07.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 07:22:09 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: vgupta@kernel.org
Cc: joao@joaoff.com,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] ARC: cleanup dead ARC_CANT_LLSC option in Kconfig
Date: Sun, 16 Aug 2026 15:22:07 +0100
Message-ID: <20260816142207.1034329-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_072212_424206_A8378C9B 
X-CRM114-Status: UNSURE (   9.65  )
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

Currently, the ARC_CANT_LLSC config option can never be enabled.
It is also not referenced anywhere else. So let's remove this dead code.

Note that I have only compile-tested these changes, because I do not have
the hardware to runtime test.

This dead code was found by kconfirm, a static analysis tool for Kconfig.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 arch/arc/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 2ed7186c81c5..80e61175bf52 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -331,13 +331,9 @@ config ARC_FPU_SAVE_RESTORE
 	  for floating point exceptions and rounding modes. These are
 	  preserved across task context switch when enabled.
 
-config ARC_CANT_LLSC
-	def_bool n
-
 config ARC_HAS_LLSC
 	bool "Insn: LLOCK/SCOND (efficient atomic ops)"
 	default y
-	depends on !ARC_CANT_LLSC
 
 if ISA_ARCV2
 
-- 
2.55.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
