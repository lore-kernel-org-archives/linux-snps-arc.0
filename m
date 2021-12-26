Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63E7C433EF
	for <linux-snps-arc@archiver.kernel.org>; Sun, 26 Dec 2021 09:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ov7G1+uVWcP1hu09HOPXwPf17EefPIruy9WyY3jTABs=; b=KwAdv6J5CQpAKn
	+Z0Ec3AaYx6BzyIH2fz6Byy6ZN2AujRfVsbMiA0ljgmahzKgclo8JXZ92ywSghzpKvo9uTJu4TEJF
	8R9ul6cX39OedKPkoIjuqt7/hvXwXmJ90ujUBE6VYtGMINPFgCVwMQkTiWkDKWbLpsjathteEBvgA
	HC8QYSwLrSiv9zkgJ6pX4LrsQUdMGaeuGMp7qW6orkfByS9Mk1aVeig2wCxetFrS5hCAs8byjJJdT
	TEengTDvvUC5mg4HsIwemqc7f3uYHYJL35CTY2xtE5A4OQ+yFf/aSGxGBHmCEMkOkSOdtR2D7gOXV
	gRgH5YbHtwldEmjA7gsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1PrK-00FPnd-1T; Sun, 26 Dec 2021 09:30:30 +0000
Received: from slot0.jllresort.com ([62.197.136.5])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1Pr6-00FPfn-6A
 for linux-snps-arc@lists.infradead.org; Sun, 26 Dec 2021 09:30:17 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=dkim; d=jllresort.com;
 h=Reply-To:From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 i=ele.mon@jllresort.com; bh=KFFG/rCPnLBgw+qURuL4EIoOnAg=;
 b=XraVUNYIi9pSjMNwMCPFm4ExH0SfdxOGuutFxMVFIZRda78Kc+m8+45DqZUMwyw9U+dZnaeyG05o
 bv7vRRwGoUjafdvZ8HG5PejBnnLLQO6SsViUwMO5DrPZSOLfdSx09a3Sbv+v15d1wUq7TqarCBfW
 EETC786H75YVFw5VjY63jQiHAX0fhQ+3DnW2fur8AG/suUxREhxG8kqB5sYDTrltKZEzJCGP2Iq6
 86y4XVe/d7Jz3vl0ZySB3MVbK4FPnFVG7H6wP3QxbdUlHKStYJovHqfhBdLxnDzkM3rNaJKsCxXw
 ys9ExUOlFdrBhetXEpNqNDx8U8tkxpi/xhqvrg==
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=dkim; d=jllresort.com;
 b=Vx5l/yo550uQFTCuiPDTZJrHkmkCjjcAFvb2ANZRxuFZgTqdINCAk/A8fLjQusoaFcdB3/uj0+Vu
 PTyMMzmBqiKMs3/KOPghGfR+fFcyOdIpoWQ1vOO8+w22NL8eosVvVbmogBtHzb8xzc53M//VJfGV
 QIdC68IbRMBy1Q6IWDy7W87vwpFzuz1Rw6GUo55RKBRajh6QJX9YuiRVwv21qIIPQFuTNgOvx1Fm
 3AP5dIAlgihMjIqQk5/eE+HdDE7hciE2AZpJTscUpiAt1gPj2ub9vzwGkrFQ5mQ5GlAtSmNODalR
 dL8KPVskl7fGRZfElrqSH1vaLlYzzHfOEghGhw==;
From: ele.mon@jllresort.com
To: linux-snps-arc@lists.infradead.org
Subject: Happy Weekend:
Date: 26 Dec 2021 10:29:36 +0100
Message-ID: <20211226102855.17E1EB990F2160D3@jllresort.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_013016_420612_9F299257 
X-CRM114-Status: UNSURE (  -1.30  )
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
Reply-To: mustafa.ayvaz@ayvazburosu.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Greetings to you linux-snps-arc,

I was wondering if you got my previous email? I have been trying 
to reach you by email linux-snps-arc@lists.infradead.org, kindly 
get back to me swiftly, it is very important and urgent.

Thanks
Mustafa Ayvaz
Email: mustafa.ayvaz@ayvazburosu.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
