Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AEFC77B7E
	for <linux-snps-arc@archiver.kernel.org>; Thu,  1 Jun 2023 07:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3MEYLqzPTvQprpiLLJa/pkOBg3VWMsUT7NPdc1077d4=; b=m1FA/IFoIeqSI/
	h+z7o3h90x6/KlOPxJ/+B2jCR04S4APzz+2Eo9Qcd+I5frE3N8I6P9VqtsiRxYKBaEpTNs8ZxKqcp
	BYe42sQCTcufy8cKXhR6WB1DX3Pes0An3dLEY4J55+0VzsQ5QV0pgzU8pbsRBwMQv70eWb1EalGz5
	pwQjwtTUIL9CPNl5GkcmuyPuORMV9AmHO6BxpzCrZK34qWFSoiDU5pa4dIuzEHPzB42RxjPbVmYmF
	7pfcWxiaL3wfnV2kY7CKJPqXQzT7bR9tf47BJjnllH2xG0XeK5W3d3bhufhI+LcAeUkfuX6uePpSn
	2XyTvIqefxT68ucbg8TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4cm5-002Moe-2X;
	Thu, 01 Jun 2023 07:31:09 +0000
Received: from mail.lokoho.com ([217.61.105.98])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4clz-002Mm7-0l
	for linux-snps-arc@lists.infradead.org;
	Thu, 01 Jun 2023 07:31:08 +0000
Received: by mail.lokoho.com (Postfix, from userid 1001)
	id 63BE783851; Thu,  1 Jun 2023 08:30:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lokoho.com; s=mail;
	t=1685604660; bh=Z0N5VlX9/JlryGOL5I747Le9USomZJCRNNGRT3LbbKc=;
	h=Date:From:To:Subject:From;
	b=htbYVtd79CRh885R29MAqLNSxXMGlx/9dmL9KQe8tMD5/oFoXhlTK1Yt821Ffa7z6
	 76B+cuDxdiRhNNYiU3o5C3Nga4+Zdw+jovEyhOohK0CiQvPHggeLJZnFTp+oKNP1ur
	 8VOZxfvcfJikH73IdApyni8p3h/li0YWmrwI490JBdu6h1YzNJzuxnle5LAJmX7mUK
	 q9AG29qvmnkxxXsuQ4QO26b1nhZXv9ZuXnz0D7gsJ0vCCvDmSjKBLdlYEjx5BvGx8n
	 P9MPjk11XFJptx7JSCgYzXt+33gzkHCnANSg+oP+1cYq49Gv+7EZgYT5SLrM4y3/8b
	 DqDf09rsN0zbw==
Received: by mail.lokoho.com for <linux-snps-arc@lists.infradead.org>; Thu,  1 Jun 2023 07:30:57 GMT
Message-ID: <20230601074503-0.1.6c.2g416.0.fcnb9nidum@lokoho.com>
Date: Thu,  1 Jun 2023 07:30:57 GMT
From: "Adam Charachuta" <adam.charachuta@lokoho.com>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.lokoho.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_003103_497954_5FCF1850 
X-CRM114-Status: UNSURE (   1.60  )
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
