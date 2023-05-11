Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1178C7EE22
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 May 2023 17:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jP86nkeaXQAii2ijGjhP6DQVO6kDT2nwmdVdX5WgN/E=; b=rauoSikX20ILml
	jf1iT2wrBz2EKT9ot9zhIcYbNuDEZHzS4qGval6i8lSPkuCJ3L/qPJyPF5LgMhdmmkn4Pmjz00EU4
	4brn+/nDti/PN9VaI7BUC6zF8wMuhUbbP5li2Kt84QKYHTOekuPsL6d0VaHYV0s3uvhBh0csoQ9jF
	A7FjPa5PVRCoorUgRs1uHJahKwtZRmqKdW8tYNHUtxWsyC+xxb98fWMrlRNi6KyiTz2iBjoEe+TQI
	cg6d3jlhVfeWQik6lsqJlAfWVTazMLA2E5gxDZtp1sF3DJGOy9V28/A/SZ5oottQ3BOV2D8UtFoy3
	JakGUK/XvjiyC4OOrq4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px9fq-009SbD-26;
	Thu, 11 May 2023 17:01:50 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px9fm-009SZg-1o
	for linux-snps-arc@lists.infradead.org;
	Thu, 11 May 2023 17:01:48 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1aaf21bb427so64142415ad.1
        for <linux-snps-arc@lists.infradead.org>; Thu, 11 May 2023 10:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683824504; x=1686416504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XlgUXjTDtEtrxv/KvgWVy44S+Dve/HMsI4TUr1ZbDUg=;
        b=ItIHLaHadK4pK/honMZMvGWHXzE8k7VzUCDmhg9be7aT65eB2rUSphEXrlBteMVLiL
         SGoOD33s96tkbg18qkXuYUo7Mi/L3LFOAD0PSMRLB0vIYqI5pqlcmlBy9ZGyTO6l+c66
         h4e+jDd1albU9o+5CX7mUOEZ/3lnPZUs7/PiLVATiyu4edUzsGLoLtQ6cN0Qzo5EimJU
         fiomoHZyXXPraz+W/BkOsxIGSH+39cqNKzImA2J6T5B2Bzmm+Sya5xvmDaZZuq24E32M
         lM3w/It+5wRKTqwR2gN7GuVEelWxM2LbZi5Zy6bHEMgYoSdLHQlff5HnT9jS51sRNjLu
         S4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683824504; x=1686416504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XlgUXjTDtEtrxv/KvgWVy44S+Dve/HMsI4TUr1ZbDUg=;
        b=al2t0/MdvOUyWkVvqm3kXbJhN454n1ambylJ8kn/JPidkqXwkR41sHBAOOL7Q0Z6fy
         L98WhRuaALbufLdbQPl2tJ30nXhBFqowXOkSfHgNrv5CUM2sqGitOVIgwfC75rgSF6R2
         eDDEv3zlnz/o2IS4QQa1DetkcdgqHoIwWta8uTew0+2If3Hbjqkg28DuZMXUY2uHcxPF
         XNBT3jg/ThUHSxfRsRK4X0y36pRIKD9zK5w95o4qOlEd5hjB0yXcuDGzCesjMDneeNVy
         ELR7XM/L9qzzmlap7G+fAf+dbkfarqhba3rFuuiwAogTgiMSj77Hl7tPx8TgrKjTl4nP
         Ifug==
X-Gm-Message-State: AC+VfDwVHD69tUVwhMFbTrDN6Aay2Y3GzQt/H6H6iZFjy+NfDXSGDYjy
	aOk9lBNQWb0wNL4JcjtunwJS9f24Fxs=
X-Google-Smtp-Source: ACHHUZ6Nalhgua5FoNS5CCxKWMsXR/0wAy4U/hKA+jlb2rlpWlqGXQOn0JKIpTztmvRwGIEco1pScQ==
X-Received: by 2002:a17:903:1d0:b0:1ac:7624:51d7 with SMTP id e16-20020a17090301d000b001ac762451d7mr15329997plh.69.1683824503775;
        Thu, 11 May 2023 10:01:43 -0700 (PDT)
Received: from ubuntu777.domain.name (36-228-94-72.dynamic-ip.hinet.net. [36.228.94.72])
        by smtp.gmail.com with ESMTPSA id r7-20020a170902be0700b001ab0083c6c9sm6156240pls.261.2023.05.11.10.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 10:01:43 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: Vineet Gupta <vgupta@kernel.org>
Cc: Min-Hua Chen <minhuadotchen@gmail.com>,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ARC: fix the THREAD_SHIFT definition
Date: Fri, 12 May 2023 01:01:37 +0800
Message-Id: <20230511170139.343434-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_100146_597217_E395C68D 
X-CRM114-Status: UNSURE (   8.42  )
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

Hi,

When I read the arch/arc code, I first found that the
definition of THREAD_SHIFT looks incorrect and the
description of 16KSTACKS looks confusing. I submit
these 2 small patches to address the issue I found.

Min-Hua Chen (2):
  ARC: fix incorrect THREAD_SHIFT definition
  ARC: rename 16KSTACKS to DEBUG_STACKS

 arch/arc/Kconfig.debug             | 7 ++++---
 arch/arc/include/asm/thread_info.h | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
