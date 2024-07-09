Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148B2C3DA41
	for <linux-snps-arc@archiver.kernel.org>; Tue,  9 Jul 2024 08:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BpapL2Wk3ZLkP2l99u6Ri39K9DnDJWVU0sYw+YzCoao=; b=zQLZK1wjtbSLQR
	2AsBgm5n1Ooetu0SVfTmtX1JzmlgfFElUVbQYW/fITLZy9MftDYCG6r09YuprigBGtvaNCz+21Tyi
	32C4NkFG5Xj58Aa7kpxb4pfKR9Dfyu2k74cK7QT2WHd4JdkFDxOCEcA6C8Ot9+RFzGJynM0PnRboR
	vn/1oVL33vcVExLqHSBlCMM91uJreUVWcTENTKDe6qXAN5Z16o4DYbbGIaIDjkAlStkjowBaJ5ZY8
	Y8yv85C7/YameZ6cIa8z/P2/v4LN4dtXAJe52b+2YKkSk8qpqqeJ1zNQ8HCpMqJtQbuaPZ7YRJ71s
	oLsZd5pqbfFW219+X/dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR65S-00000006N0e-2I2M;
	Tue, 09 Jul 2024 08:20:34 +0000
Received: from mail.creationavenue.pl ([217.61.16.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR65O-00000006Mz5-25MJ
	for linux-snps-arc@lists.infradead.org;
	Tue, 09 Jul 2024 08:20:32 +0000
Received: by mail.creationavenue.pl (Postfix, from userid 1002)
	id C25CB84D07; Tue,  9 Jul 2024 10:17:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=creationavenue.pl;
	s=mail; t=1720513050;
	bh=ChscJKp3Om3FoG8SjFzTAmp7diEPSUZN/W3lUPFw6JM=;
	h=Date:From:To:Subject:From;
	b=hLMnVB9JwkSaCTmPfhKVLoJWcfb+30Ra8mbqjE//rzd/ChOZUx8Z8Q0G3K/M/yz8y
	 ravQ/TEUjGNBn6s5XGJDFArmcmDMspm7r2Qhouzt93DqGMp8dKgKJYgYZgCw+Pbssf
	 PBsIWMIchYpFAuutSLdQUczXzTzkvsHod/Hfv4jo+z9pF4wGmORwm7vkexfxEFoLRx
	 7BjNmddsEc7Zv4px5l9DNfMhYu6PJ2dTHDENzGTLRl/5heixvDQSRRdEu4CKFchf8W
	 5DCcQEwHyIrKkKDIiy7QWq22wR52nbKYUG1aF5+vxHOgdgfYe7Ec6XdvMwIpiuztgc
	 ziGxpxSr/iYQQ==
Received: by mail.creationavenue.pl for <linux-snps-arc@lists.infradead.org>; Tue,  9 Jul 2024 08:15:57 GMT
Message-ID: <20240709084501-0.1.4o.mi6n.0.abx6842rg7@creationavenue.pl>
Date: Tue,  9 Jul 2024 08:15:57 GMT
From: "Karol Winiarski" <karol.winiarski@creationavenue.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.creationavenue.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_012030_678747_D856BB39 
X-CRM114-Status: UNSURE (   0.03  )
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
YXdpYW0KS2Fyb2wgV2luaWFyc2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
