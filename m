Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B13C4167B
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Nov 2023 10:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=thX5RyYQBHC0ABXcYMX+aBrFcvjNMQYGUp/OgoH92BE=; b=TnkO7OKvwcTn1R
	rJASpu2tsf+6snr+PAHIARQC0ULZgFwkgM+mLNexg0irs1ALysIyhYF+OLw07jurZb8i08pzW8a9M
	FEsittNMdhlZn5rKKfSKzdEgQaydaWzJvbbJEWg4yzD7IMQ1dKNdTnYNU6h30x0y7LFVaqMiCUrYH
	TNYnKSDQ1Le7wx7J4MG5lsKFaI5RD/eBo92IvS2G88Xs0AieXNzNK87oML7KH5WsUrT7Bd0559/MY
	i7OlOJnAEN5zJ8/a/o6uWajYUhDEMlpUjBzlRVBKYoBsuei2FxyDc/hOdsaOB/FcRC30Z3qC1bWwK
	0jRsr5fCdhtnMO5UQyeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7YeZ-0023EX-1F;
	Mon, 27 Nov 2023 10:15:47 +0000
Received: from mail.thrivehub.pl ([164.132.48.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7XaD-001vN8-1s
	for linux-snps-arc@lists.infradead.org;
	Mon, 27 Nov 2023 09:07:14 +0000
Received: by mail.thrivehub.pl (Postfix, from userid 1002)
	id 5FCF124DF0; Mon, 27 Nov 2023 09:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=thrivehub.pl; s=mail;
	t=1701075984; bh=m3ZUCTPRVLoDFM+cXi7VhHW+xNF3eUdGHrj1eDbLwQI=;
	h=Date:From:To:Subject:From;
	b=c+yH6j7B1u/SMZJDHvGyTP94YKlHTFQ4ZJq6OrVSmT0D1jBPy0eZucBOPYFo7lUxw
	 0mXBe73KDvNf33U9SKPCvlpM/76d7w2dpuKdU6eG+LhN3pehH19ZwUPXvyI+0WvuBx
	 iquxhpCSxu4M1a1/Y3rvBYyWC8Dm37fwGykzUX7mILtaV1rRyAHgWd09wCwadKBMPx
	 wipnkXRUgQH2eBrU7iJ9OuqCsU/bBuq8yJ6PO60BQH+rD+INjhlUOduxCxK4AGBudZ
	 s4wJdwFQ6JMsxtMP61skDOhhwnTq0oCPtMzaS1rPFnla7VSqw4NW0Xtr+ASfPH8lRy
	 2qKqRWHppPiag==
Received: by mail.thrivehub.pl for <linux-snps-arc@lists.infradead.org>; Mon, 27 Nov 2023 09:05:02 GMT
Message-ID: <20231127074500-0.1.35.1bppo.0.vaogn85d39@thrivehub.pl>
Date: Mon, 27 Nov 2023 09:05:02 GMT
From: "Szymon Jankowski" <szymon.jankowski@thrivehub.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.thrivehub.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_010713_763738_BC359358 
X-CRM114-Status: UNSURE (   1.18  )
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

RHppZcWEIGRvYnJ5LAoKUG96d29sacWCZW0gc29iaWUgbmEga29udGFrdCwgcG9uaWV3YcW8IGpl
c3RlbSB6YWludGVyZXNvd2FueSB3ZXJ5ZmlrYWNqxIUgbW/FvGxpd2/Fm2NpIG5hd2nEhXphbmlh
IHdzcMOzxYJwcmFjeS4KCldzcGllcmFteSBmaXJteSB3IHBvenlza2l3YW5pdSBub3d5Y2gga2xp
ZW50w7N3IGJpem5lc293eWNoLgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHIHcgY2VsdSBwcnpl
ZHN0YXdpZW5pYSBzemN6ZWfDs8WCb3d5Y2ggaW5mb3JtYWNqaT8gCgoKUG96ZHJhd2lhbQpTenlt
b24gSmFua293c2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXNucHMtYXJjCg==
