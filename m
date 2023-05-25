Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA25C77B7A
	for <linux-snps-arc@archiver.kernel.org>; Thu, 25 May 2023 16:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ULEKknrJAkvbTq2f6/4WEtd/7i5VyBWtbHmKr1MS0kI=; b=Sjx8NySP6r/Aiu
	X3M8xjhnQZkqxrBrBn4F51gAcCKLMs5MVlTweZa7fkdei6NdqIKEeRkb5LmAypyUtZuc5bbHUwf+Q
	PHqwsXwqe5jv4WESVWlp8RizvqfwzBrwDjqvvm8t7OmW3s0vxOVqOtZt+PB2FqJRFcgLhnwTMHeYy
	RFWmevsqxwuEwllA5pcp8+dp/2kNaQHoV0yCRgL+J76p136vMxmeQTVnfFq0rlo57Yor6DbUJexh7
	9UYaezkfM7v1egdMSYKfb3Ddook8EVW+pKKz5W38MF99aIxmdcy7aiaz8VeyqGpgxaWH1l8MXN/tH
	Fw1vt2g9b5Fd7b//d2+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2DVt-00H3RF-1t;
	Thu, 25 May 2023 16:08:29 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2DVr-00H3O9-1g
	for linux-snps-arc@lists.infradead.org;
	Thu, 25 May 2023 16:08:28 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1ae408f4d1aso12772455ad.0
        for <linux-snps-arc@lists.infradead.org>; Thu, 25 May 2023 09:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685030898; x=1687622898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xEv45uJta0uzHG0bC+JhZzCb4VSE8MHC7EtFPn9iTPw=;
        b=JDnDL2rZqzVJE3Vwd5HUCn5bmJ8Z24AepAKBASGbdeEPmPgG6N6Z4GbpoGieWvAFEx
         Ldv/jYPJlzSBM4Q5ep/PAu3+ecTcs2puJhTAf8y8Fkr+RmZ5WSEoeYIr+EbSmnvT7q93
         BGP/4kh1w5C0E/03ferCO1lZ7s4n3/bWcauRbtEeQJZbwl9NZcjQDckDPx1YYSOfXxNl
         rQhHjFOzRVs1TdMPK1Wnl5ZQyM870UbePXlRMOpPJOTos6huq/DEdfvYv8uB9qgZWnwi
         OUTLMindhK60AXQfc6uFTKYx0UPn9mEBAaLEFNjQvR1FNPJ2dO+GM8Xhfs4aQED492/k
         XydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685030898; x=1687622898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xEv45uJta0uzHG0bC+JhZzCb4VSE8MHC7EtFPn9iTPw=;
        b=GQj+cCD20tfG9SvAogbmQEFAdVr11/EW/4u0SweSpFyjP2QAZHtBOVSdAtjm3w/GXX
         cRc5CNRT/HgLayeIfczDLvWWhj0Q6P36yCcwHibUP/LSJ1mhuuKecDAzbpIl5sQX4BMi
         Xxn89XMw8TLu2SsUeHmMA8RZjojH+ga+QEgKUcme4azRIsOtQzF0E/JWhRsyJnzs8Y0d
         oUXAP7wlfpVqNEIEjNZq2ds1mYpPgVM9uRL9l87eQVeW0oV8mT4X88tPMwdCghk4hgiL
         qsXaBVk2RA6nLjf42Bcxhz2qwBfv9OvLHmsFXFMujhL7ZrX1jRI4oLxUY29n+MVaiCz8
         0kHg==
X-Gm-Message-State: AC+VfDzZZI4PAJTO/sCwlxXB8eHY5br4TvhyYS7tvc5Kh2udo8WNXkJC
	artbEZGbRkGvdlrANISYf+Q=
X-Google-Smtp-Source: ACHHUZ6uW6fsUfZe/Jt0KEvH/QJobmdMYQHctdVJvfxIo/e7nZPdKSFfHXUir4tn20X6SvBwZ36eBQ==
X-Received: by 2002:a17:902:b10d:b0:1ac:a28e:4b1d with SMTP id q13-20020a170902b10d00b001aca28e4b1dmr2237384plr.34.1685030897726;
        Thu, 25 May 2023 09:08:17 -0700 (PDT)
Received: from ubuntu777.domain.name (36-228-81-153.dynamic-ip.hinet.net. [36.228.81.153])
        by smtp.gmail.com with ESMTPSA id s3-20020a170902a50300b001ab12ccc2a7sm1611450plq.98.2023.05.25.09.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 09:08:17 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Min-Hua Chen <minhuadotchen@gmail.com>
Subject: [RESEND PATCH 0/2] ARC: fix THREAD_SHIFT and rename 16KSTACKS
Date: Fri, 26 May 2023 00:08:10 +0800
Message-Id: <20230525160813.39408-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_090827_562488_D3F9C362 
X-CRM114-Status: UNSURE (   8.70  )
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

When I read the arch/arc code, I first noticed that the
definition of THREAD_SHIFT looks incorrect and the
description of 16KSTACKS looks confusing because there are
multiple definitions of PAGE_SHIFT. So I submit
these patches to address the issues I found.


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
