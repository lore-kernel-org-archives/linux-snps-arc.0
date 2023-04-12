Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608F5C77B6E
	for <linux-snps-arc@archiver.kernel.org>; Wed, 12 Apr 2023 07:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3MEYLqzPTvQprpiLLJa/pkOBg3VWMsUT7NPdc1077d4=; b=akhK4qLeu2rtLO
	notesaAcPtOsQrGukl3BBg3b4dZ6MDLXIjfD4HBCP+oRFqxkpr+dmw+5LuO3pwgDCdTHEEklF63jw
	2WI0KjIEY+irikLq/LclGOjd5WVUlCEolWGTykHMYoBGCx+DDBX7y1A3pc17rFq0v1pg/yMdeUYh3
	6mQ0XCm6vscx9Pu3y3BAu7ED+DFIdqQF7g6HwFGjHkyfaX5WfTaPQBUJb1iR39IE88ty0/bPerExT
	B/W5SRe8G+JJETqCEeE/V09h7j43j5qKy4N7uM25BwMyS5Jtjn1OU9iL6OKIy/iSYIYre1L61pdDS
	SPm8vU0z0n1iibwf8Gxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmV6b-0027m9-1G;
	Wed, 12 Apr 2023 07:41:25 +0000
Received: from mail.lokoho.com ([217.61.105.98])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmV6Y-0027kv-2z
	for linux-snps-arc@lists.infradead.org;
	Wed, 12 Apr 2023 07:41:24 +0000
Received: by mail.lokoho.com (Postfix, from userid 1001)
	id 93BD282E2A; Wed, 12 Apr 2023 08:40:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lokoho.com; s=mail;
	t=1681285261; bh=Z0N5VlX9/JlryGOL5I747Le9USomZJCRNNGRT3LbbKc=;
	h=Date:From:To:Subject:From;
	b=Rcrj9FUz/0ve9ot8cUmj/WxjcY8PUgvyJFwoF7xEA/v4zE/HMAX/FcYJjn3ftktZT
	 buQZGMO8+YO5Df9W85lGjlbaPvvukNFgWSy50e3VRaA+vCzl9ZPsILfIabpZSI0nXO
	 cqEGADr6E57+PpdqHmKPg8lIt0KLHUlcLSMwrHD3QUGQ30H76Pz+OnQ+KR9h/W9dYF
	 Z4kItD0eItl+xEerzpUI8v5FCSvOITjR8K++PqxZjOlatogQTzaD7moK8OPlju3qDJ
	 WLpYxbVdKkq0ngSVppqQh7IPQjuq7EcmdWqsJmhD7oJfin30ghK6ozG977176sB41l
	 NdMNUlD81dfmw==
Received: by mail.lokoho.com for <linux-snps-arc@lists.infradead.org>; Wed, 12 Apr 2023 07:40:53 GMT
Message-ID: <20230412074501-0.1.59.1u6uc.0.hcpgf5sitr@lokoho.com>
Date: Wed, 12 Apr 2023 07:40:53 GMT
From: "Adam Charachuta" <adam.charachuta@lokoho.com>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.lokoho.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_004123_101794_90D8E518 
X-CRM114-Status: UNSURE (   1.41  )
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
