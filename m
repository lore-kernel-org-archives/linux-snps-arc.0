Return-Path: <SRS0=6Q4T=JT=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50715C433B4
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Apr 2021 05:17:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F73161042
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Apr 2021 05:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F73161042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w3H6yq67HTo57LF/96kmCobFYPnXUf63NXhzXL+FSvQ=; b=FqS2Fb4Iu3NlH0oGNAQuRp5Kqm
	S9j2+MxFlhHCEPJaIPccA57Azjs9lMk7J2CwLZosF1uL5LQizKMZJNkkk6PZda12L3e4QLUntcfFy
	AaUmE9f2Y9kB04wZMVesCKNhxLTR652mtkL07/1JtcX5/yG2mcSbHviC5/M8ydA7X2qFjwKjiZCUa
	7nqwATrXzmEX4+GoO3nU687hjByB9wa3M3TCrh51H711MN/RRkBv8rvJPX0t4i1luCK600oeWWPuI
	YeFLqs3M34D3xBQ+cJC7VROsOnYd3OVud3Xhi3Dd73OiiUfiYt5GbMcIcffhe24f3/CEIfBO7Qc7b
	OxhJpksQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZRiP-00Ftn2-Fp; Thu, 22 Apr 2021 05:17:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZRiJ-00Ftmp-Sk
 for linux-snps-arc@desiato.infradead.org; Thu, 22 Apr 2021 05:17:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=nXccVF0VLMZZqdk7lBuIpC5btmCdWymL750DLlWAg2U=; b=v+a4qYbJcGUkAzXdGc2gUyofE8
 2nPvYlXPhSOLZ9RTyLrSUgCS5S1V77rxhQU5vwocNJRytdpuRsRA/DYP2nFA8Vu8+2SSRvy5YW/+n
 sCNcWpYXsbVJLutejf2O/VtM5EuQxra9W3WUK+UcVDc64oPy9ncE4CA5/pvoPtDth4oluTsN5a17I
 UhWs5ZZLsjsEtiVQc5O3IINv5tHGoeFBU+ybFMQiNBQYElJbQrW8mL8rZ7cdVQYGXHjZp2hglO3Qe
 2QZuxdmDw834j48rVSrwawFxfpvwOVzjvk9mETisPd0P+m6BXmgL0LMekv3BrWYZd/27v+YmLc3oA
 WE3fEhJg==;
Received: from [2601:1c0:6280:3f0::df68] (helo=smtpauth.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lZRhw-00HSwO-KM; Thu, 22 Apr 2021 05:17:01 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Vineet Gupta <vgupta@synopsys.com>,
 linux-snps-arc@lists.infradead.org
Subject: [PATCH] ARC: kgdb: add 'fallthrough' to prevent a warning
Date: Wed, 21 Apr 2021 22:16:53 -0700
Message-Id: <20210422051653.23078-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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

Use the 'fallthrough' macro to document that this switch case
does indeed fall through to the next case.

../arch/arc/kernel/kgdb.c: In function 'kgdb_arch_handle_exception':
../arch/arc/kernel/kgdb.c:141:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
  141 |   if (kgdb_hex2long(&ptr, &addr))
      |      ^
../arch/arc/kernel/kgdb.c:144:2: note: here
  144 |  case 'D':
      |  ^~~~

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org
---
 arch/arc/kernel/kgdb.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20210420.orig/arch/arc/kernel/kgdb.c
+++ linux-next-20210420/arch/arc/kernel/kgdb.c
@@ -140,6 +140,7 @@ int kgdb_arch_handle_exception(int e_vec
 		ptr = &remcomInBuffer[1];
 		if (kgdb_hex2long(&ptr, &addr))
 			regs->ret = addr;
+		fallthrough;
 
 	case 'D':
 	case 'k':

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
