Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B692C282DE
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 Mar 2025 09:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bqWy7q1x2uCLjfLcHX7PlZS1IURnIwGJZbyHIj4pMHk=; b=ZPZa/qULor1Z9V
	2ZgLaFaGPXfFl8GG9Zqasmrb647FdlC0IY4rsYjsWlGrD4Z7Eq/CN4LFo94g7XM3jFQa9K72aGfcy
	RKHlsDaFZMWcK5156jUuub+Ru1PPU+mvbFxUj91xP+fNCtOhIy2EJDLz46g42JjISeoQnm+erYO2b
	BT9sJS6K7cmvzA7Nw9q1/6edsyVN8CYW7JdQBzgVRkCmfOWbgervkQh8bQAnR9+iwg/D+iyHuz/fy
	xButfNXIbmleo8ADlliWhN9QQSA0Tb2iil8rKqjkI8tNoWPqiv+YldD5B4KTpVzvHHtjlODFYU5vp
	8xtBtTqhu3ix7MbVipfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trZH7-000000023Mi-00LB;
	Mon, 10 Mar 2025 09:18:17 +0000
Received: from mail.commetro.pl ([217.61.16.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trZCG-000000022CL-2L8H
	for linux-snps-arc@lists.infradead.org;
	Mon, 10 Mar 2025 09:13:18 +0000
Received: by mail.commetro.pl (Postfix, from userid 1002)
	id 6FCFD83B7C; Mon, 10 Mar 2025 10:01:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commetro.pl; s=mail;
	t=1741597315; bh=COht1CALZmZz8MRkow5xVDQUyVzx29Nu6ozA/Y0jgb4=;
	h=Date:From:To:Subject:From;
	b=OA7/SC/NGOrQQWMA5TSxpzAIceAu85jIxEZKuSvOdukINMtKWZ55g8dtd8EmQGgc0
	 gVvapEAmG1k3osccLn1DtOO2Qs45YDMhvD3b9f7T0shGF+3vpgk4tQe89bxoNN9Jl5
	 MtvKBKS4aaCb3BsCoaYk5z0uihrLHo6nvi8vTs7q1+V8FQ25MbKN9qNSnYnWP5jG5/
	 jqiBNXhCjK+Xo1ptNWFfhrPoCSM/SvIFEieEmTOE4yyWMsxfpSBEt79dLpCX9gJVP0
	 1H6CxXh2Cvc5AGaghhI8BTR0ux6WRczxMHW4ew+BbLkXKlrxIJl6ZamAGu7PavufQO
	 0gcRI6RqHNE9w==
Received: by mail.commetro.pl for <linux-snps-arc@lists.infradead.org>; Mon, 10 Mar 2025 09:01:01 GMT
Message-ID: <20250310084500-0.1.1a.faty.0.4qrkp6rhkd@commetro.pl>
Date: Mon, 10 Mar 2025 09:01:01 GMT
From: =?UTF-8?Q?"Jaros=C5=82aw_Kownacki"?= <jaroslaw.kownacki@commetro.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_ofert=C4=99?=
X-Mailer: mail.commetro.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_021317_268488_219009D8 
X-CRM114-Status: UNSURE (   1.66  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IHBvdHJ6ZWJ1asSFIFBhxYRzdHdvIGFrdHVhbG5pZSBub3d5Y2gg
a2xpZW50w7N3ID8KClNrdXRlY3puaWUgcG9tYWdhbXkgcm96cG9jenluYcSHIHJvem1vd3kgaGFu
ZGxvd2UgeiBrbGllbnRhbWkgemFpbnRlcmVzb3dhbnltaSBQYcWEc3R3YSBvZmVydMSFLgoKWmFw
cmFzemFtIGRvIGtvbnRha3R1IHp3cm90bmVnby4KCgpQb3pkcmF3aWFtIHNlcmRlY3puaWUKSmFy
b3PFgmF3IEtvd25hY2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXNucHMtYXJjCg==
