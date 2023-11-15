Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F838C48BFA
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Nov 2023 13:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/7BrUh1mjGz2reiIiChoIlO4Lz/LbB1TrR1ehv/BFpQ=; b=xXLLMiXFjBcb2u
	qxYJ3UOTs1tf+qIltnZ25z40QcwXDghGgEdOG6pos0Sn1/tHoMxHgEbaH+SHtZE26OqCCsGEnAcDU
	ctjX2UuumAizLmVO6bLb3qfCjlfY0Jn75pREooFZxkz0Bt4myU4cvC08mNNApAhCCmmOpX1GsLzk2
	ALkTvnrhPN9elsY1KjMinTSFCCsqxECYHH/m7nXknsu+og6+GFe+KzuFM+As4WtMSrwPCz9mx1zv0
	07/lEmMvOyoo7KP8lb9mY8n7D3QT4iYS9HD5fXGXWa9y2jDQ6zdutBp48KNRv8MZW2/J/tHDms5aL
	tubWOFvv+4VSvgm7gP3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3FwM-000s33-09;
	Wed, 15 Nov 2023 13:28:22 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3FwI-000rxt-0c
	for linux-snps-arc@lists.infradead.org;
	Wed, 15 Nov 2023 13:28:19 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50930f126b1so9024556e87.3
        for <linux-snps-arc@lists.infradead.org>; Wed, 15 Nov 2023 05:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700054896; x=1700659696; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IwN4XVt8yK1X3+YfAI5MPsrSuan+JzWxqjLblP1tQKk=;
        b=u4prM+o8Jmi4Wtchmp5pajoAAbL57qqVT2cAHyZhDuL5lpb93LBrD+q/3aNDJbpS25
         dXo0/wtVnvYwMDDk/PVklLS2dyH51CGljuh3jetAQPOaQVUj4xKWR72TvSjoEPAoviqC
         vNcrSXLgWcpJw0u+qqVZOqrSzkp54F/Q64+NhyLT25ZTy1rb0uZo/R59Hse6KY2XfmvS
         5Fn2/F1ARgSU9W1R2hHRkRopPpP01MiuQJxMDzFcay7YIos4d0o2H0SKQApsHRdVvOE2
         I87N6icjbJLP4gbYg85JSrz6UkEvEZyx49At3gzxi2mJM0EUBDNnAPxKCEM/RQcCAM4L
         TW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700054896; x=1700659696;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IwN4XVt8yK1X3+YfAI5MPsrSuan+JzWxqjLblP1tQKk=;
        b=pQ9mkjdKVmpCSP9TtIuyjIKav4SLL3KLOZuOBWoRbz7T1IgiGM8uIEBFWMv90WnPxm
         nG4WWQC0TeUly28kWIwTnvrajwWT81ssq+F7f2duJe9m8R0uTRE3fpUujVOhjegZ5Dzr
         EuIyEG4sNi8ADTUF7dzug0tSvSkePYYVAdKN736hOTerByNXOU8r7qdf198nlWIHgFZU
         tKqn+k+dn28lA2NzCvglL7zQCsB6SXfqQUk6M2rRaYbpYtaYR2ai1xb9MH8bi0qz+FO+
         cfph/Pv+07PXo7Hp9ejfYsu7ygxIA2vb/rx4RNl59p81mu9kRaTKel5CcEc0iR/TvEcj
         AgKg==
X-Gm-Message-State: AOJu0YzbQjBd/0UamZR975/LTcqY/LDDzpAdFQ1qlFq5MjH1K4w+CzbQ
	LSfyhkejfwFw0y4rhgcYH+iHVuV7QY3tC+r2uWw=
X-Google-Smtp-Source: AGHT+IF6FsX84+Bpu5NsuR9YTgjgvPm5Ii4b6DzTvo5LXdZ+KTsK38zulfyHnqY8V8cYq+V7VMdbJg==
X-Received: by 2002:a05:6512:3e1e:b0:509:4b8a:b65f with SMTP id i30-20020a0565123e1e00b005094b8ab65fmr10675082lfv.60.1700054895757;
        Wed, 15 Nov 2023 05:28:15 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id l12-20020a19c20c000000b00507b1da672bsm1648705lfc.174.2023.11.15.05.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 05:28:15 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/2] arch: Virt to phys to static inlines
Date: Wed, 15 Nov 2023 14:28:13 +0100
Message-Id: <20231115-virt-to-phy-arch-tree-v1-0-8b61296eae73@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAG3HVGUC/x3MPQqAMAxA4atIZgON/3gVcdAabRaVtBRFvLvF8
 Rvee8CzCnvosweUo3g59gTKM7Bu2jdGWZKhMEVJRDVG0YDhwNPdOKl1GJQZqWxn27Wmapggtaf
 yKtf/Hcb3/QD/9wbVZwAAAA==
To: Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>, 
 Brian Cain <bcain@quicinc.com>
Cc: linux-arch@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-hexagon@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_052818_256118_A19FF2AF 
X-CRM114-Status: UNSURE (   8.55  )
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

Some architectures have been given patches to switch their
virt_to_phys()/phys_to_virt() or underlying *pfn etc functions
over to static inlines.

Some patches have been ignored or have no maintained arch
tree.

This set includes patches that I suggest to simply be applied
to the arch tree so they get in.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (2):
      ARC: mm: Make virt_to_pfn() a static inline
      Hexagon: Make pfn accessors statics inlines

 arch/arc/include/asm/page.h           | 21 ++++++++++++---------
 arch/arc/include/asm/pgtable-levels.h |  2 +-
 arch/hexagon/include/asm/page.h       | 15 +++++++++++++--
 3 files changed, 26 insertions(+), 12 deletions(-)
---
base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86
change-id: 20231115-virt-to-phy-arch-tree-137bc87046e1

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
