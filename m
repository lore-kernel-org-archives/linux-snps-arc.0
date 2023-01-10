Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB538C54EBE
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Jan 2023 08:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3MEYLqzPTvQprpiLLJa/pkOBg3VWMsUT7NPdc1077d4=; b=URHd1/5P9ta+rV
	HgqjOiUDa3hIqyOAkrNCC0RTZh0DPfxhGElBSl5mKyN8Zq+mk7vZ6pc44BfoPsGAZ6nycCC9pD7zv
	nVjUFOnFS625iOiHXHz8ccy7qltWVEO1djytiRBBNwTEL08Rhp6QDTccz2XvKdU9DmgEeLL9oVbFz
	gFQ2dcJyMGZQKglhc90GZDJaU2ZCm2jXFsCOP4kiRzC4H+PiZeIuPgCmiSqUqBnumyP0DSQvuuKbP
	lXJmhQTBHfJlJ2FBghuNgmTuK+PYY7hc40Yz9AvOuA0srLVAbibu00CpBPb8c1bSZeDjD+Pdl/wnQ
	K+Ii1UA9LE2WRmKQcl+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFABW-005r3y-A6; Tue, 10 Jan 2023 08:40:42 +0000
Received: from mail.lokoho.com ([217.61.105.98])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFABT-005r2q-Rn
	for linux-snps-arc@lists.infradead.org; Tue, 10 Jan 2023 08:40:41 +0000
Received: by mail.lokoho.com (Postfix, from userid 1001)
	id 6F1F082DBA; Tue, 10 Jan 2023 08:40:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lokoho.com; s=mail;
	t=1673340038; bh=Z0N5VlX9/JlryGOL5I747Le9USomZJCRNNGRT3LbbKc=;
	h=Date:From:To:Subject:From;
	b=QEJK5FAAas6Gbm7JZQ9g39lK80I8AJLM7C+1rmal6Uo3roRaobGKxFEbien1M/2dK
	 fRB5lwJW7x+FgtzC6sswKFivrWmhkvHroQ/vchQoEjT+ynUk7kOqbB+cNIia26ViIB
	 fntAItFbA9WBfzH0iPNvksprM4hHPIeooUuszEkyzRkT1mMvO8muzpZ7ZuZYuJ064v
	 qKUgWUGs/lmFlDKZF9c0zNAtxGVdCi2mnUthDkw7Z2ha97G28eFTjgNAMCfuKjNNgW
	 6zWXb+dWq3bh4Raqq8rAkQV96tTtDD2nmx7BwwZZBuz1yiVONc8aayZq8PaJ4Nnq98
	 PkReBh1UR+5Zw==
Received: by mail.lokoho.com for <linux-snps-arc@lists.infradead.org>; Tue, 10 Jan 2023 08:40:32 GMT
Message-ID: <20230110074501-0.1.3b.lhmn.0.2j2o2hu479@lokoho.com>
Date: Tue, 10 Jan 2023 08:40:32 GMT
From: "Adam Charachuta" <adam.charachuta@lokoho.com>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.lokoho.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_004040_046189_F603A910 
X-CRM114-Status: UNSURE (   1.65  )
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

RHppZcWEIGRvYnJ5LAoKemFwb3puYcWCZW0gc2nEmSB6IFBhxYRzdHdhIG9mZXJ0xIUgaSB6IHBy
enlqZW1ub8WbY2nEhSBwcnp5em5hasSZLCDFvGUgcHJ6eWNpxIVnYSB1d2FnxJkgaSB6YWNoxJlj
YSBkbyBkYWxzenljaCByb3ptw7N3LiAKClBvbXnFm2xhxYJlbSwgxbxlIG1vxbxlIG3Ds2fFgmJ5
bSBtaWXEhyBzd8OzaiB3a8WCYWQgdyBQYcWEc3R3YSByb3p3w7NqIGkgcG9tw7NjIGRvdHJ6ZcSH
IHogdMSFIG9mZXJ0xIUgZG8gd2nEmWtzemVnbyBncm9uYSBvZGJpb3Jjw7N3LiBQb3p5Y2pvbnVq
xJkgc3Ryb255IHd3dywgZHppxJlraSBjemVtdSBnZW5lcnVqxIUgxZt3aWV0bnkgcnVjaCB3IHNp
ZWNpLgoKTW/FvGVteSBwb3Jvem1hd2lhxIcgdyBuYWpibGnFvHN6eW0gY3phc2llPwoKClBvemRy
YXdpYW0KQWRhbSBDaGFyYWNodXRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
