Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06228C3600B
	for <linux-snps-arc@archiver.kernel.org>; Thu, 27 Mar 2025 09:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bqWy7q1x2uCLjfLcHX7PlZS1IURnIwGJZbyHIj4pMHk=; b=UKhQTwQfZmNhp8
	uXQpeB8qS5RalTe6QCRA4+lApvfQ1MmZ5tizM1g+LlWhsEICMFveInn01paMPjahbSA+HZnfl2crA
	9lqjoL9QZTMZG5X9czBZTnHRn1m6JkujJZJL+3PPdMUjmHm0H3CYNQAjHHOxTyO04UisaYNmq4sr7
	+JJKsgVYfidMOsoqrlEw8T8RJelUN2AbbXA/TUA1c7bJlZMvdKpF/GMrZLmCjSX/6mNrw8FyKG2Vp
	ue0sN8b1aM9JFtfryTGuEFu282PbTxa+ky5rNN+LXIsLeupkcUzJUA6pryZnmpF8wEVOJwJFwuIQ4
	GrMrBtvNTYFkMViCFrqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txjBb-0000000AWmX-2ZWQ;
	Thu, 27 Mar 2025 09:06:03 +0000
Received: from mail.commetro.pl ([217.61.16.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txjBX-0000000AWkf-2p1E
	for linux-snps-arc@lists.infradead.org;
	Thu, 27 Mar 2025 09:06:02 +0000
Received: by mail.commetro.pl (Postfix, from userid 1002)
	id 9214283673; Thu, 27 Mar 2025 10:05:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commetro.pl; s=mail;
	t=1743066352; bh=COht1CALZmZz8MRkow5xVDQUyVzx29Nu6ozA/Y0jgb4=;
	h=Date:From:To:Subject:From;
	b=Lf2oTP0PY0ss+WqqA9XjkJCZN+VllUaKlnFGG7fOhIrwWLP+UW2hBJZ+TjLbSV64X
	 L96Z6mOOruXVWndBcUHlhg+k8qmZrOaOYw8FI4GRQOd3XW1lXLcpxtqlon/KQTc/mc
	 uBk1MwEm3qc/pHX3koyYzPZDe6RyW0zmatLP/3lemR5BRTnfFhu6hNckdA3TT41/Ob
	 rDswFNpUSqyuKaQSJEZkloYzPUitCCxa64tipDQKKeiw8gKVAhQBqpg8uAORcV4QKJ
	 TZJul7pEt13w+HXTqgDgDe5UZelwt+xTVrIB391dpThMsnWEMwPh0RHebkfplWG9xG
	 0PJ5T5UlnPswA==
Received: by mail.commetro.pl for <linux-snps-arc@lists.infradead.org>; Thu, 27 Mar 2025 09:05:49 GMT
Message-ID: <20250327084500-0.1.1n.je2p.0.zmghpwz54x@commetro.pl>
Date: Thu, 27 Mar 2025 09:05:49 GMT
From: =?UTF-8?Q?"Jaros=C5=82aw_Kownacki"?= <jaroslaw.kownacki@commetro.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_ofert=C4=99?=
X-Mailer: mail.commetro.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_020600_375977_F5F54054 
X-CRM114-Status: UNSURE (   1.07  )
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
