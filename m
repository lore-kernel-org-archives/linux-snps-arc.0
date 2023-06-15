Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECC2EB64DB
	for <linux-snps-arc@archiver.kernel.org>; Thu, 15 Jun 2023 09:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3MEYLqzPTvQprpiLLJa/pkOBg3VWMsUT7NPdc1077d4=; b=GwvtF//f/04ljM
	OqauGpiS5tReIrHnF+ZBKmTL1QV8jTmkFxr0I0gYOUHcXn/+hqtpiG2TsrqXZ7Z5qxuEn+vZjwPKB
	gE3INQDXRgNIoNd5YosH3myAuEtH0zuaZ+9HYsYJi45rGOhMwIAy5X4T+46rx+9DpHlj43jJqF1FB
	dXxeQpTvWK0x49KJlolPK5/4VWeTGtWuK+aqNtsKvd7Sm3yu+/NldNtflrDvUmFn6zuGcaNypqXM8
	cfTSpwGoOqIHAf/BonYrT3DZc34XcV2O6CblmVWZjbV5XiD1SJ/A2Fgi9xjTrep7K3fpHZyQcJ2er
	cOcGl0WtQDq9Dx4rFdNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9jHl-00EIXA-2O;
	Thu, 15 Jun 2023 09:28:57 +0000
Received: from mail.lokoho.com ([217.61.105.98])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9jHj-00EIUa-0z
	for linux-snps-arc@lists.infradead.org;
	Thu, 15 Jun 2023 09:28:56 +0000
Received: by mail.lokoho.com (Postfix, from userid 1001)
	id 74CF0878DC; Thu, 15 Jun 2023 10:27:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lokoho.com; s=mail;
	t=1686821231; bh=Z0N5VlX9/JlryGOL5I747Le9USomZJCRNNGRT3LbbKc=;
	h=Date:From:To:Subject:From;
	b=fbwpC/uaLAlKpzbvJbFw+ovK6Rq1pqjGY4uj0g2QwuV3F0bmO2g/Af9bGBY0FBKdb
	 OjtDFYH7dj1DpXlX9BhE+9hZPrDGKa0ZrAFPYWGNgj/BAtks7Q6XqLDDPfhkDvV9ba
	 xCNwuUqXY3ZFwvEEWSJNoXPKMFiQ1WZ9qlvcH++/FZtZ6ZIEVj6uOTykj1M0eVtQ4L
	 7Cck5qe+4D6AkRoPCOLPIyL4PmHUEa2EdRT6gr3io4xXv/J+yMq4gGuGhYJXtXBXpe
	 it/hAH7IXy964c1XtAB26Xp8ILlzxJBdzLaFwsp6vTU+0cEISU3LE15lXkwR8R7nSq
	 3wnJRdiSJcGnQ==
Received: by mail.lokoho.com for <linux-snps-arc@lists.infradead.org>; Thu, 15 Jun 2023 09:26:02 GMT
Message-ID: <20230615094301-0.1.6n.2mdsu.0.mp74gl5eji@lokoho.com>
Date: Thu, 15 Jun 2023 09:26:02 GMT
From: "Adam Charachuta" <adam.charachuta@lokoho.com>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.lokoho.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_022855_482241_C3B17957 
X-CRM114-Status: UNSURE (   1.21  )
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
