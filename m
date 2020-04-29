Return-Path: <SRS0=xF7R=6N=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6F4C83000
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Apr 2020 15:12:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 133812074A
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Apr 2020 15:12:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rgUznyro";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXA/vaMt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 133812074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R7Edyk+2bzf/76Imun746ncxTcYOul58tjS2b6KZOvs=; b=rgUznyroXVVHQB
	xRX31w42x9c4i7fVFpWTysKVV7KE3taI25x/4tcMNo3bKV/Ut6D74UzJTBfuYkM+ZyEvFVvIvyCVM
	KcZjqmQq273zdbkvjiwMDRtd+waJex/1LY65WpFpelWIO3fJSszQmBhK4u2WjvskrBG9T1gaJRsmA
	ssoS6lnGO0TfwfsWqHQvADEUJi7LxP9EaLB5G6kkC5PsKhFU/X/d9obkTOHNulOYopnHcQ3kssL/Z
	wjRbuaqhK44vF0qkECUcxp2NKhWMwSiP6xEmu6NpMDYR8P/yJeKV1b3sujDLYHbqE5/l1DFCN8nMd
	l0RPK2JiRGVILlUeQA3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jToO7-0004ks-E2; Wed, 29 Apr 2020 15:12:39 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jToO3-0004ex-2v
 for linux-snps-arc@lists.infradead.org; Wed, 29 Apr 2020 15:12:36 +0000
Received: by mail-pf1-x444.google.com with SMTP id x77so1223486pfc.0
 for <linux-snps-arc@lists.infradead.org>; Wed, 29 Apr 2020 08:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZtfxcAdJgvL3rHPILIPyvwSO0rRyZfKUkMWQ4mNPZT4=;
 b=IXA/vaMtixRg5KryB8HwKetJjz1dHyfr7hkD2KT2Lq+cGEbZpYyAkjmwGHsC5/AplN
 iY4noe7J6oEhFmhssZgyIou2PLm9jHrc8o2bNAPs2IMf6yZH36kzEM55OKXDxyv3XfDS
 xVp9WS4J0BMoH5gQG9PYdDhcXymiefnDCnKcn13fqbJdgN3u6vI+eF/Jv1yhU1iP7JAr
 iWbnrzWimQbxSikcM62nTQAJbibNwshiKXqQwNTCgKwbrZN+fpejcydB/hoMCK2yqxTo
 XVbcUljz9PW5AAgKSnQ7DjRNT6qYX+LBUVDCJMs3Fkjwjzpy3helPEiNtCyXEsx1QLc8
 dkCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZtfxcAdJgvL3rHPILIPyvwSO0rRyZfKUkMWQ4mNPZT4=;
 b=SFnbKDRIyIW4iaGU8e1pklk5a1uRAlQ0Mw95MZ2ASw0L2Tp285S5DsPt6lbtPtIw/n
 GInem3G+9UsBotF63zQUqZM6sPsppbL5EJ5Lntlzd0EriCd54MZmSersu4eSj/5lyU0B
 6Mj2gIpGBksS1NFTFG25CVpeYLbsdfldOVjRdFXomgbdEuQyAb4xsX15XJsPEQQuXV4d
 G9dVHpNP2l+mCa8uA51ZpULH2Jp9llFryyIa2SO02gtC/dnqqtYZu2tV2drdG5Bs2YwL
 8aMcftYNwM4+j3jw/5sI3sXmyaAljfvizszfrkiweg/HVunHD19YeUPemDkTuPBlzOux
 4EHQ==
X-Gm-Message-State: AGi0PuaJBroK9eDtYRsqN5LY+OaAM8WTHH60SxhzZ66/yvl8Yzdmn9hR
 DV5HNw1icORYA+GS/7+/uAY=
X-Google-Smtp-Source: APiQypJ9KD3omt64yeDmK+4veD1+/ihs8MYf083XhRt4rgQNF1xaAZTkjvYoCOeSW/uoRsmyklXOow==
X-Received: by 2002:aa7:82d4:: with SMTP id f20mr36338827pfn.253.1588173153248; 
 Wed, 29 Apr 2020 08:12:33 -0700 (PDT)
Received: from localhost ([89.208.244.169])
 by smtp.gmail.com with ESMTPSA id q97sm5305049pjb.7.2020.04.29.08.12.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Apr 2020 08:12:32 -0700 (PDT)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: vgupta@synopsys.com, daniel.lezcano@linaro.org, tglx@linutronix.de,
 linux-snps-arc@lists.infradead.org
Subject: [PATCH v1] clocksource: arc_timer: remove duplicate error message
Date: Wed, 29 Apr 2020 23:12:23 +0800
Message-Id: <20200429151223.3120-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_081235_194890_9FCC68B8 
X-CRM114-Status: GOOD (  10.21  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Dejin Zheng <zhengdejin5@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

it will print an error message by itself when arc_get_timer_clk()
goes wrong. so remove the duplicate error message.

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 drivers/clocksource/arc_timer.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clocksource/arc_timer.c b/drivers/clocksource/arc_timer.c
index b29b5a75333e..de93dd1a8c7b 100644
--- a/drivers/clocksource/arc_timer.c
+++ b/drivers/clocksource/arc_timer.c
@@ -334,10 +334,8 @@ static int __init arc_clockevent_setup(struct device_node *node)
 	}
 
 	ret = arc_get_timer_clk(node);
-	if (ret) {
-		pr_err("clockevent: missing clk\n");
+	if (ret)
 		return ret;
-	}
 
 	/* Needs apriori irq_set_percpu_devid() done in intc map function */
 	ret = request_percpu_irq(arc_timer_irq, timer_irq_handler,
-- 
2.25.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
