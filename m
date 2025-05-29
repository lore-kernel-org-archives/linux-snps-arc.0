Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930B0C54FB3
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 May 2025 07:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=facMbgmW7vrVEoKgIDNbUV9V+x98mrnGFZc2RJomGjk=; b=TaKtQckX0aAfP+
	JFgYmqnBYl7Y6exqLj69ZcrQ2Es49xGGkKuiZBZFVUwDNA40RYgpaDsegT0VfkzSmVG6PbgsfOnPB
	3HuRjCFFPJ2WC1N27gG6Ou7gdpJUUG9DAO/iEDqN9lsYN9sRyi233ne/zB5zCU+/yDz3bFIIsNSYR
	yxnfeq5VW/GKH044C4T8RcoEwvPwvgqvFaqtka/WxaVjojZVO7P+UGmgpqKoAs3KaBJ8C0Q455Q3I
	LSL3hYrrTXJtGPzNeUivjaCJScAJrZUlUpbNDiHMMYtqXDPGmsjy/ZKzMSJmFtj3PagOq/6VJrdWF
	aNtlYdoOY1+ZxZpHzjFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKXpR-0000000FBuU-3V8Y;
	Thu, 29 May 2025 07:37:29 +0000
Received: from mail.genbiz.pl ([94.177.225.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKXp0-0000000FBni-1Wiq
	for linux-snps-arc@lists.infradead.org;
	Thu, 29 May 2025 07:37:04 +0000
Received: by mail.genbiz.pl (Postfix, from userid 1002)
	id 5D14F8391F; Thu, 29 May 2025 09:35:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=genbiz.pl; s=mail;
	t=1748504188; bh=QE2s7Sx3IpLcBTCvlyAnhlStw9+iPMwbl94HYtFJXq0=;
	h=Date:From:To:Subject:From;
	b=RWzehpk9i+gKtq9/xcU0FLqldA0d9YUB8IesLq4s3LhX9kag9Blztf+TDE1DCskzw
	 ozyxDFNDZRiAHBNXw6RCq/u0RT7xIoyn1zXXQB0PUnPn7Ocosuwjd7LAK7sDDSSGnN
	 Ey+RP9vzXQTxpipQX94F8VQpsfG2l6wA0WVCWW9Bkcgo4XhDQ0GAbwOywbd2lrnvvE
	 elwAJiGVKyW1upDQnZttZ95UR2bhdC61mn+ibh2GKK6GeDiPs2chiOSU2n98BrLFx0
	 3dHb8t367pUdI17TavekI+7rB9CCJnwkGJH1MNiZoE7UfS0Veeap0ifRE0dre87J+H
	 Z60ZvQkYsjfVA==
Received: by mail.genbiz.pl for <linux-snps-arc@lists.infradead.org>; Thu, 29 May 2025 07:35:30 GMT
Message-ID: <20250529084502-0.1.1n.1x0p.0.o41jj6o7fe@genbiz.pl>
Date: Thu, 29 May 2025 07:35:30 GMT
From: =?UTF-8?Q?"Rados=C5=82aw_Grabowski"?= <radoslaw.grabowski@genbiz.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d_?=
X-Mailer: mail.genbiz.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_003703_073371_71AAD4D9 
X-CRM114-Status: UNSURE (  -0.14  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKQ3p5IGludGVyZXN1amUgUGHFhHN0d2Egcm96d2nEhXphbmllIHVtb8W8
bGl3aWFqxIVjZSBtb25pdG9yb3dhbmllIHNhbW9jaG9kw7N3IGZpcm1vd3ljaCBvcmF6IG9wdHlt
YWxpemFjasSZIGtvc3p0w7N3IGljaCB1dHJ6eW1hbmlhPyAKCgpQb3pkcmF3aWFtClJhZG9zxYJh
dyBHcmFib3dza2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc25wcy1hcmMK
